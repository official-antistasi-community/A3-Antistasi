#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _hqPos = markerPos "Synd_HQ";
private _nearCities = citiesX inAreaArrayIndexes [_hqPos, distanceMission, distanceMission] apply { citiesX#_x };

private _weightedMarkers = [];
{
    private _supportReb = (A3A_cityData getVariable _x) select 1;
    if (_supportReb < 80) then {
        private _dist = markerPos _x distance2d _hqPos;
        private _weight = (100 - _supportReb) * ((distanceMission - _dist) ^ 2);
        _weightedMarkers append [_x, _weight];
    };
} forEach (_nearCities - destroyedSites);

if (_weightedMarkers isEqualTo []) exitWith {false};        // no suitable cities
[1, [selectRandomWeighted _weightedMarkers]];                    // just returns city marker
