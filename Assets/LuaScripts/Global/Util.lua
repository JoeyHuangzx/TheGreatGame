

Util={}


function Util.find()
    print('util find')
end

local function testUtil(arg1, arg2, arg3)
    print(arg1,arg1,arg3)
end

Util.testUtil=testUtil

return Util;

