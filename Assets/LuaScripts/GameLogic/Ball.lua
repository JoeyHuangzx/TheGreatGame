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

function Ball:Start()
    
    print('Ball Start fun...',self, self.gameObject.name,self.transform.name)
    base.Enable(self)
   -- Ball.isUpdate = true
end

function Ball:Update()
    print('ball update',self.gameObject.name)
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
--Ball.Move=Move

return Ball
