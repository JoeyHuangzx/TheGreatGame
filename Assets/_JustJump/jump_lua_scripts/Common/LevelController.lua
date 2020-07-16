
LevelController=BaseClass('LevelController',Singleton)

function LevelController:Initialize(params)
    self.currLevel=1
    self.LEVEL_DATA='level_data'

end

function LevelController:SaveLevel()
    self.currLevel=self.currLevel+1
    CS.UnityEngine.PlayerPrefs:SetInt(self.LEVEL_DATA,self.currLevel)
end

function LevelController:GetLevel()
    self.currLevel=CS.UnityEngine.PlayerPrefs.GetInt(self.LEVEL_DATA)
    if self.currLevel==0 then
         self:SaveLevel()
    end
    return self.currLevel
end

return LevelController