/*
    Create initial troop & vehicle data for enemy garrison
    Used for both new campaigns and fixing up garrisons from older saves

    Environment: Server

    Arguments:
    <STRING> Marker name of major enemy site.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", ["_vehiclesOnly", false]];

if !(_marker in markersX) exitWith {
    Error_1("Marker %1 is not a major marker", _marker);
};
private _side = sidesX getVariable _marker;
private _faction = Faction(_side);
private _spawnPlaceStats = A3A_spawnPlaceStats get _marker;
if (isNil "_spawnPlaceStats") then {
    Error_1("Marker %1 not found in spawnPlaceStats", _marker);
};

// Might be used to rebuild a garrison after a sim capture, so keep the old static info if it exists
private _garrison = A3A_garrison getOrDefaultCall [_marker, {createHashMap}, true];

if (!_vehiclesOnly) then {
    private _siteType = call {
        if (_marker in citiesX) exitWith {"city"};
        if (_marker in airportsX) exitWith {"airport"};
        if (_marker in outposts) exitWith {"outpost"};
        if (_marker in seaports) exitWith {"seaport"};
        "factory";
    };
    private _quality = [_siteType, _marker, _side] call A3A_fnc_getSiteTroopQuality;

    _garrison set ["buildings", []];
    private _troopCount = (0.7 + random 0.3) * (A3A_garrisonSize get _marker);
    _garrison set ["troops", [ceil _troopCount, _quality]];
};

// Note: spawnPlaceStats has detailed place names (eg staticAA, vehicleTruck), garrison puts everything into vehicles
private _vehicles = [];
{
    if (_x in ["vehicleArty", "vehicleSAM"]) then { continue };
    private _placeType = _x;
    _y params ["_indexes", "_max", "_par"];

    private _remIndexes = +_indexes;
    for "_i" from 1 to _par do {
        private _vehType = [_faction, _placeType, "airport" in _marker] call A3A_fnc_selectGarrisonVehicleType;
        if (isNil "_vehType") exitWith {};      // faction doesn't have vehicles of that type

        // Use places in order for vehicles, otherwise randomly
        private _placeIndex = if (_placeType == "vehicle") then { _remIndexes deleteAt 0 }
            else { _remIndexes deleteAt floor random count _remIndexes };
        _vehicles pushBack [_vehType, _placeIndex];
    };
} forEach _spawnPlaceStats;

_garrison set ["vehicles", _vehicles];

if (!isNil "serverInitDone") then {
    // If we're using this function after init then we need recreate the vehicle IDs
    [_marker] call A3A_fnc_garrisonServer_initVIDs;
};

_garrison;
