require 'Global.Global'
require 'Common.BallClass'
require 'Common.BoardClass'

-- 定义为全局模块，整个lua程序的入口类

LuaGameEntry = {}

local function EnterGame()
    print('enter game')
    UIManager.Init()

    local sub = BallClass:New('Joey Huang', 26)
    sub:Start()
    
    local sub2=BoardClass:New("Board","BoardObj")
    sub2:Start()
end

local function Start()
    print('start game')
    EnterGame()
end

LuaGameEntry.Start = Start
LuaGameEntry.EnterGame = EnterGame

return LuaGameEntry
