#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _airports = airportsX inAreaArrayIndexes ["Synd_HQ", distanceMission, distanceMission] apply { airportsX#_x }
    select { sidesX getVariable _x != teamPlayer };

private _airport = "";
private _foundPos = false;
while {_airports isNotEqualTo []} do
{
    // Pre-check whether this mission is actually possible for the faction
    _airport = _airports deleteAt floor random count _airports;
    private _faction = [A3A_faction_occ, A3A_faction_inv] select (sidesX getVariable _airport == Invaders);
    if (_faction get "vehiclesHelisTransport" isEqualTo []) then { continue };

    private _originPos = markerPos _airport;
    private _worldMax = worldSize-1000;
    private _ang = random 360;
    private _dist = 3000;               //if (_difficult) then {2000} else {3000};
    private _testPos = [];
    while {_dist > 1000} do {
        _testPos = _originPos getPos [_dist, _ang];
        private _inBounds = _testPos#0 > 1000 and _testPos#1 > 1000 and _testPos#0 < _worldMax and _testPos#1 < _worldMax;
        private _distToHQ = _testPos distance2d markerPos "Synd_HQ";
        if (!surfaceIsWater _testPos and _distToHQ < distanceMission and _distToHQ > 1500 and _inBounds) exitWith {};
        _ang = (_ang + 5) % 360;
        _dist = _dist - 7;              // about four circuits in a descending spiral 
    };
    if (_dist > 1000) exitWith { _foundPos = _testPos };
} forEach _airports;

if (_foundPos isEqualType false) exitWith {false};

[1, [_airport, _foundPos]];
