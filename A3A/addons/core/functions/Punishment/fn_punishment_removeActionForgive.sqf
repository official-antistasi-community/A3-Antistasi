/*
Function:
    A3A_fnc_punishment_removeActionForgive

Description:
    Removes forgive action on players about detainee;

Scope:
    <GLOBAL> Execute on all players.

Environment:
    <ANY>

Parameters:
    <String> name of the detainee that the actions pertains to.

Returns:
    <BOOLEAN> true if it hasn't crashed; nil if it has crashed.

Examples:
    ["Vadim"] remoteExecCall ["A3A_fnc_punishment_removeActionForgive",0,false];

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official Antistasi Community
*/
params ["_name"];

private _actionsSelf = actionIDs player;
if ((!isNil "_actionsSelf") && {!(_actionsSelf isEqualTo [])}) then {  // All players will be scanned, in-case they were previously an admin.
    private _actionName = ["[" + localize "STR_A3A_fn_punishment_FF_addAcFor" + "]" ,_name,""] joinString """";
    {
        if (((player actionParams _x)#0) isEqualTo _actionName) exitWith {
            player removeAction _x;
        };
    } forEach _actionsSelf;
};
true;
