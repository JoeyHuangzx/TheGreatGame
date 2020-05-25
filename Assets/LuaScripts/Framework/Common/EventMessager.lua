
EventMessager=BaseClass("EventMessager",Singleton)
--EventMessager.instance=nil

--[[ function EventMessager:GetInstance()
    if EventMessager.instance==nil then
        EventMessager.instance=EventMessager.New('EventMessager');
        print('new 。。。')
    end
    print('我在这里')
    return EventMessager.instance
end ]]

function EventMessager:AddListener(eventName,fun,data)
    print('AddListener',self)
    
    -- body
end


function EventMessager:DispatchEvent(eventName,data)
    print('DispatchEvent',self)
    -- body
end


function EventMessager:RemoveListener(eventName)
    print('RemoveListener',self)
    -- body
end

return EventMessager