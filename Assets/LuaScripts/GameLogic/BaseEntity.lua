
BaseEntity=BaseClass('BaseEntity',LuaUpdate)
local base=LuaUpdate

function BaseEntity:constructor()
    --self.base=BaseEntity.base
    --print('baseEntity:',self)
end

function BaseEntity.OnCreate(self)
 --   self.gameObject=_gameObject
  --  self.transform=_gameObject.transform
    --print('base entity:',self.gameObject.name,self)
end

local function Enable(self)
    print(self)
    self:EnableUpdate(true)
end

BaseEntity.Enable=Enable

return BaseEntity