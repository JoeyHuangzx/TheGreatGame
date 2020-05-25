
## 前言

相信任何一个游戏项目缺少不了事件，自然而然的缺少不了要有个事件管理器，下面来给大家做一个Lua端的事件管理器，话不多说，先上代码在解析

### 代码

```
-- 这里继承单例类，把类做成单例类
EventMessager = BaseClass('EventMessager', Singleton)
EventMessager.eventTable = {}

-- 侦听事件
function EventMessager:AddListener(eventName, funCallback)
    -- print('AddListener',self)
    assert(funCallback)
    EventMessager.eventTable[eventName] = EventMessager.eventTable[eventName] or {}
    local event = EventMessager.eventTable[eventName]
    table.insert(event, funCallback)
end

-- 发布事件
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

-- 移除事件
function EventMessager:RemoveListener(eventName)
    --  print('RemoveListener',self)
    if eventName ~= nil then
        if EventMessager.eventTable[eventName] ~= nil then
            table.remove(EventMessager.eventTable[eventName])
        end
    end
end



return EventMessager

```

### 说明
1. 相信大家看到这代码会感到很熟悉，因为和C#端的是有点相似的（简直一模一样），除了语法上有些差别。
2. 单例类我在这里[Lua学习随感之一Lua的单例模式](https://blog.csdn.net/JoeyHuangzx/article/details/106342180)有解析
3. eventTable用来保存事件名+回调方法。
4. 插入表操作table.insert(event, funCallback)和移除表操作table.remove(EventMessager.eventTable[eventName])
5. **谨记：有侦听事件必要有移除事件，两者缺一不可**
6. 本代码适合初学者学习用，可能在性能上还有待提高

### 调用方法
```
-- click是事件名，随便设置。
EventMessager:GetInstance():AddListener('click',Handle)
-- 这里我随便加了几个参数，说明一下如何传参
EventMessager:GetInstance():DispatchEvent('click','sdfsa',true,'2434')

function Handle(a,b,c)
    print('listeneer handle',a,b,c)
    EventMessager:GetInstance():RemoveListener('click')
end
```

PS:别忘了，EventMessager，Singleton，BaseClass都是需要事先require的