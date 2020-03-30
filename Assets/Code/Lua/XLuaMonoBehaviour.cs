using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

public class XLuaMonoBehaviour : MonoBehaviour
{
    private LuaTable luaTable;
    private Action luaAwake;
    private Action luaStart;
    private Action luaUpdate;
    private Action luaOnEnable;
    private Action luaOnDestroy;

    private void Awake()
    {
        this.luaTable = XLuaManager.GetInstance().InitMonoBehaviour(this);
        luaAwake = XLuaUtils.CallFunction(gameObject.name, "Awake");
        luaStart = XLuaUtils.CallFunction(gameObject.name, "Start");
        luaOnEnable = XLuaUtils.CallFunction(gameObject.name, "OnEnable");
        luaOnDestroy = XLuaUtils.CallFunction(gameObject.name, "OnDestroy");
        luaAwake?.Invoke();
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
