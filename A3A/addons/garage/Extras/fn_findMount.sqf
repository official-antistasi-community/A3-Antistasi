/*
    Author: [Håkon]
    [Description]
        Trys to find a static of a kind to accomodate a request/release from client

    Arguments:
    0. <String> Player UID
    1. <String> Class name of static
    2. <Int>    Requesting or releasing
        0: release
        1: request
    3. <Int>    ClientID
    4. <Object> Player

    Return Value:
    <Bool> Request granted

    Scope: Server
    Environment: Uncheduled
    Public: [No]
    Dependencies:

    Example: [getPlayerUID player, _index, _newIconIndex, clientOwner, player] remoteExecCall ["HR_GRG_fnc_findMount",2];

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_UID", "_vehUID", "_newIconIndex", "_owner", "_player"];
Trace_4("Finding available mount | UID: %1 | Vehicle ID: %2 | Reserving: %3 | Client: %4", _UID, _vehUID, _newIconIndex, _owner);
private _failed = { ["STR_HR_GRG_Feedback_requestMount_Denied"] remoteExec ["HR_GRG_fnc_Hint", _owner]; [true] remoteExecCall ["HR_GRG_fnc_toggleConfirmBttn", _owner]; false };
if (!isServer) exitWith _failed;

private _cat = HR_GRG_vehicles#4;
private _mount = _cat get _vehUID;
private _CheckedUID = ["",_UID] select (_newIconIndex isEqualTo 1);

//block checkout condition
if (
    !((_mount#2) in ["",_UID])                   //locked by someone else
    && !(_player call HR_GRG_canOverrideLock)        //cmd overwrite
) exitWith _failed;
if !((_mount#3) in ["", _UID]) exitWith _failed; //Checked out by someone else

//check out mount
_mount set [3, _CheckedUID];
[nil, _CheckedUID, 4, _vehUID, _player, false] call HR_GRG_fnc_broadcast;
true;
