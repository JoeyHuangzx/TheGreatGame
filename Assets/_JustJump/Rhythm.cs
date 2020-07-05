using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;

public class Rhythm : MonoBehaviour
{
    public GameObject obj;
    public Transform top;
    public Transform right;
    public Transform left;
    public Transform bottom;
    private List<RectTransform> lists = new List<RectTransform>();


    private void Awake()
    {
        Transform parent = null;
        int angle = 0;
        for (int i = 0; i < 4; i++)
        {
            angle = i * 90;
            if (i == 0) parent = top;
            else if (i == 1) parent = right;
            else if (i == 2) parent = bottom;
            else if (i == 3) parent = left;
            for (int j = 0; j < 11; j++)
            {
                GameObject o = Instantiate(obj, parent);
                o.Reset();
                o.SetAnchorPosition(new Vector2(-100 + j * 25, 0));
                o.transform.localRotation = Quaternion.Euler(new Vector3(0, 0, 0));
                o.GetComponent<RectTransform>().sizeDelta = Vector2.one;
                lists.Add(o.GetComponent<RectTransform>());
            }

        }
    }

    void Start()
    {

    }

    private float timer = 0;
    private float prequery = 10;
    private int min = 10;
    private int max = 20;
    private float changeTimer = 0;
    void Update()
    {
        changeTimer += Time.deltaTime;
        timer += Time.deltaTime;
        if (timer > prequery * Time.deltaTime)
        {
            timer = 0;
            for (int i = 0; i < 44; i++)
            {
                lists[i].sizeDelta = new Vector2(20, Mathf.Clamp(100 * UnityEngine.Random.value, 10, 100));
                lists[i].GetComponent<Image>().color = RandomRainbowColor();
            }

        }
        prequery = UnityEngine.Random.Range(min, max);
        if(changeTimer>3)
        {
            changeTimer = 0;
            min += 5;
            max += 5;
            if(max>40)
            {
                min = 10;
                max = 20;
            }
        }
    }

    public Color RandomColor()
    {
        //随机颜色的RGB值。即刻得到一个随机的颜色
        float r = UnityEngine.Random.Range(0f, 1f);
        float g = UnityEngine.Random.Range(0f, 1f);
        float b = UnityEngine.Random.Range(0f, 1f);
        Color color = new Color(r, g, b);
        return color;
    }

    string[] rainbowColors = { "#FF0000", "#FF7F00", "#FFFF00", "#00FF00", "#00FFFF", "#0000FF", "#8B00FF" };
    public Color RandomRainbowColor()
    {
        int index = (int)(UnityEngine.Random.Range(0,6));
        Color nowColor;
        ColorUtility.TryParseHtmlString(rainbowColors[index], out nowColor);
        return nowColor;
    }
}
