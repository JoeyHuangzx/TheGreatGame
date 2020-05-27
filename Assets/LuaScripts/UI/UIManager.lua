UIManager = BaseClass('UIManager',Singleton)
UIManager.name = 'UIManager'

UIManager.windows = {}
UIManager.currWindow = nil

UIManager.uiCanvas = nil


function UIManager:Init()
    print('UIManager Init...',self)
    UIManager.uiCanvas = GameObject.Find('Canvas')
    local panel = require 'UI.LobbyPanel'
    panel.New('i am lobby panel')
    local obj = self:CreatePanel('LobbyPanel')
    panel:OnCreate(obj)
    UIManager.windows["LobbyPanel"]=obj
    UIManager.currWindow=obj
end

function UIManager:OpenPanel(panelName)
    local target = UIManager.windows[panelName]
    UIManager.currWindow:SetActive(false)
    if target == nil then
        target = self:CreatePanel(panelName)
    end
    UIManager.currWindow = target
    target:SetActive(true)
end

function UIManager:CreatePanel(panelName)
    -- local panel = CS.XLuaUtils.GetGameObjectByName(panelName)
    print('create panel name:',panelName)
    local prefab = ResourcesManager.Load(panelName) --CS.UnityEngine.Resources.Load("GameOverPanel")
    local panel = Object.Instantiate(prefab, UIManager.uiCanvas.transform)
    panel.name = panelName
    --panel:SetActive(true)
    UIManager.windows[panelName] = panel
    return panel
end

function UIManager:ClosePanel(panelName)
    local target = UIManager.windows[panelName]
    if target == nil then
        target:SetActive(false)
    end
end


return UIManager
