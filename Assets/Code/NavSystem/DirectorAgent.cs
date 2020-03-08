using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class DirectorAgent : MonoBehaviour
{
    private NavMeshAgent navMeshAgent;

    // Start is called before the first frame update
    void Start()
    {
        navMeshAgent = GetComponent<NavMeshAgent>();
    }

    public void MoveToLocation(Vector3 _targetPos)
    {
        navMeshAgent.destination = _targetPos;
        navMeshAgent.isStopped = false;
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
