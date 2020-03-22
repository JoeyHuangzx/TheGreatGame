-- 定义为全局模块，整个lua程序的入口类

LuaGameEntry={};

local function EnterGame()
    print('enter game')
end

local function Start()
    print('start game')
    EnterGame()
end

LuaGameEntry.Start=Start;
LuaGameEntry.EnterGame=EnterGame;

return LuaGameEntry;