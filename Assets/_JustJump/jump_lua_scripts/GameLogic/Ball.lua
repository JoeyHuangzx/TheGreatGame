local Ball = BaseClass('Ball', BaseEntity)
local base=BaseEntity
Ball.timer = 0
Ball.isUpdate = false

function Ball:constructor()
    --self.base = Ball.base
    --print('Ball Constructor',self,self.base,Ball.base)
end

function Ball:OnCreate(_gameObject)
    self.gameObject=_gameObject
    self.transform=_gameObject.transform
    
    base.OnCreate(self)
    self:Start()
end

function Ball:SetActive(enable)
    self.gameObject:SetActive(enable)
end

function Ball:Start()
    
  --  print('Ball Start fun...',self, self.gameObject.name,self.transform.name)
    self:EnableUpdate(true)
    self.gameObject:SetActive(true)
    
   -- Ball.isUpdate = true
end

function Ball.Update(self)
    self.transform.position=Vector3(self.transform.position.x,self.transform.position.y+0.1,0)
    --print('ball update',self.gameObject.name)
end

function Ball:LateUpdate()
    print('ball lateupdate ')
end

function Ball:FixedUpdate()
    print('ball fixedupdate')
end

function Ball:Jump()
    print('ball Jump', self)
end

function Ball:Move(params)
    print('ball move', self)
end

--Ball.constructor=constructor
--Ball.Jump=Jump
Ball.base=base

return Ball
