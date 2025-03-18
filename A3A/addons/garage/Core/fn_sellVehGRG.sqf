/*
    Author: Tiny, parts of code ethically sourced from Håkon
    [Description]
        Attempts to sell currently selected vehicle

    Arguments:
    0. <String> player UID
    1. <Object> Player
    2. <Array>  vehicle to sell (intended use with HR_GRG_SelectedVehicles)

    Return Value:
    n/A

    Scope: Server
    Environment: Unscheduled
    Public: [No]
    Dependencies:

    Example: [HR_GRG_PlayerUID, player, HR_GRG_SelectedVehicles] remoteExecCall ["HR_GRG_fnc_sellVehGRG",2];

    License: APL-ND
*/

#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_UID", "_player", "_selectedVehicle"];

if (!isServer) exitWith {Error("Not server executed")};
if !(_player call HR_GRG_canSell) exitWith {["STR_HR_GRG_Feedback_sellVehicle_comOnly"] remoteExecCall ["HR_GRG_fnc_hint", _player];};
_selectedVehicle params [["_catIndex", -1], ["_vehUID", -1], ["_class", ""]];
if ( (_catIndex isEqualTo -1) || (_vehUID isEqualTo -1) ) exitWith {};
Trace_2("Attempting to sell vehicle at cat: %1 | Vehicle ID: %2 | Classname: %3", _catIndex, _vehUID, _class);

private _refund = [_class] call HR_GRG_getVehicleSellPrice;
if (_refund == 0) exitWith {["STR_HR_GRG_Feedback_sellVehicle_noPrice"] remoteExecCall ["HR_GRG_fnc_hint", _player];};

private _cat = HR_GRG_Vehicles#_catIndex;
private _veh = _cat get _vehUID;
private _lock = _veh#2;
if !(_lock isEqualTo "") exitWith {["STR_HR_GRG_Feedback_sellVehicle_locked"] remoteExecCall ["HR_GRG_fnc_hint", _player];};

private _recipients = +HR_GRG_Users;
_recipients pushBackUnique 2; // to avoid double-calling the function on localhost
private _removeStatics = (_catIndex != 4);
[_UID,_player,_removeStatics] remoteExecCall ["HR_GRG_fnc_removeFromPool", _recipients];
[] remoteExec ["HR_GRG_fnc_sellVehGRGLocal",_player];

[_refund] spawn HR_GRG_addResources;

["STR_HR_GRG_Feedback_sellVehicle_sold",[str _refund]] remoteExecCall ["HR_GRG_fnc_hint", _player];
Info_4("Vehicle UID %1 sold by %2 for %3. Vehicle classname: %4.", _vehUID, name _player, _refund,_class);
