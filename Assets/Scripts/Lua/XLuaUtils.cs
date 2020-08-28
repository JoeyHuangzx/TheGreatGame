/**
 * 
 * Author:JoeyHuang
 * Time: 2020/3/30 16:43:20
 * 说明：
 */
using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using XLua;
using Utility;
using DG.Tweening;

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

    public static GameObject GetGameObjectByName(string findName, GameObject parent)
    {
        GameObject obj = null;
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

    public static string[] GetObjectNameWithFile(string path)
    {
        DirectoryInfo dirInfo = new DirectoryInfo(path);
        List<string> arr = new List<string>();
        foreach(FileInfo next in dirInfo.GetFiles())
        {
            if(next.Extension==".prefab")
            {
                arr.Add(next.Name.Split('.')[0]);
            }
        }
        
        return arr.ToArray();
        
    }

    public static string[] GetCheesePrefabNames(string _json)
    {
        List<string> strs = JsonHelper.DeserializeToList<string>(_json);
        return strs.ToArray();
    }
}

[LuaCallCSharp]
public static class Extension
{

    public static Button GetButton(this GameObject go)
    {
        return go.GetComponent<Button>();
    }

    public static void AddButtonListener(this GameObject go,Action _cb)
    {
        go.GetComponent<Button>().onClick.AddListener(()=> { _cb(); });
        
    }

    public static void RotationQuaternion(Transform _tran,int angle,float duration)
    {
        _tran.DOLocalRotateQuaternion(Quaternion.Euler(0, _tran.localRotation.eulerAngles.y + angle, 0), duration).SetEase(Ease.Flash).SetLoops(-1, LoopType.Yoyo);
    }

}
