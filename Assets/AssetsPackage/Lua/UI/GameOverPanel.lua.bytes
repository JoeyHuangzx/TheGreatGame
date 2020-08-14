local panelName = 'GameOverPanel'

local restartBtn = nil
local homeBtn = nil

function Awake()
    print(panelName, ' this is Awake function', self.gameObject.name)
    restartBtn = CS.XLuaUtils.GetGameObjectByName('restartBtn',self.gameObject)
    homeBtn = CS.XLuaUtils.GetGameObjectByName("homeBtn",self.gameObject)
end

function OnEnable()
    print(panelName, ' LobbyPanel this is OnEnable function')
end

function Start()
    print(panelName, '  this is Start function')
    restartBtn:AddButtonListener(RestartHandle)
    homeBtn:AddButtonListener(HomeHandle)
end

function RestartHandle()
    UIManager.OpenPanel('GamePanel')
end

function HomeHandle()
    UIManager.OpenPanel('LobbyPanel')
end


function OnDestroy()
    print('this is OnDestroy function')
end
