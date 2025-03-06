/*
    Move an enemy group to return to the nearest unspawned base and despawn as soon as possible
    Will choose appropriate base depending on occupied vehicle (if any)
    If optional marker is provided, will attempt to garrison foot troops there

    NOTE:
    This is pretty awful and should be reimplemented in an AI/commander/garrison rework
    Fundamental problem with double-counting when adding to a despawned garrison in current system 
    Plus perf problems with overstuff testing, nearest marker, near spawners etc.

    Parameters:
    1. <GROUP> Group to order
    2. <STRING> Nearby friendly marker to garrison (Optional)

    Environment: Any
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group", ["_marker", ""]];

// Calling functions aren't too picky about lists of groups
if (isNull _group) exitWith {};
if (units _group isEqualTo []) exitWith { deleteGroup _group };

private _fnc_nearestBase = {
    params ["_group", "_potentials"];
	_potentials = _potentials select { (spawner getVariable _x == 2) and (sidesX getVariable [_x, sideUnknown] == side _group) };
	if (count _potentials == 0) exitWith {nil};
    [_potentials, leader _group] call BIS_fnc_nearestPosition;
};

// Remove any other AI scripts (eg. attackDrillAI
private _AIScriptHandle = _group getVariable "A3A_AIScriptHandle";
if (!isNil "_AIScriptHandle") then { terminate _AIScriptHandle; };   // _group setVariable ["A3A_AIScriptHandle", nil] };

// Remove any current waypoints
// Turns out that this is actually bugged (for infantry?) and followed vs visible waypoints desync in unpredictable ways
{ deleteWaypoint _x } forEachReversed (waypoints _group);

// Group in vehicle
private _vehicle = vehicle leader _group;
if (_vehicle != leader _group) exitWith
{
	[_group] spawn A3A_fnc_groupDespawner;
    [_vehicle] spawn A3A_fnc_vehDespawner;         // probably already done, but whatever

    // Ignore captured marker, find nearest suitable base to return to
    if (_vehicle isKindOf "Air") then {
        _marker = [_group, airportsX + ["CSAT_carrier", "NATO_carrier"]] call _fnc_nearestBase;
    };
    if (_vehicle isKindOf "Ship") then {
        _marker = _vehicle getVariable "A3A_shipSpawnPos";      // not a marker, but fixed later
    } else {
        _marker = [_group, airportsX + outposts] call _fnc_nearestBase;
    };

    if (isNil "_marker") exitWith {};       // just carry on

    private _returnPos = if (_marker isEqualType "") then { markerPos _marker } else { _marker };
    { _x disableAI "AUTOCOMBAT" } forEach units _group;
    _group setBehaviourStrong "AWARE";
    private _wp = _group addWaypoint [_returnPos, 50];
    ServerDebug_2("Group %1 with vehicle %2 returning to base", _group, typeof vehicle leader _group);
    _group setCurrentWaypoint _wp;
};


// Foot infantry
// If specified marker is (still) valid, garrison at it
if (_marker != "") then {
    if (([_marker] call A3A_fnc_garrisonSize) - count (garrison getVariable [_marker, []]) <= 0) exitWith { _marker = "" };
    if (sidesX getVariable _marker != side _group) exitWith { _marker = "" }; 
    if (markerPos _marker distance2d leader _group >= 500) exitWith { _marker = "" };
};
if (_marker != "") exitWith { [_group, _marker] call A3A_fnc_enemyGarrison };

// Foot troops can retreat to any unspawned friendly location
_marker = [_group, outposts + airportsX + resourcesX + factories + seaports] call _fnc_nearestBase;
if (isNil "_marker") exitWith {
    ServerDebug_1("Group %1 surrendering due to no retreat locations", _group);
    { _x spawn A3A_fnc_surrenderAction } forEach units _group;
};
[_group] spawn A3A_fnc_groupDespawner;

{ _x disableAI "AUTOCOMBAT"; _x disableAI "TARGET"; } forEach units _group;
_group setBehaviourStrong "AWARE";
private _wp = _group addWaypoint [markerPos _marker, 50];
_group setCurrentWaypoint _wp;
ServerDebug_1("Group %1 returning to base on foot", _group);
