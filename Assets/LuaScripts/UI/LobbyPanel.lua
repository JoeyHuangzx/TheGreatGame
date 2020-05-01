
local panelName="LobbyPanel"

function Awake()
    print(panelName," this is Awake function",self.gameObject.name)
    CS.XLuaUtils.GetGameObjectByName("playBtn"):GetButton().onClick:AddListener(PlayClick)
    CS.XLuaUtils.GetGameObjectByName("skinBtn"):GetButton().onClick:AddListener(SkinClick)
    CS.XLuaUtils.GetGameObjectByName("musicBtn"):GetButton().onClick:AddListener(MusicClick)
 
end

function PlayClick()
	UIManager.OpenPanel("GameOverPanel")
end

function SkinClick()
	print(" SkinClick handle")
end

function MusicClick()
	print(" MusicClick handle")
end

function OnEnable()
     print(panelName," LobbyPanel this is OnEnable function")
end

function Start()
    print(panelName,"  this is Start function")
  
end

function Update()
    -- print("this is Update function")
end

function OnDestroy()
    print("this is OnDestroy function")
end