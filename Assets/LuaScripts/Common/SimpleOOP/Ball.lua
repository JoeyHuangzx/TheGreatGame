
local Ball=BaseClass('Ball', LuaUpdate)
--local base=LuaUpdate

function Ball:constructor(params)
    self.base=Ball.base;
    print('Ball Constructor')
end

function Ball:Start( ... )
    self.base:Start()
    print('Ball Start fun...',self)
    self:EnableUpdate(false)
end

function Ball:Update()
  print('ball update')
end

function Ball:Jump()
    print('ball Jump',self)
end

function Ball:Move(params)
    print('ball move',self)
end

--Ball.constructor=constructor
--Ball.Jump=Jump
--Ball.Move=Move

return Ball