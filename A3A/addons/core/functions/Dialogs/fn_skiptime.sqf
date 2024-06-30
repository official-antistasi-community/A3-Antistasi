//TODO: add header

private _titleStr = localize "STR_A3A_fn_dialogs_skiptime_title";

if (player!= theBoss) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_commander"] call A3A_fnc_customHint;};

private _rebelSpawners = units teamPlayer select { _x getVariable ["spawner",false] };
private _presente = (-1 != (_rebelSpawners findIf { [getPosATL _x] call A3A_fnc_enemyNearCheck }));
if (_presente) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_enemy1"] call A3A_fnc_customHint;};
if ("rebelAttack" in A3A_activeTasks) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_enemy2"] call A3A_fnc_customHint;};
if ("invaderPunish" in A3A_activeTasks) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_civatt"] call A3A_fnc_customHint;};
if ("DEF_HQ" in A3A_activeTasks) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_hqatt"] call A3A_fnc_customHint;};

private _absentPlayers = [];
private _posHQ = getMarkerPos respawnTeamPlayer;
{
if ((_x distance _posHQ > 100) and (side _x in [teamPlayer,civilian])) then {_absentPlayers pushBackUnique name _x;};
} forEach (allPlayers - (entities "HeadlessClient_F"));

switch (true) do {
	case (count _absentPlayers == 0): 
	{
		remoteExec ["A3A_fnc_resourcecheckSkipTime", 0];
	};
	case (count _absentPlayers == 1): 
	{
		[_titleStr, format [localize "STR_A3A_fn_dialogs_skiptime_no_radius_singleplayer",_absentPlayers#0]] call A3A_fnc_customHint;
	};
	case (count _absentPlayers > 10): 
	{
		[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_radius"] call A3A_fnc_customHint;
	};
	default 
	{
		private _lastPlayer = _absentPlayers deleteAt 0;
		private _absentString = _absentPlayers joinString ", ";
		[_titleStr, format [localize "STR_A3A_fn_dialogs_skiptime_no_radius_players",_absentString,_lastPlayer]] call A3A_fnc_customHint;
	};
};