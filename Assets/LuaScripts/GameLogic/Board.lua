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
    base.OnCreate(self)
    print('board Start fun...',self, self.gameObject.name, self.transform.name)
    base.Enable(self)
end

function Board:Start()
    print('board Start')
end

function Board:Update()
    print('baord update',self.gameObject.name)
    --   obj.transform:Translate(dir/30)
end

return Board
