
local Singleton = BaseClass("Singleton")
Singleton.instance=nil

function Singleton:GetInstance()
    --[[ if Singleton.instance==nil then
        Singleton.instance=Singleton.New()
    end
    return Singleton.instance ]]
    if rawget(self, "instance") == nil then
		rawset(self, "instance", self.New())
	end
	assert(self.instance ~= nil)
	return self.instance
end

return Singleton