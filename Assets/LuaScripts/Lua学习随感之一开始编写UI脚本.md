
## 前言

    本文章作为自己的学习lua的笔记，用来加深理解。这次要学的是用Lua代替C#来写Unity的UI交互功能。我将会建立几个通用游戏脚本来理解Lua如何与Unity UI进行交互

#### 如果你只想看Demo，那就拉到最后面吧 

## 编写Lua Panel脚本

### 开始界面/游戏界面/结束界面

我们需要制作Unity MonoBehavior生命周期几个常用的方法，Awake-OnEnable-Start-Update-OnDestroy，
然后在Awake方法里获取UI界面中我们建立的三个按钮对象，并侦听按钮事件

```
local panelName = 'LobbyPanel'

local playBtn = nil
local skinBtn = nil
local musicBtn = nil
--[[
    这里的GetGameObjectByName方法是在C#端的一个静态方法，用来获取UI界面上的按钮对象  
    public static GameObject GetGameObjectByName(string findName, GameObject parent)
    {
        GameObject obj = null;
        Transform[] objChildren = parent.GetComponentsInChildren<Transform>(true);
        for (int i = 0; i < objChildren.Length; ++i)
        {
            if (objChildren[i].name == findName)
            {
                obj = objChildren[i].gameObject;
                break;
            }
        }
        return obj;
    }
]]
function Awake()
  
    playBtn = CS.XLuaUtils.GetGameObjectByName('playBtn',self.gameObject)
    skinBtn = CS.XLuaUtils.GetGameObjectByName('skinBtn',self.gameObject)
    musicBtn = CS.XLuaUtils.GetGameObjectByName('musicBtn',self.gameObject)
end

function OnEnable()
   -- print(panelName, ' LobbyPanel this is OnEnable function')
end

function Start()
  --  print(panelName, '  this is Start function')
    AddListener()
end
--  侦听按钮事件
-- 这里的也是C# 端的一个侦听方法
--[[
 public static void AddButtonListener(this GameObject go,Action _cb){go.GetComponent<Button>().onClick.AddListener(()=> { _cb(); });}
]]
function AddListener()
    playBtn:AddButtonListener(PlayClick)
    skinBtn:AddButtonListener(SkinClick)
    musicBtn:AddButtonListener(MusicClick)
end

function PlayClick()
    -- 这里调用了UIManager一个总的UI管理类，稍后会说
    UIManager.OpenPanel('GamePanel')
end

function SkinClick()
    print(' SkinClick handle')
end

function MusicClick()
    print(' MusicClick handle')
end

function Update()
    -- print("this is Update function")
end

function OnDestroy()
    print('this is OnDestroy function')
end
                          

```

接下来是怎么在unity端调用这个脚本的问题，我的上一个博客有说到一个XLuaMonoBehaviour.cs类，我们把这个脚本挂在我们在Unity的LobbyPanel对象上，然后在scriptName变量上写上Lua脚本的名字，这样我们的LobbyPanel lua类就做成了。

运用同样的方法我又做了GamePanel（游戏中界面），GameOverPanel（游戏结束界面），初始化界面，寻找到按钮对象，侦听事件，在事件方法里处理UI交互的问题。

### 编写UI管理类UIManager.lua

UIManage就只做了几个简单的方法，创建Panel，打开Panel，关闭Panel。

其中在CreatePanel方法里，有用到Load和Instantiate，这两个方法在C#里不必多说，在lua中，我们可以LuaCallC#来实现，我单独新建了个ResourceManager.lua类

```
ResourcesManager={}
local function Load(path)
    local resObj=CS.UnityEngine.Resources.Load(path)
    return resObj
end
ResourcesManager.Load=Load
return ResourcesManager

```

所有在CreatePanel中直接用ResourcesManager.Load(panelName)就可以加载resources文件夹里的UI预制体（当然，其实我们可以直接用CS.UnityEngine.Resources.Load(path)来加载，这里考虑到我们在很多地方都有可能用到Load加载资源，所有就新建了个管理类）

至于Instantiate我在Global.lua类里定义了Object=CS.UnityEngine.Object，所有我们可以直接用Object.Instantiate(prefab,uiCanvas.transform)来实例化预制体到UI界面（这里其实也可以用到像ResourceManager类这样的方法来给实例化做一个管理，这里为了学习采用了不同的方法进行尝试，后面要进行统一的规划管理）

有些像CS.UnityEngine.GameObject要写比较长的代码的，我们在可以在一个统一的地方写上GameObject = CS.UnityEngine.GameObject，这样我们调用的时候可以直接用GameObject就可以避免许多在拼写上的失误（这里我把他统一放到了一个Global.lua类,这个类同样在lua代码入口的时候就要require）

```

UIManager = {}

local name = 'UIManager'
-- 定义一个数组用来保存已经创建过的panel
local windows = {}
-- 定义当前显示panel
local currWindow=nil
-- 所有panel的父对象，在这里就是Canvas对象
local uiCanvas=nil

-- 初始化，先创建开始界面
local function Init()
    print('UIManager Init...')
    -- 查找Canvas，和C#一样
    uiCanvas=GameObject.Find("Canvas")
    local obj=CreatePanel("LobbyPanel")
    -- 把开始界面存到数组
    windows["LobbyPanel"]=obj
    currWindow=obj
end

local function OpenPanel(panelName)
    local target = windows[panelName]
    currWindow:SetActive(false)
    -- 如果数组中不存在target，则新建一个
    if target == nil then
        target = CreatePanel(panelName)
    end
    currWindow=target;
    target:SetActive(true) 
end
-- 创建，加载，实例化Panel
function CreatePanel(panelName)
    -- 从Resources文件夹中加载UI预制体
    local prefab=ResourcesManager.Load(panelName)
    -- 实例化预制体到Unity场景中的Canvas
    local panel=Object.Instantiate(prefab,uiCanvas.transform)
    panel.name=panelName
    panel:SetActive(true)
    windows[panelName] = panel
    return panel
end
-- 关闭界面，目前只是隐藏
local function ClosePanel(panelName)
    local target = windows[panelName]
    if target == nil then
        target:SetActive(false)
    end
end
UIManager.Init = Init
UIManager.OpenPanel = OpenPanel
UIManager.ClosePanel = ClosePanel
return UIManager

```


### 游戏实体类
下面我们来编写几个游戏对实体类，分别创建一个球类Ball.lua,一个板类Board.lua，一个相机类Camera.lua

需要调用lua模块化脚本的话我们需要用到require "模块名",为了方便和统一，我把这几个类的请求调用放到了一个Util.lua的脚本，然后我在一个Lua入口调用Util.lua(可能说的有点绕，但是集中管理起来会规范很多),Util.lua脚本如下

```
Util={}
local ball=nil
local board=nil
local camera=nil
-- 定义局部对象变量，然后判断是否已经请求了，有对象了。如果没有则请求，然后返回对象。
-- 如果我们需要外部调用的时候，可以用local obj=Util.GetBoard() 来获取到相应的对象
local function GetBoard()
    if board ==nil then
        board=require "GameLogic.Board"
    end
    
    return board
end
local function GetBall()
    if ball ==nil then
        ball=require "GameLogic.Ball"
    end
    
    return ball
end
local function GetCamera()
    if camera == nil then
        camera=require "GameLogic.Camera"
    end
    return camera
end
Util.GetBoard=GetBoard
Util.GetBall=GetBall
Util.GetCamera=GetCamera
return Util;

```

下面来看一个实体类Ball.lua，我们在Unity新建了一个Ball对象，在lua这边我们需要把这个对象找出来，具体脚本如下

```

Ball={}
-- 获取Unity中的Ball对象
Ball.Obj=nil
-- 保存一个Vector3对象，用来设置球的移动
local Dir=nil

-- 初始化
local function Init()
    print('Ball init')
    -- 这里查找unity对象的方法上面已经说过
    Ball.Obj=CS.XLuaUtils.GetGameObjectByName("ball")
    Dir=Vector3(1,0,0)
    --print(Ball.Obj)
end

local function Start()
    print('ball Start')
end

-- update这里做一个简单的来回移动操作
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

```


还有Board和Camera类的写法也差不多是这样（稍后会给Demo），这里就不贴出来了，以免文章拉得又长又臭。。。

### 最后的总结

从C#转到Lua，代码语法写法上是有很大不同的，最麻烦的是代码bug的查找没那么容易，比较Lua属于弱语言类型，有什么问题都是需要先编译了才能知道会不会有错误，有时候可能是一个大小写或者标点符号或者判断不明的错误都会搞得你半天，这个过程刚开始是很难受的，包括我现在也是这样，查找问题来也是挺慢的，有时候恰恰在一个很简单的bug上卡住了很久。

当通过慢慢的动手写，然后加强Lua基础的理解，特别是Lua的table和元表的理解一定要谨记于心，这样才能更好的写代码甚至于理解别人博客上说的。