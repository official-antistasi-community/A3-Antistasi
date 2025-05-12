/*
Author: Wurzel0701, Triada, jaj22, Spoffy, Barbolani
    Defines and executes the behaviour of enemy AI in case of a down or KIA in their group

Arguments:
    <OBJECT> The unit which was downed or killed.
    <GROUP> The group of the unit. May have changed since.
    <OBJECT> The unit which downed or killed the unit

Return Value:
    <NIL>

Scope: Server/HC, local to unit/group
Environment: Scheduled
Public: Yes
Dependencies:
    <ARRAY> allMachineGuns
    <BOOL> haveNV
    <BOOL> hasIFA
    <HashMap> A3A_faction_all

Example:
[_unit, _group, _killer] spawn A3A_fnc_AIreactOnKill;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// TODO: what exactly should killer parameter be here?
params ["_unit", "_group", "_killer"];

if (_unit getVariable ["downedTimeout", 0] > time) exitWith {};         // only count each unit once, at least within timeout
_unit setVariable ["downedTimeout", time + 1200];

//If _killer is not set or the same side (collision for example), abort here
if((isNil "_killer") || {(isNull _killer) || {side (group _killer) == side _group}}) exitWith {};

// Add the unit to recent kills for reaction purposes
[side _group, getPosATL _unit, 10, _killer] remoteExec ["A3A_fnc_addRecentDamage", 2];


private _enemy = objNull;
private _activeGroupMembers = (units _group) select {_x call A3A_fnc_canFight};

//No group member left in fighting condition, no reaction possible
if(count _activeGroupMembers == 0) exitWith {};

//Call help if possible
if(_group getVariable ["A3A_canCallSupportAt", -1] < time) then {
    [_group, _killer] spawn A3A_fnc_callForSupport;
};

// Call for Local battery support.
if (PATCOM_ARTILLERY_MANAGER) then {
    [getPos _killer, (random 150), "HE", (round (1 + tierWar / 2)), _group] call A3A_fnc_artilleryFireMission;
};

if (!fleeing leader _group and random 1 < 0.5) then
{
    private _courage = leader _group skill "courage";
    _group allowFleeing (2 - _courage - count _activeGroupMembers / count units _group);
};

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
