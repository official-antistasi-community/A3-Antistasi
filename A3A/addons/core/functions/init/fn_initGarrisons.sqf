
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("InitGarrisons started");

// This function is now only called for a new game

private _emptyGarrison = createHashMapFromArray [ ["troops", []], ["vehicles", []], ["buildings", []] ];
A3A_garrison set ["Synd_HQ", _emptyGarrison];


private _updateMarkers = outposts + airportsX;			// To sort out the faction names & flags
if (gameMode >= 3) then
{
    // Set everything to government control if we have no invaders
    // Otherwise use the pre-init sides
    {
        if (sidesX getVariable _x == Occupants) then { continue };
        sidesX setVariable [_x, Occupants, true];
        _updateMarkers pushBackUnique _x;
    } forEach (markersX - ["Synd_HQ"]);
};
{ _x call A3A_fnc_mrkUpdate } forEach _updateMarkers;


// Quite a bit of duplicated effort here but it's probably not worth optimizing
{
    [_x] call A3A_fnc_buildEnemyGarrison;
} forEach (markersX - ["Synd_HQ"]);

// Initialize enemy roadblocks & specops sites
call A3A_fnc_initMinorSites;

// Add police stations in cities (done before buildCity because they share vehicle places)
call A3A_fnc_initPoliceStations;

// Add boats & vehicles for cities
{ [_x] call A3A_fnc_buildCity } forEach citiesX;

// Add type info to markers
call A3A_fnc_initMarkerTypes;


Info("InitGarrisons completed");
