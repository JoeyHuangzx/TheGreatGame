
local BaseComponent=BaseClass('BaseComponent')

BaseComponent.gameObject='unity gameObject'
BaseComponent.transform='unity transform'

function BaseComponent:constructor(self,params)
    -- statements
   -- print('I am BaseComponent:',self,params)
end

function BaseComponent:Awake()
   -- print('BaseComponent Awake fun')
end

function BaseComponent:Enable(self,params)
    -- statements
    print('BaseComponent 0enable fun',self)
end

function BaseComponent:Start( )
    print('BaseComponent Start fun...')
end

function BaseComponent:OnClick(obj,_callback)
    obj:GetComponent('Button').onClick:AddListener(function()
        _callback(self,obj)
    end)
end

function BaseComponent:FindSubObj()
    
end


return BaseComponent