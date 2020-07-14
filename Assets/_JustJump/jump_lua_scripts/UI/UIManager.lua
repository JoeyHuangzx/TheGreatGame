UIManager = BaseClass('UIManager',Singleton)
UIManager.name = 'UIManager'

UIManager.windows = {}
UIManager.currWindow = nil

--UIManager.uiCanvas = nil
PanelName={
    LobbyPanel='LobbyPanel',
    GamePanel='GamePanel',
    GameOverPanel='GameOverPanel'
}

function UIManager:Init()
   -- print('UIManager Init...',self)
    self.uiCanvas = GameObject.Find('Canvas')
    local panel = self:CreatePanel('LobbyPanel')
    UIManager.currWindow=panel
  --  print('curr:',UIManager.currWindow.name)
end

function UIManager:OpenPanel(panelName)
    local panel = UIManager.windows[panelName]
    UIManager.currWindow:SetActive(false)
    if panel == nil then
        panel=self:CreatePanel(panelName)
    end
    UIManager.currWindow = panel
    panel:OnEnable()
end

function UIManager:CreatePanel(panelName)
    -- local panel = CS.XLuaUtils.GetGameObjectByName(panelName)
    print('create panel name:',panelName)
    local prefab = ResourcesManager.Load("UI/"..panelName) --CS.UnityEngine.Resources.Load("GameOverPanel")
    local panelObj = Object.Instantiate(prefab, self.uiCanvas.transform)
    local panel = UIConfig[panelName].New()
    UIManager.windows[panelName] = panel
    panel:OnCreate(panelObj)
    return panel
end

function UIManager:ClosePanel(panelName)
    local target = UIManager.windows[panelName]
    if target == nil then
        target:SetActive(false)
    end
end


return UIManager
