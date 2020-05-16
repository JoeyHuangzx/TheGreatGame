
local BaseComponent=BaseClass('BaseComponent')

BaseComponent.gameObject='unity gameObject'
BaseComponent.transform='unity transform'

local function constructor(self,params)
    -- statements
    print('I am BaseComponent:',self,params,self.num)
end

local function Awake()
    print('BaseComponent Awake fun')
end

local function Enable(self,params)
    -- statements
    print('BaseComponent 0enable fun',self)
end

local function Start( )
    print('BaseComponent Start fun...')
end

BaseComponent.Awake=Awake
BaseComponent.constructor=constructor
BaseComponent.Enable=Enable
BaseComponent.Start=Start

return BaseComponent