
-- 用于记录所有类结构
local _ClzTbl = {}

-- 索引基类成员的元表
local _BaseMeta = { __index = function(childClz, k)
    if not childClz.base then return nil end
    -- 变种点：1
    -- 将基类中的成员拷贝到子类中，可以提高二次访问的效率（减少搜索的层次）
    local v = childClz.base[k]
    childClz[k] = v
    return v;
end }

--- 定义类结构
--- 约定：构造函数使用名字Ctor
--- 注意：如果指定了基类base，则不能再为子类设置其他MetaTable.
---@param clzName string 类名，必须能全局唯一标识一个类
---@param base table 要继承的基类，没有则不传参
function Class(clzName, base)
    if type(clzName) ~= 'string' then return nil end
    local clz = _ClzTbl[clzName]
    -- 类结构已经定义过的，直接返回
    -- 使用这种方式，避免在多次DoFile中被重复定义
    if clz then return clz end
    clz = {
        Ctor = false,
        base = base,
    }
    if base then
        setmetatable(clz, _BaseMeta)
    end
    _ClzTbl[clzName] = clz
    return clz
end

---变种点：2
---递归调用构造函数
---先调用基类的构造函数，再调用自己的
local _Create
_Create = function(clz, obj, ...)
    if clz.base then
        _Create(clz.base, obj, ...)
    end
    if clz.Ctor then
        clz.Ctor(obj, ...)
    end
end

--- 创建对象
---@param clz table 对象所属的类，可以是类型的table也可以是类型的名字
-- @param ...要传递给构造函数的参数列表
function New(clz, ...)
    if type(clz) == 'string' then
        clz = _ClzTbl[clz]
    end
    if not clz then return nil end
    local obj = {}
    setmetatable(obj, { __index = clz })
    _Create(clz, obj, ...)
    return obj
end

-- 1.定义类
Base = Class('Base')
function Base:Ctor(name)
    self._name= name
    print('This is Base....')
end

Child = Class('Child', Base)
function Child:Ctor(name)
    print('Old name：' .. self.__name)
    self._name = name
    print('New name：' .. self.__name)
end

-- 2.创建对象(两种方式是等价的)
local child1 = New (Child, 'Walker')
local child2 = New ('Child', 'Walker')