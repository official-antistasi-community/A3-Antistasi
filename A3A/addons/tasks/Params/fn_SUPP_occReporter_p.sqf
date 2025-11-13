#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

_nearHostileCities = [citiesX] call FUNC(nearHostileMarkers);
_nearHostileCities = _nearHostileCities select {spawner getVariable _x != 0};
if (_nearHostileCities isEqualTo []) exitWith { false };
selectRandom _nearHostileCities;