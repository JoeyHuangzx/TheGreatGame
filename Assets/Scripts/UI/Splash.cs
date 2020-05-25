using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Utility;

public class Splash : MonoBehaviour
{
    public Text _text;
    private int timer = 3;

    // Start is called before the first frame update
    void Start()
    {
        _text.text = timer.ToString();
        StartCoroutine(CountDown());
        //gameObject.GetComponent<Rigidbody2D>().velocity = new Vector2(0, 100);
       // gameObject.transform.Translate(Vector3.up,)
    }

    IEnumerator CountDown()
    {
        yield return new WaitForSeconds(1.0f);
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
