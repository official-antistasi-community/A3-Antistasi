#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _outposts = outposts inAreaArrayIndexes ["Synd_HQ", distanceMission, distanceMission] apply { outposts#_x }
    select { sidesX getVariable _x != teamPlayer } select { spawner getVariable _x != 0 };

if (_outposts isEqualTo []) exitWith {false};
[1, [selectRandom _outposts]];
