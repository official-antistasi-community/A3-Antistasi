/*
    Author: [Hazey]
    Description:
        Group Patrol Area

    Arguments:
        <Group> Group you want to run a Patrol Area.
        <Number> Max Distance the unit should venture before returning home.
        <Number> Minimum Radius from Center to Patrol.
        <Number> Maximum Radius from Center to Patrol.
        <Number> Distance from nearest object to create waypoint.
        <Number> 0 - No Water, 1 - land & water, 2 - water only
        <Number> Max Gradient to create waypoint on. Used to avoid super hilly maps.
        <Number> Should be on the shore or not.

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
    ["_centerPos", []],
    ["_searchBuildings", false]
];

// Get home position of the unit.
private _groupHomePosition = _group getVariable "PATCOM_Patrol_Home";
private _patrolParams = _group getVariable "PATCOM_Patrol_Params";

// This is the only place we handle civilians in this Commander.
if ((side leader _group) == civilian) then {
    [_group, "CARELESS", "NORMAL", "LINE", "BLUE", "AUTO"] call A3A_fnc_patrolSetCombatModes;
} else {
    [_group, "SAFE", "LIMITED", "COLUMN", "WHITE", "AUTO"] call A3A_fnc_patrolSetCombatModes;
    _group setVariable ["PATCOM_Group_State", "CALM"];
};

if (PATCOM_DEBUG) then {
    if ((side leader _group) == civilian) then {
        [leader _group, "CIVILIAN THINGS", 10, "White"] call A3A_fnc_debugText3D;
    } else {
        [leader _group, "PATROL AREA", 10, "White"] call A3A_fnc_debugText3D;
    };
};

// We check to see if the waypoint is still active after 3 minutes. If waypoint isn't complete the unit is likely stuck.
if (_group getVariable "PATCOM_WaypointTime" < serverTime) exitWith {
    // Return home
    [_group, _groupHomePosition, "MOVE", "PATCOM_PATROL_AREA", -1, _patrolParams # 1] call A3A_fnc_patrolCreateWaypoint;
};

// Check for current waypoints and make sure they are type MOVE for patrol
if ((waypointType [_group, currentWaypoint _group] != "MOVE") || ((waypointName [_group, currentWaypoint _group]) != "PATCOM_PATROL_AREA")) then {
    if (_searchBuildings) then {
        // Percentage chance on searching a nearby building.
        if (15 > random 100) exitWith {
            [_group] call A3A_fnc_patrolSearchBuilding;
            if (PATCOM_DEBUG) then {
                [leader _group, "SEARCH BUILDING", 10, "Green"] call A3A_fnc_debugText3D;
            };
        };
    };

    if (_maxPatrolDistance != -1) then {
        if ((leader _group) distance _groupHomePosition > _maxPatrolDistance) exitWith {
            // Return home
            [_group, _groupHomePosition, "MOVE", "PATCOM_PATROL_AREA", -1, _patrolParams # 1] call A3A_fnc_patrolCreateWaypoint;
        };
    };

    if (_fromCenter) then {
        // | Center Position | Min Radius | Max Radius | Min Object Distance | Water Mode | Max Gradient | ShoreMode |
        private _nextWaypointPos = [_centerPos, _minimumRadius, _maximumRadius, 2, 0, -1, 0] call A3A_fnc_getSafePos;
        [_group, _nextWaypointPos, "MOVE", "PATCOM_PATROL_AREA", -1, _patrolParams # 1] call A3A_fnc_patrolCreateWaypoint;
    } else {
        // | Center Position | Min Radius | Max Radius | Min Object Distance | Water Mode | Max Gradient | ShoreMode |
        private _nextWaypointPos = [getPosATL (leader _group), _minimumRadius, _maximumRadius, 2, 0, -1, 0] call A3A_fnc_getSafePos;
        [_group, _nextWaypointPos, "MOVE", "PATCOM_PATROL_AREA", -1, _patrolParams # 1] call A3A_fnc_patrolCreateWaypoint;
    };
};