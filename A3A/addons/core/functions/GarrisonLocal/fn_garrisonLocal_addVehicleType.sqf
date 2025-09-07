/*
    Garrison-local function for spawning a vehicle of specified type in enemy garrison
    Not used for buildings

    Environment: Scheduled. Should only be called by garrisonOpLoop.

    Arguments:
    <STRING> Marker name.
    <STRING> Class name of vehicle to add to active garrison.
    <NUMBER> Slot number (index into marker spawn places) to use for vehicle.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_class", "_slotNum"];

private _garrison = A3A_activeGarrison get _marker;

private _spawnPlace = (A3A_spawnPlacesHM get _marker) # _slotNum;
_spawnPlace params ["_placeType", "_pos", "_dir", "_building"];         // uh, building should be pre-checked?

private _blockers = _pos nearEntities 8 select { _x getVariable ["markerX", ""] != _marker };
if (_blockers isNotEqualTo []) exitWith {
    Error_3("Spawn of %1 in %2 blocked by %3", _class, _marker, typeof (_blockers#0));
};

private _vehicle = objNull;
isNil {
    _vehicle = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
    _vehicle setDir _dir;
};
//if (_side != teamPlayer and _placeType in ["vehicleAA", "boat"]) then { _fullCrew = true };

_garrison get "vehicles" pushBack _vehicle;
_vehicle setVariable ["markerX", _marker, true];
[_vehicle, _garrison get "side"] call A3A_fnc_AIVEHinit;

// Set reb crew var in case it's transferred later
if (_vehicle isKindOf "Land" and _vehicle emptyPositions "gunner" > 0) then { _vehicle setVariable ["A3A_rebCrewed", true] };
if ("static" in _placeType or _placeType == "vehicleRB") then {
    _vehicle setVariable ["A3A_crewed", true];
    [_marker] call A3A_fnc_garrisonLocal_updateStatics;
};
