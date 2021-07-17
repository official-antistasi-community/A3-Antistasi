if (player!= theBoss) exitWith {[localize "STR_a3_cfgvehicles_moduleskiptime_f_0", localize "STR_antistasi_customHint_only_comander"] call A3A_fnc_customHint;};
_presente = false;

{
if ((side _x == Occupants) or (side _x == Invaders)) then
	{
	if ([500,1,_x,teamPlayer] call A3A_fnc_distanceUnits) then {_presente = true};
	};
} forEach allUnits;
if (_presente) exitWith {[localize "STR_a3_cfgvehicles_moduleskiptime_f_0", localize "STR_antistasi_customHint_skipTime_enemy"] call A3A_fnc_customHint;};
if ("rebelAttack" in A3A_activeTasks) exitWith {[localize "STR_a3_cfgvehicles_moduleskiptime_f_0", localize "STR_antistasi_customHint_skipTime_counterattack"] call A3A_fnc_customHint;};
if ("invaderPunish" in A3A_activeTasks) exitWith {[localize "STR_a3_cfgvehicles_moduleskiptime_f_0", localize "STR_antistasi_customHint_skipTime_attack"] call A3A_fnc_customHint;};
if ("DEF_HQ" in A3A_activeTasks) exitWith {[localize "STR_a3_cfgvehicles_moduleskiptime_f_0", localize "STR_antistasi_customHint_skipTime_attackHQ"] call A3A_fnc_customHint;};

_checkX = false;
_posHQ = getMarkerPos respawnTeamPlayer;
{
if ((_x distance _posHQ > 100) and (side _x == teamPlayer)) then {_checkX = true};
} forEach (allPlayers - (entities "HeadlessClient_F"));

if (_checkX) exitWith {[localize "STR_a3_cfgvehicles_moduleskiptime_f_0", format [localize "STR_antistasi_customHint_skipTime_radius",100]] call A3A_fnc_customHint;};

remoteExec ["A3A_fnc_resourcecheckSkipTime", 0];


