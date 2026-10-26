/*
    Author: [Hazey]
    Description:
        Create Waypoint for Group.

    Arguments:
        <Group> Group waypoint should be added to.
        <Array> Position to create waypoint at.
        <String> Waypoint Type, Typically "MOVE".
        <String> Waypoint Name, used to verify current waypoint.
        <Number> Radius of waypoint.
        <Number> Distance to ignore newly created waypoint.

    Return Value:
        <Array> Waypoint

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_group, _nextWaypointPos, "SAD", _waypointName, -1, 50] call A3A_fnc_patrolCreateWaypoint;

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group", "_position", "_waypointType", "_waypointName", ["_radius", -1], ["_distance", 50]];

if (count _position < 3) exitWith {};

// Delete everything except the first two waypoints
for "_i" from (count waypoints _group - 1) to 2 step -1 do { deleteWaypoint [_group, _i] };

private _waypointPos = if (_radius == -1) then { AGLtoASL _position } else { _position };

// If waypoint 1 is the right type then re-use it with the new position
if (count waypoints _group > 1 && waypointName [_group, 1] isEqualTo _waypointName) then {
    [_group, 1] setWaypointPosition [_waypointPos, _radius];
    _group setCurrentWaypoint [_group, 1];
} else {
    if (count waypoints _group > 1) then { deleteWaypoint [_group, 1] };
    _waypoint = _group addWaypoint [_waypointPos, _radius];
    _waypoint setWaypointType _waypointType;
    _group setCurrentWaypoint _waypoint;            // might have started with no waypoints
};

// Allow enough time to reach the next waypoint
private _waypointTime = time + 30 + (_position distance leader _group);
_group setVariable ["PATCOM_WaypointTime", _waypointTime];
