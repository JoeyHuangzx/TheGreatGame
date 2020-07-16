GameState = {
    MENU = 0,
    GAME = 1,
    PAUSE = 2,
    GAMEOVER = 3,
    TUTORIAL = 4,
    SHOP = 5
}

PanelType={
    MenuPanel=0,
    GamePanel=1,
    GameOver=2,
    Pause=3,
    Shop=4,
}

JumpGameController = BaseClass('JumpGameController', Singleton)

-- ++++++ data ++++++ --
JumpGameController.score = 6
JumpGameController.bestScore = 1
JumpGameController.coins = 9

-- ++++++++++++++++++++++ --

-- ++++++++++++++++++++++ --

JumpGameController.gameState = GameState.GAME
JumpGameController.mainCamera=nil



function JumpGameController:Initialize()
    self.mainCamera=CS.UnityEngine.Camera.main
    UIManager:GetInstance():Init()
    self.testTable={}
    self:FunInsert(self.testTable,self.SetMenu)
    self:FunInsert(self.testTable,self.SetGaming)
    self:FunInsert(self.testTable,self.SetPause)
    self:FunInsert(self.testTable,self.SetGameOver)

end

function JumpGameController:FunInsert(tb,cb)
    table.insert(tb,cb)
end

function JumpGameController:ChangeGameState(_gameState)
    self.testTable[_gameState+1](self)
end

function JumpGameController:SetMenu()
    print('set menu')
    UIManager:GetInstance():OpenPanel(PanelName.LobbyPanel)
end

function JumpGameController:SetGaming()
    UIManager:GetInstance():OpenPanel(PanelName.GamePanel)
    print('set Gaming')
end

function JumpGameController:SetPause()
    print('set Pause')
end

function JumpGameController:SetGameOver()
    UIManager:GetInstance():OpenPanel(PanelName.GameOverPanel)
    print('set GameOver')
end



return JumpGameController
