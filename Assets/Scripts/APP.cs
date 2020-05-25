using System.Collections;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// 游戏入口
/// </summary>
public class APP : MonoSingleton<APP>
{
    public enum GameMode
    {
        QA,
        Developing,
        Release
    }

    public GameMode gameMode = GameMode.Developing;

    public delegate void LifeCircleCallback();

    public event LifeCircleCallback onUpdate = null;
    public event LifeCircleCallback onFixedUpdate = null;
    public event LifeCircleCallback onLatedUpdate = null;
    public event LifeCircleCallback onGUI = null;
    public event LifeCircleCallback onDestroy = null;
    public event LifeCircleCallback onApplicationQuit = null;

    private APP() { }


    void Awake()
    {
        DontDestroyOnLoad(this);

        Instance = this;
        Application.targetFrameRate = 60;
        XLuaManager.GetInstance().StartUp();
        XLuaManager.GetInstance().OnEntry();
    }

    void Start()
    {
       


        //GameObject obj = new GameObject("obj11111");
        //obj.AddComponent<Button>();
        //obj.AddComponent<XLuaMonoBehaviour>();

        //GameObject obj2 = new GameObject("obj22222222");
        //obj2.AddComponent<XLuaMonoBehaviour>();

        //GameObject obj3 = new GameObject("obj3333333333");
        //obj3.AddComponent<XLuaMonoBehaviour>();
    }

    void Update()
    {
        if (this.onUpdate != null)
            this.onUpdate();
    }
    void FixedUpdate()
    {
        if (this.onFixedUpdate != null)
            this.onFixedUpdate();
    }

    void LateUpdate()
    {
        if (this.onLatedUpdate != null)
            this.onLatedUpdate();
    }

    void OnApplicationQuit()
    {
        if (this.onApplicationQuit != null)
            this.onApplicationQuit();
    }

    void OnGUI()
    {
        if (this.onGUI != null)
            this.onGUI();
    }

    protected override void OnDestroy()
    {
        base.OnDestroy();
        if (this.onDestroy != null)
            this.onDestroy();
    }
}




