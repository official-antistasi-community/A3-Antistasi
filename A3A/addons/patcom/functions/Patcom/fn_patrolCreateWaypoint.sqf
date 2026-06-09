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

/*
// This is the only way I know how to reindex the waypoints on a group.
for "_i" from count waypoints _group - 1 to 0 step -1 do {
    deleteWaypoint [_group, _i];
};
*/

if ((count _position) < 3) exitWith {};

// Waypoint Position
private _waypointPos = [];

// Avoid breaking how A3 handles waypointing.
private _waypointCount = count waypoints _group - 1;
private _waypoint = [_group, _waypointCount];

// Check if current waypoints is more than 1 and current waypoint name is as defined.
if (count waypoints _group > 1 && waypointName _waypoint isEqualTo _waypointName) then {

    // If radius is -1, we set to exact position.
    if (_radius == -1) then {
        // When using negative radius, the center position supplied must be PositionASL, 
        // only then the resulting waypointPosition will be in format PositionAGL and not buried under the ground ¯\_(ツ)_/¯ Thanks Bi.
        _waypointPos = AGLtoASL waypointPosition _waypoint;
        _position = AGLtoASL _position;
    } else {
        _waypointPos = waypointPosition _waypoint;
    };

    // We check param distance to see if new waypoint is too close to old waypoint.
    if (_position distance _waypointPos > _distance) then {
        _waypoint setWaypointPosition [_position, _radius];
    };
} else {
    _waypoint = _group addWaypoint [AGLtoASL _position, _radius];
    _waypoint setWaypointName _waypointName;
};

// Make sure currentWaypoint is set to new waypoint. If not, set it.
if ((_waypoint#1) != currentWaypoint _group) then {
    _group setCurrentWaypoint _waypoint;
};

// Make sure waypointType returns correct type. If not, set it.
if (waypointType _waypoint != _waypointType) then {
    _waypoint setWaypointType _waypointType;
};

// Allow enough time to reach the next waypoint
private _waypointTime = time + 30 + (_position distance leader _group);
_group setVariable ["PATCOM_WaypointTime", _waypointTime];