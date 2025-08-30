// Input: City marker
// Output: Do we need weights for this? hmm, probably not

// Return false if unavailable, otherwise array of params to feed through to task function?

#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

// Doesn't make sense for the dude to be standing in the street. Put him in a building place instead

private _buildingPlaces = [_marker, 200, 1] call A3A_fnc_patrolGetBuildingPlaces;
private _place = if (_buildingPlaces isEqualTo []) then { [markerPos _marker, 0] } else { _buildingPlaces # 0 };

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
