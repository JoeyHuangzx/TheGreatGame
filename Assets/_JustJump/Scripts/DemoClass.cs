using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DemoClass
{

    public DemoClass()
    {
        AClass a = new AClass();
        BClass b = new BClass();
        
        Debug.Log(string.Format("aName:{0},parent:{1},id:{2}", a.aName, a.parentName,a.id));
        Debug.Log(string.Format("bName:{0},parent:{1},id:{2}", b.bName, b.parentName,b.id));
    }

}

public class ParentClass
{
    public string parentName="parent";
    public int id = 1000;
}

public class AClass: ParentClass
{
    public string aName = "aClass";

    public AClass()
    {
        parentName = aName + " " + parentName;
        id =(int)(Random.value * id);
    }
}

public class BClass:ParentClass
{
    public string bName = "bClass";

    public BClass()
    {
        parentName = bName + " " + parentName;
        id = (int)(Random.value * id);
    }
}

