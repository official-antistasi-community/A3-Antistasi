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
private _totalReinf = 0.1 * ([A3A_resourcesDefenceOcc, A3A_resourcesDefenceInv] select (_side == Invaders));       // spend 10% of defence resources
if (_totalReinf <= 0) then {continue};

private _sourceAirports = airportsX select {(sidesX getVariable [_x,sideUnknown] == _side) and (spawner getVariable _x == 2)};
_sourceAirports pushBack (["NATO_carrier", "CSAT_carrier"] select (_side == Invaders));

private _typeWeights = createHashMapFromArray [["mortar", 1], ["staticAA", 1], ["staticMG", 1], ["vehicleAA", 1], ["vehicleTruck", 1], ["vehicle", 0.4], ["heli", 0.3], ["plane", 0.3], ["boat", 0.6]];
// TODO: special case weightings if faction is lacking equipment type (helis specifically?)

private _enemyAirfieldPositions = airportsX select {sidesX getVariable _x != _side} apply { markerPos _x };

private _reinfTargets = [];         // elements are [[marker, type, numReq], weight]
{
    //... copied in from older version
    private _site = _x;
    if (sidesX getVariable _site != _side) then { continue };
    if (_site in forcedSpawn) then { continue };

    // Don't reinforce (by air?) if marker has enemy-controlled airfields within spawn distance
    if (_enemyAirfieldPositions inAreaArray [markerPos _x, 1000, 1000] isNotEqualTo []) then { continue };

    // Don't reinforce places with significant recent violence (use QRFs instead)
    if ([_side, markerPos _site, 300] call A3A_fnc_getRecentDamage > 50) then { continue };

    // Special case for troops
    private _par = A3A_spawnPlaceStats get _marker get "troops" select 0;                                     // no variance currently?
    private _cur = _garrison get "troops" select 0;          // [count, quality]
    if (_cur < _par) then {
        private _weight = 1 * (1 - _cur / _par);
        _reinfTargets pushBack [[_site, _x, _par - _cur], _weight];
    };

    // Guaranteed only to use places?
    private _usedPlaces = (_garrison get "vehicles") apply {_x#1};
    _usedPlaces append ((_garrison get "statics") apply {_x#1});
    {
        if (_x == "troops") then { continue };      // Handled above
        _y params ["_places", "_max", "_par"];
        if (_par == 0) then { continue };               // probably shouldn't happen?

        private _countUsed = count (_places arrayIntersect _usedPlaces);
        if (_countUsed >= _par) then { continue };
        private _weight = (_typeWeights get _x) * (1 - _countUsed / _par);
        _reinfTargets pushBack [[_site, _x, _par - _countUsed], _weight];

    } forEach (A3A_spawnPlaceStats get _marker);        // hashmap, place type to [placeindexes, max, par]

} forEach (airportsX + outposts + seaports + resourcesX + factories);

// problem: Need to record in-motion reinforcements?
// or just assume for now that they'll arrive before the next reinf check

while {_totalReinf > 0} do
{
    if (_sourceAirports isEqualTo [] or _reinfTargets isEqualTo []) exitWith {};

    private _targData = selectRandomWeighted _reinfTargets;
    if (isNil "_targData") exitWith {};         // Nothing non-zero left. Possible?
    (_targData#0) params ["_target", "_type", "_needed"];

    Debug_3("Selected reinf of %1 type %2 needed %3", _target, _type, _needed);

    // Currently non-troop reinf is just teleported in
    if (_type != "troops") then
    {
        // Need to know class now for cost reasons
        private _vehClass = [_faction, _type, _target in airportsX] call A3A_fnc_selectGarrisonVehicleType;
        _totalReinf = _totalReinf - (A3A_vehicleResourceCosts get _vehClass);      // TODO: shouldn't ever be 0 now

        [_side, _target, _type, _vehClass] spawn {
            params ["_side", "_marker", "_slotType", "_vehClass"];
            sleep 300;          // lazy code, should check nearest base

            // Now check if garrison has enemies nearby
            private _nearRebels = units teamPlayer inAreaAray [markerPos _marker, 700, 700];
            if (_nearRebels findIf { _x getVariable ["spawner", false] }) exitWith {
                Debug_2("Reinf of %1 type %2 blocked by rebels", _marker, _type);
            };
            if (sidesX getVariable _marker != _side) exitWith {
                Debug_2("Reinf of %1 type %2 blocked by side change", _marker, _type);
            };

            // Determine free places. Can't re-use reinf code due to delay
            private _garrison = A3A_garrison get _marker;
            private _faction = [A3A_faction_occ, A3A_faction_inv] select (_side == Invaders);
            private _garrisonType = ["vehicles", "statics"] select ("static" in _x);
            private _usedPlaces = (_garrison get _garrisonType) apply {_x#1};
            private _places = A3A_spawnPlaceStats get _marker select 0 select { !(_x in _usedPlaces) };
            if (_places isEqualType []) exitWith {
                Info_2("Reinf of %1 type %2 cancelled because no free places", _marker, _type);
            };

            [A3A_vehicleResourceCosts get _vehClass, _side, "defence"] call A3A_fnc_addEnemyResources;
            private _placeNum = if (_slotType == "vehicle") then { _places # 0 } else { selectRandom _places };
            [_marker, _vehClass, _garrisonType, _placeNum] remoteExecCall ["A3A_fnc_garrisonServer_addVehicleType", 2];
            Debug_3("Reinforcing %1 with vehicle %2", _marker, _vehClass);
        };

        // Fix up weights for next pass
        (_targ#0) set [2, _needed-1];
        _targ set [1, (_targ#1) * (_needed-1) / _needed];
    };

    //Find a suitable site to reinforce
    private _source = "";
    if (_lowAir) then {
        _source = [_side, _marker] call A3A_fnc_availableBasesLand;         // TODO: check whether this can return itself
        if (isNil "_source") then {
            // No possible reinforcements for this location, remove it from the list
            _targ set [1, 0]; continue;
        };
    } else {
        // TODO: Check current version of availableBasesAir after merge, needs to be close-biased here
        _source = [_side, markerPos _marker] call A3A_fnc_availableBasesAir;
    };

    private _numTroops = [4, 8] select (_needed > 4 and _totalReinf > 40 and random 1 > 0.3);
    _totalReinf = _totalReinf - _numTroops*10;

    Debug_3("Reinforcing garrison %1 from %2 with %3 troops", _target, _source, _numTroops);
    if (_source == _target) then {
        // Self-reinforce. Already know that we're not spawned, so this is fine
        [10*_numTroops, _side, "defence"] call A3A_fnc_addEnemyResources;
        [_target, _numTroops, 2] remoteExecCall ["A3A_fnc_garrisonServer_addUnitCount", 2];
        continue;
    };
    if ([distanceSPWN1, 1, getMarkerPos _target, teamPlayer] call A3A_fnc_distanceUnits) then {
        // If rebels are near the target, send a real reinforcement
        [[_target, _source, _numTroops, _side], "A3A_fnc_patrolReinf"] call A3A_fnc_scheduler;      // TODO: patrolReinf needs update
        sleep 10;		// Might re-use this marker shortly, avoid collisions
    } else {
        // Otherwise just add troops directly
        [10*_numTroops, _side, "defence"] call A3A_fnc_addEnemyResources;
        [_target, _numTroops, 2] remoteExecCall ["A3A_fnc_garrisonServer_addUnitCount", 2];
    };
};


// This probably works, but better to choose a site first?
// And then decide what to send to the site?
