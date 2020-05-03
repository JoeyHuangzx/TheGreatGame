local panelName = 'LobbyPanel'

local playBtn = nil
local skinBtn = nil
local musicBtn = nil

function Awake()
  --  print(panelName, ' this is Awake function', self.gameObject.name)
    playBtn = CS.XLuaUtils.GetGameObjectByName('playBtn',self.gameObject)
    skinBtn = CS.XLuaUtils.GetGameObjectByName('skinBtn',self.gameObject)
    musicBtn = CS.XLuaUtils.GetGameObjectByName('musicBtn',self.gameObject)
end

function OnEnable()
   -- print(panelName, ' LobbyPanel this is OnEnable function')
end

function Start()
  --  print(panelName, '  this is Start function')
    AddListener()
end

function AddListener()
    playBtn:AddButtonListener(PlayClick)
    skinBtn:AddButtonListener(SkinClick)
    musicBtn:AddButtonListener(MusicClick)
end

function PlayClick()
    UIManager.OpenPanel('GamePanel')
end

function SkinClick()
    print(' SkinClick handle')
end

function MusicClick()
    print(' MusicClick handle')
end

function Update()
    -- print("this is Update function")
end

function OnDestroy()
    print('this is OnDestroy function')
end
