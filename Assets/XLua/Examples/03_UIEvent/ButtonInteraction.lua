function start()
    print("lua start..."..btn)
    --this:GetComponent("Button").onClick:AddListener(clickHandle)
    btn:GetComponent("Button").onClick:AddListener(clickHandle)
	-- input 和 Tip都为你在LuaBehviour类里injection的injection.name
	--[[
	this:GetComponent("Button").onClick:AddListener(function()
		print("clicked, you input is '" ..input:GetComponent("InputField").text .."'")
		tip:GetComponent("InputField").text="test change"
		print("my self test " ..tip:GetComponent("InputField").text)
	end)
	--]]
end

function clickHandle()
	print("clicked, you input is '" ..input:GetComponent("InputField").text .."'")
		tip:GetComponent("InputField").text="test change"
		print("my self test " ..tip:GetComponent("InputField").text)
end