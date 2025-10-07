/*
    Author: [Hazey]
    Description:
        Group Patrol Attack

    Arguments:
        <Group> Group you want to run an attack.
        <Number> Maximum search radius
        <Array> ATL position of target enemy position.

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_group, _knownEnemies] call A3A_fnc_patrolArea;

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
    "_group", 
    "_maximumRadius",
    "_targetPos"
];

[_group, "COMBAT", "FULL", "COLUMN", "RED", "AUTO"] call A3A_fnc_patrolSetCombatModes;

if (PATCOM_DEBUG) then {
    [leader _group, "ATTACK", 10, "White"] call A3A_fnc_debugText3D;
};

// If Enabled unit in combat, activly check for statics near their positions to man.
if (PATCOM_AI_STATICS) then {
    [_group] call A3A_fnc_patrolArmStatics;
};

// Set Waypoint Name
private _waypointName = "PATCOM_PATROL_ATTACK";

if ((waypointType [_group, currentWaypoint _group] != "SAD") || ((waypointName [_group, currentWaypoint _group]) != _waypointName)) then {
    
    // Instead of taking the Perceived Position and creating a waypoint from there. We opt to get our own waypoint so we can add some variation.
    // Center Position | Min Radius | Max Radius | Min Object Distance | Water Mode | Max Gradient | ShoreMode
    private _nextWaypointPos = [_targetPos, 0, _maximumRadius, 2, 0, -1, 0] call A3A_fnc_getSafePos;
    
    [_group, _nextWaypointPos, "SAD", _waypointName, -1, 50] call A3A_fnc_patrolCreateWaypoint;
};

// Revert to previous order if we're close to the target zone and without enemies
private _wpPos = waypointPosition [_group, currentWaypoint _group];
Trace_2("Group %1 distance to waypoint %2", _group, leader _group distance2d _wpPos);

if (leader _group distance2d _wpPos < 50) then {
    private _knownEnemies = _group targets [true, PATCOM_VISUAL_RANGE, [], PATCOM_TARGET_TIME];
    if (_knownEnemies isNotEqualTo []) exitWith {};

    // If we didn't have previous orders then just throw some safe garbage in
    private _previousOrders = _group getVariable "PATCOM_Previous_Orders";
    if (isNil "_previousOrders") then { 
        _previousOrders = ["Patrol_Area", 0, 100, -1, false, _group getVariable "PATCOM_Patrol_Home", false];
    };
    _group setVariable ["PATCOM_Patrol_Params", _previousOrders];
    _group setVariable ["PATCOM_Group_State", "CALM"];
};
