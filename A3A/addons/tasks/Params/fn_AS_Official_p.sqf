#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _airports = airportsX inAreaArrayIndexes ["Synd_HQ", distanceMission, distanceMission] apply { airportsX#_x }
    select { sidesX getVariable _x != teamPlayer } select { spawner getVariable _x != 0 };

if (_airports isEqualTo []) exitWith {false};
[1, [selectRandom _airports]];
