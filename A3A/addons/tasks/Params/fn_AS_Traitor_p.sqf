#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _cities = citiesX inAreaArrayIndexes ["Synd_HQ", distanceMission, distanceMission] apply { citiesX#_x }
    select { sidesX getVariable _x != teamPlayer } select { spawner getVariable _x != 0 };

private _selPair = [];
while {_cities isNotEqualTo []} do {
    private _city = _cities deleteAt random count _cities;
    private _citySide = sidesX getVariable _city;
    private _airports = ([_city, false] call A3A_fnc_findLandSupportMarkers) select {_x#0 in airportsX} select {_citySide isEqualTo (sidesX getVariable (_x#0))};
    if (_airports isNotEqualTo []) exitWith {_selPair = [_city, (selectRandom _airports)#0]};
};  
if (_selPair isEqualTo []) exitWith {false};

[1, _selPair];
