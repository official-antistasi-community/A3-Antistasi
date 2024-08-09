/*
    Author: [Hazey]
    Description:
        Group Defend Area

    Arguments:
        <Group> Group you want to defend an area.
        <Number> Minimum Radius from Center to Defend.
        <Number> Maximum Radius from Center to Defend.
        <Bool> Should unit patrol from center or from last waypoint position. True from center, False from waypoint.
        <Array> Center Position unit is calling from.

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_group, 20, 50] call A3A_fnc_patrolDefend;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
    "_group",
    ["_minimumRadius", 20], 
    ["_maximumRadius", 100],
    ["_fromCenter", false],
    ["_centerPos", []]
];

private _leader = leader _group;

// Get home position of the unit.
private _groupHomePosition = _group getVariable "PATCOM_Patrol_Home";
private _patrolParams = _group getVariable "PATCOM_Patrol_Params";

// We check to see if the waypoint is still active after 3 minutes. If waypoint isn't complete the unit is likely stuck.
if (_group getVariable "PATCOM_WaypointTime" < serverTime) exitWith {
    // Return home
    [_group, _groupHomePosition, "MOVE", "PATCOM_PATROL_DEFEND", -1, _patrolParams # 1] call A3A_fnc_patrolCreateWaypoint;
};

[_group, "SAFE", "LIMITED", "COLUMN", "WHITE", "AUTO"] call A3A_fnc_patrolSetCombatModes;
_group setVariable ["PATCOM_Group_State", "CALM"];

if (PATCOM_DEBUG) then {
    [leader _group, "DEFEND", 10, "White"] call A3A_fnc_debugText3D;
};

private _patrolParams = _group getVariable "PATCOM_Patrol_Params";
private _waypointName = "PATCOM_PATROL_DEFEND";

if ((waypointType [_group, currentWaypoint _group] != "MOVE") || ((waypointName [_group, currentWaypoint _group]) != _waypointName)) then {
    // If Enabled, allows AI to check for statics near their position.
    // Happens once per waypoint completion.
    if (PATCOM_AI_STATICS) then {
        [_group] call A3A_fnc_patrolArmStatics;
    };

    private _nextWaypointPos = [_centerPos, _minimumRadius, _maximumRadius, 2, 0, -1, 0] call A3A_fnc_getSafePos;
    [_group, _nextWaypointPos, "MOVE", _waypointName, -1, _patrolParams # 1] call A3A_fnc_patrolCreateWaypoint;
};