
local GameObjectExtends={}

local function TransformReset(_transform)
    _transform.localPosition=Vector3.zero;
    _transform.localRotation=Quaternion.identity;
    _transform.localScale=Vector3.one;
end

GameObjectExtends.TransformReset=TransformReset;

return GameObjectExtends

