/*
    Garrison-local function to handle incident reports (kills, detection)

    Environment: Scheduled. Should only be called by garrisonOpLoop.

    Arguments:
    <STRING> Marker name.
    <STRING> Event type, can be "detect" or "damage".
    <OBJECT> Enemy object that triggered the event.
    <NUMBER> Knowsabout value for enemy object.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_type", "_enemy", "_knowsAbout"];

// If we're firing a static attached to a truck, then the static is more important
if (_enemy isKindOf "Man" and !(isNull objectParent _enemy)) then { _enemy = objectParent _enemy };

Debug_1("Enemy type %1", _enemy);

private _garrison = A3A_activeGarrison get _marker;

// ignore mode changes that are triggered by related events
if (_type == "detect" and _garrison getOrDefault ["ignoreModeChange", 0] > time) exitWith {};
if (_type == "detect") then { _garrison set ["ignoreModeChange", time + 30] };

// Increase alert state of garrison?
// Not sure what we're using that for yet

// Transmit knowledge to all garrison groups
// They should all be within gunshot radius anyway?
// Not like Arma has stealth killing
{
    _x reveal [_enemy, _knowsAbout min 1.5];
} forEach ((_garrison get "groups") - [_garrison get "mortarGroup"]);

// Evaluate whether the orders we already have are sufficient
// - How much threat is there?
// - How much firepower do we have?
// - Have we requested mortar fire recently?
// - Have we sent squads in that direction?
// - Do we actually have anything to send?

// Do really dumb damage vs orders calc for now?

private _defenders = (_garrison get "groups") - [_garrison get "mortarGroup", _garrison get "staticGroup", _garrison get "buildingGroup"];
_defenders = _defenders select { leader _x call A3A_fnc_canFight };
_defenders = _defenders select { _x getVariable ["PATCOM_Patrol_Params", [""]] select 0 != "Patrol_Attack" };

// Only include mortars that are far enough and aren't busy
private _mortars = [];
if (_type != "detect") then {
    private _mortarUnits = units (_garrison get "mortarGroup") select { _x call A3A_fnc_canFight };
    _mortars = _mortarUnits apply { vehicle _x } select { _x isKindOf "StaticMortar" };

    private _busy = _mortars select {!(_x getVariable ["PATCOM_ArtilleryBusy", false])};
    Trace_3("Mortars: %1 can fire; %2 not busy; %3 in range", count (_mortars select {canFire _x}), count _busy, count (_mortars select {_enemy distance2d _x > 100}) );

    _mortars = _mortars select { canFire _x and !(_x getVariable ["PATCOM_ArtilleryBusy", false]) and _enemy distance2d _x > 100 };
};

private _threatTime = _garrison getOrDefault ["threatTime", time];
private _threat = _garrison getOrDefault ["threat", 0];

if (abs _threat > 0.01) then {
    // time falloff towards zero (even if negative)
    _threat = _threat - ((time - _threatTime) / 60) * _threat / abs _threat;
};
_threat = (_threat max 0) + ([1, 3] select (_type == "mortar"));

Trace_2("%1 current threat %2", _marker, _threat);

if (_threat > random 3) then
{
    // Send a response
    private _minDist = selectMin markerSize _marker;
    private _group = call {
        if (_enemy isKindOf "Air") exitWith {};             // garrison can't deal with air
        private _dist = _enemy distance2d markerPos _marker;
        // At very long range, restrict to mortars
        if (_dist > _minDist + 200 + random 300) exitWith { selectRandom _mortars };
        // Prefer infantry at close range
        if (_dist < _minDist + random 150) exitWith { selectRandom _defenders };
        selectRandom (_defenders + _mortars);
    };
    if (isNil "_group") exitWith {
        ServerDebug_1("Nothing usable within range at %1", _marker);
        private _side = _garrison get "side";
        if (_type == "detect" or _side == teamPlayer) exitWith {};             // Do not call cheap supports vs spotted targets
        [_side, _enemy, markerPos _marker, _knowsAbout, 0.7] remoteExec ["A3A_fnc_requestSupport", 2];
        _threat = 0;                  // don't spam support calls
    };

    private _precisionOff = random (60 - (_knowsAbout / 4) * 50);
    private _targPos = getPosATL _enemy getPos [_precisionOff, random 360];
 
    // mortars are actually vehicles not groups here, but whatever
    if (_group in _mortars) then {
        private _delay = [20 + random 10, 5 + random 5] select (_enemy isKindOf "StaticMortar");
        [_group, _targPos, 40, "HE", 4, _delay] call A3A_fnc_artilleryFireMission;
        _threat = _threat - 4;
        ServerDebug_3("Ordering mortar %1 to attack %2 at %3", _group, _enemy, _marker);
        // should probably pay for it?
    } else {
        [_group, "Patrol_Attack", 0, 50, -1, false, _targPos, false, false] call A3A_fnc_patrolLoop;
        _threat = _threat - ({ _x call A3A_fnc_canFight } count units _group);
        ServerDebug_3("Sending group %1 to attack %2 at %3", _group, _enemy, _marker);
    };
};

_garrison set ["threatTime", time];
_garrison set ["threat", _threat];
