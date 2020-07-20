
EntityComponentManager=BaseClass('EntityComponentManager',Singleton)

function EntityComponentManager:Initialize()
    -- 存储对象的表
    self.entityTable={}
    -- 每个对象所拥有的的脚本
    self.EntityScrips={}
    self:CreatePlayer()
    self:CreateCamera()
end

function EntityComponentManager:CreatePlayer()
    self.Player=EntityConfig['PlayerController'].New()
    self:IsValid(self.Player)
    self.Player:OnCreate()

    
end

function EntityComponentManager:CreateCamera()
    self.Camera=EntityConfig['Camera'].New()
    self:IsValid(self.Camera)
    self.Camera:OnCreate()
    self.Camera:SetFollow(self.Player.gameObject)
end

function EntityComponentManager:CreateCheese()
    
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

function EntityComponentManager:IsValid(target)
    if target ==nil then
        print('the Camera is null')
    end
end

return EntityComponentManager