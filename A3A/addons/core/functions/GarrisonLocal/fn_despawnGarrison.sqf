#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

private _garrison = A3A_activeGarrison get _marker;
A3A_activeGarrison deleteAt _marker;

// Timing arguable...
["locationSpawned", [_marker, "RebelOutpost", false]] call EFUNC(Events,triggerEvent);

{ if (alive _x) then { deleteVehicle _x }; } forEach (_garrison get "troops");
{ deleteGroup _x } forEach (_garrison get "groups");

{ deleteVehicle _x } forEach (_garrison get "civs");
{ deleteGroup _x } forEach (_garrison get "civGroups");

{ deleteVehicle _x } forEach (_garrison get "statics");
{ deleteVehicle _x } forEach (_garrison get "vehicles");
{ deleteVehicle _x } forEach (_garrison get "buildings");
