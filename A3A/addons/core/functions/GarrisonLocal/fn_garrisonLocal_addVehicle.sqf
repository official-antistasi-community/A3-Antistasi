#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehicle"];

// Assume that setOwner has already been called by whatever called this function?

private _garrison = A3A_activeGarrison get _marker;
private _arrayType = call {
    if (_vehicle isKindOf "StaticWeapon") exitWith {"statics"};
    if (fullCrew [_vehicle, "", true] isNotEqualTo []) exitWith {"vehicles"};
    "buildings";
};
(_garrison get _arrayType) pushBack _vehicle;

// Install local disassembled handler if locality changed by moving
if (_arrayType == "statics" and !(_vehicle getVariable ["A3A_disassembledEH", false])) then {
    _vehicle addEventHandler ["Disassembled", A3A_fnc_disassembledEH];
    _vehicle setVariable ["A3A_disassembledEH", true];
};
