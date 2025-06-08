#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehicle"];

// Assume that setOwner has already been called by whatever called this function?

private _garrison = A3A_activeGarrison get _marker;
private _arrayType = call {
    if (_vehicle isKindOf "StaticWeapon") exitWith {"statics"};
    if (fullCrew [_vehicle, "", true] isNotEqualTo []) exitWith {"vehicles"};
    if (typeof _vehicle in A3A_utilityItemHM) exitWith {"vehicles"};
    "buildings";
};
(_garrison get _arrayType) pushBack _vehicle;

if (_arrayType == "statics") then { [_marker] call A3A_fnc_garrisonLocal_updateStatics };
