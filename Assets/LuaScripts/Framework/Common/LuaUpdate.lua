LuaUpdate = BaseClass('LuaUpdate')
LuaUpdate.fixedDeltaTime = 0
LuaUpdate.UpdateHandler = {callback=nil,target=nil}
LuaUpdate.FixedUpdateHandler = nil
LuaUpdate.LateUpdateHandler = nil

function LuaUpdate:EnableUpdate(_enable)
    if _enable == true then
        print('start update',self)
        if self.Update~=nil then
            LuaUpdate.UpdateHandler.callback=self.Update
            LuaUpdate.UpdateHandler.target=self
        end
       -- LuaUpdate.UpdateHandler = self.Update or nil
        --LuaUpdate.LateUpdateHandler = self.LateUpdate or nil
        --LuaUpdate.FixedUpdateHandler = self.FixedUpdate or nil
    end
end

function LuaUpdate:Start()
    --  print('luaupdate start...')
    
end

function Update()
    -- print('Update',Update)
    if LuaUpdate.UpdateHandler.target ~= nil then
        LuaUpdate.UpdateHandler.callback(LuaUpdate.UpdateHandler.target)
        --print(LuaUpdate.UpdateHandler.target)
    end
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
    LuaUpdate.UpdateHandler = nil
    LuaUpdate.LateUpdateHandler = nil
    LuaUpdate.FixedUpdateHandler = nil
end

return LuaUpdate
