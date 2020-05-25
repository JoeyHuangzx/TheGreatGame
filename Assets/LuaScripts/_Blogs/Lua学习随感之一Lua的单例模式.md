
## 前言

我就是我，是独一无二的自我，这句话用来形容单例模式一点都不为过。Unity游戏开发中，我们在用C#写管理类的时候会用到很多单例模式，那么在Lua同样也需要。下面我来结合上一节 [Lua学习随感之一关于Lua面向对象的理解](https://blog.csdn.net/JoeyHuangzx/article/details/106164531)的面向对象类来做一个Lua单例类。

## 单例代码

```
-- 这里设置基类，并没有，也就是自己了
local Singleton = BaseClass("Singleton")

function Singleton:GetInstance()
    if rawget(self, "instance") == nil then
		rawset(self, "instance", self.New())
	end
	assert(self.instance ~= nil)
	return self.instance
end

return Singleton
```

### 关于rawset和rawget的作用
rawset/rawget：对“原始的”表进行直接的赋值/取值操作。
所以，raw方法就是忽略table对应的metatable，绕过metatable的行为约束，强制对原始表进行一次原始的操作，也就是一次不考虑元表的简单更新。另外，一次原始的操作其实并不会加速代码执行的速度，效率一样。

-- 格式
- rawset(table, key, value)
- rawget(table, key)

## 最后

代码很简单，就是没有就创建（self.New()）一个单例对象，有就直接返回。

初学Lua，没有项目学，自己瞎蒙，有错请各位大神指教