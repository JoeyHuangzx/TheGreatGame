
EntityComponentManager=BaseClass('EntityComponentManager')

function EntityComponentManager:Initialize()
    -- 存储对象的表
    self.entityTable={}
    -- 每个对象所拥有的的脚本
    self.EntityScrips={}
end



function EntityComponentManager:InsertEntity(_entity,_scriptList)
    if TableHelper:HasKey(self.entityTable,_entity) then
        self.entityTable[_entity]=_scriptList
    end
end

function EntityComponentManager:GetEntityScript(_entity,_scriptName)
    if TableHelper:HasKey(self.entityTable,_entity) then
        return self.entityTable[_entity][_scriptName] 
    end
    return nil
end

return EntityComponentManager