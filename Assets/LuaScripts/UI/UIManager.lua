
UIManager={}

local name="UIManager"

local function Init()
    print("UIManager Init...");
    local lobby=CS.XLuaUtils.GetGameObjectByName("LobbyPanel")
    print(lobby)
    lobby:SetActive(true)
end

local function OpenPanel(panelName)
    local panel=CS.XLuaUtils.GetGameObjectByName(panelName)
    panel:SetActive(true)
end

local function ClosePanel()

end

UIManager.Init=Init;
UIManager.OpenPanel=OpenPanel;
UIManager.ClosePanel=ClosePanel;

return UIManager;
