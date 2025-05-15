// Server-side function to add currently-existing vehicles to garrison data
// Will remove from any current garrison
// Autodetects new garrison if _marker is empty string 

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehicle"];

Trace_1("Called with params %1", _this);

private _oldMarker = _vehicle getVariable "markerX";
if (!isNil "_oldMarker") then { [_vehicle] call A3A_fnc_remVehicleFromGarrison };

if (_marker == "") then { _marker = [getPosATL _vehicle] call A3A_fnc_getMarkerForPos };
if (_marker == "") exitWith {};

if (sidesX getVariable _marker != teamPlayer) exitWith {
    // Is this actually an error? Could be cleaned up later...
    Error("Attempted to add vehicle to non-rebel garrison");
};

private _garrison = A3A_garrison get _marker;
private _arrayType = call {
    if (_vehicle isKindOf "StaticWeapon") exitWith {"statics"};
    if (fullCrew [_vehicle, "", true] isNotEqualTo []) exitWith {"vehicles"};
    "buildings";
};

(_garrison get _arrayType) pushBack [typeOf _vehicle, getPosWorld _vehicle, vectorUp _vehicle, vectorDir _vehicle];
_vehicle setVariable ["markerX", _marker, true];

// Add to active garrison if spawned
private _machineID = A3A_garrisonMachine get _marker;
if (!isNil "_machineID") then {
    _vehicle setOwner _machineID;           // TODO: potential driver issues?
    ["addVehicle", [_marker, _vehicle]] call A3A_fnc_garrisonOp;
} else {
    deleteVehicle _vehicle;     // TODO: might be problematic until enemy garrisons are supported
};

Trace("Completed");
