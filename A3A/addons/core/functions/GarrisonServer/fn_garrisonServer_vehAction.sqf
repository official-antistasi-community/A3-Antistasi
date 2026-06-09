/*
    Placeholder function to test partial spawning

    Environment: Unscheduled, server

    Arguments:
    <STRING> Marker name of garrison. Empty string to autodetect from vehicle position.
    <NUMBER> Vehicle ID to spawn.
    <ARRAY> Arbitrary data to pass through to the vehicle action.

    Returns bool, true if successful

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehID", "_actionData"];

Trace_1("Called with params %1", _this);

if (sidesX getVariable _marker == teamPlayer) exitWith {
    Error_1("Attempted to use support vehicle in rebel garrison %1", _marker); 
    false;
};

private _garrison = A3A_garrison get _marker;
private _supportVehData = _garrison get "supportVehicles" get _vehID;
if (isNil "_supportVehData") exitWith {
    Error_2("No support data for vehicle ID %1 in %2", _vehID, _marker); 
    false;
};

// What do we need? Just activity state? "ready", "busy", "broken" 
// ready -> free to order
// busy -> not free
// broken -> not free, convert to ready on despawn
if (_supportVehData # 0 != "ready") then {
    Error_2("Support vehicle %1 in %2 is not ready", _vehID, _marker);
    false;
};
_supportVehData set [0, "busy"];

// This can run when unspawned, so may need to pick a machine
if !(_marker in A3A_garrisonMachine) then {
    private _machineID = if (_marker == "Synd_HQ") then { 2 } else { call A3A_fnc_chooseMachineForGarrison };
    A3A_garrisonMachine set [_marker, _machineID];
};

// Vehicle data existence should be guaranteed
private _vehicles = _garrison get "vehicles";
private _vehData = _vehicles select (_vehicles findIf { _x#3 == _vehID });
private _side = sidesX getVariable _marker;
["vehAction", [_marker, _vehData, _side, _actionData]] call A3A_fnc_garrisonOp;

true;
