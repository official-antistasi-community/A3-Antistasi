#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_units","_unit"];
private _titleStr = localize "STR_A3A_fn_reinf_controlunit_title";

_units = _this select 0;

_unit = _units select 0;

if (_unit == Petros) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_controlunit_no_petros"] call A3A_fnc_customHint;};
if (captive player) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_controlunit_no_uncon"] call A3A_fnc_customHint;};
if (player != leader group player) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_controlunit_no_sl"] call A3A_fnc_customHint;};
if (isPlayer _unit) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_controlunit_no_other_player"] call A3A_fnc_customHint;};
if (!(alive _unit) or (_unit getVariable ["incapacitated",false]))  exitWith {[_titleStr, localize "STR_A3A_fn_reinf_controlunit_no_deadUnit"] call A3A_fnc_customHint;};
if (side _unit != teamPlayer) exitWith {[_titleStr, format [localize "STR_A3A_fn_reinf_controlunit_no_belong",FactionGet(reb,"name")]] call A3A_fnc_customHint;};
if (!isNil "A3A_FFPun_Jailed" && {(getPlayerUID player) in A3A_FFPun_Jailed}) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_controlunit_no_nope"] call A3A_fnc_customHint;};

_owner = player getVariable ["owner",player];
if (_owner!=player) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_controlunit_no_controlling"] call A3A_fnc_customHint;};

{
if (_x != vehicle _x) then
	{
	[_x] orderGetIn true;
	};
} forEach units group player;

_unit setVariable ["owner",player,true];
_eh1 = player addEventHandler ["HandleDamage",
	{
	_unit = _this select 0;
	_unit removeEventHandler ["HandleDamage",_thisEventHandler];
	//removeAllActions _unit;
	selectPlayer _unit;
	(units group player) joinsilent group player;
	group player selectLeader player;
	[localize "STR_A3A_fn_reinf_controlunit_title", localize "STR_A3A_fn_reinf_controlunit_return_damage"] call A3A_fnc_customHint;
	nil;
	}];
_eh2 = _unit addEventHandler ["HandleDamage",
	{
	_unit = _this select 0;
	_unit removeEventHandler ["HandleDamage",_thisEventHandler];
	removeAllActions _unit;
	selectPlayer (_unit getVariable "owner");
	(units group player) joinsilent group player;
	group player selectLeader player;
	[localize "STR_A3A_fn_reinf_controlunit_title", localize "STR_A3A_fn_reinf_controlunit_return_damage_ai"] call A3A_fnc_customHint;
	nil;
	}];
selectPlayer _unit;

_timeX = 60;

_unit addAction [localize "STR_A3A_fn_reinf_controlunit_return",{selectPlayer leader (group (_this select 0))}];

waitUntil {sleep 1; [_titleStr, format [localize "STR_A3A_fn_reinf_controlunit_return_time", _timeX]] call A3A_fnc_customHint; _timeX = _timeX - 1; (_timeX == -1) or (isPlayer (leader group player))};

removeAllActions _unit;
selectPlayer (_unit getVariable ["owner",_unit]);
//_unit setVariable ["owner",nil,true];
(units group player) joinsilent group player;
group player selectLeader player;
_unit removeEventHandler ["HandleDamage",_eh2];
player removeEventHandler ["HandleDamage",_eh1];
[_titleStr, ""] call A3A_fnc_customHint;
