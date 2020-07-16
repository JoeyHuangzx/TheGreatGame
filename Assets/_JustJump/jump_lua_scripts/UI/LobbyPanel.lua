LobbyPanel = BaseClass('LobbyPanel', BaseComponent)


function LobbyPanel:constructor(params)
    self.base = LobbyPanel.base
    --self.base.constructor(self,params)
end

function LobbyPanel:Awake()
    self.base.Awake()
    --  print(panelName, ' this is Awake function', self.gameObject.name)
   
end

function LobbyPanel:OnCreate(gameObject)
    self.gameObject = gameObject
    self.transform = gameObject.transform
    self.playBtn=ObjectUtil:FindComponentsWithTran('playBtn',self.gameObject)
    self.logo=ObjectUtil:FindComponentsWithTran('logo',self.gameObject)
    self.coinTxt=ObjectUtil:FindComponentsWithTran('coinTxt',self.gameObject)
end

function LobbyPanel:OnEnable()
    self.gameObject:SetActive(true)
    -- print(panelName, ' LobbyPanel this is OnEnable function')
end

function LobbyPanel:SetActive(enable)
    self.gameObject:SetActive(enable)
end


function LobbyPanel:Start()
    --  print(panelName, '  this is Start function')
   
end

function LobbyPanel:SetActive(enable)
    self.gameObject:SetActive(enable)
end

function LobbyPanel:AddListener()
    print(self)
    self:OnClick(self.playBtn, self.PlayClick)
end

function LobbyPanel:PlayClick(obj)
    print('click play game', self, obj)
    JumpGameController:ChangeGameState(GameState.GAME)
end

function LobbyPanel:SkinClick(obj)
    print(' SkinClick handle', self, obj)
end

function LobbyPanel:MusicClick(obj)
    print(' MusicClick handle', self, obj)
end

function LobbyPanel:OnDestroy()
    print('this is OnDestroy function')
end

return LobbyPanel
