
using UnityEngine;

public class Sphere : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        GetComponent<Rigidbody>().velocity = new Vector3(0,1*Time.deltaTime,0);        
        if(Input.GetKey(KeyCode.Space))
        {
            transform.Translate(new Vector3(10*Time.deltaTime, 0, 0));
        }
    }
}
