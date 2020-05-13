require 'Global.Global'

-- 定义为全局模块，整个lua程序的入口类

LuaGameEntry = {}
Base = BaseClass('Base')
function Base:constructor(self,name)
    self.className = name
    print('Base Class ,the name:' .. self.className)
end

Child = BaseClass('Child', Base)
function Child:constructor(self,name)
    print('old name:' .. self.className)
    self.className = name
    print('new name:' .. self.className)
end

local child1 = Child.New(Child, 'child111')
local child2 = Child.New(Child, 'child222')
local function EnterGame()
    print('enter game')
    UIManager.Init()
end

local function Start()
    print('start game')
    EnterGame()
end

LuaGameEntry.Start = Start
LuaGameEntry.EnterGame = EnterGame

return LuaGameEntry
