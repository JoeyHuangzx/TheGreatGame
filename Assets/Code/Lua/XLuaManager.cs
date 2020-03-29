using FileUtility;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using XLua;

public class XLuaManager : MonoSingleton<XLuaManager>
{
    //放置LuaScripts代码的文件夹名字
    public const string luaScriptsFolder = "LuaScripts";
    //lua代码的文件名
    const string luaGameEntryScript = "LuaGameEntry";

    private LuaEnv luaEnv = null;


    // Start is called before the first frame update
    void Start()
    {

    }

    protected override void Init()
    {
        base.Init();
        InitLuaEnv();
    }

    private void InitLuaEnv()
    {
        luaEnv = new LuaEnv();
        if (luaEnv != null)
        {
            luaEnv.AddLoader(CustomLoader);
        }
    }

    /// <summary>
    /// 回调中可以根据这个参数去加载指定文件
    /// 如果需要支持调试，需要把filepath修改为真实路径传出。
    /// 该回调返回值是一个byte数组，如果为空表示该loader找不到，否则则为lua文件的内容
    /// </summary>
    /// <param name="_filePath"></param>
    /// <returns></returns>
    public static byte[] CustomLoader(ref string _filePath)
    {
        string _scriptPath = string.Empty;
        _filePath = _filePath.Replace(".", "/") + ".lua";
        if (Application.platform == RuntimePlatform.WindowsEditor)
        {
            _scriptPath = Path.Combine(Application.dataPath, luaScriptsFolder);
            _scriptPath = Path.Combine(_scriptPath, _filePath);
            byte[] _bytes = FileManager.SafeReadAllBytes(_scriptPath);
            return _bytes;
        }

        return null;
    }

    /// <summary>
    /// lua脚本启动入口
    /// </summary>
    public void OnEntry()
    {
        if (luaEnv != null)
        {
            loadScript(luaGameEntryScript);
            DoString("LuaGameEntry.Start()");
        }
    }

    // Update is called once per frame
    void Update()
    {

    }

    private void loadScript(string _scriptName)
    {
        DoString(string.Format("require('{0}')", _scriptName));
    }

    /// <summary>
    /// 加载lua代码块
    /// </summary>
    /// <param name="_luaScript"></param>
    public void DoString(string _luaScript)
    {
        if (luaEnv != null)
        {
            try
            {
                luaEnv.DoString(_luaScript);
            }
            catch (System.Exception ex)
            {

                Debug.Log(ex.Message);
            }
        }
    }


}
