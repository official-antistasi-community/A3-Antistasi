// Repairs a destroyed building.
// Currently only used by building placer, which reads the building from the ruin anyway, so it's trivial

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_building"];

/*if !(_target isKindOf "Ruins") exitWith {
 	// This can't work reliably because you can't store vars on a streamed object
	Error_1("Attempted to repair building %1 by passing the original building", _target);
	false;
};

// Should be registered from buildingChanged EH, if it's a repairable object
private _building = _target getVariable ["building", objNull];

//Haven't located the matching building - abort!
if (isNull _building) exitWith {
	Error_1("Couldn't find original building at %1", getPosATL _target);
	false;
};
*/

_building setDamage 0;
//deleteVehicle _target;
A3A_destroyedBuildings = A3A_destroyedBuildings - [_building];		// should probably check if it's in here...
true;
