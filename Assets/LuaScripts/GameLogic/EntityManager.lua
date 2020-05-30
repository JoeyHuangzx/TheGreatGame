EntityManager=BaseClass('EntityManager', Singleton)

function EntityManager:Init()
    local ball=EntityConfig.Ball.New()
    local obj=ObjectUtil:TranFindComponents('ball',GameObject.Find('Game').transform)
    ball:OnCreate(obj)

    local board=EntityConfig.Board.New()
    obj=ObjectUtil:TranFindComponents('board',GameObject.Find('Game').transform)
    board:OnCreate(obj)

    print('ball name:',ball.gameObject.name,ball,',board name:',board.gameObject.name,board)
end

function EntityManager:CreateCamera(  )
    -- body
end

function EntityManager:CreateBall(  )
    -- body
end

function EntityManager:CreateBoard(  )
    -- body
end

return EntityManager