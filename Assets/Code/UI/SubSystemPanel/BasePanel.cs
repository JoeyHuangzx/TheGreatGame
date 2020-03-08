using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Events;


public abstract class AbstractPanel:MonoBehaviour
{

    public abstract void OnEnter();
    public abstract void OnExit();
}


/// <summary>
/// UI窗体脚本（父类，其他窗体都继承此脚本）
/// </summary>
public class BasePanel : MonoBehaviour
{
    protected UIType mCurrUItype;

    public UIType CurrUIType
    {
        get
        {
            return mCurrUItype;
        }
        set
        {
            mCurrUItype = value;
        }
    }


    protected string mPanelName;
    public string PanelName
    {
        get { return mPanelName; }
    }

    public virtual void Awake()
    {
        mCurrUItype = new UIType();
    }

    public virtual void Start()
    {
    }

    public virtual void OnEnter()
    {

    }

    public virtual void OnExit()
    {

    }

    public virtual void OnDestroy()
    {

    }

    protected virtual void ClosePanelHandle(GameObject go)
    {
        this.gameObject.SetActive(false);
    }

    public virtual void Update()
    {

    }

    public virtual void LateUpdate()
    {

    }

    

    protected void Clear()
    {

    }

    protected void Unload()
    {

    }

   
}

