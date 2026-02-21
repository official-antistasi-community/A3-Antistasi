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

params ["_marker", "_class", "_slotNum", "_idNum"];

private _garrison = A3A_activeGarrison get _marker;
private _side = _garrison get "side";

// Should just work with the main function now
// Don't install crew? Probably should send them with it...
// Or delete some wanderers afterwards...
[_garrison, _marker, _side, [0, 0], [_class, _slotNum, nil, _idNum]] call A3A_fnc_spawnGarrisonVehicles;

// Doesn't really hurt
[_marker] call A3A_fnc_garrisonLocal_updateStatics;
