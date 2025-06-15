// Civ marker spawn. Input is real marker but server references by _civ

// TODO: remVehicle needs server-side handling for this?

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_spawnKey", "_newGarrison"];

Trace_2("Called with marker %1 and data %2");

// just a list of vehicles, or do we want other stuff?

private _garrison = createHashMap;
private _vehicles = [];
{
    _x params ["_class", "_placeNum"];
    private _spawnPlace = (A3A_spawnPlacesHM get _spawnKey) # _placeNum;
    _spawnPlace params ["_type", "_pos", "_dir"];

    // Block if there are any near entities at all?
    private _blockers = _pos nearEntities 8;
    if (_blockers isNotEqualTo []) then {
        Error_3("Spawn of %1 in %2 blocked by %3", _class, _spawnKey, typeof (_blockers#0));
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
    [_vehicle, civilian] call A3A_fnc_AIVEHinit;

} forEach (_newGarrison get "vehicles");

_garrison set ["vehicles", _vehicles];
A3A_activeGarrison set [_spawnKey, createHashMap];

Trace("Completed");
