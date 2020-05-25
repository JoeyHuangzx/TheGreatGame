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

    // Start is called before the first frame update
    void Start()
    {
        
    }

    public void AddUpdate(LuaEnv luaEnv)
    {
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

public static class LuaUpdaterExporter
{
    [CSharpCallLua]
    public static List<Type> CSharpCallLua = new List<Type>()
    {
        typeof(Action),
        typeof(Action<float>),
        typeof(Action<float, float>),
    };
}
