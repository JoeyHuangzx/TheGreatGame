using AOT;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace XLua.LuaDLL
{
    [LuaCallCSharp]
    public static class LuaBuildIn
    {
        [DllImport("LuaDLL", CallingConvention = CallingConvention.Cdecl)]
        public static extern int luaopen_rapidjson(System.IntPtr l);

        [MonoPInvokeCallback(typeof(LuaDLL.lua_CSFunction))]
        public static int LoadRapidJson(IntPtr l)
        {
            return luaopen_rapidjson(l);
        }

    }
}



