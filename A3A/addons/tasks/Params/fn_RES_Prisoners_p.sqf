#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _potentials = outposts + airportsX;
private _valid = _potentials inAreaArrayIndexes ["Synd_HQ", distanceMission, distanceMission] apply { _potentials#_x }
    select { sidesX getVariable _x != teamPlayer } select { spawner getVariable _x != 0 };

if (_valid isEqualTo []) exitWith {false};
[1, [selectRandom _valid]];
