
local BaseComponent=BaseClass('BaseComponent')

BaseComponent.gameObject='unity gameObject'
BaseComponent.transform='unity transform'

function BaseComponent:constructor(self,params)
    -- statements
    print('I am BaseComponent:',self,params,self.num)
end

function BaseComponent:Awake()
    print('BaseComponent Awake fun')
end

function BaseComponent:Enable(self,params)
    -- statements
    print('BaseComponent 0enable fun',self)
end

function BaseComponent:Start( )
    print('BaseComponent Start fun...')
end

----BaseComponent.Awake=Awake
--BaseComponent.constructor=constructor
--BaseComponent.Enable=Enable
--BaseComponent.Start=Start

return BaseComponent