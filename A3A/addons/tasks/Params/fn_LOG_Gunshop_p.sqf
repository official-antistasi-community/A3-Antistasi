#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _nearCities = citiesX inAreaArrayIndexes ["Synd_HQ", distanceMission, distanceMission] apply { citiesX # _x }
	select { sidesX getVariable _x != teamPlayer } select { spawner getVariable _x != 0 };

if (_nearCities isEqualTo []) exitWith {false};

private _weight = tierWar / 5;
[_weight, [selectRandom _nearCities]];
