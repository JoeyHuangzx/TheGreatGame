CheeseSpawner = BaseClass('CheeseSpawner', Singleton)

function CheeseSpawner:Initialize()
    self.gameObject = GameObject.Find('CheeseSpawner')
    self.transform = self.gameObject.transform

    -- self.player=self:CreateObjWithName('Player')
    self.cheesePrefabs = {}
    self.cheeseEnemiesPrefabs = {}
    self.pillar = GameObject.Find('Pillar')
    self.diamondPrefab = ResourcesManager.Load('Prefab/Coin')
    self.initialYSpawn = -1.2
    self.distanceBetweenCheese = 3
    self.initailCheese = 7
    --
    self.pressedPos = Vector3.zero
    self.actualPos = Vector3.zero
    self.resetTrigger = false
    self.SpawnCount = 0
    self.currLoopLevel = 1
    self.initSpawnCount = 21
    self.isSpawnComplete = false
    self.AddSpawnEachLevel = 5
    self.diamondCount = 1
    self.currColorIndex = 1
    self.NormalCheeseColors = {'111111', '222222', '333333'}
    self.EnemyCheeseColors = {'aaaaaa', 'bbbbbb', 'abcdef'}
    self.CurrNormalCheeseColor = nil
    self.CurrEnemyCheeseColor = nil

    self.levels = {}
    self.serialObj = {}
    self.levelCheeseMap = {}

    self.angleModifier=0.9

    self.levelStr =
        '1,1,2,1,1,2,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,3,1,2,2,1,2,3,1,2,2,1,2,3,1,2,2,1,2,3,1,2,3,2,2,3,1,2,3,2,2,3,1,2,3,2,2,3,1,2,3,2,2,3'

    self:InitData()
end

function CheeseSpawner:InitData()
    self.CurrEnemyCheeseColor = self.EnemyCheeseColors[1]
    self.CurrNormalCheeseColor = self.NormalCheeseColors[1]

    -- 把resources的cheese资源加载到数组
    local objNames = CS.XLuaUtils.GetObjectNameWithFile('Assets/_JustJump/Resources/Cheeses')

    for i = 0, objNames.Length - 1 do
        local obj = ResourcesManager.Load('Cheeses/' .. objNames[i])
        table.insert(self.serialObj, obj)
        -- print(self.serialObj[i+1])
    end
    -- ---------------------------------------
    self.levelCheeseMap[1] = {}
    self.levelCheeseMap[2] = {}
    self.levelCheeseMap[3] = {}
    for i = 1, TableHelper:TableLen(self.serialObj) do
        if i % 3 == 0 then
            table.insert(self.levelCheeseMap[1], self.serialObj[i])
        elseif i % 3 == 2 then
            table.insert(self.levelCheeseMap[2], self.serialObj[i])
        else
            table.insert(self.levelCheeseMap[3], self.serialObj[i])
        end
    end
    local strArr = StringHelper.Split(self.levelStr, ',')
    for key, value in pairs(strArr) do
        self.levels[key] = value
    end
    self.pressedPos = Vector3.zero
    self.actualPos = Vector3.zero

    LuaUpdate.EnableUpdate(self, true)
end

function CheeseSpawner:Update()
  --  print('update......',self.transform.childCount < self.initailCheese,self.isSpawnComplete)
    if self.transform.childCount < self.initailCheese and self.isSpawnComplete == false then
       -- print(self.levelCheeseMap)
        if self.SpawnCount < self.initSpawnCount then
            
            self.SpawnCount = self.SpawnCount + 1
            self:SpawnCheese(self:GetSpawningPosition())
        else
            self:SpawnCheese(self:GetSpawningPosition(),true)
            self.isSpawnComplete = true
        end
    end

    if CS.UnityEngine.Time.realtimeSinceStartup>5.0 then
        self:ControllerRotation()
    end
end

function CheeseSpawner:ControllerRotation()
  
    if Input:GetMouseButtonDown(0) then
        self.pressedPos=Input.mousePosition
        self.actualPos=self.pressedPos
    elseif Input:GetMouseButton(0) then
        self.actualPos=Input.mousePosition
        local angle=self.pressedPos.x-self.actualPos.x
        angle=angle*self.angleModifier
        self.transform:Rotate(Vector3(0,angle,0))
        self.pressedPos=self.actualPos
    elseif Input:GetMouseButtonUp(0) then
        self.pressedPos=self.actualPos
    end
end

function CheeseSpawner:Reset()
    self.currLoopLevel = 0
    self.SpawnCount = 0
    self.isSpawnComplete = false
end

function CheeseSpawner:AddInitSpawnCount()
    self.currColorIndex = self.currColorIndex + 1
    self.currColorIndex = self.currColorIndex % 4
    self.CurrNormalCheeseColor = self.NormalCheeseColors[self.currColorIndex]
    self.CurrEnemyCheeseColor = self.EnemyCheeseColors[self.currColorIndex]

    self.initSpawnCount = self.initSpawnCount + (self.AddInitSpawnCount + 1)
end


function CheeseSpawner:SpawnCheese(spawnPos, isEnd)
    if isEnd == true then
        return
    end
    local a = tonumber(self.levels[self.currLoopLevel])
    if self.levelCheeseMap[a]==nil then
       return
    end
    local len = TableHelper:TableLen(self.levelCheeseMap[a])
    local b = math.ceil(CS.UnityEngine.Random.Range(0, len))
    self.currLoopLevel = self.currLoopLevel + 1
    if self.currLoopLevel >= TableHelper:TableLen(self.levels) then
        self.currLoopLevel = 0
        self.levels = {}
        table.insert(self.levels, 1)
        table.insert(self.levels, 2)
        table.insert(self.levels, 3)
    end
    local CheeseRotation = Quaternion.identity
    CheeseRotation.y = CS.UnityEngine.Random.Range(0, CS.UnityEngine.Mathf.PI)
    if self.transform.childCount == 0 then
        a = tonumber(1)
        b = tonumber(1)
        self.CheeseRotation = Quaternion.identity
    end
    --print(self.levelCheeseMap[a][b],',','pos:',spawnPos,',CheeseRotation:',CheeseRotation,',transform:',self.transform)
    if self.levelCheeseMap[a][b]==nil then
       -- print(',a:',a,',b:',b)
        return
        else
            --print(self.levelCheeseMap[a][b],',a:',a,',b:',b)
    end
    local cheeseInstance = Object.Instantiate(self.levelCheeseMap[a][b], spawnPos, CheeseRotation, self.transform)

    --[[ if self.diamondCount % 5 == 0 then
        if self.diamondCount == 0 then
            self.diamondCount = self.diamondCount + 1
            return
        end
        print('33333')
        local diamondParnet = nil
        local diamond = Object.Instantiate(self.diamondPrefab, diamondParnet.parent)
        diamond.transform.position =
            diamondParnet.parent.right * 1.7 - diamondParnet.parent.forward * 0.5 + cheeseInstance.transform.position +
            Vector3(0, 0.5, 0)
    end
 ]]
    self.diamondCount = self.diamondCount + 1
end

function CheeseSpawner:CreateObjWithName(objName)
    local prefab = ResourcesManager.Load('Prefab/' .. objName)
    local obj = Object.Instantiate(prefab)
    GameObjectExtends.TransformReset(obj.transform)
    return obj
end

function CheeseSpawner:GetSpawningPosition()
    if self.transform.childCount == 0 then
        return Vector3(0, self.initialYSpawn, 0)
    else
        return Vector3(0,self.transform:GetChild(self.transform.childCount - 1).position.y - self.distanceBetweenCheese,0)
    end
end

return CheeseSpawner
