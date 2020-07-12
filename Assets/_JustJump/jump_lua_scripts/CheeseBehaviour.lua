
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


return CheeseBehaviour
