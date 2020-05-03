
Ball={}

Ball.Obj=nil
local Dir=nil

local function Init()
    print('Ball init')
    Ball.Obj=CS.XLuaUtils.GetGameObjectByName("ball")
    Dir=Vector3(1,0,0)
    --print(Ball.Obj)
end

local function Start()
    print('ball Start')
end

local function Update()
    if Ball.Obj.transform.position.x >3 then
        Dir.x=-1
    end
    if(Ball.Obj.transform.position.x<-3) then
        Dir.x=1
    end
 --   obj.transform:Translate(dir/30)

end

--Ball.Obj=Obj;
Ball.Dir=Dir;
Ball.Init=Init
Ball.Start=Start
Ball.Update=Update

return Ball
