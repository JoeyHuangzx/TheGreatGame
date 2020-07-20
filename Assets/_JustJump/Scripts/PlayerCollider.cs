using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

public class PlayerCollider : MonoBehaviour
{
    public Action<Collision> onCollisionEnter;
    public Action<Collision> onCollisionStay;
    public Action<Collision> onCollisionExit;

    // Start is called before the first frame update
    void Start()
    {
        LuaEnv lua = XLuaManager.GetInstance().GetLuaEnv();
        onCollisionEnter = lua.Global.Get<Action<Collision>>("OnCollisionEnter");
        onCollisionStay = lua.Global.Get<Action<Collision>>("OnCollisionStay");
        onCollisionExit = lua.Global.Get<Action<Collision>>("OnCollisionExit");
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown(KeyCode.Space))
        {

        }
    }

    private void OnCollisionEnter(Collision collision)
    {

        onCollisionEnter?.Invoke(collision);
    }

    private void OnCollisionStay(Collision collision)
    {
        onCollisionStay?.Invoke(collision);
    }

    private void OnCollisionExit(Collision collision)
    {
        onCollisionExit?.Invoke(collision);
    }
}
