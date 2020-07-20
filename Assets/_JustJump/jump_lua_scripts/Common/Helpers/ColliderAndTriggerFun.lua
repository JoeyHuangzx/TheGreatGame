
ColliderAndTriggerFun={
    onCollisionEnters=nil,
    onCollisionStay=nil,
    OnCollisionExit=nil,
}


function ColliderAndTriggerFun:EnableCollision(_enable)
    if _enable == true then
        print(ColliderAndTriggerFun.onCollisionEnters)
        if ColliderAndTriggerFun.onCollisionEnters==nil then
            ColliderAndTriggerFun.onCollisionEnters = {}
        end
        print(self.OnCollisionEnter,self)
        if self.OnCollisionEnter ~= nil then
            table.insert(ColliderAndTriggerFun.onCollisionEnters, {callback = self.OnCollisionEnter, target = self})
        end
    end
end

function OnCollisionEnter(collision)
    if ColliderAndTriggerFun.onCollisionEnters ~= nil then
        for key, value in pairs(ColliderAndTriggerFun.onCollisionEnters) do
            if value.callback~=nil then
                value.callback(value.target)
            end
        end
    end
end

function OnCollisionStay(collision)
   
end

function OnCollisionExit(collision)
    
end

return ColliderAndTriggerFun