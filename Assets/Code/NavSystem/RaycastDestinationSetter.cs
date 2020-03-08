using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RaycastDestinationSetter : MonoBehaviour
{
    public float fireRate = 0.25f;
    public float weaponRange = 500f;
    public Transform gunEnd;
    public DirectorAgent directorAgent;
    public Camera fpsCam;
    private WaitForSeconds shotDuration = new WaitForSeconds(0.07f);
    private AudioSource gunAudio;
    private LineRenderer laserLine;
    private float nextFire;



    void Start()
    {
        laserLine = GetComponent<LineRenderer>();
        gunAudio = GetComponent<AudioSource>();

    }


    void Update()
    {
        if(Input.GetButtonDown("Fire1") && Time.time>nextFire)
        {
            nextFire = Time.time+ fireRate;
            StartCoroutine(ShotEffect());
            Vector3 originVector = fpsCam.ViewportToWorldPoint(new Vector3(0.5f, 0.5f, 0));
            RaycastHit hit;
            laserLine.SetPosition(0, gunEnd.position);

            if(Physics.Raycast(originVector,fpsCam.transform.forward, out hit,weaponRange))
            {
                laserLine.SetPosition(1, hit.point);
                directorAgent.MoveToLocation(hit.point);
            }
            else
            {
                laserLine.SetPosition(1, originVector + (fpsCam.transform.forward * weaponRange));
            }

        }
    }

    private IEnumerator ShotEffect()
    {
        gunAudio.Play();
        laserLine.enabled = true;

        yield return shotDuration;
        laserLine.enabled = false;
    }
}
