using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class NavigationBaker : MonoBehaviour
{

    public NavMeshSurface[] surfaces;
    public Transform[] objectsToRotate;

    void Start()
    {
        
    }

    
    void Update()
    {
        for (int i = 0; i < objectsToRotate.Length; i++)
        {
            objectsToRotate[i].localRotation = Quaternion.Euler(new Vector3(0, Random.Range(0, 360), 0));
        }
        for (int j = 0; j < surfaces.Length; j++)
        {
            surfaces[j].BuildNavMesh();
        }
    }
}
