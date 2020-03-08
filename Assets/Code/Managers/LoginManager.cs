using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoginManager : Singleton<LoginManager>
{
    private LoginManager() { }

    public void Init()
    {
        EventManager.Instance.AddEventListener(EventArg.LOGIN_REQUEST, LoginHandle);
    }

    private void LoginHandle(object param)
    {
        GameSceneManager.LoadScene("Game");
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
