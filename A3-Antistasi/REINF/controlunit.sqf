#include "..\Includes\common.inc"
FIX_LINE_NUMBERS()
private ["_units","_unit"];

_units = _this select 0;

_unit = _units select 0;

if (_unit == Petros) exitWith {["Control Unit", "You cannot control Petros"] call A3A_fnc_customHint;};
//if (captive player) exitWith {hint "You cannot control AI while on Undercover"};
if (player != leader group player) exitWith {["Control Unit", "You cannot control AI if you are not the squad leader"] call A3A_fnc_customHint;};
if (isPlayer _unit) exitWith {["Control Unit", "You cannot control another player"] call A3A_fnc_customHint;};
if (!(alive _unit) or (_unit getVariable ["incapacitated",false]))  exitWith {["Control Unit", "You cannot control an unconscious, a dead unit"] call A3A_fnc_customHint;};
if (side _unit != teamPlayer) exitWith {["Control Unit", format ["You cannot control a unit which does not belong to %1",FactionGet(reb,"name")]] call A3A_fnc_customHint;};
if (!isNil "A3A_FFPun_Jailed" && {(getPlayerUID player) in A3A_FFPun_Jailed}) exitWith {["Control Unit", "Nope. Not happening."] call A3A_fnc_customHint;};

_owner = player getVariable ["owner",player];
if (_owner!=player) exitWith {["Control Unit", "You cannot control AI while you are controlling another AI"] call A3A_fnc_customHint;};

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
	["Control Unit", "Returned to original Unit as it received damage"] call A3A_fnc_customHint;
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
	["Control Unit", "Returned to original Unit as controlled AI received damage"] call A3A_fnc_customHint;
	nil;
	}];
selectPlayer _unit;

_timeX = 60;

_unit addAction ["Return Control to AI",{selectPlayer leader (group (_this select 0))}];

waitUntil {sleep 1; ["Control Unit", format ["Time to return control to AI: %1", _timeX]] call A3A_fnc_customHint; _timeX = _timeX - 1; (_timeX == -1) or (isPlayer (leader group player))};

removeAllActions _unit;
selectPlayer (_unit getVariable ["owner",_unit]);
//_unit setVariable ["owner",nil,true];
(units group player) joinsilent group player;
group player selectLeader player;
_unit removeEventHandler ["HandleDamage",_eh2];
player removeEventHandler ["HandleDamage",_eh1];
["Control Unit", ""] call A3A_fnc_customHint;
