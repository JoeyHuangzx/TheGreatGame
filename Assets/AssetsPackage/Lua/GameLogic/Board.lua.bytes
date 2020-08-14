Board = BaseClass('Board', BaseEntity)
local base=BaseEntity

local dir = nil

function Board:constructor()
 --   self.base = Board.base
 --   print('board Constructor',self.name,self.base.name)
end

function Board:OnCreate(_gameObject)
    self.gameObject=_gameObject
    self.transform=_gameObject.transform
    base.id=102
    base.OnCreate(self)
    self:Start()
 --   print('board Start fun...',self, self.gameObject.name, self.transform.name)
  
end

function Board:SetActive(enable)
    self.gameObject:SetActive(enable)
end

function Board:Start()
    print('board Start')
    self:EnableUpdate(true)
end

function Board.Update(self)
    --print('baord update',self.gameObject.name)
    --   obj.transform:Translate(dir/30)
end

Board.base=base

return Board
