
Camera=BaseClass('Camera',LuaUpdate)

local target=nil
local isUpdate=false

function Camera:constructor()
    
end

function Camera:OnCreate()
    self:Init()
    self:EnableUpdate(true)
end

function Camera:SetFollow(_target)
    target=_target
    isUpdate=true
end

function Camera:Init()
    self.gameObject=GameObject.Find("Main Camera")
    self.transform=self.gameObject.transform
    
end

local targetY=0
function Camera.Update(self)
    if isUpdate==true then
        targetY=MathTool:Lerp(self.transform.position.y,target.transform.position.y,0.1)
        self.transform.position=Vector3(target.transform.position.x,targetY,-10)
    end 
end


return Camera