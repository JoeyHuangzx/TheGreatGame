using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

public class LuaUpdate : MonoBehaviour
{
    private Action<float> fixedUpdate;
    private Action lateUpdate;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    public void AddUpdate(LuaEnv luaEnv)
    {
        luaEnv.Global.Get<Action>("FixedUpdate");
        luaEnv.Global.Get<Action<float>>("LateUpdate");
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void FixedUpdate()
    {
        fixedUpdate?.Invoke(Time.fixedDeltaTime);
    }

    private void LateUpdate()
    {
        lateUpdate?.Invoke();
    }
}
