#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _cities = citiesX inAreaArrayIndexes ["Synd_HQ", distanceMission, distanceMission] apply { citiesX#_x }
    select { sidesX getVariable _x != teamPlayer } select { spawner getVariable _x != 0 };

private _selPair = [];
while {_cities isNotEqualTo []} do {
    private _city = _cities deleteAt floor random count _cities;
    private _citySide = sidesX getVariable _city;
    private _supportMarkers = ([_city, false] call A3A_fnc_findLandSupportMarkers) apply {_x#0}; 
    private _airports = _supportMarkers select {_x in airportsX} select {_citySide isEqualTo (sidesX getVariable _x)};
    if (_airports isEqualTo []) then {continue};

    // Mission needs a house with 3+ building positions for the traitor and a bodyguard
    private _radius = [_city] call A3A_fnc_sizeMarker;
    private _houses = nearestObjects [markerPos _city, ["house"], _radius] select {!((typeOf _x) in A3A_buildingBlacklist)};
    if (_houses findIf { count (_x buildingPos -1) >= 3 } == -1) then {continue};

    _selPair = [_city, selectRandom _airports];
    break;
};
if (_selPair isEqualTo []) exitWith {false};

[1, _selPair];
