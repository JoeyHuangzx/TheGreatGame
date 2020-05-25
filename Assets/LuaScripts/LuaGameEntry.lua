require 'Global.Global'
print('requre global')
-- 定义为全局模块，整个lua程序的入口类

LuaGameEntry = {}
local function EnterGame()
    print('enter game')
    UIManager.Init()

    EventMessager:GetInstance():AddListener()
    EventMessager:GetInstance():DispatchEvent()
    EventMessager:GetInstance():RemoveListener()
end

local function Start()
    print('start game')
    EnterGame()
end

LuaGameEntry.Start = Start
LuaGameEntry.EnterGame = EnterGame

return LuaGameEntry
