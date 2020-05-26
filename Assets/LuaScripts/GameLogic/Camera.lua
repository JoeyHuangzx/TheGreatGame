
Camera={}

Camera.Obj=nil
local ballObj=nil
local Offset=nil
local pos=nil

local function Init()
    Camera.Obj=GameObject.Find("UICamera");
   --[[  pos=Camera.Obj.transform.position
    ballObj=Ball.Obj
    Offset=pos-ballObj.transform.position ]]
end

local function Update()
    if ballObj ~= nil then
        pos=Camera.Obj.transform.position
        --Camera.Obj.transform.position=Vector3(pos.x,ballObj.transform.position.y+Offset.y,pos.z)
    end
end

Camera.Init=Init
Camera.Update=Update

return Camera