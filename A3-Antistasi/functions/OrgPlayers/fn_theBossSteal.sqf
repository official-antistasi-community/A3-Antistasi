#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
_resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < 100) exitWith {["Money Grab", "FIA has not enough resources to grab"] call A3A_fnc_customHint;};
server setvariable ["resourcesFIA",_resourcesFIA - 100, true];
[-2,theBoss] call A3A_fnc_playerScoreAdd;
[100] call A3A_fnc_resourcesPlayer;

["Money Grab", format ["You grabbed 100 € from the %1 Money Pool.<br/><br/>This will affect your prestige and status among %1 forces",FactionGet(reb,"name")]] call A3A_fnc_customHint;
