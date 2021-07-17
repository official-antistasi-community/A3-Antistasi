_resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < 100) exitWith {[localize "STR_antistasi_customHint_money_grab", localize "STR_antistasi_customHint_grab_noMoney"] call A3A_fnc_customHint;};
server setvariable ["resourcesFIA",_resourcesFIA - 100, true];
[-2,theBoss] call A3A_fnc_playerScoreAdd;
[100] call A3A_fnc_resourcesPlayer;

[localize "STR_antistasi_customHint_money_grab", format [localize "STR_antistasi_customHint_grabed",nameTeamPlayer,100]] call A3A_fnc_customHint;
