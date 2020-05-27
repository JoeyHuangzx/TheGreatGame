UIManager = {}

local name = 'UIManager'

local windows = {}
local currWindow = nil

local uiCanvas = nil

local function Init()
    --  print('UIManager Init...')
    uiCanvas = GameObject.Find('Canvas')
    local panel = require 'UI.LobbyPanel'
    panel.New('i am lobby panel')
    local obj = CreatePanel('LobbyPanel')
    panel:OnCreate(obj)
    windows["LobbyPanel"]=obj
    currWindow=obj
end

local function OpenPanel(panelName)
    local target = windows[panelName]
    currWindow:SetActive(false)
    if target == nil then
        target = CreatePanel(panelName)
    end
    currWindow = target
    target:SetActive(true)
end

function CreatePanel(panelName)
    -- local panel = CS.XLuaUtils.GetGameObjectByName(panelName)
    local prefab = ResourcesManager.Load(panelName) --CS.UnityEngine.Resources.Load("GameOverPanel")
    local panel = Object.Instantiate(prefab, uiCanvas.transform)
    panel.name = panelName
    --panel:SetActive(true)
    windows[panelName] = panel
    return panel
end

local function ClosePanel(panelName)
    local target = windows[panelName]
    if target == nil then
        target:SetActive(false)
    end
end

UIManager.Init = Init
UIManager.OpenPanel = OpenPanel
UIManager.ClosePanel = ClosePanel

return UIManager
