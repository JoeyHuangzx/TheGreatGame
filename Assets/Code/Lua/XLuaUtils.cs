/**
 * 
 * Author:JoeyHuang
 * Time: 2020/3/30 16:43:20
 * 说明：
 */
using System;
using UnityEngine;
using UnityEngine.UI;
using XLua;
using Utility;

[LuaCallCSharp]
public class XLuaUtils
{


    public static Action CallFunction(string _targetName, string _function)
    {
        return XLuaManager.GetInstance().CallFunction(_targetName, _function);
    }

    /// <summary>
    /// 获取单个GameObject
    /// </summary>
    /// <returns>The game object by name.</returns>
    /// <param name="go">Go: 一般是所寻找对象的父层级</param>
    /// <param name="findName">Find name.</param>
    public static GameObject GetGameObjectByName(string findName)
    {
        GameObject obj = null;
        
        GameObject parent = GameObject.Find("Canvas");
        Transform[] objChildren = parent.GetComponentsInChildren<Transform>(true);
        for (int i = 0; i < objChildren.Length; ++i)
        {
            if (objChildren[i].name == findName)
            {
                obj = objChildren[i].gameObject;
                break;
            }
        }
        return obj;
    }
}

[LuaCallCSharp]
public static class Extension
{

    public static Button GetButton(this GameObject go)
    {
        Debug.Log("call GetButton");
        return go.GetComponent<Button>();
    }

    
}
