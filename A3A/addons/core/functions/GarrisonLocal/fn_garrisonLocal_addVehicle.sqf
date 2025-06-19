// Add already-existing vehicle to garrison. Usually rebel but might be used incidentally by enemy garrisons

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_vehicle"];

// Assume that setOwner has already been called by whatever called this function?

private _garrison = A3A_activeGarrison get _marker;
private _arrayType = call {
    if (fullCrew [_vehicle, "", true] isNotEqualTo []) exitWith {"vehicles"};
    if (typeof _vehicle in A3A_utilityItemHM) exitWith {"vehicles"};
    "buildings";
};
(_garrison get _arrayType) pushBack _vehicle;

// non-statics should be locked on adding. Statics might be locked if moved inside marker
if (_vehicle isKindOf "Land" and _vehicle emptyPositions "gunner" > 0) then {
    _vehicle setVariable ["A3A_rebCrewed", true];
    if !(_vehicle getVariable ["lockedForAI", false]) then { [_marker] call A3A_fnc_garrisonLocal_updateStatics };
};
