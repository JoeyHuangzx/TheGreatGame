
local PlayerController=BaseClass('PlayerController',LuaUpdate)

function PlayerController:constructor()
    
end

function PlayerController:OnCreate(_gameObject)
    self.gameObject=_gameObject
    self.transform=_gameObject.transform

    self:Initialize()
end

function PlayerController:Initialize()
    self.rigidBody=nil
    self.bounceForce=0.1
    self.tumble=10
    self.particle=nil
    self.initialPosition=Vector3.zero
    self.cheeseCombo=0
    self.passCheese=0
    self.resetTrigger=false
    self.dead=false
    self.levelController=nil
    self.meshRenderer=nil
    self.currColor=nil
    self.trailRenderer=nil
end

function PlayerController:OnCreate()
    self.meshRenderer=self.gameObject:GetComponent(typeof(CS.UnityEngine.MeshRenderer))
    self:RandomMat()
    self.initialPosition=self.transform.position
end

function PlayerController:OnEnable()
    
end

function PlayerController:Update()
    
end


function PlayerController:RandomMat()
    
end

return PlayerController