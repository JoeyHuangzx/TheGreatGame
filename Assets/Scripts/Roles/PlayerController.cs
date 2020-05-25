using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    private List<int> AniInts = new List<int>();
    private int currIndex=1;
    private Animator mAnimator;
    public float speed=10;

    private void Awake()
    {
        #region ani list add 
        AniInts.Add(AnimationHash.Moving);
        AniInts.Add(AnimationHash.Strafing);
        AniInts.Add(AnimationHash.Stunned);
        AniInts.Add(AnimationHash.AnimationSpeed);
        AniInts.Add(AnimationHash.Weapon);
        AniInts.Add(AnimationHash.WeaponSwitch);
        AniInts.Add(AnimationHash.AttackSide);
        AniInts.Add(AnimationHash.Jumping);
        AniInts.Add(AnimationHash.VelocityX);
        AniInts.Add(AnimationHash.VelocityZ);
        AniInts.Add(AnimationHash.Action);
        AniInts.Add(AnimationHash.IdleTrigger);
        AniInts.Add(AnimationHash.AttackTrigger);
        AniInts.Add(AnimationHash.AttackKickTrigger);
        AniInts.Add(AnimationHash.GetHitTrigger);
        AniInts.Add(AnimationHash.RollTrigger);
        AniInts.Add(AnimationHash.TurnLeftTrigger);
        AniInts.Add(AnimationHash.TurnRightTrigger);
        AniInts.Add(AnimationHash.WeaponSheathTrigger);
        AniInts.Add(AnimationHash.WeaponUnsheathTrigger);
        AniInts.Add(AnimationHash.JumpTrigger);
        AniInts.Add(AnimationHash.Death1Trigger);
        AniInts.Add(AnimationHash.Revive1Trigger);
        AniInts.Add(AnimationHash.InstantSwitchTrigger);
        #endregion

    }

    // Start is called before the first frame update
    void Start()
    {
        mAnimator = GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKey(KeyCode.Q))
        {
            currIndex--;
            if (currIndex < 0) currIndex = AniInts.Count - 1;

            transform.Rotate(Vector3.up, -30*Time.deltaTime);
          
        }
        else if(Input.GetKey(KeyCode.E))
        {
            currIndex++;
            if (currIndex >= AniInts.Count) currIndex = 0;
            transform.Rotate(Vector3.up, 30*Time.deltaTime);
        }

        if (Input.GetKeyDown(KeyCode.U))
        {
            mAnimator.Play("Unarmed-Jump", -1);
            //mAnimator.SetTrigger(AnimationHash.Jumping);
        }
        else if (Input.GetKeyDown(KeyCode.I))
        {
            mAnimator.SetTrigger(AnimationHash.AttackTrigger);
            mAnimator.SetInteger(AnimationHash.Action, currIndex);
            currIndex++;
            if (currIndex > 5) currIndex = 0;
        }
        else if (Input.GetKeyDown(KeyCode.P))
        {
            mAnimator.SetTrigger(AnimationHash.GetHitTrigger);
            mAnimator.SetInteger(AnimationHash.Action, currIndex);
            currIndex++;
            if (currIndex > 5) currIndex = 0;
        }


        this.MoveControl();
    }

    public void MoveControl()
    {
        float _h = Input.GetAxis("Horizontal");
        float _v = Input.GetAxis("Vertical");

        mAnimator.SetFloat("posX", _h);
        mAnimator.SetFloat("posY", _v);
        transform.Translate(new Vector3(_h * Time.deltaTime * speed,0, _v * Time.deltaTime * speed));
    }
}

