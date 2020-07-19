
local PlayerController=BaseClass('PlayerController',LuaUpdate)

function PlayerController:constructor()
    
end

function PlayerController:OnCreate()
    
    self.gameObject=GameObjectExtends.CreateObjWithName('Player')
    self.transform=self.gameObject.transform

  --  self:Initialize()
end

function PlayerController:InitializeProperty()
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

function PlayerController:Initialize()
    self.InitializeProperty()

    self.meshRenderer=self.gameObject:GetComponent(typeof(CS.UnityEngine.MeshRenderer))
    self:RandomMat()
    self.initialPosition=self.transform.position
    self.gameObject:GetComponent(typeof(CS.UnityEngine.Rigidbody)).angularVelocity=1 -- CS.UnityEngine.Random.Range(0,len)
end

function PlayerController:Resurrection(arg1, arg2, arg3)
    
end

function PlayerController:OnEnable()
    
end

function PlayerController:Update()
    local speed=CS.UnityEngine.Random.Range(10,20)
    local value=speed*0.1
    self.transform:Rotate(Vector3(CS.UnityEngine.Random.Range(10,20)*0.1,CS.UnityEngine.Random.Range(10,20)*0.1,CS.UnityEngine.Random.Range(10,20)*0.1))
end

function PlayerController:PlayParticle()
    self.particle:SetActive(true)
    self.particle.transform.position=self.transform.position

end

function PlayerController:Bounce()
    
end

function PlayerController:DelayDie()
    
end

function PlayerController:RandomMat()
    
end

return PlayerController