
local TableHelper={}

function TableHelper:TableLen(t)
    local len=0
    for key, value in ipairs(t) do
        len=len+1
    end
    return len
end


-- 查看某值是否为表tbl中的key值
function TableHelper:HasKey(tbl, key)
    if tbl == nil then
        return false
    end
    for k, v in pairs(tbl) do
        if k == key then
            return true
        end
    end
    return false
end
 
-- 查看某值是否为表tbl中的value值
function TableHelper:HasVal(tbl, value)
    if tbl == nil then
        return false
    end
 
    for k, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

return TableHelper