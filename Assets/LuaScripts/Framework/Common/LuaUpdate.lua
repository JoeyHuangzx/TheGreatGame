
LuaUpdate=BaseClass("LuaUpdate")
LuaUpdate.objUpdate=nil

function LuaUpdate:EnableUpdate(_enable)
   print(self)
   print(self.Update)
   LuaUpdate.objUpdate=self.Update
end

function LuaUpdate:Start()
    print('luaupdate start...')
end

function Update()
   -- print('Update',Update)
   if LuaUpdate.objUpdate~=nil then
      LuaUpdate.objUpdate()
   end
end

function FixedUpdate(deltaTime)
   -- print('fixedUpdate',deltaTime)
end

function LateUpdate()
   -- print('Lateupdate...')
end

LuaUpdate.Update=Update

return LuaUpdate