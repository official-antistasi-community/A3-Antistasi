/*
Maintainer: Shoter
    Starts building a vehicle at a factory. Building costs no money: while it runs, the factory adds nothing to the
    income multiplier (A3A_fnc_siteUpgradeIncome). One build per factory at a time.

Arguments:
    <STRING> Factory marker
    <STRING> Vehicle class, from A3A_factoryBuildList
    <OBJECT> Player who asked, gets the feedback

Return Value:
    <BOOL> True when the build started

Scope: Server
Environment: Any, called with remoteExecCall from the Site upgrades tab
Public: No
Dependencies: A3A_fnc_factoryBuildRefusal, A3A_fnc_siteName, A3A_factoryBuildList, A3A_factoryBuilds

Example:
    [_marker, _class, player] remoteExecCall ["A3A_fnc_factoryBuildStart", 2];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server"); false };
params [["_marker", "", [""]], ["_class", "", [""]], ["_player", objNull, [objNull]]];

private _titleStr = localize "STR_A3A_fn_siteUpgrades_title";
private _refusal = [_marker, _class, _player] call A3A_fnc_factoryBuildRefusal;
if (_refusal != "") exitWith {
    if (!isNull _player) then { [_titleStr, _refusal] remoteExecCall ["A3A_fnc_customHint", _player] };
    false;
};

private _entry = A3A_factoryBuildList select (A3A_factoryBuildList findIf { _x # 0 == _class });
private _ticks = _entry # 2;
A3A_factoryBuilds set [_marker, [_class, _ticks, _ticks]];
publicVariable "A3A_factoryBuilds";

private _text = format [localize "STR_A3A_fn_siteUpgrades_buildStarted", [_marker] call A3A_fnc_siteName, _entry # 3, _ticks / 6 toFixed 1, name _player];
[_titleStr, _text] remoteExecCall ["A3A_fnc_customHint", [teamPlayer, civilian]];
Info_3("Factory %1 started building %2, %3 ticks", _marker, _class, _ticks);
true;
