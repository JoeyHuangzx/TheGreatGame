
local Singleton = BaseClass("Singleton")
--Singleton.instance=nil

function Singleton:GetInstance()
    -- rawget(tb, i)就是对table tb进行了一次“原始的（raw）”访问，也就是一次不考虑元表的简单访问
    -- rawset:绕过metatable的行为约束，强制对原始表进行一次原始的操作
    if rawget(self, "instance") == nil then
		rawset(self, "instance", self.New())
	end
	assert(self.instance ~= nil)
	return self.instance
end

return Singleton