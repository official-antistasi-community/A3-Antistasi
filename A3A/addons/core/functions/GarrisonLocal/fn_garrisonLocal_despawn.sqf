// Despawn any garrison
// Also used for removing rebel roadblocks/watchposts

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", ["_toDelete", false]];

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


// Minor sites (both enemy and rebel?) should be deleted when despawned, if cleared
// Two-stage though? Want to immediately announce destruction (from zoneCheck?)
// Move marker name to deadMinorSites on server?
// clean up cyclically in distance.sqf? No, marker might still need to exist. So trigger cleanup here

if (_toDelete) then { _marker remoteExecCall ["A3A_fnc_garrisonServer_delete", 2] };
