/*
    Sends a customHint to all live players within radius

Parameters:

*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_title", "_bodyText", "_center", "_radius"];

private _nearPlayers = playableUnits inAreaArray [_center, _radius, _radius];
[_title, _bodyText] remoteExecCall ["A3A_fnc_customHint", _nearPlayers];
