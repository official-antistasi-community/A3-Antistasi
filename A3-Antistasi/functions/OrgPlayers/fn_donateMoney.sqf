private ["_resourcesPlayer","_pointsXJ","_target"];
_resourcesPlayer = player getVariable "moneyX";
if (_resourcesPlayer < 100) exitWith {[localize "STR_antistasi_customHint_donate", format [localize "STR_antistasi_customHint_donate_no_money",100]] call A3A_fnc_customHint;};

if (count _this == 0) exitWith
	{
	[0,100] remoteExec ["A3A_fnc_resourcesFIA",2];
	_pointsXJ = (player getVariable "score") + 1;
	player setVariable ["score",_pointsXJ,true];
	[-100] call A3A_fnc_resourcesPlayer;
	[localize "STR_antistasi_customHint_donate", localize "STR_antistasi_customHint_donated"] call A3A_fnc_customHint;
	};
_target = cursortarget;

if (!isPlayer _target) exitWith {[localize "STR_antistasi_customHint_donate", localize "STR_antistasi_customHint_donate_noLook"] call A3A_fnc_customHint;};

[-100] call A3A_fnc_resourcesPlayer;
[100] remoteExec ["A3A_fnc_resourcesPlayer", _target];
[localize "STR_antistasi_customHint_donate", format [localize "STR_antistasi_customHint_donated_player", name _target]] call A3A_fnc_customHint;
