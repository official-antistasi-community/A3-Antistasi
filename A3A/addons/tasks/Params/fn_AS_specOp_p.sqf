#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _camps = controlsX inAreaArrayIndexes ["Synd_HQ", distanceMission, distanceMission] apply { controlsX#_x }
    select {!isOnRoad markerPos _x} select { sidesX getVariable _x != teamPlayer };

if (_camps isEqualTo []) exitWith {false};
[1, [selectRandom _camps]];
