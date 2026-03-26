/*
    Garrison-local function for spawning civilian "garrison"

    Environment: Scheduled. Should only be called by garrisonOpLoop.

    Arguments:
    <STRING> Marker name (actually spawn key, citymarker + "_civ")
    <HASHMAP> Garrison data from server.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_spawnKey", "_newGarrison"];

// just a list of vehicles, or do we want other stuff?

private _marker = _spawnKey select [0, _spawnKey find "_civ"];
private _policeCarPos = A3A_cityPoliceData get _marker select 1;

private _garrison = createHashMap;
private _places = A3A_spawnPlacesHM get _spawnKey;
private _vehicles = [];
{
    _x params ["_class", "_posData", "", "_vehID"];
    private ["_pos", "_dir"];
    if (_x#1 isEqualType 0) then {
        _spawnPlace = _places # (_x#1);
        _pos = _spawnPlace#1; _dir = _spawnPlace#2;
    } else {
        // Boats use [pos, dir] posdata format
        _pos = _posData#0; _dir = _posData#1;
    };

    // Block if there are any near entities at all?
    private _blockers = _pos nearEntities 8;
    if (_blockers isNotEqualTo []) then {
        Error_3("Spawn of %1 in %2 blocked by %3", _class, _spawnKey, typeof (_blockers#0));
        continue;
    };
    if (_policeCarPos isEqualType [] and {_policeCarPos distance2d _pos < 10}) then {
        Debug_1("Spawn of %1 in %2 blocked by police", _class, _spawnKey);
        continue;
    };

    private _vehicle = objNull;
    isNil {
        _vehicle = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
        _vehicle setDir _dir;
    };
    [_vehicle, true, true, true, true] call A3A_fnc_clearVehicleCargo;

    _vehicles pushBack _vehicle;
    _vehicle setVariable ["markerX", _spawnKey, true];
    _vehicle setVariable ["A3A_vehID", _vehID, 2];
    [_vehicle, civilian] call A3A_fnc_AIVEHinit;

} forEach (_newGarrison get "vehicles");

_garrison set ["vehicles", _vehicles];
A3A_activeGarrison set [_spawnKey, _garrison];

Trace("Completed");
