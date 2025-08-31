// Input: City marker
// Output: Do we need weights for this? hmm, probably not

// Return false if unavailable, otherwise array of params to feed through to task function?

#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

// Doesn't make sense for the dude to be standing in the street. Put him in a building place instead

// Find building with places that's not too close to enemies or players
private _markerPos = markerPos _marker;
private _blockers = (units Occupants + units teamPlayer) inAreaArray [_markerPos, 250, 250];
private _place = false;
for "_i" from 1 to 10 do {
    private _rpos = _markerPos getPos [200 * sqrt random 1, random 360];
    private _house = nearestBuilding _rpos;
    if (_blockers inAreaArray [getPosATL _house, 20, 20] isNotEqualTo []) then { continue };
    private _placePos = selectRandom (_house buildingPos -1);
    if (!isNil "_placePos") exitWith { _place = [_placePos, _house getRelDir _placePos] };
};
if (_place isEqualType false) exitWith {
    Debug_1("Failed to find suitable place in %1", _marker);
    false;
};

// Other condition is that we need somewhere to take the guy?
// Allow cities within mission distance & within 3km of this city
private _nearCities = citiesX inAreaArrayIndexes [markerPos _marker, 3000, 3000] apply { citiesX # _x };
private _maxDist = distanceMission max (markerPos _marker distance2d markerPos "Synd_HQ");
_nearCities = _nearCities inAreaArrayIndexes [markerPos "Synd_HQ", _maxDist, _maxDist] apply { _nearCities # _x };
_nearCities = _nearCities select { markerPos _x distance2d (_place#0) > 1000 };      // min 1km

if (_nearCities isEqualTo []) exitWith {
    Debug_1("Found no suitable destinations near %1", _marker);
    false;
};

[_marker, _place#0, _place#1, selectRandom _nearCities];
