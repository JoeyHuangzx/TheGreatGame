
local panelName="GameOverPanel"

function Awake()
    print(panelName," this is Awake function",self.gameObject.name)
   -- self.gameObject:GetComponent("Button").onClick:AddListener(clickHandle)
 
end

function ClickHandle()
	print(panelName,"  button click handle")
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