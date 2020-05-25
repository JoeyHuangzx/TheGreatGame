
EventMessager=BaseClass("EventMessager",Singleton)
EventMessager.eventTable={}
EventMessager.data={}

function EventMessager:AddListener(eventName,fun)
    print('AddListener',self)
    assert(fun)
    EventMessager.eventTable[eventName]=EventMessager.eventTable[eventName] or {}
    local event=EventMessager.eventTable[eventName]
    table.insert( event,fun )
end


function EventMessager:DispatchEvent(eventName,...)
    print('DispatchEvent',self)
    if eventName~=nil then
        if EventMessager.eventTable[eventName]~=nil then
            for k,v in pairs(EventMessager.eventTable[eventName]) do
                print(k,v)
                v(...)
            end
        end
    end
end


function EventMessager:RemoveListener(eventName)
    print('RemoveListener',self)
    if eventName~=nil then
        if EventMessager.eventTable[eventName]~=nil then
            table.remove( EventMessager.eventTable[eventName])
        end
    end
end

return EventMessager