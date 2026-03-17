#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _nearCities = citiesX inAreaArray ["Synd_HQ", distanceMission, distanceMission];

private _validCities = _nearCities select { spawner getVariable _x != 0 } select { sidesX getVariable _x != teamPlayer };
if (_validCities isEqualTo [] and count _nearCities >= 4) then {
	// Fallback, allow unspawned rebel cities with no garrison
	_validCities = _nearCities select { spawner getVariable _x != 0 } select { A3A_garrison get _x get "troops" isEqualTo [] };
};
if (_validCities isEqualTo []) exitWith {false};

private _weight = tierWar / 5;
[_weight, [selectRandom _validCities]];
