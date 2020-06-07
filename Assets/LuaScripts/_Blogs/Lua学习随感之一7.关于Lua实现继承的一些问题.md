
## 问题

    最近在用Lua的继承的时候，如果你在Lua中有多个“对象”去继承了同一个“类”的话，发现了个问题，当A和B同时继承C的时候，其实A和B继承的是同一个C，而在Java或者C#的面向对象中，
    
    A的C和B的C是两个不一样的，是毫无联系的。进而我知道了原来Lua中的继承只是给了个指引指向了某一个对象，而并不是重新生成这个父对象。

### 对比
    可能这样说会有点蒙蔽，下面用代码来看下。

   **C#中的继承**
   ```
   using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DemoClass
{
    public DemoClass()
    {
        AClass a = new AClass();
        BClass b = new BClass();
        
        Debug.Log(string.Format("aName:{0},parent:{1},id:{2}", a.aName, a.parentName,a.id));
        Debug.Log(string.Format("bName:{0},parent:{1},id:{2}", b.bName, b.parentName,b.id));
    }

}
public class ParentClass
{
    public string parentName="parent";
    public int id = 1000;
}
public class AClass: ParentClass
{
    public string aName = "aClass";

    public AClass()
    {
        parentName = aName + " " + parentName;
        id =(int)(Random.value * id);
    }
}
public class BClass:ParentClass
{
    public string bName = "bClass";

    public BClass()
    {
        parentName = bName + " " + parentName;
        id = (int)(Random.value * id);
    }
}
   ```

   **Lua中的继承**
   ```
   DemoClass = {}

ParentClass = BaseClass('ParentClass')
ParentClass.parentName = 'parent'
ParentClass.id = 10000

AClass = BaseClass('AClass', ParentClass)
AClass.base = ParentClass
AClass.aName = 'aClass'
function AClass:constructor()
    self.base.parentName = self.aName .. ' ' .. self.base.parentName
    self.base.id = CS.UnityEngine.Random.value * self.base.id
end

BClass = BaseClass('BClass', ParentClass)
BClass.base = ParentClass
BClass.bName = 'bClass'
function BClass:constructor()
    self.base.parentName = self.bName .. ' ' .. self.base.parentName
    self.base.id = CS.UnityEngine.Random.value * self.base.id
end

function DemoClass:Test()
    AClass.New()
    BClass.New()

    print('aName:',AClass.aName,',parent:',AClass.base.parentName,',id:',AClass.base.id)
    print('bName:',BClass.bName,',parent:',BClass.base.parentName,',id:',BClass.base.id)

end

return DemoClass

   ```


下面我们共同放出C#和Lua的打印对比下看看

![C#中的继承](07/02.png)
![Lua中的继承](07/03.png)

## 总结
    很明显我们可以看得到Lua中的问题。为什么在BClass的parent的name和id和AClass的是一样的。
    真相只有一个，Lua中的继承并不是真正意义上的继承，AClass和BClass都指向的父类是同一个ParentClass。而在C#分配的不同的内存，新生成不同的ParentClass，所以AClass和BClass的父类是互不相干，互不干扰的。而Lua的其实都是同一个ParentClass，所以这就会造成了只要有一个子类改了父类的属性那都会直接改掉所有继承该类的子类的父类的属性改变（好吧，这句话有点绕）

