// Server-side function to add currently-existing vehicles to garrison data
// Will remove from any current garrison
// Autodetects new garrison if _marker is empty string 
// Only used for rebel vehicles atm, so don't need pool change?

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehicle"];

Trace_1("Called with params %1", _this);

private _oldMarker = _vehicle getVariable "markerX";
if (!isNil "_oldMarker") then { [_vehicle] call A3A_fnc_garrisonServer_remVehicle };

if (_marker == "") then { _marker = [getPosATL _vehicle] call A3A_fnc_getMarkerForPos };
if (_marker == "") exitWith {};

// Should work now, cleaned up on despawn if you leave junk in enemy garrisons
/*if (sidesX getVariable _marker != teamPlayer) exitWith {
    // Is this actually an error? Could be cleaned up later...
    Error("Attempted to add vehicle to non-rebel garrison");
};*/

private _garrison = A3A_garrison get _marker;
private _arrayType = call {
    if (fullCrew [_vehicle, "", true] isNotEqualTo []) exitWith {"vehicles"};
    if (typeof _vehicle in A3A_utilityItemHM) exitWith {"vehicles"};
    "buildings";
};

if (_arrayType == "buildings" and _marker == "Synd_HQ") then {
    _garrison get "spawnedBuildings" pushBack _vehicle;
};

(_garrison get _arrayType) pushBack [typeOf _vehicle, getPosWorld _vehicle, vectorDir _vehicle, vectorUp _vehicle];
_vehicle setVariable ["markerX", _marker, true];
if !(_vehicle isKindOf "StaticWeapon") then { _vehicle setVariable ["lockedForAI", true, true] };


// Add to active garrison if spawned
if (_marker in A3A_garrisonMachine) then {
    _vehicle setOwner (A3A_garrisonMachine get _marker);           // TODO: potential driver issues?
    ["addVehicle", [_marker, _vehicle]] call A3A_fnc_garrisonOp;
} else {
    deleteVehicle _vehicle;
};
