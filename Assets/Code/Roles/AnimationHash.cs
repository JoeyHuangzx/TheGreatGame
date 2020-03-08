/**
 * 
 * Author:JoeyHuang
 * Time: 2019/11/1 14:00:09
 * 说明：
 */

using System;
using UnityEngine;

public class AnimationHash
{
    public static readonly int Moving = Animator.StringToHash("Moving");
    public static readonly int Strafing = Animator.StringToHash("Strafing");
    public static readonly int Stunned = Animator.StringToHash("Stunned");
    public static readonly int AnimationSpeed = Animator.StringToHash("AnimationSpeed");
    public static readonly int Weapon = Animator.StringToHash("Weapon");
    public static readonly int WeaponSwitch = Animator.StringToHash("WeaponSwitch");
    public static readonly int AttackSide = Animator.StringToHash("AttackSide");
    public static readonly int Jumping = Animator.StringToHash("Jumping");
    public static readonly int VelocityX = Animator.StringToHash("VelocityX");
    public static readonly int VelocityZ = Animator.StringToHash("VelocityZ");
    public static readonly int Action = Animator.StringToHash("Action");
    public static readonly int IdleTrigger = Animator.StringToHash("IdleTrigger");
    public static readonly int AttackTrigger = Animator.StringToHash("AttackTrigger");
    public static readonly int AttackKickTrigger = Animator.StringToHash("AttackKickTrigger");
    public static readonly int GetHitTrigger = Animator.StringToHash("GetHitTrigger");
    public static readonly int RollTrigger = Animator.StringToHash("RollTrigger");
    public static readonly int TurnLeftTrigger = Animator.StringToHash("TurnLeftTrigger");
    public static readonly int TurnRightTrigger = Animator.StringToHash("TurnRightTrigger");
    public static readonly int WeaponSheathTrigger = Animator.StringToHash("TurnRightTrigger");
    public static readonly int WeaponUnsheathTrigger = Animator.StringToHash("TurnRightTrigger");
    public static readonly int JumpTrigger = Animator.StringToHash("TurnRightTrigger");
    public static readonly int Death1Trigger = Animator.StringToHash("TurnRightTrigger");
    public static readonly int Revive1Trigger = Animator.StringToHash("TurnRightTrigger");
    public static readonly int InstantSwitchTrigger = Animator.StringToHash("TurnRightTrigger");
}
