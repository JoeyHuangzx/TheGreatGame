
Board=BaseClass('Board', BaseComponent)

Board.Obj=nil
local dir=nil

function Ball:constructor(params)
    self.base = Board.base
    print('Ball Constructor')
end

function Board:Init()
    print('board init')
    Board.Obj=CS.XLuaUtils.GetGameObjectByName("board")
    dir=Vector3(1,0,0)
    print(Board.Obj)
end

function Board:Start()
    print('board Start')
end

function Board:Update()
    if Board.Obj.transform.position.x >3 then
        dir.x=-1
    end
    if(Board.Obj.transform.position.x<-3) then
        dir.x=1
    end
 --   obj.transform:Translate(dir/30)

end


return Board
