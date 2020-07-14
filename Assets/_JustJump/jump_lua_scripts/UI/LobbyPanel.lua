LobbyPanel = BaseClass('LobbyPanel', BaseComponent)

--local playBtn = nil
--local skinBtn = nil
--local musicBtn = nil
--local panelPath = 'Canvas/LobbyPanel'

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
  
end

function LobbyPanel:OnEnable()
    print(self.gameObject)
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
    self:OnClick(self.skinBtn, self.SkinClick)
    self:OnClick(self.musicBtn, self.MusicClick)
end

function LobbyPanel:PlayClick(obj)
    print('click play game', self, obj)
    UIManager:GetInstance():OpenPanel('GamePanel')
    EventMessager:DispatchEvent('StartGame')
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
