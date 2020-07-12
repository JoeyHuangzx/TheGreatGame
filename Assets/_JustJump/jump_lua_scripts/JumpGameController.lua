GameState = {
    MENU = 0,
    GAME = 1,
    GAMEOVER = 2,
    PAUSE = 3,
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

-- ++++++ UI ++++++ --

--[[  Panel ]]
JumpGameController.Menu = nil
JumpGameController.Game = nil
JumpGameController.GameOver = nil
JumpGameController.Pause = nil
JumpGameController.Shop = nil

--[[  button ]]
JumpGameController.playBtn = nil

--[[  text ]]
JumpGameController.ScoreText = nil
JumpGameController.BestScoreText = nil
JumpGameController.GameOverText = nil
JumpGameController.CoinsMenuText = nil
JumpGameController.CoinsGameText = nil
JumpGameController.CoinsShop = nil
JumpGameController.PauseBestText = nil
JumpGameController.MenuScoreText = nil
JumpGameController.ReplayText = nil
JumpGameController.CompleteText = nil

-- ++++++++++++++++++++++ --

JumpGameController.gameState = GameState.GAME
JumpGameController.mainCamera=nil



function JumpGameController:Initialize()
    self.mainCamera=CS.UnityEngine.Camera.main
end

function JumpGameController:SetPanelActive()
    
end

return JumpGameController
