local Ball = BaseClass('Ball', LuaUpdate)
Ball.timer = 0
Ball.isUpdate = false

function Ball:constructor(params)
    self.base = Ball.base
    print('Ball Constructor')
end

function Ball:Start()
    self.base:Start()
    --self:Start()
    print('Ball Start fun...', self)
    self:EnableUpdate(true)
    Ball.isUpdate = true
end

function Ball:Update()
    if Ball.isUpdate then
        print('ball update')
        -- Ball.timer+=self.fixedDeltaTime

        if Ball.timer > 10 then
            self:RemoveEnable()
        else
            Ball.timer = Ball.timer + self.fixedDeltaTime
            print('timer:',Ball.timer)
        end
    end
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
