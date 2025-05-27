
// Server-side unscheduled function to create a new rebel outpost with a specified garrison
// Currently uses old/simple behaviour of despawning the units on creation

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// kinda temporary?
params ["_marker", "_name", "_troopTypes", "_vehTypes"];

private _garrison = createHashMapFromArray [ ["troops", _troopTypes], ["statics", []], ["vehicles", [_vehTypes]], ["buildings", []] ];
A3A_garrison set [_marker, _garrison];

_marker setMarkerTypeLocal "loc_bunker";
_marker setMarkerColorLocal colorTeamPlayer;
_marker setMarkerText _name;

sidesX setVariable [_marker, teamPlayer, true];
spawner setVariable [_marker, 2, true];         // start despawned
outpostsFIA = outpostsFIA + [_marker]; publicVariable "outpostsFIA";

// meh
//[-5, 5, markerPos _marker] remoteExec ["A3A_fnc_citySupportChange", 2];

["RebelControlCreated", [_marker, isOnRoad markerPos _marker]] call EFUNC(Events,triggerEvent);
