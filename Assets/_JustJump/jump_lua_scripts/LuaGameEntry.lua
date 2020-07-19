LuaGameEntry = {}

require 'Common.JumpGlobal'

require 'CodeVerify'

function LuaGameEntry:Start()
    print('start...')

    InitManager()

end

function InitManager()
    EntityComponentManager:GetInstance():Initialize()
    JumpGameController:GetInstance():Initialize()
    CheeseSpawner:GetInstance():Initialize()
end

return LuaGameEntry
