
local Class={}

--[[
    -- @param _className 类名
    -- @param  _base 基类，父类
]]
function BaseClass(_className,_base)
    local _class={}
    _class.className=_className;
    _class.base=_base;
    -- 创建对象
    -- @param ...要传递给构造函数的参数列表
    _class.New=function(...)
        local classObj={}
        setmetatable(classObj,{
            __index=Class[_class],
        })
        -- 调用初始化方法
        -- 递归调用构造函数
        -- 先调用基类的构造函数，再调用自己的
        do
            local create
            create=function(_class,...)
                if _class.base then
                    print('call create base。。。')
                    create(_class.base,...)
                end
                if _class.constructor then
                    print('call constructor');
                    _class.constructor(classObj,...)
                end
            end
            create(_class,...)
        end

        return classObj
    end

    local classTable={}
    Class[_class]=classTable

    -- 设置类的元表
    setmetatable(_class,{
        __newIndex=function(_table,_key,_value)
            classTable[_key]=_value
        end,
        __index=classTable
    })
    -- 索引基类成员的元表
    if _base then
        setmetatable(classTable,{
            __index=function(_talbe,_key)
                print('所以基类成员的元表')
                return Class[_base][_key]
            end
        })
    end
    return _class;
end