local panelName = 'GamePanel'

local board = nil
local ball = nil
local camera = nil
local pauseBtn = nil
local homeBtn = nil
local resetBtn = nil
local leftBtn = nil
local rightBtn = nil
local touchJumpBtn = nil

function Awake()
    InitUI()
    InitGame()
    CreateBoard()
end

function InitUI()
    pauseBtn = CS.XLuaUtils.GetGameObjectByName('pauseBtn', self.gameObject)
    homeBtn = CS.XLuaUtils.GetGameObjectByName('homeBtn', self.gameObject)
    resetBtn = CS.XLuaUtils.GetGameObjectByName('resetBtn', self.gameObject)
    leftBtn = CS.XLuaUtils.GetGameObjectByName('leftBtn', self.gameObject)
    rightBtn = CS.XLuaUtils.GetGameObjectByName('rightBtn', self.gameObject)
    touchJumpBtn = CS.XLuaUtils.GetGameObjectByName('touchJump', self.gameObject)
end

function OnEnable()
    -- print(panelName, ' LobbyPanel this is OnEnable function')
end

function Start()
    -- print(panelName, '  this is Start function')
    if board ~= nil then
        board.Start()
    end
    if ball ~= nil then
        ball.Start()
    end
    pauseBtn:AddButtonListener(PauseHandle)
    homeBtn:AddButtonListener(HomeHandle)
    resetBtn:AddButtonListener(ResetHandle)
    leftBtn:AddButtonListener(LeftHandle)
    rightBtn:AddButtonListener(RightHandle)
    touchJumpBtn:AddButtonListener(JumpHandle)
end

function InitGame(arg1, arg2, arg3)
    board = Util.GetBoard()
    ball = Util.GetBall()
    camera = Util.GetCamera()
    --print(camera)
    board.Init()
    ball.Init()
    camera.Init()
end

function CreateBoard()
    for i = 1, 10 do
        local _b = Object.Instantiate(board.Obj, self.transform)
        _b.transform.position = Vector3((i % 2) * 3 - 1.2, (i / 2) * 4 - 2, 0)
    end
end

function PauseHandle()
    UIManager.OpenPanel('GameOverPanel')
end

function HomeHandle()
    UIManager.OpenPanel('LobbyPanel')
end

function ResetHandle()
    ball.Obj:GetComponent('Rigidbody2D').velocity = Vector2.Zero
    ball.Obj.transform.position = Vector3.Zero
end

function JumpHandle()
    ball.Obj:GetComponent('Rigidbody2D').velocity = Vector2(0, 7)
end

function LeftHandle()
    ball.Obj:GetComponent('Rigidbody2D').velocity = Vector2(-3.5, 0)
end

function RightHandle()
    ball.Obj:GetComponent('Rigidbody2D').velocity = Vector2(3.5, 0)
end

function Update()
    -- print("this is Update function")
    if board ~= nil then
        board.Update()
    end
    if ball ~= nil then
        ball.Update()
    end
    if camera ~= nil then
        camera.Update()
    end
end

function OnDestroy()
    print('this is OnDestroy function')
end
