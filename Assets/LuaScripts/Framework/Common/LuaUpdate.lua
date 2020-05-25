
LuaUpdate=BaseClass("LuaUpdate")

local function Update()
    
end

local function FixedUpdate(self,deltaTime)
    print('fixedUpdate',self,deltaTime)
end

local function LateUpdate()
    print('Lateupdate...')
end

LuaUpdate.Update=Update;
LuaUpdate.FixedUpdate=FixedUpdate;
LuaUpdate.LateUpdate=LateUpdate;

return LuaUpdate