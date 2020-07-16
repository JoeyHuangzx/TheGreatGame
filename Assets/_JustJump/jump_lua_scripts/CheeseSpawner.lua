
CheeseSpawner=BaseClass('CheeseSpawner',Singleton)

function CheeseSpawner:Initialize()
    self.gameObject=GameObject.Find('CheeseSpawner')
    self.transform=self.gameObject.transform

    self.player=self:CreateObjWithName('Player')
    self.cheesePrefabs={}
    self.cheeseEnemiesPrefabs={}
    self.pillar=GameObject.Find('Pillar')
    self.diamondPrefab=ResourcesManager.Load('Prefab/Coin')
    self.initialYSpawn=0
    self.distanceBetweenCheese=0
    self.initailCheese=0
    -- 
    self.pressedPos=Vector3.zero
    self.actualPos=Vector3.zero
    self.resetTrigger=false
    self.SpawnCount=0
    self.currLoopLevel=1
    self.initSpawnCount=21
    self.isSpawnComplete=false
    self.AddSpawnEachLevel=5
    self.diamondCount=1
    self.currColorIndex=1
    self.NormalCheeseColors={'111111','222222','333333'}
    self.EnemyCheeseColors={'aaaaaa','bbbbbb','abcdef'}
    self.CurrNormalCheeseColor=nil
    self.CurrEnemyCheeseColor=nil

    self.levels={}
    self.serialObj={}
    self.levelCheeseMap={}


    self.levelStr='1,1,2,1,1,2,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,3,1,2,2,1,2,3,1,2,2,1,2,3,1,2,2,1,2,3,1,2,3,2,2,3,1,2,3,2,2,3,1,2,3,2,2,3,1,2,3,2,2,3'

    self:InitData()
end

function CheeseSpawner:InitData()
    self.CurrEnemyCheeseColor=self.EnemyCheeseColors[1]
    self.CurrNormalCheeseColor=self.NormalCheeseColors[1]

    self.levelCheeseMap[1]={}
    self.levelCheeseMap[2]={}
    self.levelCheeseMap[3]={}
    for i = 1, 100 do
        if i%3==0 then
            table.insert(self.levelCheeseMap[1],i)
        elseif i%3==2 then
            table.insert(self.levelCheeseMap[2],i)
        else
            table.insert(self.levelCheeseMap[3],i)
        end
    end


    local strArr=StringHelper.Split(self.levelStr,',')
    for key, value in pairs(strArr) do
        self.levels[key]=value
    end
    self.pressedPos=Vector3.zero
    self.actualPos=Vector3.zero

    local objNames=CS.XLuaUtils.GetObjectNameWithFile('Assets/_JustJump/Resources/Cheeses')
    print(objNames.Length)
    for i = 0, objNames.Length-1 do
        local obj=ResourcesManager.Load('Cheeses/'..objNames[i])
        table.insert(self.serialObj,obj)
       -- print(self.serialObj[i+1])
    end
end


function CheeseSpawner:Update(self)
    if self.transform.childCount<self.initailCheese and self.isSpawnComplete==false then
        if self.SpawnCount<self.initSpawnCount then
            self.SpawnCount=self.SpawnCount+1
        else
            self.isSpawnComplete=true
        end
    end
end

function CheeseSpawner:Reset()
    self.currLoopLevel=0
    self.SpawnCount=0
    self.isSpawnComplete=false
end

function CheeseSpawner:AddInitSpawnCount()
    self.currColorIndex=self.currColorIndex+1
    self.currColorIndex=self.currColorIndex%4
    self.CurrNormalCheeseColor=self.NormalCheeseColors[self.currColorIndex]
    self.CurrEnemyCheeseColor=self.EnemyCheeseColors[self.currColorIndex]

    self.initSpawnCount=self.initSpawnCount+(self.AddInitSpawnCount+1)
end

function CheeseSpawner:SpawnCheese(spawnPos,isEnd)
    if isEnd==true then
        return
    end
    local a=self.levels[self.currLoopLevel]
    local len=TableHelper:TableLen(self.levelCheeseMap[a])
    local b=CS.UnityEngine.Random.Range(0,len)
    self.currLoopLevel=self.currLoopLevel+1
    
    if self.currLoopLevel>=TableHelper:TableLen(self.levels) then
        self.currLoopLevel=0
        self.levels={}
        table.insert(self.levels,1)
        table.insert(self.levels,2)
        table.insert(self.levels,3)
    end
    local CheeseRotation=Quaternion.identity
    CheeseRotation.y=CS.UnityEngine.Random.Range(0,CS.UnityEngine.Mathf.PI)
    if self.transform.childCount==0 then
        a=1
        b=0
        self.CheeseRotation=Quaternion.identity
    end
    local cheeseInstance=Object.Instantiate(self.levelCheeseMap[a][b],self.spawnPos,CheeseRotation,self.transform)

    if self.diamondCount%5==0 then
        
        if self.diamondCount==0 then
            self.diamondCount=self.diamondCount+1
            return
        end

        local diamondParnet=nil
        local diamond=Object.Instantiate(self.diamondPrefab,diamondParnet.parent)
        diamond.transform.position=diamondParnet.parent.right*1.7-diamondParnet.parent.forward*0.5+cheeseInstance.transform.position+Vector3(0,0.5,0)
    end
    
    self.diamondCount=self.diamondCount+1
end

function CheeseSpawner:CreateObjWithName(objName)
    local prefab=ResourcesManager.Load("Prefab/"..objName)
    local obj = Object.Instantiate(prefab)
    GameObjectExtends.TransformReset(obj.transform)
    return obj
    
end

function CheeseSpawner:GetSpawningPosition()
   if self.transform.childCount==0 then
       return Vector3(0,self.initialYSpawn,0)
   else
        return Vector3(0,self.transform:GetChild(self.transform.childCount-1).position.y-self.distanceBetweenCheese,0)
   end
end


return CheeseSpawner