
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

function EntityComponentManager:CreateCheese(_gameObject)
    local cheese=EntityConfig['Cheese'].New()
    self:IsValid(cheese)
    cheese:OnCreate(_gameObject)
    self:InsertEntity('Cheese',cheese)
    
end

function EntityComponentManager:LogTest()
    print('log.......')
    for key, value in pairs(self.entityTable) do
        print('entityTB--k:',key,',v:',value)
        for scriptName,script in pairs(value) do
            print('name:',scriptName,',script:',script)
        end
    end
end

function EntityComponentManager:InsertEntity(_entityName,_scriptName,_script)
    self.entityTable[_entityName]=self.entityTable[_entityName] or {}
    local tb={}
    tb.name=_scriptName
    tb.script=_script
    --self.entityTable[_entity]=tb
    table.insert(self.entityTable[_entityName],tb)
end

function EntityComponentManager:GetEntityScript(_entity,_scriptName)
    if TableHelper:HasKey(self.entityTable[_entity],_scriptName) then
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