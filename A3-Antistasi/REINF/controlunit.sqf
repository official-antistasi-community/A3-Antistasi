private ["_units","_unit"];

_units = _this select 0;

_unit = _units select 0;

if (_unit == Petros) exitWith {[localize "STR_antistasi_customHint_control", localize "STR_antistasi_customHint_control_petros"] call A3A_fnc_customHint;};
//if (captive player) exitWith {hint "You cannot control AI while on Undercover"};
if (player != leader group player) exitWith {[localize "STR_antistasi_customHint_control", localize "STR_antistasi_customHint_only_leader"] call A3A_fnc_customHint;};
if (isPlayer _unit) exitWith {[localize "STR_antistasi_customHint_control", localize "STR_antistasi_customHint_control_player"] call A3A_fnc_customHint;};
if (!(alive _unit) or (_unit getVariable ["incapacitated",false]))  exitWith {[localize "STR_antistasi_customHint_control", localize "STR_antistasi_customHint_control_dead"] call A3A_fnc_customHint;};
if (side _unit != teamPlayer) exitWith {[localize "STR_antistasi_customHint_control", format [localize "STR_antistasi_customHint_control_noBelong",nameTeamPlayer]] call A3A_fnc_customHint;};
if (!isNil "A3A_FFPun_Jailed" && {(getPlayerUID player) in A3A_FFPun_Jailed}) exitWith {[localize "STR_antistasi_customHint_control", localize "STR_antistasi_customHint_fast_trevel_nope"] call A3A_fnc_customHint;};

_owner = player getVariable ["owner",player];
if (_owner!=player) exitWith {[localize "STR_antistasi_customHint_control", localize "STR_antistasi_customHint_control_already"] call A3A_fnc_customHint;};

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
	[localize "STR_antistasi_customHint_control", localize "STR_antistasi_customHint_controlSquad_damage"] call A3A_fnc_customHint;
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
	[localize "STR_antistasi_customHint_control", localize "STR_antistasi_customHint_controlSquad_damageAI"] call A3A_fnc_customHint;
	nil;
	}];
selectPlayer _unit;

_timeX = 60;

_unit addAction [localize "STR_antistasi_addAction_returnControl",{selectPlayer leader (group (_this select 0))}];

waitUntil {sleep 1; [localize "STR_antistasi_customHint_control", format [localize"STR_antistasi_customHint_controlSquad_time", _timeX]] call A3A_fnc_customHint; _timeX = _timeX - 1; (_timeX == -1) or (isPlayer (leader group player))};

removeAllActions _unit;
selectPlayer (_unit getVariable ["owner",_unit]);
//_unit setVariable ["owner",nil,true];
(units group player) joinsilent group player;
group player selectLeader player;
_unit removeEventHandler ["HandleDamage",_eh2];
player removeEventHandler ["HandleDamage",_eh1];
[localize "STR_antistasi_customHint_control", ""] call A3A_fnc_customHint;

