
local GameObjectExtends={}


local function CreateObjWithName(objName)
    local prefab=ResourcesManager.Load("Prefab/"..objName)
    local obj = Object.Instantiate(prefab)
    GameObjectExtends.TransformReset(obj.transform)
    return obj
    
end

local function TransformReset(_transform)
    _transform.localPosition=Vector3.zero;
    _transform.localRotation=Quaternion.identity;
    _transform.localScale=Vector3.one;
end

GameObjectExtends.TransformReset=TransformReset
GameObjectExtends.CreateObjWithName=CreateObjWithName

return GameObjectExtends

