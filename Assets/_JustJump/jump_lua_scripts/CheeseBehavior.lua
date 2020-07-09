
local CheeseBehaviour=BaseClass('CheeseBehaviour',LuaUpdate)

CheeseBehaviour={
    forceMagnitude=0,
    didExplode=false,
    Level=1
}

function CheeseBehaviour:constructor()
    
end

function CheeseBehaviour:OnCreate()
    
end

function CheeseBehaviour:OnEnable()
    self:EnableUpdate(true)
end

function CheeseBehaviour:FixedUpdate()
    
end

