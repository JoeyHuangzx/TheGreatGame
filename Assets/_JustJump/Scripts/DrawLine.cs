using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DrawLine : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        //  transform.Rotate(Vector3.up, 10);
        gameObject.GetComponent<Rigidbody>().angularVelocity = Vector3.one;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnDrawGizmosSelected()
    {

    }
}
