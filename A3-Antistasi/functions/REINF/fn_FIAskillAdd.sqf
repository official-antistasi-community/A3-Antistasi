#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _groupData = FactionGet(reb,"groups");
#define GROUP(VAR) (_groupData get VAR)
if (player != theBoss) exitWith {["Skill Add", "Only our Commander has access to this function"] call A3A_fnc_customHint;};

if (skillFIA > 20) exitWith {["Skill Add", "Your troops have the maximum training"] call A3A_fnc_customHint;};
if (skillFIA > (tierWar*2)) exitWith {["Skill Add", "You cannot upgrade training in the current War Level"] call A3A_fnc_customHint;};
_resourcesFIA = server getVariable "resourcesFIA";
_costs = 1000 + (1.5*(skillFIA *750));
if (_resourcesFIA < _costs) exitWith {["Skill Add", format ["You do not have enough money to afford additional training. %1 € needed",_costs]] call A3A_fnc_customHint;};

_resourcesFIA = _resourcesFIA - _costs;
skillFIA = skillFIA + 1;
["Skill Add", format ["%2 Skill Level has been Upgraded<br/>Current level is %1",skillFIA,FactionGet(reb,"name")]] call A3A_fnc_customHint;
publicVariable "skillFIA";
server setVariable ["resourcesFIA",_resourcesFIA,true];
[] spawn A3A_fnc_statistics;
{
_costs = server getVariable _x;
_costs = round (_costs + (_costs * (skillFIA/280)));
server setVariable [_x,_costs,true];
} forEach GROUP("soldiers");
