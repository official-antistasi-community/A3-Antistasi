
// Server-side unscheduled function to create a new rebel outpost with a specified garrison
// Currently uses old/simple behaviour of despawning the units on creation

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_pos", "_troopTypes", "_vehTypes"];

// Adjust position to road if there is one
if (isOnRoad _pos) then { _pos = getPosATL roadAt _pos };

// Create underlying shape marker
_marker = createMarkerLocal [format ["RebPost%1", mapGridPosition _pos], _pos];
if (_marker == "") exitWith { Error_1("Already a rebel post at %1", _pos) };            // should be impossible
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [30,30];
_marker setMarkerAlpha 0;

// Visible marker (text & broadcast needs to be set after outpostsFIA)
_iconMarker = createMarkerLocal [format ["Dum%1", _marker], _pos];
_iconMarker setMarkerShapeLocal "ICON";
_iconMarker setMarkerTypeLocal "loc_bunker";
_iconMarker setMarkerColorLocal colorTeamPlayer;

private _garrison = createHashMapFromArray [ ["troops", _troopTypes], ["vehicles", []], ["buildings", []], ["type", "rebpost"] ];

// Add the MG vehicle. Use spawn place so we don't need to worry about precision
if (isOnRoad _pos) then {
    private _road = roadAt _pos;
    private _roadDir = (getRoadInfo _road # 6) getDir (getRoadInfo _road # 7);

    private _spawnPlaces = [["vehicleRB", _pos, _roadDir+90]];
    _garrison set ["spawnPlaces", _spawnPlaces];
    A3A_spawnPlacesHM set [_marker, _spawnPlaces];

    private _vehClass = FactionGet(reb,"vehiclesLightArmed") # 0;
    _garrison set ["vehicles", [[_vehClass, 0]]];
};
A3A_garrison set [_marker, _garrison];

sidesX setVariable [_marker, teamPlayer, true];
spawner setVariable [_marker, 2, true];         // start despawned
outpostsFIA = outpostsFIA + [_marker];

if (_troopTypes isNotEqualTo []) then {
    // If used from a save then outpostsFIA and markers are updated later (after adding garrison)
    // If it's live then set the text & broadcast immediately, needs outpostsFIA & side
    publicVariable "outpostsFIA";
    [_marker] call A3A_fnc_mrkUpdate;
};

["RebelControlCreated", [_marker, isOnRoad _pos]] call EFUNC(Events,triggerEvent);

_marker;        // loadstat needs this as a return value
