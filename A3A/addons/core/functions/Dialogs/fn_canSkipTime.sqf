if (player!= theBoss) exitWith {localize "STR_A3A_fn_dialogs_skiptime_no_commander"};

private _rebelSpawners = units teamPlayer select { _x getVariable ["spawner",false] };
private _presente = (-1 != (_rebelSpawners findIf { [getPosATL _x] call A3A_fnc_enemyNearCheck }));
if (_presente) exitWith {localize "STR_A3A_fn_dialogs_skiptime_no_enemy1"};
if ("rebelAttack" in A3A_activeTasks) exitWith {localize "STR_A3A_fn_dialogs_skiptime_no_enemy2"};
if ("invaderPunish" in A3A_activeTasks) exitWith {localize "STR_A3A_fn_dialogs_skiptime_no_civatt"};
if ("DEF_HQ" in A3A_activeTasks) exitWith {localize "STR_A3A_fn_dialogs_skiptime_no_hqatt"};

private _absentPlayers = [];
private _posHQ = getMarkerPos respawnTeamPlayer;
{
if ((_x distance _posHQ > 100) and (side _x in [teamPlayer,civilian])) then {_absentPlayers pushBackUnique name _x;};
} forEach (allPlayers - (entities "HeadlessClient_F"));

switch (true) do {
	case (count _absentPlayers == 0): 
	{
		""; // preferred case
	};
	case (count _absentPlayers == 1): 
	{
		format [localize "STR_A3A_fn_dialogs_skiptime_no_radius_singleplayer",_absentPlayers#0];
	};
	case (count _absentPlayers > 10): 
	{
		localize "STR_A3A_fn_dialogs_skiptime_no_radius";
	};
	default 
	{
		private _lastPlayer = _absentPlayers deleteAt 0;
		private _absentString = _absentPlayers joinString ", ";
		format [localize "STR_A3A_fn_dialogs_skiptime_no_radius_players",_absentString,_lastPlayer];
	};
};