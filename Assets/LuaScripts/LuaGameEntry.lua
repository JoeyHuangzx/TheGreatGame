require 'Global.Global'
print('requre global')
-- 定义为全局模块，整个lua程序的入口类

LuaGameEntry = {}
local function EnterGame()
    print('enter game')
    UIManager.Init()

    local Ball=require "Common.SimpleOOP.Ball"
    local b=Ball.New()
    b:Start()
    ----EventMessager:GetInstance():AddListener('click',Handle)
   -- EventMessager:GetInstance():DispatchEvent('click','sdfsa',LuaGameEntry,'2434')
  
end

local function Start()
    print('start game')
    EnterGame()
end

function Handle(a,b,c)
    print('listeneer handle',a,b,c)
    EventMessager:GetInstance():RemoveListener('click')
end

LuaGameEntry.Start = Start
LuaGameEntry.EnterGame = EnterGame

return LuaGameEntry
