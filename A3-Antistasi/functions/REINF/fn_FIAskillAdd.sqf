if (player != theBoss) exitWith {[localize "STR_antistasi_customHint_skill", localize "STR_antistasi_customHint_only_comander"] call A3A_fnc_customHint;};

if (skillFIA > 20) exitWith {[localize "STR_antistasi_customHint_skill", localize "STR_antistasi_customHint_skill_max"] call A3A_fnc_customHint;};
if (skillFIA > (tierWar*2)) exitWith {[localize "STR_antistasi_customHint_skill", localize "STR_antistasi_customHint_skill_warlevel"] call A3A_fnc_customHint;};
_resourcesFIA = server getVariable "resourcesFIA";
_costs = 1000 + (1.5*(skillFIA *750));
if (_resourcesFIA < _costs) exitWith {[localize "STR_antistasi_customHint_skill", format [localize "STR_antistasi_customHint_skill_noMoney",_costs]] call A3A_fnc_customHint;};

_resourcesFIA = _resourcesFIA - _costs;
skillFIA = skillFIA + 1;
[localize "STR_antistasi_customHint_skill", format [localize "STR_antistasi_customHint_skill_upgrade",skillFIA,nameTeamPlayer]] call A3A_fnc_customHint;
publicVariable "skillFIA";
server setVariable ["resourcesFIA",_resourcesFIA,true];
[] spawn A3A_fnc_statistics;
{
_costs = server getVariable _x;
_costs = round (_costs + (_costs * (skillFIA/280)));
server setVariable [_x,_costs,true];
} forEach soldiersSDK;
