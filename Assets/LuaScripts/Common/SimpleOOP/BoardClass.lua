require "Common.SimpleOOP.Class"

BoardClass={
    objName="obj"
}

setmetatable(BoardClass,Class)

BoardClass.__index=BoardClass

function BoardClass:New(className,objName)
    local self={}
    self=Class:New(className)
    setmetatable(self,BoardClass)
    self.objName=objName
    return self
end

local function Start(self)
    print('the obj name is ',self.className,self.objName)
end

--BoardClass.New=New
BoardClass.Start=Start

return BoardClass