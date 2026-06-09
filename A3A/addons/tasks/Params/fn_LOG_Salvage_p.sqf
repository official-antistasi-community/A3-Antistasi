#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

// Allow spawned for some reason? hmm
private _seaports = seaports inAreaArrayIndexes ["Synd_HQ", distanceMission, distanceMission] apply { seaports # _x }
	select { sidesX getVariable _x != teamPlayer };

if (_seaports isEqualTo []) exitWith {false};
[1, [selectRandom _seaports]];
