using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

public class XLuaMonoBehaviour : MonoBehaviour
{
    public string scriptName = "";
    private LuaTable luaTable;
    private Action luaAwake;
    private Action luaStart;
    private Action luaUpdate;
    private Action luaOnEnable;
    private Action luaOnDestroy;

    private void Awake()
    {
        this.luaTable = XLuaManager.GetInstance().InitMonoBehaviour(this,scriptName);
        luaAwake = CallLuaFunction("Awake");
        luaStart = CallLuaFunction("Start");
        luaUpdate = CallLuaFunction("Update");
        luaOnEnable = CallLuaFunction("OnEnable");
        luaOnDestroy = CallLuaFunction("OnDestroy");
        luaAwake?.Invoke();
    }

    private Action CallLuaFunction(string _fun)
    {
        return XLuaManager.GetInstance().CallFunction(gameObject.name, _fun);
    }

    private void OnEnable()
    {
        luaOnEnable?.Invoke();
    }

    // Start is called before the first frame update
    void Start()
    {
        luaStart?.Invoke();
    }

    // Update is called once per frame
    void Update()
    {
        luaUpdate?.Invoke();
    }

    private void OnDestroy()
    {
        luaOnDestroy?.Invoke();
        luaOnDestroy = null;
        luaStart = null;
        luaUpdate = null;
        this.luaTable.Dispose();
    }
}
