/*
Maintainer: Caleb Serafin
    Prone to race conditions and confusing calling. Migrate to A3A_fnc_sendMoney.
    Donates money to faction or person.
    Gives the player a score for donating to faction.
    If no arguments are passed, money is donated to the faction.
    If one player object is passed, € 100 is donated to who he is looking at.

Arguments:
    <OBJECT> The player object who loses money.

Scope: Client donating from, Global Arguments, Global Effect
Environment: Any
Public: Yes

Example:
    [] call A3A_fnc_donateMoney; // Donate to faction
    [player] call A3A_fnc_donateMoney; // Donates to player's cursor object.
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_resourcesPlayer","_pointsXJ","_target"];

_resourcesPlayer = player getVariable "moneyX";
if (_resourcesPlayer < 100) exitWith {[_title, format [localize "STR_A3A_fn_orgp_donMon_no_less", 100]] call A3A_fnc_customHint;};

if (count _this == 0) exitWith
	{
	[0,100] remoteExec ["A3A_fnc_resourcesFIA",2];
	_pointsXJ = (player getVariable "score") + 1;
	player setVariable ["score",_pointsXJ,true];
	[-100] call A3A_fnc_resourcesPlayer;
	[_title, format [localize "STR_A3A_fn_orgp_donMon_donated_faction", 100]] call A3A_fnc_customHint;
	};
_target = cursorTarget;

if (!isPlayer _target) exitWith {[_title, localize "STR_A3A_fn_orgp_donMon_no_looking"] call A3A_fnc_customHint;};

[-100] call A3A_fnc_resourcesPlayer;
[100] remoteExec ["A3A_fnc_resourcesPlayer", _target];
[_title, format [localize "STR_A3A_fn_orgp_donMon_donated_player", name _target, 100]] call A3A_fnc_customHint;
