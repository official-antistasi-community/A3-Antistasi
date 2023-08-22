
// Server-side unscheduled function to remove active vehicles from garrison

// are these functions always used singularly? Any likely non-singular use?
// How do we identify real vehicles with garrison entries? Guesswork or what?

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_vehicle"];

private _marker = _vehicle getVariable "markerX";
if (isNil "_marker") exitWith { Error_1("Vehicle %1 not in a garrison", _vehicle) };

private _garrison = A3A_garrison get _marker;

private _arrayType = call {
    if (_vehicle isKindOf "StaticWeapon") exitWith {"statics"};
    if (fullCrew [_vehicle, "", true] isNotEqualTo []) exitWith {"vehicles"};
    "buildings";
};

// Search for closest vehicle of correct type
private _index = -1;
private _minDist = 1e6;
{
    if (typeof _vehicle != _x#0) then { continue };     // wrong vehicle type
    private _dist = _vehicle distance2d _x#1#0;
    if (_dist < _minDist) then { _index = _forEachIndex; _minDist = _dist };
} forEach (_garrison get _arrayType);

if (_index < 0) exitWith { Error_2("Vehicle type %1 not found in garrison %2", typeof _vehicle, _marker) };

// Remove from server garrison data
(_garrison get _arrayType) deleteAt _index;
_vehicle setVariable ["markerX", nil, true];

// Remove from active garrison if spawned
private _machineID = A3A_garrisonMachine get _marker;
if (!isNil {_machineID}) then {
    ["remVehicle", [_marker, _vehicle]] remoteExecCall ["A3A_fnc_garrisonOp", _machineID];
};
