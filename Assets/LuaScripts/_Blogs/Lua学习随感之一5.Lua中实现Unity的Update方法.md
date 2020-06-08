## 前言

这里写一个Lua端Update，FixedUpdate,LateUpdate方法。 

### 代码

1. 我们需要在C#端写一个Update类，用来回调Lua的Update方法
```
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

[CSharpCallLua]
public class LuaUpdate : MonoBehaviour
{
    private Action update;
    private Action<float> fixedUpdate;
    private Action lateUpdate;

    public void AddUpdate(LuaEnv luaEnv)
    {
        //这里这三个回调方法从lua中的全局表里获取
        update = luaEnv.Global.Get<Action>("Update");
        fixedUpdate= luaEnv.Global.Get<Action<float>>("FixedUpdate");
        lateUpdate=luaEnv.Global.Get<Action>("LateUpdate");
    }

    // Update is called once per frame
    void Update()
    {
        update?.Invoke();
    }

    private void FixedUpdate()
    {
        fixedUpdate?.Invoke(Time.fixedDeltaTime);
    }

    private void LateUpdate()
    {
        lateUpdate?.Invoke();
    }

    public void OnDispose()
    {
        update = null;
        lateUpdate = null;
        fixedUpdate = null;
    }

    void OnDestroy()
    {
        OnDispose();
    }
}

```
这个类需要挂载在对象上

2. 然后我们来到Lua端编写LuaUpdate.lua类
```
LuaUpdate = BaseClass('LuaUpdate')
LuaUpdate.fixedDeltaTime = 0

-- 这三个update方法都是全局方法，C#端通过luaEnv.Global.Get<Action>("xxxUpdate");
-- 来获取相关的函数
function Update()
    print('Update',Update)
end

function FixedUpdate(deltaTime)
    LuaUpdate.fixedDeltaTime = deltaTime
    print('fixedUpdate',deltaTime)
end

function LateUpdate()
    print('Lateupdate...')
end

return LuaUpdate

```
3. 调试我们就可以看到Lua端的三个打印都有了

### 改进
我们需要将这个类应用到需要用到Update的对象上，例如一个Ball类，我们只需要继承，然后稍作修改下，如下：
```
LuaUpdate = BaseClass('LuaUpdate')
LuaUpdate.fixedDeltaTime = 0
LuaUpdate.UpdateHandler = nil
LuaUpdate.FixedUpdateHandler = nil
LuaUpdate.LateUpdateHandler = nil

function LuaUpdate:EnableUpdate(_enable)
    if _enable == true then
        LuaUpdate.UpdateHandler = self.Update or nil
        LuaUpdate.LateUpdateHandler = self.LateUpdate or nil
        LuaUpdate.FixedUpdateHandler = self.FixedUpdate or nil
    end
end

function LuaUpdate:Start()
    --  print('luaupdate start...')
end

function Update()
    -- print('Update',Update)
    if LuaUpdate.UpdateHandler ~= nil then
        LuaUpdate:UpdateHandler()
    end
end

function FixedUpdate(deltaTime)
    LuaUpdate.fixedDeltaTime = deltaTime
    if LuaUpdate.FixedUpdateHandler ~= nil then
        LuaUpdate:FixedUpdateHandler()
    end
    -- print('fixedUpdate',deltaTime)
end

function LateUpdate()
    if LuaUpdate.LateUpdateHandler then
        LuaUpdate:LateUpdateHandler()
    end
    -- print('Lateupdate...')
end

function LuaUpdate:RemoveEnable()
    LuaUpdate.UpdateHandler = nil
    LuaUpdate.LateUpdateHandler = nil
    LuaUpdate.FixedUpdateHandler = nil
end

return LuaUpdate

```

**在Ball类中的应用方法**

```
local Ball = BaseClass('Ball', LuaUpdate)
Ball.timer = 0
Ball.isUpdate = false

function Ball:constructor(params)
    self.base = Ball.base
    print('Ball Constructor')
end

function Ball:Start()
-- 调用基类的Start
    self.base:Start()
    -- 开启Update
    self:EnableUpdate(true)
    Ball.isUpdate = true
end

-- 这里做了一个判断，如果大于10秒则停止所有update事件
function Ball:Update()
    if Ball.isUpdate then
        print('ball update')
        if Ball.timer > 10 then
            self:RemoveEnable()
        else
            Ball.timer = Ball.timer + self.fixedDeltaTime
            print('timer:',Ball.timer)
        end
    end
end

function Ball:LateUpdate()
    print('ball lateupdate ')
end

function Ball:FixedUpdate()
    print('ball fixedupdate')
end

return Ball

```
下面我们来看下打印


### 总结说明
1. 如果你一直开着update，可能会很耗性能，所有能不用尽量不调用
2. 本文用到的知识点有Lua面向对象中的继承，重写。具体可以参考 [Lua学习随感之一关于Lua面向对象的理解](https://blog.csdn.net/JoeyHuangzx/article/details/106164531)
3. 本文只是一个简单的个人学习笔记记录，可能很多不完善的地方，如有错误请指教
