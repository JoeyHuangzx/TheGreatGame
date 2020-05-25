require 'Global.Global'
print('requre global')
-- 定义为全局模块，整个lua程序的入口类

LuaGameEntry = {}
local function EnterGame()
    print('enter game')
    UIManager.Init()

    --[[     local base=BaseComponent.New('JoeyBaseComponent')
    base:Enable('ddd')

    local ball = require 'Common.SimpleOOP.Ball'
    local b = ball.New('BallObj')
    b:Awake()
    b:Enable()
    b:Jump()
    b:Move()
    b:Start() ]]
    local ball = require 'Common.SimpleOOP.Ball'
    
    local b = ball.New('BallObj')
    b:Start()
end

local function Start()
    print('start game')
    EnterGame()
end

LuaGameEntry.Start = Start
LuaGameEntry.EnterGame = EnterGame

return LuaGameEntry
