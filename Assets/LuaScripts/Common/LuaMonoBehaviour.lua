

--LuaMonoBehaviour={}

function Awake()
    print("this is Awake function",self.gameObject.name)
end

function OnEnable()
     print("this is OnEnable function")
end

function Start()
    print("this is Start function")
end

function Update()
    print("this is Update function")
end

function OnDestroy()
    print("this is OnDestroy function")
end


--return LuaMonoBehaviour