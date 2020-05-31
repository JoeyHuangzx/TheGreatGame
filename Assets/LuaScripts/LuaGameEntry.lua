require 'Global.Global'
-- 定义为全局模块，整个lua程序的入口类

LuaGameEntry = {}
local function EnterGame()
    EntityManager:GetInstance():Init()
end

local function Start()
    EventMessager:AddListener('StartGame', EnterGame)
    UIManager:GetInstance():Init()
end

function Handle(a, b, c)
    print('listeneer handle', a, b, c)
    EventMessager:GetInstance():RemoveListener('click')
end

LuaGameEntry.Start = Start
LuaGameEntry.EnterGame = EnterGame

return LuaGameEntry
