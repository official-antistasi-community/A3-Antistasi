/*
    Author: [Håkon]
    [Description]
        removes all checked out vehicles from the vehicle pool

    Arguments:
    0. <Int> Client UID
    1. <Str> Player, for logging
    2. <Bool> Whether or not to exclude mounts from removal (default false)

    Return Value:
    <Bool> succesfull

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [HR_GRG_PlayerUID] remoteExecCall ["HR_GRG_fnc_removeFromPool",_recipients];

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params [["_UID", "", [""]], ["_player", objNull, [objNull]], ["_removeMounts",false,[false]]];
Trace_1("Removing vehicles from garage with UID: %1", _UID);
if (_UID isEqualTo "") exitWith {false};

//find vehicles to remove
private _toRemove = [];
private _localVehicleList = +HR_GRG_Vehicles;
if (_removeMounts) then {_localVehicleList deleteAt 4};
{
    private _catIndex = _forEachIndex;
    private _hashMap = _x;
    {
        _veh = _hashMap get _x;
        if ((_veh#3) isEqualTo _UID) then {_toRemove pushBack [_catIndex, _x, _veh]};
    } forEach keys _x;
} forEach _localVehicleList;

    
//remove vehicles
{
    //remove vehicle
    _x params ["_catIndex", "_entry"];
    private _cat = HR_GRG_Vehicles#_catIndex;
    private _removedVeh = _cat deleteAt _entry;

    //remove from source registre
    {
        private _index = _x find _entry;
        if (_index != -1) exitWith {
            (HR_GRG_Sources#_forEachIndex) deleteAt _index;
            [_forEachIndex] call HR_GRG_fnc_declairSources;
        };
    }forEach HR_GRG_Sources;

} forEach _toRemove;

//refresh category if client
if (!isNull player) then {
    {
        call HR_GRG_fnc_updateVehicleCount;
        if (ctrlEnabled _x) then {
            [_x, _forEachIndex] call HR_GRG_fnc_reloadCategory;
        };
    } forEach HR_GRG_Cats;
};

//logging is low priority do it after done modifying the pool
{
    (_x#2) params ["_dispName", "", "", "_UID"];
    Info_4("By: %1 [%2] | Type: %3 | Vehicle ID: %4", name _player, _UID, _dispName, _x#1);
} forEach _toRemove;

true
