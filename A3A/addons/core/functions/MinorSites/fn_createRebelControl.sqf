
// Server-side unscheduled function to create a new rebel outpost with a specified garrison
// Currently uses old/simple behaviour of despawning the units on creation

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_pos", "_troopTypes", "_vehTypes"];

// Create underlying shape marker
_marker = createMarkerLocal [format ["RebPost%1", mapGridPosition _positionTel], _positionTel];
if (_marker == "") exitWith { Error_1("Already a rebel post at %1", _positionTel) };            // should be impossible
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [30,30];
_marker setMarkerAlpha 0;

// Visible marker
private _strTable = ["STR_A3A_fn_base_croutpFIA_watchpost", "STR_A3A_fn_base_croutpFIA_roadblock"] select (isOnRoad _pos);
_iconMarker = createMarkerLocal [format ["Dum%1", _marker], markerPos _marker];
_iconMarker setMarkerShapeLocal "ICON";
_iconMarker setMarkerTypeLocal "loc_bunker";
_iconMarker setMarkerColorLocal colorTeamPlayer;
_iconMarker setMarkerText format [localize _strTable, FactionGet(reb,"name")];;

private _garrison = createHashMapFromArray [ ["troops", _troopTypes], ["statics", []], ["vehicles", [_vehTypes]], ["buildings", []] ];
A3A_garrison set [_marker, _garrison];

sidesX setVariable [_marker, teamPlayer, true];
spawner setVariable [_marker, 2, true];         // start despawned
outpostsFIA = outpostsFIA + [_marker];

// Load-from-save usage, troops are later. Don't spam publicVariable.
if (_troopTypes isNotEqualTo []) then { publicVariable "outpostsFIA" };

// meh
//[-5, 5, markerPos _marker] remoteExec ["A3A_fnc_citySupportChange", 2];

["RebelControlCreated", [_marker, isOnRoad markerPos _marker]] call EFUNC(Events,triggerEvent);
