## 前言

靠着零碎的时间学习，今天可算是把Lua面向对象的基本原来给搞明白了，有一种守得云开见月明的感觉，没理解之前感觉很难，看哪里哪里都蒙蔽。理解了之后就感觉其实也没这么难

### 引用

我们知道，对象由属性和方法组成。LUA中最基本的结构是table，所以需要用table来描述对象的属性。

lua 中的 function 可以用来表示方法。那么LUA中的类可以通过 table + function 模拟出来。

至于继承，可以通过 metetable 模拟出来（不推荐用，只模拟最基本的对象大部分时间够用了）。

关于Lua面向对象一些理论知识和写法这里我就不说了，毕竟网上有很多大神已经写了很好的博客，我今天要写的是将这些大神些的面向对象类加入自己的理解，一层层的探讨，整理个流程出来。

下面是我参考的大神的链接，我基本都是基于这几个博客的方法来学习的。

- [Lua面对对象知识1](https://www.runoob.com/lua/lua-object-oriented.html)
- [Lua面向对象知识2](https://www.cnblogs.com/msxh/p/8469340.html)
- [Lua实现面向对象机制
](https://www.jianshu.com/p/b8f794927f3d)
- [云风的面向对象类](https://blog.codingnow.com/cloud/LuaOO)
- [一个超好的unity Lua框架](https://blog.csdn.net/u013108312/category_6462401.html)


### 面向对象代码及其用法
**类代码**
*声明：这个类是来自于[一个超好的unity Lua框架](https://blog.csdn.net/u013108312/category_6462401.html)博客的源码，我在他的基础上加了一些解析*
```
local Class = {}

--[[
    -- @param _className 类名
    -- @param  _base 基类，父类
]]
function BaseClass(_className, _base)
    local _class = {}
    print('新建类BaseClass，类名' .. _className)
    _class.className = _className
    _class.base = _base
    -- 创建对象
    -- @param ...要传递给构造函数的参数列表
    _class.New = function(...)
        local classObj = {}
        print('新建类对象...',_className)
        setmetatable(
            classObj,
            {
                __index = Class[_class]
            }
        )
        -- 调用初始化方法
        -- 递归调用构造函数
        -- 先调用基类的构造函数，再调用自己的
        do
            local create
            create = function(_c, ...)
                print('call create。。。')
                if _c.base then
                    print('调用基类构造函数call create base。。。')
                    create(_c.base, ...)
                end
                if _c.constructor then
                    print('调用构造函数call constructor')
                    _c.constructor(classObj, ...)
                end
            end
            create(_class, ...)
        end

        return classObj
    end

    local classTable = {}
    Class[_class] = classTable

    -- 设置类的元表
    setmetatable(
        _class,
        {
            -- 这里设置的类的成员变量和方法，因为Lua会把类的变量名和变量的值看成是key和value，
            -- 同样的方法名和方法内容也是key和value
            __newindex = function(_table, _key, _value)
                print('设置__newindex',',_key:', _key,',value:',_value)
                classTable[_key] = _value
            end,
            __index = classTable
        }
    )
    -- 索引基类成员的元表，这里表示的是如果某个对象调用了其变量或者方法
    -- lua一层一层的去查找（子类-父类-父类的父类）
    if _base then
        setmetatable(
            classTable,
            {
                __index = function(_talbe, _key)
                    print('索引基类成员的元表,table:',_talbe,'key:',key)
                    return Class[_base][_key]
                end
            }
        )
    end
    return _class
end

```
#### 用法
**创建一个基类对象**
```

local BaseComponent=BaseClass('BaseComponent')

BaseComponent.gameObject='unity gameObject'
BaseComponent.transform='unity transform'

local function constructor(self,params)
    -- statements
    print('I am BaseComponent:',self,params,self.num)
end

local function Awake()
    print('BaseComponent Awake fun')
end

local function Enable(self,params)
    -- statements
    print('enable function',self)
end

local function Start( )
    print('BaseComponent Start fun...')
end

BaseComponent.Awake=Awake
BaseComponent.constructor=constructor
BaseComponent.Enable=Enable
BaseComponent.Start=Start

return BaseComponent
```

**创建一个类对象**
```

local Ball=BaseClass('Ball', BaseComponent)

function Ball:constructor(params)
    print('Ball Constructor')
end

function Ball:Start( ... )
    print('Ball Start fun...')
end

function Ball:Jump()
    print('ball Jump',self)
end

function Ball:Move(params)
    print('ball move',self)
end

--Ball.constructor=constructor
--Ball.Jump=Jump
--Ball.Move=Move

return Ball
```

#### 调用调试
我在一个全局（Global.lua）类里请求BaseComponent=require "Common.SimpleOOP.BaseComponent"

现在创建一个BaseComponent类对象
-- New里的参数可有可无
local base=BaseComponent.New('BaseComponent')
base:Awake()
base:Enable('ddd')

下面是创建一个Ball对象
```
 local ball=require 'Common.SimpleOOP.Ball'
    local b=ball.New('BallObj')
    b:Awake()
    b:Enable()
    b:Jump()
    b:Move()
    b:Start()
```
### 接下来我们看结果


### 总结
- 我们可有看到在__newindex里我们可有看到类所有的变量和方法
- 我们在设置*local BaseComponent=BaseClass('BaseComponent')*和*local Ball=BaseClass('Ball', BaseComponent)*的时候会调用
- 如果有超类（父类）那就会触发我们代码最后设置的_base的_index，返回索引基类成员。