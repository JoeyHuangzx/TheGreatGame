
EntityComponentManager=BaseClass('EntityComponentManager',Singleton)

function EntityComponentManager:Initialize()
    -- 存储对象的表
    self.entityTable={}
    -- 每个对象所拥有的的脚本
    self.EntityScrips={}
    self:CreatePlayer()
    self:CreateCamera()
    self.timer=0
    LuaUpdate.EnableUpdate(self,true);
end

function EntityComponentManager:Update()
    self.timer=self.timer+LuaUpdate.fixedDeltaTime
end

function EntityComponentManager:CreatePlayer()
    self.Player=EntityConfig['PlayerController'].New()
    self:IsValid(self.Player,'player')
    self.Player:OnCreate()

    
end

function EntityComponentManager:CreateCamera()
    self.Camera=EntityConfig['Camera'].New()
    self:IsValid(self.Camera,'camera')
    self.Camera:OnCreate()
    self.Camera:SetFollow(self.Player.gameObject)
end

function EntityComponentManager:CreateCheese(_gameObject)
    local cheese=EntityConfig['Cheese'].New()
    self:IsValid(cheese,'cheese')
    cheese:OnCreate(_gameObject)
    self:InsertEntity('CheeseObj','Cheese',cheese)

    for i = 0, _gameObject.transform.childCount-1 do
        local obj=_gameObject.transform:GetChild(i)
        obj.localPosition=Vector3.zero
        local piece=EntityConfig['Piece'].New()
        self.IsValid(piece,'piece'..i)
        piece:OnCreate(obj.gameObject)
        self:InsertEntity(obj.name,'Piece',piece)
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

function EntityComponentManager:GetEntityScript(_entityName,_scriptName)
    if TableHelper:HasKey(self.entityTable,_entityName) then
        for key, ScriptList in pairs(self.entityTable[_entityName]) do
            if ScriptList.name==_scriptName then
                return ScriptList.script
            end
        end
    end
    return nil
end

function EntityComponentManager:IsValid(target,name)
    if target ==nil then
        print('the target is null: ',name)
    end
end

return EntityComponentManager