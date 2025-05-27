// Used from UI action to clear all troops from spawned rebel garrisons
// Assume not used while under attack

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_unitType"];

private _garrison = A3A_activeGarrison get _marker;

{ if (alive _x) then { deleteVehicle _x }; } forEach (_garrison get "troops");
{ deleteGroup _x } forEach (_garrison get "groups");

_garrison set ["troops", []];
