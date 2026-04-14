/*
    Help ground vehicles to follow move waypoints

Parameters:
    <OBJECT> Vehicle.

*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_vehicle"];

// Handle some broken input errors
private _error = call {
    if !(alive _vehicle) exitWith { "Dead or missing vehicle input" };
    if !(alive driver _vehicle) exitWith { "Dead or missing driver in vehicle" };
};
if (!isNil "_error") exitWith { Error(_error) };

private _group = group driver _vehicle;
private _timeout = time + 20 + (_vehicle distance2d waypointPosition [_group, currentWaypoint _group]);
private _fails = 0;
while {_fails < 2} do
{
    // Terminate if we ran out of (intermediate) move waypoints or vehicle/driver broke
    private _curWP = currentWaypoint _group;
    if (_curWP+1 >= count waypoints _group || waypointType [_group, _curWP] != "MOVE") exitWith {};
    if (!canMove _vehicle or !(driver _vehicle call A3A_fnc_canFight)) exitWith {};

    // If next waypoint position is close then switch to next one
    if (waypointPosition [_group, _curWP] distance2d _vehicle < 50) then {
        _group setCurrentWaypoint [_group, _curWP + 1];
        _timeout = time + 20 + (_vehicle distance2d waypointPosition [_group, _curWP + 1]);
    };

    // If we reached a timeout and there are no players near then attempt to bounce vehicle
    if (time > _timeout) then {
        _fails = _fails + 1;
        if (units teamPlayer inAreaArray [_vehicle, 500, 500] isNotEqualTo []) exitWith {};
        private _emptyPos = [getPosATL _vehicle, _vehicle, getDir _vehicle, 10, 30, 20] call A3A_fnc_findEmptyPosCar;
        if (_emptyPos isEqualTo []) exitWith {};
        _vehicle setPosATL _emptyPos;
    };

    sleep 1;
};
