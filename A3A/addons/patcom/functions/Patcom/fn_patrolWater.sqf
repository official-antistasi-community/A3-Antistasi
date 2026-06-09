/*
    Author: [Hazey]
    Description:
        Group Patrol Water

    Arguments:
        <Group> Group you want to patrol the surrounding water.
        <Number> Minimum Radius from Center to Patrol.
        <Number> Maximum Radius from Center to Patrol.
        <Number> Maximum distance this unit can Patrol before returning home.
        <Bool> Should unit patrol from center or from last waypoint position. True from center, False from waypoint.
        <Array> Center Position unit is calling from.


    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_group] call A3A_fnc_patrolArea;

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
    "_group",  
    ["_minimumRadius", 50], 
    ["_maximumRadius", 100], 
    ["_maxPatrolDistance", -1],
    ["_fromCenter", false],
    ["_centerPos", []]
];

// Get home position of the unit.
private _groupHomePosition = _group getVariable "PATCOM_Patrol_Home";
private _patrolParams = _group getVariable "PATCOM_Patrol_Params";

[_group, "SAFE", "LIMITED", "COLUMN", "YELLOW", "AUTO"] call A3A_fnc_patrolSetCombatModes;
_group setVariable ["PATCOM_Group_State", "CALM"];

if (PATCOM_DEBUG) then {
    [leader _group, "PATROL WATER", 10, "White"] call A3A_fnc_debugText3D;
};

// Check if waypoint is reached or timeout has expired
if (currentWaypoint _group == count waypoints _group || waypointType [_group, currentWaypoint _group] != "MOVE" || time > _group getVariable ["PATCOM_WaypointTime", 0]) then {
    if (_maxPatrolDistance != -1) then {
        if ((leader _group) distance _groupHomePosition > _maxPatrolDistance) exitWith {
            // Return home
            [_group, _groupHomePosition, "MOVE", "PATCOM_PATROL_WATER", -1, _patrolParams # 1] call A3A_fnc_patrolCreateWaypoint;
        };
    };

    if (_fromCenter) then {
        // | Center Position | Min Radius | Max Radius | Min Object Distance | Water Mode | Max Gradient | ShoreMode |
        private _nextWaypointPos = [_centerPos, _minimumRadius, _maximumRadius, 2, 2, -1, 0] call A3A_fnc_getSafePos;
        [_group, _nextWaypointPos, "MOVE", "PATCOM_PATROL_WATER", -1, _patrolParams # 1] call A3A_fnc_patrolCreateWaypoint;
    } else {
        // | Center Position | Min Radius | Max Radius | Min Object Distance | Water Mode | Max Gradient | ShoreMode |
        private _nextWaypointPos = [getPosATL (leader _group), _minimumRadius, _maximumRadius, 2, 2, -1, 0] call A3A_fnc_getSafePos;
        [_group, _nextWaypointPos, "MOVE", "PATCOM_PATROL_WATER", -1, _patrolParams # 1] call A3A_fnc_patrolCreateWaypoint;
    };
};