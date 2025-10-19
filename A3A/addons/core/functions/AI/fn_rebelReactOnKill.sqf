/*
    Defines and executes the behaviour of rebel AI in case of a down or KIA in their group

Arguments:
    <OBJECT> The unit which was downed or killed.
    <GROUP> The group of the unit. May have changed since.
    <OBJECT> The unit which downed or killed the unit

Return Value:
    <NIL>

Scope: Local to unit/group
Environment: Scheduled
Public: Yes

Example:
[_unit, _group, _killer] spawn A3A_fnc_rebelReactOnKill;
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// TODO: what exactly should killer parameter be here?
params ["_unit", "_group", "_killer"];

Trace_1("Called with parameters %1", _this);

// Need to fire this regardless of previous downs
private _marker = _unit getVariable ["markerX", ""];
if (_marker != "") then {
    A3A_garrisonOps pushBack ["zoneCheck", [_marker]];          // should always be local for marker units
};

if (_unit getVariable ["downedTimeout", 0] > time) exitWith {};         // only count each unit once, at least within timeout
_unit setVariable ["downedTimeout", time + 1200];

//If _killer is not set or the same side (collision for example), abort here
if((isNil "_killer") || {(isNull _killer) || {side (group _killer) == side _group}}) exitWith {};

if (_marker != "") then {
    // Fire this one even if group was eliminated, garrison expects regular response from group
    [_group, _marker, _killer] spawn {
        params ["_group", "_marker", "_killer"];
        sleep (4 + random 4);
        private _knowsAbout = _group knowsAbout _killer;
        if !(leader _group call A3A_fnc_canFight) then { _knowsAbout = 0 };
        A3A_garrisonOps pushBack ["enemyInfo", [_marker, "damage", _killer, _knowsAbout]];
    };
};

/*
private _enemy = objNull;
private _activeGroupMembers = (units _group) select {_x call A3A_fnc_canFight};

//No group member left in fighting condition, no reaction possible
if(count _activeGroupMembers == 0) exitWith {};


if (_group getVariable ["A3A_reactingToKill", false]) exitWith {};      // don't spam this loop
_group setVariable ["A3A_reactingToKill", true];

{
    if !(_x call A3A_fnc_canFight) then { continue };
    private _enemy = _x findNearestEnemy _x;

    call {
        if (fleeing _x && {!isNull _enemy && (_x distance _enemy < 50) && (vehicle _x == _x)} ) exitWith {
            [_x] spawn A3A_fnc_surrenderAction;
        };
        if (_x getVariable ["helping", false]) exitWith {};
        if (!isNull _enemy && (primaryWeapon _x in allMachineGuns)) exitWith {
            if (random 100 < 40) then { [_x,_enemy] spawn A3A_fnc_suppressingFire };
        };
        if (sunOrMoon == 1 || haveNV) exitWith {
            if (random 100 < 40) then { [_x,_x,_enemy] spawn A3A_fnc_chargeWithSmoke };
        };
        if (primaryWeapon _x in allGrenadeLaunchers) exitWith {
            [_x,_enemy] spawn A3A_fnc_useFlares;
        };
	};
    sleep (1 + random 1);
} forEach _activeGroupMembers;

_group setVariable ["A3A_reactingToKill", nil];
*/
