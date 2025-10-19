#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
// convert killzones into [base, target] array
private _allKillzones = [];
{
    private _base = _x;
    private _kzlist = killZones getVariable [_base, []];
    { _allKillzones pushBack [_base, _x] } forEach _kzlist;
} forEach (outposts + airportsX);

// Remove random killzones if the aggression-based accumulator hits >1
if (isNil "killZoneRemove") then {killZoneRemove = 0};
private _kzAggroMult = 0.2 + 0.4 * (aggressionOccupants + aggressionInvaders) / 100;
killZoneRemove = killZoneRemove + _kzAggroMult * (0.5 + 0.1 * count _allKillzones);
if (count _allKillzones == 0) then { killZoneRemove = 0 };

while {killZoneRemove >= 1} do
{
    // Remove a random killzone entry from the real killzones.
    // May attempt to remove the same killzone multiple times. This is safe.
    (selectRandom _allKillzones) params ["_base", "_target"];
    private _kzlist = killZones getVariable [_base, []];
    _kzlist deleteAt (_kzlist find _target);
    killZones setVariable [_base, _kzlist, true];
    killZoneRemove = killZoneRemove - 1;
};

// Do killzones do anything anymore?
// actually want two things:
// 1. Routes where ground vehicles got stuck
// 2. Dangerous locations
// Point 1 needs handling maybe
// Point 2 can be replaced with a recentDamage check for the moment


// Reinforce garrisons
[Occupants] call A3A_fnc_reinforceSide;
if (gameMode != 3) then { [Invaders] call A3A_fnc_reinforceSide };


// If there aren't too many road patrols around already, generate about 3 * playerScale per hour
if (AAFpatrols < round (3 * A3A_balancePlayerScale) and (random 2 < A3A_balancePlayerScale)) then {
    [] spawn A3A_fnc_AAFroadPatrol;
};


// Reduce loot crate & intel cooldowns if garrison is reasonably full
{
    private _cdtype = _x;
    {
        if (sidesX getVariable _x == teamPlayer) then { continue };		// shouldn't really be necessary
        private _garrison = A3A_garrison get _x;
        if !(_cdtype in _garrison) then { continue };

        private _realSize = _garrison get "troops" select 0;
        private _maxSize = A3A_garrisonSize get _x;
        if (_realSize / _maxSize < 0.7) then { continue };

        private _newVal = (_garrison get _cdtype) - 10;
        if (_newVal <= 0) then { _garrison deleteAt _cdtype; continue };
        _garrison set [_cdtype, _newVal];

    } forEach markersX;
} forEach ["lootCD", "intelCD"];


// Civ car replenishment
// makes some sense for cleared areas to acquire more cars? People do need them...
{
    private _spawnKey = _x + "_civ";
    if (spawner getVariable _spawnKey != 2) then { continue };		// don't reinf cities if spawned

    // Only do civ cars for now
    private _placeStats = A3A_spawnPlaceStats get _spawnKey;
    _placeStats get "civCar" params ["_places", "_max", "_par"];

    private _vehicles = A3A_garrison get _spawnKey get "vehicles";
    private _usedPlaces = _vehicles select {_x#1 in _places} apply {_x#1};		// warning, _x#1 might be position

    // Each missing car has a ~1/100 chance of being replaced each tick at tier 1
    private _chance = 50 * (1 + tierWar);
    if (random _chance > _par - count _usedPlaces) then { continue };

    // Add a car
    private _type = selectRandomWeighted civVehiclesWeighted;
    private _placeNum = selectRandom (_places - _usedPlaces);
    _vehicles pushBack [_type, _placeNum];
    Debug_2("Added car %1 at %2", _type, _x);

} forEach (citiesX - destroyedSites);


// Enemy troop and vehicle upgrading
// Only for major markers, others just run until they die
// Expected progression: About 48 hours for +8 tiers, or 1 tier per 6 hours
// 1 swap per hour should be plenty
{
    if (random 6 > 1) then { continue };
    private _side = sidesX getVariable _x;
    if (_side == teamPlayer) then { continue };
    if (spawner getVariable _x != 2) then { continue };

    // Only do anything if we're near max troops
    private _marker = _x;
    private _garrison = A3A_garrison get _marker;
    _garrison get "troops" params ["_curTroops", "_quality"];
    if (_curTroops < (A3A_garrisonSize get _marker) * 0.8) then { continue };

    private _siteType = _garrison get "type";
    private _newQuality = [_siteType, _side, 0.2] call A3A_fnc_getSiteTroopQuality;
    Debug_3("Adjusting troop quality from %1 to %2 at %3", _quality, _newQuality, _marker);
    _garrison get "troops" set [1, _newQuality * 0.2 + _quality * 0.8];

    private _vehicles = _garrison get "vehicles";
    private _spawnStats = A3A_spawnPlaceStats get _marker;
    if (_vehicles isEqualTo [] or isNil "_spawnStats") then { continue };

    private _spawnPlaces = A3A_spawnPlacesHM get _marker;
    private _usedPlaces = _vehicles select {count _x == 2} apply {_x#1};		// filter not necessary as it's despawned, but whatever
    private _faction = [A3A_faction_occ, A3A_faction_inv] select (_side == Invaders);

    private _fnc_changeVehicle = {
        private _vehEntry = selectRandom _vehicles;
        if (isNil "_vehEntry") exitWith {};

        private _placeType = _spawnPlaces#(_vehEntry#1)#0;
        if !("static" in _placeType) then {
            private _oldClass = _vehEntry#0;
            private _newClass = [_faction, _placeType, _siteType == "airport"] call A3A_fnc_selectGarrisonVehicleType;
            private _priceDiff = (A3A_vehicleResourceCosts get _newClass) - (A3A_vehicleResourceCosts get _oldClass);
            [-_priceDiff, _side, "defence"] call A3A_fnc_addEnemyResources;
            _vehEntry set [0, _newClass];
            Debug_3("Changing %1 to %2 at %3", _oldClass, _newClass, _marker);
        };
        if (_placeType == "vehicle") exitWith {};			// vehicles use places from 0 upwards anyway

        // move to a different position
        private _places = (_spawnStats get _placeType select 0) - _usedPlaces;
        if (_places isEqualTo []) exitWith {};
        _vehEntry set [1, selectRandom _places];
        Debug_3("Moving %1 to place %2 at %3", _vehEntry#0, _vehEntry#1, _marker); 
    };
    call _fnc_changeVehicle;
    if (_siteType == "airport") then { call _fnc_changeVehicle; call _fnc_changeVehicle };

} forEach markersX;
