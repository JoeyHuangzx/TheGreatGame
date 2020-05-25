
## 前言

这里针对一些平常学习Lua需要用到的，注意的和有点难以理解的语法进行解析和说明

LUA：一切皆table

## 基础

1. lua面向对象编程是基于元表metatable，元方法__index来实现的
2. lua中的函数默认都是有self传递进去的，self相当于C++类中函数的this指针，会自动给我们传递 self
3. 设置A为B的元表时setmetatable(A,B)，B的元方法__index一定要赋值B.__index = B,(lua并不是直接在表B中查找变量a，而是调用表B的元方法__index，如果__index为nil，那就会返回nil),如果__index被赋值为一个函数，那么查找时就会返回该函数的返回值
4.  **冒号和点调用方法的区别**：使用冒号：可以将自身（self）自动传过去不需要写进方法参数里   **(a.test())**，使用点则需要将主动传自身过去 **(a.test(a))**。

### lua文件之间的相互调用

#### 写法一
```
--文件 A.lua

A={}

function A:A_Init()
end
```

```
-- 文件B.lua

B={}
function B:B_Init()
end
```
例如A中想调用B，则在ALua文件中
```
--文件 A.lua
A={}
-- 这里如果B在其他文件夹，则要加上文件夹名，如B在Common文件夹下，则是 require 'Common.B'
local b=require 'B'
function A:A_Init()
    b:B_Init()
end
```
#### 写法二
```
--文件 A.lua

A={}

local function A_Init()
end

A.A_Init=A_Init

return A
```
接下来我们在B中调用ALua文件
```
-- 文件B.lua

B={}
local a=require 'A'
local function B_Init()
    a:A_Init()
end

B.B_Init=B_Init

return B
```
#### 两个方法的区别其实就是，一个是全局方法，一个是局部方法，第二个方法是局部方法通过赋值给一个全局变量来供外部调用

### 元表的查找步骤
- 步骤1、在表中查找，如果找到，返回该元素，找不到则继续步骤2
- 步骤2、判断该表是否有元表，如果没有元表，返回nil，有元表则继续步骤3
- 步骤3、判断元表有没有__index方法，如果__index方法为nil，则返回nil；如果__index方法是一个表，则重复步骤1、2、3；如果__index方法是一个函数，则调用该函数，并返回该函数的返回值

## 高级用法


### 面向对象

local obj = require 'xxx'
-- 这里的对象b如果直接调用self.base并不能获取到基类，只有用上面的obj.base才可以。
-- 解决方法，在构造函数里把obj.base赋值给b这里。也就是self.base=xxx.base
local b = ball.New('BallObj')