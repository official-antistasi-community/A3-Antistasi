/*
    Server-side function to add vehicle/static of specific type to enemy garrison

    Environment: Unscheduled, server

    Arguments:
    <STRING> Marker name of garrison.
    <STRING> Classname of vehicle to add to garrison.
    <NUMBER or STRING> Slot number (index into spawnPlaces) or slot type.

    Returns: <BOOL> false if slot number isn't provided and there are no free places

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehClass", "_slotNum"];

Trace_1("Called with params %1", _this);

if (sidesX getVariable _marker == teamPlayer) exitWith {
    Error("Attempted to add vehicle type to rebel garrison");
};

private _garrison = A3A_garrison get _marker;

if (_slotNum isEqualType "") then {
    private _usedPlaces = (_garrison get "vehicles") select {_x#1 isEqualType 0} apply {_x#1};
    private _places = (A3A_spawnPlaceStats get _marker get _slotNum select 0) - _usedPlaces;
    if (_places isEqualTo []) exitWith {};
    _slotNum = if (_slotNum == "vehicle") then { _places # 0 } else { selectRandom _places };
};
if (_slotNum isEqualType "") exitWith { Debug_2("No places found for slot type %1 in %2", _slotNum, _vehClass); false };

private _vehID = _garrison get "nextVehID";
private _vehEntry = [_vehClass, _slotNum, nil, _vehID];
(_garrison get "vehicles") pushBack _vehEntry;
_garrison set ["nextVehID", _vehID+1];

// Add to garrison support vehicles
if (_vehClass in A3A_supportVehTypes) then {
    (_garrison get "supportVehicles") set [_vehID, ["ready", A3A_supportVehTypes get _vehClass, _vehEntry]];
};

// Add to active garrison if spawned
if (spawner getVariable _marker != 2) then {
    ["addVehicleType", [_marker, _vehClass, _slotNum, _vehID]] call A3A_fnc_garrisonOp;
};

true;
