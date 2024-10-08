/*
Maintainer: Caleb Serafin
    Will check if the provided position is within a member leash.
    It is recommended to use this before teleporting.

Arguments:
    <POS2D | POS3D> Position to check for player leash. Z-axis is ignored.
    <POS2D | POS3D> The nearest leash center found (OPTIONAL). [DEFAULT = [0,0]]

Return Value:
    <BOOL> If the target zone is within a player leash.

Scope: Any, Global Arguments
Environment: Any
Public: Yes
Dependencies:
    <SCALAR> memberDistance
    <STRING> respawnTeamPlayer

Example:
    [_airport1] call A3A_fnc_playerLeashCheckPosition; // false

    _nearestLeashCentre = [0,0];
    [_coolMission,_nearestLeashCentre] call A3A_fnc_playerLeashCheckPosition;
    _member = (_nearestLeashCentre nearEntities 99999) #0;
    hint format ["You could ask %1 to support you at the mission.",name _member];
*/
params [
    ["_targetPos", [0,0] ,[ [] ], [2,3]],
    ["_out_nearestLeashCentre", [0,0], [ [] ], [2,3]]
];
private _debugMode = !isNil "A3A_DEV_playerLeash_debug";

// -1 is used to represent unlimited distance.
if (memberDistance <= 0 || !membershipEnabled) exitWith {true};

private _leashCentres = [];
_leashCentres pushBack getMarkerPos respawnTeamPlayer;
{ if (sidesX getVariable _x == teamPlayer) then { _leashCentres pushBack getMarkerPos _x } } forEach forcedSpawn;         // Enable guests to defend
private _memberPositions = (call A3A_fnc_playableUnits select {_x call A3A_fnc_isMember or _x == theBoss}) apply {getPosATL _x};
_leashCentres append _memberPositions;

_nearestLeashCentre = [_leashCentres,_targetPos] call BIS_fnc_nearestPosition;
_out_nearestLeashCentre set [0,_nearestLeashCentre #0];
_out_nearestLeashCentre set [1,_nearestLeashCentre #1];

// By this point no leash exemptions were found.
_targetPos distance2D _nearestLeashCentre <= memberDistance;  // Final return of whether the player is within leash
