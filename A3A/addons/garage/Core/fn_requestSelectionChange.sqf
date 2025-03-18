/*
    Author: [Håkon]
    [Description]
        Handles vehicle selection change requests from clients

    Arguments:
    0. <String> Player UID
    1. <Int>    Category index
    2. <Int>    Index
    3. <Object> Player
    4. <Int>    Machine Net ID

    Return Value:
    <Bool> Success

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [HR_GRG_PlayerUID, _newCat, _newIndex] remoteExecCall ["HR_GRG_fnc_requestSelectionChange",2];

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_UID", "_catIndex", "_vehUID", "_player", "_client"];
Trace_3("Vehicle change requested | UID: %1 | Cat: %2 | Vehicle ID: %3", _UID, _catIndex, _vehUID);
private _exit = { [true] remoteExecCall ["HR_GRG_fnc_toggleConfirmBttn", _client]; false};
if (!isServer) exitWith _exit;
if (_UID isEqualTo "") exitWith _exit;
if (-1 in [_catIndex, _vehUID]) exitWith _exit;

private _cat = HR_GRG_Vehicles#_catIndex;
private _vehicle = _cat get _vehUID;

if !( ((_vehicle#2) in ["", _UID]) || (_player call HR_GRG_canOverrideLock) ) exitWith _exit;
if !((_vehicle#3) in ["", _UID] ) exitWith _exit;

[_UID] call HR_GRG_fnc_releaseAllVehicles;
_vehicle set [3, _UID];

Trace_3("Vehicle at | Cat: %1 | Vehicle ID: %2 | checked out by UID: %3", _catIndex, _vehUID, _UID);
[nil,_UID, _catIndex, _vehUID, _player, true] call HR_GRG_fnc_broadcast;
true
