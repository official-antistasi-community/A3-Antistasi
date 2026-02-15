#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _nearCities = citiesX inAreaArrayIndexes ["Synd_HQ", distanceMission+500, distanceMission+500] apply { citiesX # _x };
if (_nearCities isEqualTo []) exitWith {false};

private _banks = banks inAreaArray ["Synd_HQ", distanceMission, distanceMission];
_banks = _banks select {
    private _bank = _x;
    private _distances = _nearCities apply { markerPos _x distance2d _bank };
    private _nearest = _nearCities select (_distances find selectMin _distances);
    sidesX getVariable _nearest != teamPlayer;          // only want banks in enemy cities
};
if (_banks isEqualTo []) exitWith {false};

[1, [selectRandom _banks]];
