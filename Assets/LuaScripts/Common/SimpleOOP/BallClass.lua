
require "Common.SimpleOOP.Class"

BallClass={
    age=23
}

-- 设置subClass的元表为Class
setmetatable(BallClass,Class)

BallClass.__index=BallClass

function BallClass:New(className,age)
    local self={}
    --将对象自身设定为父类，这个语句相当于其他语言的super ，可以理解为调用父类的构造函数
    self=Class:New(className)
    --将对象自身元表设定为SubClass类
    setmetatable(self,BallClass)
    self.age=age
    return self
end

function BallClass:Start()
    print('subClass Start method',self.className,self.age)
end

function BallClass:Move()
    print("SubClass Move method")
end