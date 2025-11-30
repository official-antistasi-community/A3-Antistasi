#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

// Find an enemy in the city
private _enemies = units Occupants inAreaArray [markerPos _marker, 200, 200];
_enemies = _enemies select { _x getVariable ["markerX", ""] == _marker };
_enemies = _enemies select { _x call A3A_fnc_canFight };

if (_enemies isEqualTo []) exitWith {
    Debug_1("Failed to find suitable enemy in %1", _marker);
    false;
};

[_marker, selectRandom _enemies];
