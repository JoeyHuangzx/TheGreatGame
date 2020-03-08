using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LoginPanel : MonoBehaviour
{
    public Button loginBtn;

    // Start is called before the first frame update
    void Start()
    {
        loginBtn.onClick.AddListener(LoginClickHandle);
    }

    private void LoginClickHandle()
    {
        EventManager.Instance.DispatchEvent(EventArg.LOGIN_REQUEST);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
