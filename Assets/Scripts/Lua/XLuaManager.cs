using FileUtility;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using XLua;

public class XLuaManager : MonoSingleton<XLuaManager>
{
    //放置LuaScripts代码的文件夹名字
    public string luaScriptsFolder = "LuaScripts";
    //lua代码的文件名
    const string luaGameEntryScript = "LuaGameEntry";

    private LuaEnv luaEnv = null;
    private LuaTable luaTable = null;
    private LuaTable meta = null;

    private Dictionary<string, string> luaFilePathDict = new Dictionary<string, string>();


    // Start is called before the first frame update
    void Start()
    {
        
    }

    protected override void Init()
    {
        base.Init();
        InitLuaEnv();
        OnEntry();
        
    }

    private void InitLuaEnv()
    {
        luaEnv = new LuaEnv();
        if (luaEnv != null)
        {
            luaEnv.AddLoader(CustomLoader);
            luaEnv.AddBuildin("rapidjson", XLua.LuaDLL.LuaBuildIn.LoadRapidJson);
            this.meta = luaEnv.NewTable();
            meta.Set("__index", luaEnv.Global);
        }
        //luaFilePathDict.Add("LobbyPanel", "UI/LobbyPanel");
        //luaFilePathDict.Add("GamePanel", "UI/GamePanel");
        //luaFilePathDict.Add("GameOverPanel", "UI/GameOverPanel");
    }

    /// <summary>
    /// 回调中可以根据这个参数去加载指定文件
    /// 如果需要支持调试，需要把filepath修改为真实路径传出。
    /// 该回调返回值是一个byte数组，如果为空表示该loader找不到，否则则为lua文件的内容
    /// </summary>
    /// <param name="_filePath"></param>
    /// <returns></returns>
    public byte[] CustomLoader(ref string _filePath)
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
            gameObject.GetComponent<LuaUpdate>().AddUpdate(luaEnv);
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
    public void DoString(string _luaScript,string _chunkName="chunk",LuaTable _luaTable=null)
    {
        if (luaEnv != null)
        {
            try
            {
                luaEnv.DoString(_luaScript,_chunkName,_luaTable);
            }
            catch (System.Exception ex)
            {

                Debug.Log(ex.Message);
            }
        }
    }

    public LuaEnv GetLuaEnv()
    {
        return this.luaEnv;
    }


    public LuaTable InitMonoBehaviour(XLuaMonoBehaviour xLuaMonoBehaviour,string scriptName)
    {
      //      Debug.Log("InitMonoBehaviour");
        //新建一个表，并设置元表为上面定义的meta
        luaTable = luaEnv.NewTable();
        luaTable.SetMetaTable(meta);
        //把xLuaMonoBehaviour对象传到lua侧
        luaTable.Set("self", xLuaMonoBehaviour);
        DoString(LoadLuaScript(luaFilePathDict[scriptName]), scriptName, luaTable);

        return luaTable;
    }
    
    /// <summary>
    /// 这里为了方便笔记，所以采用了C# IO来加载lua内容，只针对unity Editor 
    /// </summary>
    /// <param name="_filePath"></param>
    /// <returns></returns>
    private string LoadLuaScript(string _filePath)
    {
        Debug.Log("LoadLuaScript "+_filePath);
        string _scriptPath = string.Empty;
        _filePath = _filePath.Replace(".", "/") + ".lua";
        _scriptPath = Path.Combine(Application.dataPath, luaScriptsFolder);
        _scriptPath = Path.Combine(_scriptPath, _filePath);
        string str = FileManager.GetFileContent(_scriptPath);
       // Debug.Log("LuaScript " + str);
        return str;
    }

    /// <summary>
    /// 创建定义从C#到lua间的一个桥接，委托
    /// </summary>
    /// <param name="_targetName"></param>
    /// <param name="_function"></param>
    /// <returns></returns>
    public Action CallFunction(string _targetName, string _function)
    {
        return luaTable.Get<Action>(_function);
    }


}
