/*
    Garrison-local function for terminating a support vehicle action

    Environment: Scheduled. Should only be called by garrisonOpLoop.

    Arguments:
    <STRING> Marker name.
    <NUMBER> Vehicle ID of support to terminate.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_vehID"];

// active garrison should be guaranteed by the op loop check
private _garrison = A3A_activeGarrison get _marker;

private _vehActions = _garrison get "vehActions";
private _index = _vehActions findIf { _x#0 == _vehID };
if (_index == -1) then {
    // Normal error because support might be terminated locally and then externally
    Trace_1("Vehicle ID %1 not found in active supports");
};
_vehActions deleteAt _index params ["", "_vehicle", "_crewGroup", "_scriptHandle"];


// First kill function if it's running
terminate _scriptHandle;

// If garrison isn't spawned, delete the vehicle & crew
if (_garrison get "state" == "disabled") exitWith {
    { if (isNull objectParent _x) then {deleteVehicle _x} else {objectParent _x deleteVehicleCrew _x} } forEach units _crewGroup;
    deleteVehicle _vehicle;

    // If now empty then delete activeGarrison entry
    if (_vehActions isEqualTo []) then { A3A_activeGarrison deleteAt _marker };

    // Signal server that we're done with the vehicle
    [_marker, _vehID, "ready"] remoteExecCall ["A3A_fnc_garrisonServer_vehActionSetState", 2];
};

// If we're paused then re-pause the vehicle & crew
if (_garrison get "state" == "paused") then {
    {
        if (!alive _x) then {continue};
        _x enableSimulationGlobal false;
        _x allowDamage false;
        if (clientOwner == 2) then {_x hideObjectGlobal true} else {[_x, true] remoteExecCall ["hideObjectGlobal", 2]};
    } forEach (units _crewGroup + [_vehicle]);
};

// If garrison is spawned, move vehicle & crew back to active garrison data
// Either of these could theoretically be null if the GC is fast
if (!isNull _vehicle) then { _garrison get "vehicles" pushBack _vehicle };
if (!isNull _crewGroup) then {
    _garrison get "troops" append (units _crewGroup);
    private _groups = _garrison get "groups";
    if (_vehicle isKindOf "StaticWeapon") then {
        private _groupType = ["staticGroup", "mortarGroup"] select (_vehicle isKindOf "StaticMortar");
        if (isNull (_garrison get _groupType)) then { _groups pushBack _crewGroup; _garrison set [_groupType, _crewGroup] };
        units _crewGroup joinSilent (_garrison get _groupType);
    } else {
        _groups pushBack _crewGroup;
        _crewGroup addEventHandler ["CombatModeChanged", A3A_fnc_combatModeChangedEH];
    };
};

// Signal server that we're done with the vehicle
[_marker, _vehID, "ready"] remoteExecCall ["A3A_fnc_garrisonServer_vehActionSetState", 2];
