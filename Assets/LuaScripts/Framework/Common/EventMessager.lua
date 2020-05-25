EventMessager = BaseClass('EventMessager', Singleton)
EventMessager.eventTable = {}

function EventMessager:AddListener(eventName, funCallback)
    -- print('AddListener',self)
    assert(funCallback)
    EventMessager.eventTable[eventName] = EventMessager.eventTable[eventName] or {}
    local event = EventMessager.eventTable[eventName]
    table.insert(event, funCallback)
end

function EventMessager:DispatchEvent(eventName, ...)
    -- print('DispatchEvent',self)
    if eventName ~= nil then
        if EventMessager.eventTable[eventName] ~= nil then
            for k, funCallback in pairs(EventMessager.eventTable[eventName]) do
                funCallback(...)
            end
        end
    end
end

function EventMessager:RemoveListener(eventName)
    --  print('RemoveListener',self)
    if eventName ~= nil then
        if EventMessager.eventTable[eventName] ~= nil then
            table.remove(EventMessager.eventTable[eventName])
        end
    end
end



return EventMessager
