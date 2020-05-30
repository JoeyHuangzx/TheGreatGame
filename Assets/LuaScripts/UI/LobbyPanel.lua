LobbyPanel = BaseClass('LobbyPanel', BaseComponent)

local playBtn = nil
local skinBtn = nil
local musicBtn = nil
local panelPath = 'Canvas/LobbyPanel'

function LobbyPanel:constructor(params)
    self.base = LobbyPanel.base
    --self.base.constructor(self,params)
end

function LobbyPanel:Awake()
    self.base.Awake()
    --  print(panelName, ' this is Awake function', self.gameObject.name)
    playBtn = ObjectUtil:FindGameObject('playBtn', self.transform)
    skinBtn = ObjectUtil:FindGameObject('skinBtn', self.transform)
    musicBtn = ObjectUtil:FindGameObject('musicBtn', self.transform)
    self:Start()
end

function LobbyPanel:OnCreate(gameObject)
    self.gameObject = gameObject
    self.transform = gameObject.transform
    if self.gameObject ~= nil then
        self.gameObject:SetActive(true)
        self:Awake()
    else
        assert(self.gameObject, 'the gameobject is null')
    end
end

function LobbyPanel:OnEnable()
    self:Awake()
    -- print(panelName, ' LobbyPanel this is OnEnable function')
end

function LobbyPanel:Start()
    --  print(panelName, '  this is Start function')
    self:AddListener()
end

function LobbyPanel:AddListener()
    print(self)
    self:OnClick(playBtn, self.PlayClick)
    self:OnClick(skinBtn, self.SkinClick)
    self:OnClick(musicBtn, self.MusicClick)
end

function LobbyPanel:PlayClick(obj)
    print('click play game', self, obj)
    UIManager:GetInstance():OpenPanel('GamePanel')
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
