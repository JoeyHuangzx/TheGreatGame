using FileUtility;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using XLua;

public class XLuaManager : MonoSingleton<XLuaManager>
{
    public const string luaAssetbundleAssetName = "lua";
    public const string luaScriptsFolder = "LuaScripts";
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
        if(luaEnv!=null)
        {
            luaEnv.AddLoader(CustomLoader);
        }
    }

    public void OnInit()
    {
        if(luaEnv!=null)
        {
            loadScript(luaGameEntryScript);
            DoString("LuaGameEntry.Start()");
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void DoString(string _luaScript)
    {
        if(luaEnv!=null)
        {
            try
            {
                luaEnv.DoString(_luaScript);
            }
            catch(System.Exception ex)
            {
                
                Debug.Log(ex.Message);
            }
        }
    }

    private void loadScript(string _scriptName)
    {
        DoString(string.Format("require('{0}')", _scriptName));
    }

    public static byte[] CustomLoader(ref string _filePath)
    {
        string _scriptPath = string.Empty;
        _filePath = _filePath.Replace(".", "/") + ".lua";
        if(Application.platform==RuntimePlatform.WindowsEditor)
        {
            _scriptPath = Path.Combine(Application.dataPath, luaScriptsFolder);
            _scriptPath = Path.Combine(_scriptPath, _filePath);
            byte[] _bytes = FileManager.SafeReadAllBytes(_scriptPath);
            string str = System.Text.Encoding.UTF8.GetString(_bytes);
            return _bytes;
        }

        return null;
    }
}
