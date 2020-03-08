using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    public Transform target;
    public float offsetHeight;
    public float offsetDistance;
    public float rotateSpeed;
    public float smoothing;
    private Vector3 lastPosition=Vector3.zero;
    private Vector3 offset;
    private float rotate;

    // Start is called before the first frame update
    void Start()
    {
        //lastPosition = new Vector3(target.position.x, target.position.y + offsetHeight, target.position.z - offsetDistance);
        //offset = new Vector3(target.position.x, target.position.y + offsetHeight, target.position.z - offsetDistance);
        //offset=
        offset = target.position - transform.position;
    }

    // Update is called once per frame
    void Update()
    {

    }

    void LateUpdate()
    {
        //lastPosition = transform.position;


        transform.position = new Vector3(target.position.x, target.position.y -offset.y, target.position.z -offset.z);
        
        transform.LookAt(target.position);
    }
}
