
local CheeseBehaviour=BaseClass('CheeseBehaviour',LuaUpdate)


function CheeseBehaviour:constructor()
    
end

function CheeseBehaviour:OnCreate()
    self.gameObject=nil
    self.transform=nil
    self.forceMagnitude=0
    self.didExplode=false
    self.Level=1
    self.playerObj=nil
end

function CheeseBehaviour:OnEnable()
    self:EnableUpdate(true)
end

function CheeseBehaviour:FixedUpdate()
    if self.didExplode==false then
        return
    end
    if self.playerObj.position.y<self.transform.position.y-0.5 and self.didExplode==false then
        
    end
    
end

function  CheeseBehaviour:GetDiamonPos()
    local cheeseList={}
    for i = 0, self.transform.childCount do
        local _child=self.transform:GetChild(i):GetChild(0)
        if _child.tag=='Cheese' then
            table.insert(cheeseList,_child)
        end
    end
    local len=TableHelper:TableLen(cheeseList)
    local random=CS.UnityEngine.Random.Range(0,len)
    local trans=cheeseList[random]
    cheeseList=nil
end

function CheeseBehaviour:Explode()
    self.didExplode=true
    self.transform.parent=nil
    self:ManageScore()
    CS.UnityEngine:Destroy(self.gameObject,1)
    self:DisableMeshColliders()
    self:AddRigidbodies()
    self:SplitCheese()
end

function CheeseBehaviour:ManageScore()
    -- statements
    local cheeseCombo=0
    JumpGameController:GetInstance().score=JumpGameController:GetInstance().score+(2*cheeseCombo)
end

function CheeseBehaviour:AddRigidbodies()
    for i = 0, self.transform.childCount do
        if self.transform:GetChild(i).childCount>0 then
            self.transform:GetChild(i):GetChild(0).gameObject:addComponent(typeof(CS.UnityEngine.Rigidbody));
        end
    end
end

function CheeseBehaviour:DisableMeshColliders(params)
    for i = 0, self.transform.childCount do
        if self.transform:GetChild(i).childCount>0 then
            self.transform:GetChild(i):GetChild(0).gameObject:getComponent(typeof(CS.UnityEngine.MeshCollider)).isTrigger=true
        end
    end
end

function CheeseBehaviour:SplitCheese(params)
    for i = 0, self.transform.childCount do
        if self.transform:GetChild(i).childCount>0 then
            self:ThrowPart(self.transform:GetChild(i):GetChild(0))
        end
    end
end

function ThrowPart(cheesePart)
    local rigid=cheesePart:getComponent(typeof(CS.UnityEngine.MeshCollider))
    local dir=cheesePart:getComponent(typeof(CS.UnityEngine.MeshCollider)).bounds.center-self.transform.position
    rigid:AddForce(dir*self.forceMagnitude)
end

return CheeseBehaviour
