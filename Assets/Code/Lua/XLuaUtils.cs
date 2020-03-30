/**
 * 
 * Author:JoeyHuang
 * Time: 2020/3/30 16:43:20
 * 说明：
 */
using System;


public static class XLuaUtils
{


    public static Action CallFunction(string _targetName, string _function)
    {
        return XLuaManager.GetInstance().CallFunction(_targetName, _function);
    }

}
