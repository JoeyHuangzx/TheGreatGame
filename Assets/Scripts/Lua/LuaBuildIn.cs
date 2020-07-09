
using System.Runtime.InteropServices;

namespace XLua.LuaDLL
{
    [LuaCallCSharp]
    public partial class LuaBuildIn
    {
        [DllImport("xlua", CallingConvention = CallingConvention.Cdecl)]
        public static extern int luaopen_rapidjson(System.IntPtr L);

        [MonoPInvokeCallback(typeof(LuaDLL.lua_CSFunction))]
        public static int LoadRapidJson(System.IntPtr L)
        {
            return luaopen_rapidjson(L);
        }

    }
}



