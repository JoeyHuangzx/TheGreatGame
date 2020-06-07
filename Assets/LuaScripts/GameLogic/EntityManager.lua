EntityManager = BaseClass('EntityManager', Singleton)

function EntityManager:Init()
    local camera = EntityConfig.Camera.New()
    camera:OnCreate()

    local gameOBj=GameObject.Find('Game').transform

    local ball = EntityConfig.Ball.New()
    local prefab = ObjectUtil:TranFindComponents('ball', gameOBj)
    local obj = CS.UnityEngine.Object.Instantiate(prefab, gameOBj)
    ball:OnCreate(obj)

    local prefab2 = ObjectUtil:TranFindComponents('board', gameOBj)
    for i = 1, 100 do
        local board = EntityConfig.Board.New()
        local obj2 = CS.UnityEngine.Object.Instantiate(prefab2, gameOBj)
        board:OnCreate(obj2)

        local offset=CS.UnityEngine.Mathf.PI*110/180
        local y=offset+i*offset
        local x=CS.UnityEngine.Mathf.Sin(offset+i*offset)*3
        board.transform.position=Vector3(x,y,0)
        board:SetActive(true)
    end

    camera:SetFollow(ball)
    UIManager.windows['LobbyPanel']:SetActive(false)
    -- print('ball name:',ball.name,',board name:',board.name)
end

function EntityManager:CreateCamera()
    -- body
end

function EntityManager:CreateBall()
    -- body
end

function EntityManager:CreateBoard()
    -- body
end

return EntityManager
