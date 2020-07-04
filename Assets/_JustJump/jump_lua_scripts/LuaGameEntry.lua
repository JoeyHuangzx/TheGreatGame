
LuaGameEntry={}

require 'Common.JumpGlobal'

local rapidjson=require 'rapidjson'
-- local t=rapidjson.decode('{"a":111}')
-- print(t.a)
-- t.a=456
-- local s=rapidjson.encode(t)
-- print('json',s)

function LuaGameEntry:Start()
    print('start...')
end

return LuaGameEntry