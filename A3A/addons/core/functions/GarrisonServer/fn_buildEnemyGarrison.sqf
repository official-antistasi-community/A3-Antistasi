// Create initial troop & vehicle data for enemy garrison
// Used for both new campaigns and fixing up garrisons from older saves
// For an old save, _troopCount is provided

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()


params ["_marker"];

private _side = sidesX getVariable _marker;
private _faction = Faction(_side);
private _spawnPlaceStats = A3A_spawnPlaceStats get _marker;
if (isNil "_spawnPlaceStats") then {
    Error_1("Marker %1 not found in spawnPlaceStats", _marker);
};

private _isAirport = false;
private _qMod = random 0.5 + tierWar/20;
private _quality = call {
    if (_marker in citiesX) exitWith {if (_side == Invaders) then {3} else {0 + _qMod}};
    if (_side == Invaders) then {_qMod = _qMod + 0.4};
    if (_marker in airportsX) exitWith {_isAirport = true; (1.5 + _qMod) min 2};
    if (_marker in outposts) exitWith {(1.4 + _qMod) min 2};
    if (_marker in seaports) exitWith {(1.2 + _qMod) min 2};
    (1 + _qMod) min 2;
};

private _garrison = createHashMapFromArray [ ["buildings", []] ];
private _troopCount = (0.7 + random 0.3) * (A3A_garrisonSize get _marker);
_garrison set ["troops", [ceil _troopCount, _quality]];

// Note: spawnPlaceStats has detailed place names (eg staticAA, vehicleTruck), garrison puts everything into vehicles
private _vehicles = [];
{
    private _placeType = _x;
    _y params ["_indexes", "_max", "_par"];

    private _remIndexes = +_indexes;
    for "_i" from 1 to _par do {
        private _vehType = [_faction, _placeType, _isAirport] call A3A_fnc_selectGarrisonVehicleType;
        if (isNil "_vehType") exitWith {};      // faction doesn't have vehicles of that type

        // Use places in order for vehicles, otherwise randomly
        private _placeIndex = if (_placeType == "vehicle") then { _remIndexes deleteAt 0 }
            else { _remIndexes deleteAt floor random count _remIndexes };
        _vehicles pushBack [_vehType, _placeIndex];
    };
} forEach _spawnPlaceStats;

_garrison set ["vehicles", _vehicles];
A3A_garrison set [_marker, _garrison];

_garrison;
