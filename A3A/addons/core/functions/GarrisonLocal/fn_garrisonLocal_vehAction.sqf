/*
    Garrison-local function for using a support vehicle from a garrison
    Will spawn vehicle if necessary

    Environment: Scheduled. Should only be called by garrisonOpLoop.

    Arguments:
    <STRING> Marker name.
    <ARRAY> Vehicle data: [_class, _placement, _state, _idNum] from server garrison
    <SIDE> Garrison side (needed if garrison isn't spawned)
    <ARRAY> Arbitrary array of action-specific data

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_vehData", "_side", "_actionData"];
_vehData params ["_class", "_posData", "_state", "_vehID"];

// If there's no active garrison data (unspawned garrison) then set it up
private _garrison = A3A_activeGarrison get _marker;
if (isNil "_garrison") then {
    _garrison = createHashMapFromArray [ ["troops", []], ["vehicles", []], ["buildings", []], ["groups", []], ["civs", []], ["civGroups", []], ["vehActions", []],
        ["side", _side], ["type", "unknown"], ["state", "disabled"], ["buildingGroup", grpNull], ["staticGroup", grpNull], ["mortarGroup", grpNull] ];
    A3A_activeGarrison set [_marker, _garrison];
};

private _vehicle = objNull;
if (_garrison get "state" != "disabled") then
{
    // Garrison is already spawned. Find the vehicle in garrison data
    private _vehicles = _garrison get "vehicles";
    private _index = _vehicles findIf { _x getVariable ["A3A_vehID", -1] == _vehID };
    if (_index == -1) exitWith {
        Error_2("Vehicle ID %1 not found in %2", _vehID, _marker);
    };
    _testVehicle = _vehicles#_index;

    // Check whether vehicle is still usable (can fire, enough crew etc)
    if !(canFire _testVehicle and gunner _testVehicle call A3A_fnc_canFight) exitWith {
        Info_2("Vehicle ID %1 is disabled %2", _vehID, _marker);

        // signal the server not to try using this vehicle until despawn
        [_marker, _vehID, "broken"] remoteExecCall ["A3A_fnc_garrisonServer_vehActionSetState", 2];
    };
    _vehicle = _vehicles deleteAt _index;
}
else
{
    // Garrison isn't spawned. Create the vehicle & crew
    [_garrison, _marker, _side, [10, 2], [_vehData]] call A3A_fnc_spawnGarrisonVehicles;

    // We know it'll be the only entry
    if (_garrison get "vehicles" isEqualTo []) exitWith {
        Error_2("Failed to spawn vehicle ID %1 in %2", _vehID, _marker);
    };
    _vehicle = (_garrison get "vehicles") deleteAt 0;
};
if (isNull _vehicle) exitWith {};

// Remove crew from garrison data. Add them to activeSupport array
private _group = createGroup [side group gunner _vehicle, true];            // delete when empty
crew _vehicle joinSilent _group;
_garrison set ["groups", (_garrison get "groups") - [grpNull]];             // prevent this growing indefinitely
_garrison set ["troops", (_garrison get "troops") - crew _vehicle];

// might need units instead for accounting? dead guys will be removed
// But dead units get removed on server side anyway, so it mostly works...

// Unpause the crew & vehicle
if (_garrison get "state" == "paused") then {
    // Unpause the crew
    {
        _x enableSimulationGlobal true;
        _x allowDamage true;
        if (clientOwner == 2) then {_x hideObjectGlobal false} else {[_x, false] remoteExecCall ["hideObjectGlobal", 2]};
    } forEach (crew _vehicle + [_vehicle]);
};

// Fire off vehicle action function
private _vehType = A3A_supportVehTypes getOrDefault [typeOf _vehicle, "none"];
Trace_1("Running vehicle action %1", _vehType);

isNil {
private _scriptHandle = switch (_vehType) do {
    case "staticMortars": {
        [_marker, _vehID, _vehicle, _actionData, false] spawn A3A_fnc_vehActionArty;
    };
    case "vehiclesArtillery": {
        [_marker, _vehID, _vehicle, _actionData, true] spawn A3A_fnc_vehActionArty;
    };
    case "vehiclesSAM": {
        [_marker, _vehID, _vehicle, _actionData] spawn A3A_fnc_vehActionSAM;
    };
    case "none";
    case "vehiclesAA": {
        // Temporary test payload
        [_marker, _vehID] spawn {
            sleep 30;
            A3A_garrisonOps pushBack ["vehActionEnd", _this];
        };
    };
};

_garrison get "vehActions" pushBack [_vehID, _vehicle, _group, _scriptHandle];
};
