using UnityEngine;
using System.Collections;

public abstract class MonoSingleton<T> : MonoBehaviour where T : MonoSingleton<T>
{
    protected static T Instance = null;

    public static T GetInstance()
    {
        if (Instance == null)
        {
            Instance = FindObjectOfType<T>();
            if (FindObjectsOfType<T>().Length > 1)
            {
                return Instance;
            }

            if (Instance == null)
            {
                string instanceName = typeof(T).Name;
                GameObject instanceGameObject = GameObject.Find(instanceName);
                if (instanceGameObject == null)
                    instanceGameObject = new GameObject(instanceName);
                Instance = instanceGameObject.AddComponent<T>();
                DontDestroyOnLoad(instanceGameObject);
            }

        }

        return Instance;
    }

    private void Awake()
    {
        if(Instance==null)
        {
            Instance = this as T;
        }
        DontDestroyOnLoad(gameObject);
        Init();
    }

    /// <summary>
    /// 无实现函数，用于保证MonoSingleton在使用前已创建
    /// </summary>
    public void StartUp()
    {
        Debug.Log(string.Format("{0} is start up...", gameObject.name));
    }

    protected virtual void Init()
    {

    }

    protected virtual void OnDestroy()
    {
        Instance = null;
    }

}

