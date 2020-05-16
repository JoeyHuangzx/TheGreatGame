
local Ball=BaseClass('Ball', BaseComponent)

function Ball:constructor(params)
    print('Ball Constructor')
end

function Ball:Start( ... )
    print('Ball Start fun...')
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