/*  
Maintainer: John Jordan
    Calculate and dispatch reinforcements to the garrisons of an enemy faction

Scope: Server
Environment: Scheduled (sleeps)

Arguments:
    <SIDE> Side of enemy faction

*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side"];

if (gamemode == 3 and _side == Invaders) exitWith {};

private _faction = Faction(_side);
private _lowAir = _faction getOrDefault ["attributeLowAir", false];
private _totalReinf = 0.2 * ([A3A_resourcesDefenceOcc, A3A_resourcesDefenceInv] select (_side == Invaders));       // spend 20% of defence resources
Debug_2("%1 has %2 resources available for reinforcements", _side, _totalReinf);
if (_totalReinf <= 0) then {continue};

private _typeWeights = createHashMapFromArray [["staticMortar", 1], ["staticAT", 1], ["staticAA", 1], ["staticMG", 1], ["vehicleAA", 1], ["vehicleTruck", 1], ["vehicle", 0.4], ["heli", 0.3], ["plane", 0.3], ["runway", 0.3], ["boat", 0.6]];
private _noPlaceTypes = _faction get "noPlaceTypes";

private _enemyAirfieldPositions = airportsX select {sidesX getVariable _x != _side} apply { markerPos _x };
private _reinfMarkers = markersX + controlsX + (destroyedSites select { _x in citiesX });


private _markers = [];         // [marker, type, numReq]
private _weights = [];
{
    private _marker = _x;
    if (sidesX getVariable _marker != _side) then { continue };
    if (_marker in forcedSpawn) then { continue };

    // Don't reinforce (by air?) if marker has enemy-controlled airfields within spawn distance
    if (_enemyAirfieldPositions inAreaArray [markerPos _x, 1000, 1000] isNotEqualTo []) then { continue };

    // Don't reinforce places with significant recent violence (use QRFs instead)
    if ([_side, markerPos _marker, 300] call A3A_fnc_getRecentDamage > 50) then { continue };

    // Special case for troops
    private _garrison = A3A_garrison get _marker;
    private _par = A3A_garrisonSize get _marker;                                     // no variance currently?
    private _cur = _garrison get "troops" select 0;          // [count, quality]
    if (_cur < _par) then {
        _weights pushBack (1 - _cur / _par);            // troop base weight is 1
        _markers pushBack [_marker, "troops", _par - _cur];
    };
    if !(_marker in A3A_spawnPlaceStats) then { continue };     // roadblock/camp don't reinforce vehicles atm

    // Filter out rebel leftovers
    private _usedPlaces = (_garrison get "vehicles") select {count _x == 2} apply {_x#1};
    {
        if (_x in _noPlaceTypes) then { continue };     // Faction has no vehicles to put here
        _y params ["_places", "_max", "_par"];
        if (_par == 0) then { continue };               // probably shouldn't happen?

        private _countUsed = count (_places arrayIntersect _usedPlaces);
        if (_countUsed >= _par) then { continue };
        _weights pushBack (_typeWeights get _x) * (1 - _countUsed / _par);
        _markers pushBack [_marker, _x, _par - _countUsed];

    } forEach (A3A_spawnPlaceStats get _marker);        // hashmap, place type (_x) to [placeindexes, max, par]

} forEach _reinfMarkers;

// problem: Need to record in-motion reinforcements?
// or just assume for now that they'll arrive before the next reinf check

private _rebelSpawners = units teamPlayer select { _x getVariable ["spawner", false] };

while {_totalReinf > 0} do
{
    Debug_1("Reinf data: %1", _markers);
    Debug_1("Reinf weights: %1", _weights);

    private _targData = _markers selectRandomWeighted _weights;
    if (isNil "_targData") exitWith {};         // Nothing non-zero left. Possible?
    private _index = _markers find _targData;
    private _weight = _weights # _index;

    _targData params ["_marker", "_type", "_needed"];

    Debug_3("Selected reinf of %1 type %2 needed %3", _marker, _type, _needed);

    // If this marker was deleted since, avoid adding stuff to it
    if (_marker in A3A_markersToDelete) then {
        _weights set [_index, 0]; continue;
    };

    // Currently non-troop reinf is just teleported in
    if (_type != "troops") then
    {
        // Need to know class now for cost reasons
        private _vehClass = [_faction, _type, _marker in airportsX] call A3A_fnc_selectGarrisonVehicleType;
        _totalReinf = _totalReinf - (A3A_vehicleResourceCosts get _vehClass);

        [_side, _marker, _type, _vehClass] spawn A3A_fnc_reinforceVehicle;

        // Fix up weights for next pass
        _targData set [2, _needed-1];
        _weights set [_index, _weight * (_needed-1) / _needed];
        continue;
    };

    //Find a suitable site to reinforce
    private _rebelsNear = _rebelSpawners inAreaArray [markerPos _marker, 1000, 1000] isNotEqualTo [];
    private _isLand = true;
    private _source = call {
        if (!_rebelsNear and _marker in airportsX) exitWith { _marker };
        [_side, _marker] call A3A_fnc_availableBasesLand;
    };
    if (isNil "_source") then { _source = [_side, markerPos _marker] call A3A_fnc_availableBasesAir; _isLand = false };
    if (isNil "_source") then {
        // No possible reinforcements for this location, remove it from the list
        _weights set [_index, 0]; continue;
    };

    private _siteType = A3A_garrison get _marker get "type";
    private _quality = [_siteType, _side, random 0.4] call A3A_fnc_getSiteTroopQuality;
    private _numTroops = [4, 8] select (_needed > 4 and _totalReinf > 40 and random 1 > 0.3);
    _totalReinf = _totalReinf - _numTroops*10;

    // Fix up weights
    _targData set [2, _needed-_numTroops];
    _weights set [_index, _weight * (_needed-_numTroops max 0) / _needed];       // might overshoot

    Debug_3("Reinforcing garrison %1 from %2 with %3 troops", _marker, _source, _numTroops);
    if (_source == _marker) then {
        // Self-reinforce
        [-10*_numTroops, _side, "defence"] call A3A_fnc_addEnemyResources;
        [_marker, _numTroops, _quality] remoteExecCall ["A3A_fnc_garrisonServer_addUnitCount", 2];
        continue;
    };
    if (_rebelsNear or _rebelSpawners inAreaArray [markerPos _source, 1000, 1000] isNotEqualTo []) then {
        // If rebels are near the target or source, send a real reinforcement
        [[_marker, _source, _isLand, _numTroops, _quality, _side], "A3A_fnc_patrolReinf"] call A3A_fnc_scheduler;      // TODO: patrolReinf needs update
        sleep 10;		// Might re-use this marker shortly, avoid collisions
    } else {
        // Otherwise just add troops directly
        [-10*_numTroops, _side, "defence"] call A3A_fnc_addEnemyResources;
        [_marker, _numTroops, _quality] remoteExecCall ["A3A_fnc_garrisonServer_addUnitCount", 2];
    };
};


// This probably works, but better to choose a site first?
// And then decide what to send to the site?

// expensive bit is probably building all these requirement arrays though?
// could instead store reinfNeed value and mark it negative when it needs to be recalculated
// recalc: losing units or vehicles?
// In this case, can we lose A3A_spawnPlaceStats?
// recalc it as required instead?


