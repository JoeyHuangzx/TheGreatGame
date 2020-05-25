
LuaUpdate=BaseClass("LuaUpdate")

function LuaUpdate:Start()
    print('luaupdate start...')
end

function Update()
   -- print('Update',Update)
end

function FixedUpdate(deltaTime)
   -- print('fixedUpdate',deltaTime)
end

function LateUpdate()
   -- print('Lateupdate...')
end

LuaUpdate.Update=Update

return LuaUpdate