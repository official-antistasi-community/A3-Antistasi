// Used from UI action to clear all troops from spawned rebel garrisons
// Assume not used while under attack

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

private _garrison = A3A_activeGarrison get _marker;

// Should probably get them out of vehicles/statics first?

{ if (alive _x) then { deleteVehicle _x }; } forEach (_garrison get "troops");
{ deleteGroup _x } forEach (_garrison get "groups");

_garrison set ["troops", []];
_garrison set ["groups", []];
