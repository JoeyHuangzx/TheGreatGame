
local JumpBehaviour=BaseClass('JumpBehaviour')

function JumpBehaviour:constructor()
    
end

function JumpBehaviour:OnCreate(_gameObject)
    self.jgameObject=_gameObject
    self.transform=_gameObject.transform;
end

function JumpBehaviour:Initialize(data)
   self.cheeseType=data.cheeseType
   self.topDown=data.topDown
   self.angleRotation=data.angleRotation
   self.angle=data.angle
   self.isRotation=data.isRotation
end

