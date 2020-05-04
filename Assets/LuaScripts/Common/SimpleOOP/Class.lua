-- 参考文章 https://www.cnblogs.com/msxh/p/8469340.html

-- 声明类和属性，类Class的声明，其实就是个table
Class={
    className="joeyhuang"
}

-- 设置元表索引，模拟类的关键一步
Class.__index=Class

-- 构造方法
function Class:New(className)
    -- 新建一个对象，这样通过Class:new()函数创建的每一个实例都是独立的
    local self={}
    -- 设置元表为Class自身
    setmetatable(self,Class)
    self.className=className
    return self
end

function Class:Start()
    print("self Start method",self.className)
end

function Class:Update()
    print("self Update method")
end

function Class:Destroy()
    print("self Destroy method")
end