
local PlayerController=BaseClass('PlayerController',LuaUpdate)

function PlayerController:constructor()
    
end

function PlayerController:OnCreate()
    
    self.gameObject=GameObjectExtends.CreateObjWithName('Player')
    self.transform=self.gameObject.transform
    self.transform.localScale=Vector3(0.5,0.5,0.5)
    self.transform.localPosition=Vector3(2.022,2,-0.53)
    self:Initialize()
end

function PlayerController:InitializeProperty()
   -- print(self.gameObject:GetComponent(typeof(CS.UnityEngine.Rigidbody)))
    self.rigidBody=self.gameObject:GetComponent(typeof(CS.UnityEngine.Rigidbody))
    self.bounceForce=6
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
    self:InitializeProperty()
    self:OnEnable()
   -- self.meshRenderer=self.gameObject:GetComponent(typeof(CS.UnityEngine.MeshRenderer))
   -- self:RandomMat()
    --self.initialPosition=self.transform.position
    self.gameObject:GetComponent(typeof(CS.UnityEngine.Rigidbody)).angularVelocity=1 -- CS.UnityEngine.Random.Range(0,len)
end

function PlayerController:Resurrection(arg1, arg2, arg3)
    
end

function PlayerController:OnEnable()
    self:EnableUpdate(true)
    ColliderAndTriggerFun.EnableCollision(self,true)
end

function PlayerController:OnCollisionEnter()
    print('player OnCollisionEnter')
    self:Bounce()
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
    if self.rigidBody==nil then
        print('the rigidBody is null')
        return
    end
    self.rigidBody.velocity=Vector3.up*self.bounceForce
    
end

function PlayerController:DelayDie()
    
end

function PlayerController:RandomMat()
    
end

return PlayerController