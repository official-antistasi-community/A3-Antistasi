#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _markers = (airportsX + resourcesX + factories + seaports + outposts - blackListDest);
_markers = _markers inAreaArrayIndexes ["Synd_HQ", distanceMission, distanceMission] apply { _markers#_x }
    select {sidesX getVariable _x != teamPlayer};

private _convoyPairs = [];
{
    private _base = [_x] call A3A_fnc_findBasesForConvoy;
    if (_base != "") then { _convoyPairs pushBack [_x, _base] };
} forEach _markers;

if (_convoyPairs isEqualTo []) exitWith {false};
[1, selectRandom _convoyPairs];
