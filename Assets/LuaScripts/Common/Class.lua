-- 参考文章 https://www.cnblogs.com/msxh/p/8469340.html

-- 声明类和属性
Class={
    className="joeyhuang"
}

-- 设置元表索引，模拟类的关键一步
Class.__index=Class

-- 构造方法
function Class:New(className)
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