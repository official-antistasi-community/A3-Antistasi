/*
Maintainer: Shoter
    Adds the local player actions to a town upgrade prop: dismantle (commander) and, for the militia post, lie low.
    Called by the server through remoteExec with a JIP id when the prop is created, so late joiners get it too.

Arguments:
    <OBJECT> The upgrade prop

Return Value:
    <nil>

Scope: Clients
Environment: Any
Public: No
Dependencies:

Example:
    [_prop] remoteExec ["A3A_fnc_townUpgradeAddActions", 0, "A3A_townUpgAct_Kavala_clinic"];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!hasInterface) exitWith {};
params [["_prop", objNull, [objNull]]];
if (isNull _prop) exitWith {};

(_prop getVariable ["A3A_townUpgrade", ["", ""]]) params ["_city", "_id"];
if (_id == "") exitWith { Error_1("Town upgrade prop %1 carries no upgrade data", _prop) };
private _name = localize format ["STR_A3A_fn_townUpgrades_name_%1", _id];

// Commander can take an upgrade down again, no refund
[
    _prop,
    format [localize "STR_A3A_fn_townUpgrades_action_dismantle", _name],
    "a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    "a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    "(player == theBoss) and (player distance _target < 8)",
    "(player == theBoss) and ([player] call A3A_fnc_canFight)",
    {},
    {},
    { [_this # 0, player] remoteExecCall ["A3A_fnc_townUpgradeDismantle", 2] },
    {},
    [],
    6
] call BIS_fnc_holdActionAdd;

if (_id != "militia") exitWith {};

// Shake off pursuit after being spotted, only when no enemies are around
[
    _prop,
    localize "STR_A3A_fn_townUpgrades_action_lieLow",
    "a3\ui_f\data\igui\cfg\holdactions\holdAction_talk_ca.paa",
    "a3\ui_f\data\igui\cfg\holdactions\holdAction_talk_ca.paa",
    "(player distance _target < 8)",
    "([player] call A3A_fnc_canFight)",
    {},
    {},
    {
        params ["_target"];
        private _title = localize "STR_A3A_fn_townUpgrades_title";
        private _enemies = (units Occupants + units Invaders) inAreaArray [getPosATL _target, 300, 300];
        if (_enemies findIf { alive _x } != -1) exitWith { [_title, localize "STR_A3A_fn_townUpgrades_lieLow_enemies"] call A3A_fnc_customHint };
        player setVariable ["compromised", 0, true];
        [_title, localize "STR_A3A_fn_townUpgrades_lieLow_ok"] call A3A_fnc_customHint;
    },
    {},
    [],
    8
] call BIS_fnc_holdActionAdd;
