/*
    Garrison-local function to place idle vehicle crew near vehicle
    Crew attempts to board and patrol with vehicle once engaged

    Arguments:
    <OBJECT> Crewed & parked vehicle
    <STRING> Marker to place crew within

    Copyright 2026 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_vehicle", "_marker"];

// Search for suitable buildings to place crew near

private _buildings = nearestObjects [_vehicle, ["House"], 200] inAreaArray _marker;
private _crewPos = [];
if (_buildings isNotEqualTo []) then {
    private _weights = _buildings apply { sizeof typeof _x * linearConversion [100, 200, _vehicle distance2d _x, 1, 0.01, true] };
    private _house = _buildings selectRandomWeighted _weights;
    _crewPos = [_house, 5, _house getDir _vehicle] call A3A_fnc_findPosNearHouse;
};
if (_crewPos isEqualTo []) then {
    // Fallback (shouldn't happen?) puts crew near vehicle & within marker
    private _crewPos = [getPosATL _vehicle, 5, 30, 3, 20, {!(_tpos inArea _marker)}] call A3A_fnc_findEmptyPos;
    if (_crewPos isEqualTo []) then { _crewPos = _vehicle getPos [5 + random 20, random 360] };
};

/*
// Find side that's 100m from the marker edge. Should be at least one by design...
private _searchAngle = {
    private _testPos = _vehicle getPos [100, getDir _vehicle + _x];
    if (_testPos inArea _marker) exitWith { _x };
} forEach [180, 90, 270];

if (isNil _searchAngle) then {
    Error_1("Marker %1 too small for placing vehicle crew", _marker);
    _searchAngle = 180;
};

// TODO: nope. could put units in road. Need to constrain to semicircle.
// maybe near-buildings version is just better
*/

Debug_3("Crew pos %1 for vehicle %2 at %3", _crewPos, _vehicle, getPosATL _vehicle);

// leave vehicle and place at this position
private _group = group _vehicle;
_group setVariable ["A3A_groupVehicle", _vehicle];
//_group leaveVehicle _vehicle;
units _group allowGetIn false;
{
    moveOut _x;
    _x setVehiclePosition [_crewPos, [], 0, "NONE"];
    // delay or not?
} forEach units _group;

// Called by combatModeChangedEH, spawned
_group setVariable ["A3A_triggerOnCombat",
{
    params ["_group", "_marker"];
    private _vehicle = _group getVariable ["A3A_groupVehicle", objNull];
    _group setVariable ["A3A_triggerOnCombat", nil];

    //_group addVehicle _vehicle;
    _group setCombatBehaviour "CARELESS";
    { _x disableAI "TARGET" } forEach units _group;
    units _group allowGetIn true;
    units _group orderGetIn true;

    private _timeout = time + 120;
    private _success = while {true} do {
        sleep 1;
        private _downUnits = units _group select { !(_x call A3A_fnc_canFight) };
        private _boarded = { vehicle _x == _vehicle } count (units _group - _downUnits);
        if (count _downUnits + _boarded == count units _group) exitWith { _boarded > 0 };
        if (time > _timeout) exitWith { false };
        if (!canFire _vehicle) exitWith { false };
    };
    if (!_success) exitWith {
        // May as well fall back to a patrol order
        [_group, "Patrol_Defend", 0, 50, -1, false, [], false, false] call A3A_fnc_patrolLoop;
    };

    // Should have some units in the vehicle, set it on patrol
    [_group, "Patrol_Area", 25, 100, 250, true, markerPos _marker, false, false] call A3A_fnc_patrolLoop;
}];


