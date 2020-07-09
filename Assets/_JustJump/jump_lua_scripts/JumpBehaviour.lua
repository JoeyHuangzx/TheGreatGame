
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
   self.rotationAngle=data.rotationAngle
 
   self.angle=data.angle
   self.isRotation=data.isRotation
end

function InitMaterialColor()
    self.currRenderer=self.gameObject.GetComponentInChildred(CS.UnityEngine.MeshRenderer)
    self.currRenderer.shadowCastingMode=CS.UnityEngine.Rendering.ShadowCastingMode.On
    local normalColor=nil
    local enemyColor=nil
    
    if self.cheeseType==1 or self.cheeseType==4 then
        self.currRenderer.material:SetColor('_Color',normalColor)
    else
        self.currRenderer.material:SetColor('_Color',enemyColor)
    
    end

    if self.rotationAngle==0 then
        self.angleRotation=0;
    elseif self.rotationAngle==1 then
        self.angleRotation=90;
        self.duration=1
    elseif self.rotationAngle==2 then
        self.angleRotation=180;
        self.duration=2
    elseif self.rotationAngle==3 then
        self.angleRotation=270;
        self.duration=3
    elseif self.rotationAngle==4 then
        self.angleRotation=360;
        self.duration=4
    end

    CS.XLuaUtils.RotationQuaternion(self.transform,self.angleRotation,self.duration)
end

