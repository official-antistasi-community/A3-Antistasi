/*  
Maintainer: John Jordan
    Select from distance-weighted list of available enemy land bases or return full list
    Checks idle, spawner, distance, garrison, spawn places and pathfinding connection

Scope: Anywhere with navgrid? Only using on server atm
Environment: Scheduled or unscheduled

Arguments:
    <SIDE> Side of enemy faction
    <POS2D or STRING> Target position or marker name to use
    <BOOL> Optional, true to return all bases & weights (Default: false)

Return value:
    <STRING> Marker name of landbase, or nil if none. Or <ARRAY, ARRAY> [landbases, weights]
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side", "_target", ["_returnAll", false]];

private _lowAir = Faction(_side) getOrDefault ["attributeLowAir", false];
private _nearMarkers = [_target, _lowAir] call A3A_fnc_findLandSupportMarkers;

// Just go simple here for the moment. Point is not to spawn at a site that's under attack
private _rebelSpawners = units teamPlayer select { _x getVariable ["spawner", false] };

private _freeBases = [];
private _weights = [];
{
    _x params ["_marker", "_navDist"];
    if (sidesX getVariable [_marker, sideUnknown] != _side) then {continue};
    if (dateToNumber date < server getVariable [_marker, 0]) then {continue};       // addTimeForIdle
    if (A3A_spawnPlaceStats get _marker get "vehicle" select 0 isEqualTo []) then {continue};       // no vehicle spawn places
    if (A3A_garrison get _marker get "troops" select 0 < 16) then {continue};
    if (_rebelSpawners inAreaArray [markerPos _marker, 700, 700] isNotEqualTo []) then {continue};

    _freeBases pushBack _marker;
    _weights pushBack (1 / _navDist^2);
} forEach _nearMarkers;

if (_returnAll) exitWith { [_freeBases, _weights] };
_freeBases selectRandomWeighted _weights;

// change this to return base, distance and count?
// or could just re-run findNavDistance

/*
// Uncached version
params ["_side", "_targPos", ["_returnAll", false]];

private _targNavIndex = [_targPos] call A3A_fnc_getNearestNavPoint;
if (_targNavIndex == -1) exitWith { nil };
private _lowAir = Faction(_side) getOrDefault ["attributeLowAir", false];
private _maxLandDist = distanceForLandAttack + ([1000, 2000] select _lowAir);        // Allow extra crow-flies distance, because it checks real distance later

private _freeBases = [];
private _weights = [];
{
    if (sidesX getVariable [_x,sideUnknown] != _side) then {continue};
    if (dateToNumber date < server getVariable [_x, 0]) then {continue};       // addTimeForIdle
    if (spawner getVariable _x != 2) then {continue};                           // spawn places dangerous if spawned
    if (markerPos _x distance2d _targPos > _maxLandDist) then {continue};
    if (count (garrison getVariable [_x,[]]) < 16) then {continue};
    if (spawner getVariable (_x + "_spawns") select 0 isEqualTo []) then {continue};        // any vehicle spawn places on base
//	if !([_x, _targPos] call A3A_fnc_arePositionsConnected) then {continue};                // checked by findNavDistance

    private _navIndex = _x call A3A_fnc_getMarkerNavPoint;
    private _navDist = [_targNavIndex, _navIndex, _maxLandDist+500] call A3A_fnc_findNavDistance;
    if (_navDist < 0) then { continue };        // no path found within range

    _freeBases pushBack _x;
    _weights pushBack (1 / _navDist^2);
} forEach (outposts + airportsX);

if (_returnAll) exitWith { [_freeBases, _weights] };
_freeBases selectRandomWeighted _weights;
*/