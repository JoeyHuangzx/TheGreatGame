--[[ Lua的设计中有一个特点就是：

当你不在变量前使用local关键字的时候，这个变量会被放在_G这个全局表中。
我在最初学习Lua的时候也很难理解这个设计，这和之前我使用的编程语言中作用域的概念是相违背的，但是当你理解函数的env概念之后，就很容易理解为什么在Lua语言中，这样的设计反而是最为合理和自洽的。

对于Lua语言自身来说，这种合理和自洽是美的，但是它会给使用的人带来困惑和难以排查的bug，因为你非常可能因为遗漏的local声明，导致污染了_G，甚至修改到了了你不想修改的变量，或者你的某个变量被别处的代码不小心修改了。因此在我们的工程中，去掉了Lua的这一特性，当期望使用一个局部变量但是没有写local变量的时候，使用error报出错误，所有的全局变量必须显示地进行声明。

实现方法很简单，重写_G的__index方法和__newindex方法：
 ]]
-- Global.lua
-- 辅助记录全局变量的名称是否被使用过
local _GlobalNames = { }

local function __innerDeclare(name, defaultValue)
    if not rawget(_G, name) then
        rawset(_G, name, defaultValue or false)
    else
        print("[Warning] The global variable " .. name .. " is already declared!")
    end
    _GlobalNames[name] = true
    return _G[name]
end

local function __innerDeclareIndex(tbl, key)
    if not _GlobalNames[key] then
        error("Attempt to access an undeclared global variable : " .. key, 2)
    end

    return nil
end

local function __innerDeclareNewindex(tbl, key, value)
    if not _GlobalNames[key] then
        error("Attempt to write an undeclared global variable : " .. key, 2)
    else
        rawset(tbl, key, value)
    end
end

local function __GLDeclare(name, defaultValue)
    local ok, ret = pcall(__innerDeclare, name, defaultValue)
    if not ok then
        --        LogError(debug.traceback(res, 2))
        return nil
    else
        return ret
    end
end

local function __isGLDeclared(name)
    if _GlobalNames[name] or rawget(_G, name) then
        return true
    else
        return false
    end
end

-- Set "GLDeclare" into global.
if (not __isGLDeclared("GLDeclare")) or (not GLDeclare) then
    __GLDeclare("GLDeclare", __GLDeclare)
end

-- Set "IsGLDeclared" into global.
if (not __isGLDeclared("IsGLDeclared")) or(not IsGLDeclared) then
    __GLDeclare("IsGLDeclared", __isGLDeclared)
end

setmetatable(_G,
{
    __index = function(tbl, key)
        local ok, res = pcall(__innerDeclareIndex, tbl, key)
        if not ok then
            logerror(debug.traceback(res, 2))
        end

        return nil
    end,

    __newindex = function(tbl, key, value)
        local ok, res = pcall(__innerDeclareNewindex, tbl, key, value)
        if not ok then
            logerror(debug.traceback(res, 2))
        end
    end
} )

return __GLDeclare