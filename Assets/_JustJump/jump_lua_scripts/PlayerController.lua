
local PlayerController=BaseClass('PlayerController')

function PlayerController:constructor()
    
end

function PlayerController:OnCreate()
    
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

return PlayerController