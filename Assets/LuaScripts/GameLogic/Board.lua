
Board={}

Board.Obj=nil
local dir=nil

local function Init()
    print('board init')
    Board.Obj=CS.XLuaUtils.GetGameObjectByName("board")
    dir=Vector3(1,0,0)
    print(Board.Obj)
end

local function Start()
    print('board Start')
end

local function Update()
    if Board.Obj.transform.position.x >3 then
        dir.x=-1
    end
    if(Board.Obj.transform.position.x<-3) then
        dir.x=1
    end
 --   obj.transform:Translate(dir/30)

end

Board.Init=Init
Board.Start=Start
Board.Update=Update

return Board
