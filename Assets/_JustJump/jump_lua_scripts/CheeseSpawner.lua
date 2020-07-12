
CheeseSpawner=BaseClass('CheeseSpawner',Singleton)

function CheeseSpawner:Initialize()
    self.player=self:CreateObjWithName('Player')
    self.coin=self:CreateObjWithName('Coin')
    
end

function CheeseSpawner:CreateObjWithName(objName)
    local prefab=ResourcesManager.Load("Prefab/"..objName)
    local obj = Object.Instantiate(prefab)
    GameObjectExtends.TransformReset(obj.transform)
    return obj
    
end


return CheeseSpawner