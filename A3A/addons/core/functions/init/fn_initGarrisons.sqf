
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("InitGarrisons started");

// This function is now only called for a new game

private _emptyGarrison = createHashMapFromArray [ ["troops", []], ["statics", []], ["vehicles", []], ["buildings", []] ];
A3A_garrison set ["Synd_HQ", +_emptyGarrison];


private _updateMarkers = outposts + airportsX;			// To sort out the faction names & flags
if (gameMode >= 3) then
{
    // Set everything to government control if we have no invaders
    {
        if (sidesX getVariable _x == Occupants) then { continue };
        sidesX setVariable [_x, Occupants, true];
        _updateMarkers pushBackUnique _x;
    } forEach (markersX - ["Synd_HQ"]);
};
{ _x call A3A_fnc_mrkUpdate } forEach _updateMarkers;


private _fnc_initGarrison =
{
    params ["_marker", "_occQuality", "_invQuality"];
    private _side = sidesX getVariable _marker;
    private _faction = Faction(_side);
    private _quality = [_occQuality, _invQuality] select (_side == invaders);
    private _isAirport = _marker in airportsX;

    private _garrison = +_emptyGarrison;
    private _troopCount = [_marker] call A3A_fnc_garrisonSize;
    _garrison set ["troops", [_troopCount, _quality]];

    private _statics = [];
    private _vehicles = [];
    {
        private _placeType = _x;
        private _slotType = [_vehicles, _statics] select ("static" in _x);
        _y params ["_indexes", "_max", "_par"];

        private _remIndexes = +_indexes;
        for "_i" from 0 to (_par-1) do {
            private _vehType = [_faction, _placeType] call A3A_fnc_selectGarrisonVehicleType;
            if (isNil "_vehType") exitWith {};      // faction doesn't have vehicles of that type
            if (_placeType == "vehicle") then { _slotType pushBack [_vehType, _i]; continue };
            private _placeIndex = _remIndexes deleteAt floor random (count _remIndexes - 0.001);
            _slotType pushBack [_vehType, _placeIndex];
        };

    } forEach (A3A_spawnPlaceStats get _marker);

    _garrison set ["statics", _statics];
    _garrison set ["vehicles", _vehicles];

    A3A_garrison set [_marker, _garrison];
};


{ [_x, 1.5 + random 0.5, 2] call _fnc_initGarrison } forEach airportsX + outposts;

{ [_x, 1 + random 0.5, 2] call _fnc_initGarrison } forEach resourcesX + factories + seaports;

{ [_x, 0 + random 0.5, 3] call _fnc_initGarrison } forEach citiesX;


// ok, need some special init function for roadblocks/watchposts?
// could just pregen them for the moment?

// but are roadblocks regenerated for each startup?

    // maybe we have special init function for roadblocks/watchposts anyway, as they're semi-dynamic?



{
    if (!isOnRoad markerPos _x) then { [_x, 3, 3] call _fnc_initGarrison; continue };
    [_x, 1 + random 0.5, 2] call _fnc_initGarrison;
} forEach controlsX;

Info("InitGarrisons completed");


// add some shit to build outpost truck weighted arrays:
