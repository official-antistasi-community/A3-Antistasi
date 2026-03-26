/*
 * File: fn_lcgRand.sqf
 * Function: 
 * Author: <author>
 * Function description
 *  This function implements a Linear congruential generator
 * Arguments:
 * 0: Seed <Scalar>
 * 
 *
 * Return Value:
 * None
 *
 * Example:
 * [[bob, ted], false] call afm_main_fnc_example
 *
 * Public: No
 */

if((count _this) isEqualTo 1) then {A3A_GS_LCGSEED = _seedValue;};

if(isNil "A3A_GS_LCGSEED") then {A3A_GS_LCGSEED = 0;};

// values from https://rlmueller.net/CrackRnd.htm 

private _mod = 16777216;
private _incr = 12820163;
private _mult = 16598013;

A3A_GS_LCGSEED = ((_mult * A3A_GS_LCGSEED) + _incr) % _mod;
A3A_GS_LCGSEED