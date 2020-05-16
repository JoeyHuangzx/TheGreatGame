require 'Global.Global'

-- 定义为全局模块，整个lua程序的入口类

LuaGameEntry = {}
--[[ Base = BaseClass('Base')
function Base:constructor(name)
    self.className = name
    print('Base Class ,the name:',self,self.className)
end

function Base:test()
    -- body
    print('test..',self)
end


function Base:baseFun()
    print('base basefun:',self)
end

function Base:fun()
    print('Base fun....')
end

Child = BaseClass('Child', Base)
function Child:constructor(self,name)
    print('old name:' .. self.className)
    self.className = name
    print('new name:' .. self.className)
end

function Child:fun(num)
    print('self',self,',num:',num)
end

local child1 = Child.New(Child, 'child111')
local child2 = Child.New(Child, 'child222')
print('child1:',child1,'child2:',child2)
child1:fun(5)
child2:fun(10)
child1:baseFun() ]]
local function EnterGame()
    --print('enter game')
    UIManager.Init()

    --[[     local base=BaseComponent.New('JoeyBaseComponent')
    base:Enable('ddd')
 ]]
    local ball = require 'Common.SimpleOOP.Ball'
    local b = ball.New('BallObj')
    b:Awake()
    b:Enable()
    b:Jump()
    b:Move()
    b:Start()
end

local function Start()
    --  print('start game')
    EnterGame()
end

LuaGameEntry.Start = Start
LuaGameEntry.EnterGame = EnterGame

return LuaGameEntry
