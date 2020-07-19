LuaUpdate = BaseClass('LuaUpdate')
LuaUpdate.fixedDeltaTime = 0
LuaUpdate.UpdateTable = nil
LuaUpdate.FixedUpdateHandler = nil
LuaUpdate.LateUpdateHandler = nil
local Timer = 0


function LuaUpdate:EnableUpdate(_enable)
    if _enable == true then
     --   print('start update', self)
        if LuaUpdate.UpdateTable==nil then
            LuaUpdate.UpdateTable = {}
        end
        
        if self.Update ~= nil then
            table.insert(LuaUpdate.UpdateTable, {callback = self.Update, target = self})
        end
    -- LuaUpdate.UpdateHandler = self.Update or nil
    --LuaUpdate.LateUpdateHandler = self.LateUpdate or nil
    --LuaUpdate.FixedUpdateHandler = self.FixedUpdate or nil
    end
end

function LuaUpdate:Start()
    --  print('luaupdate start...')
end

--[[ !!!不允许其他地方有同样的Update全局函数 ]]
function Update()
    --  Timer=Timer+LuaUpdate.fixedDeltaTime
    Timer=Timer+LuaUpdate.fixedDeltaTime
    --if Timer>0.02 then
    --    Timer=0
        if LuaUpdate.UpdateTable ~= nil then
            for key, value in pairs(LuaUpdate.UpdateTable) do
          --      print(key, value, value.callback, value.target.name)
                if value.callback~=nil then
                    value.callback(value.target)
                end
            end
        end
   -- end
    
   
end

function FixedUpdate(deltaTime)
    LuaUpdate.fixedDeltaTime = deltaTime
    if LuaUpdate.FixedUpdateHandler ~= nil then
        LuaUpdate:FixedUpdateHandler()
    end
    -- print('fixedUpdate',deltaTime)
end

function LateUpdate()
    if LuaUpdate.LateUpdateHandler then
        LuaUpdate:LateUpdateHandler()
    end
    -- print('Lateupdate...')
end

function LuaUpdate:RemoveEnable()
    print('remove update')
    LuaUpdate.UpdateTable = nil
    LuaUpdate.LateUpdateHandler = nil
    LuaUpdate.FixedUpdateHandler = nil
end

return LuaUpdate
