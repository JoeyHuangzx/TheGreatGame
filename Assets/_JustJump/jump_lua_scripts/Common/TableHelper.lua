
local TableHelper={}

function TableHelper:TableLen(t)
    local len=0
    for key, value in pairs(t) do
        len=len+1
    end
    return len
end

return TableHelper