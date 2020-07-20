Camera = BaseClass('Camera', LuaUpdate)

function Camera:constructor()
end

function Camera:OnCreate()
    self.gameObject = GameObject.Find('Main Camera')
    self.transform = self.gameObject.transform
    print('camera oncreate', self.gameObject.name)
end

function Camera:SetFollow(_target)
    self.target = _target
    self.isUpdate = true
    self:Initialize()
end

function Camera:Initialize()
    self.yOffset = 0.89
    self.initialPos = self.transform.localPosition
    self.initialDeltaY = self.target.transform.localPosition.y - self.initialPos.y
    self.minimumPlayerY = 0
    self.spwaner = nil
    self.resetCamera = false
    JumpGameController:GetInstance().gameState = GameState.GAME
    LuaUpdate.EnableUpdate(self, true)
end

local targetY = 0
function Camera.Update(self)
    if self.isUpdate == true then
        if JumpGameController:GetInstance().gameState == GameState.GAME then
            if self.target.transform.localPosition.y < self.minimumPlayerY then
                self.minimumPlayerY = self.target.transform.localPosition.y
            end
            if CheeseSpawner:GetInstance().isSpawnComplete and self.spwaner.transform.childCount < 3 then
                return
            end
            self.transform.localPosition =
                Vector3(
                self.transform.localPosition.x,
                self.minimumPlayerY - self.initialDeltaY + self.yOffset,
                self.transform.localPosition.z
            )
        end
        local code=CS.UnityEngine.KeyCode.Space
        --[[ if Input:GetKeyDown(code)==true then
            JumpGameController:GetInstance().gameState = GameState.GAME
        end ]]
    end
end

return Camera
