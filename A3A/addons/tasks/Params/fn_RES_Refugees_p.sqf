#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

// Valid in destroyed cities...
private _cities = citiesX inAreaArrayIndexes ["Synd_HQ", distanceMission, distanceMission] apply { citiesX#_x }
    select { sidesX getVariable _x != teamPlayer } select { spawner getVariable _x != 0 };

if (_cities isEqualTo []) exitWith {false};
[1, [selectRandom _cities]];
