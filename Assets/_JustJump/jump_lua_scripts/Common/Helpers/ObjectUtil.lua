ObjectUtil = {}

-- GameObject.Find 查找
function ObjectUtil:FindGameObject(_name, _parent)
    local target = _parent:Find(_name)
    if target == nil then
        print('查找的obj:' .. _name .. '-不存在')
    end
    return target
end

-- transform.find 查找
function ObjectUtil:FindComponentsWithTran(_name, _parent)
    local transList = _parent:GetComponentsInChildren(typeof(CS.UnityEngine.Transform),true)
    local target = nil
  --   print(transList,transList.Length)
    for i = 0, transList.Length - 1 do
        if _name == transList[i].name then
            target = transList[i].gameObject
        end
    end
    if target == nil then
        print('查找的obj:' .. _name .. '-不存在')
    end
    return target
end

-- 全局查找 GameObject.Find
function ObjectUtil:GlobalFind(_name)
    local obj = GameObject.Find(_name)
    if obj == nil then
        print('查找的obj:' .. _name .. '-不存在')
    end
    return obj
end

return ObjectUtil
