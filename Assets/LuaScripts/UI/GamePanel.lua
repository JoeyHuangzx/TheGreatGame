GamePanel=BaseClass('GamePanel',BaseComponent)

local board = nil
local ball = nil
local camera = nil
local pauseBtn = nil
local homeBtn = nil
local resetBtn = nil
local leftBtn = nil
local rightBtn = nil
local touchJumpBtn = nil

function GamePanel:Awake()
    --InitUI()
   -- InitGame()
   -- CreateBoard()
end

function GamePanel:InitUI()
    --[[ pauseBtn = CS.XLuaUtils.GetGameObjectByName('pauseBtn', self.gameObject)
    homeBtn = CS.XLuaUtils.GetGameObjectByName('homeBtn', self.gameObject)
    resetBtn = CS.XLuaUtils.GetGameObjectByName('resetBtn', self.gameObject)
    leftBtn = CS.XLuaUtils.GetGameObjectByName('leftBtn', self.gameObject)
    rightBtn = CS.XLuaUtils.GetGameObjectByName('rightBtn', self.gameObject)
    touchJumpBtn = CS.XLuaUtils.GetGameObjectByName('touchJump', self.gameObject) ]]
end

function GamePanel:OnEnable()
    -- print(panelName, ' LobbyPanel this is OnEnable function')
end

function GamePanel:Start()
    -- print(panelName, '  this is Start function')
  --[[   if board ~= nil then
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
    touchJumpBtn:AddButtonListener(JumpHandle)]]
end

function GamePanel:InitGame(arg1, arg2, arg3)
    --[[ board = Util.GetBoard()
    ball = Util.GetBall()
    camera = Util.GetCamera()
    --print(camera)
    board.Init()
    ball.Init()
    camera.Init() ]]
end

function GamePanel:CreateBoard()
    
end

function GamePanel:PauseHandle()
    UIManager.OpenPanel('GameOverPanel')
end

function GamePanel:HomeHandle()
    UIManager.OpenPanel('LobbyPanel')
end

function GamePanel:ResetHandle()
    --ball.Obj:GetComponent('Rigidbody2D').velocity = Vector2.Zero
    --ball.Obj.transform.position = Vector3.Zero
end

function GamePanel:JumpHandle()
    --ball.Obj:GetComponent('Rigidbody2D').velocity = Vector2(0, 7)
end

function GamePanel:LeftHandle()
    --ball.Obj:GetComponent('Rigidbody2D').velocity = Vector2(-3.5, 0)
end

function GamePanel:RightHandle()
    --ball.Obj:GetComponent('Rigidbody2D').velocity = Vector2(3.5, 0)
end

function GamePanel:Update()
    -- print("this is Update function")
    if board ~= nil then
      --  board.Update()
    end
    if ball ~= nil then
     --   ball.Update()
    end
    if camera ~= nil then
     --   camera.Update()
    end
end

function GamePanel:OnDestroy()
    print('this is OnDestroy function')
end

return GamePanel