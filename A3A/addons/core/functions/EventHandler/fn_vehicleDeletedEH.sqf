#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
	
params ["_veh"];

private _spawnPlace = _veh getVariable "spawnPlace";
if (!isNil "_spawnPlace") then { [_spawnPlace] call A3A_fnc_freeSpawnPositions };

// Shortcut for garrison vehicles, otherwise gets spammy for statics
if (!isNil {_veh getVariable "markerX"}) exitWith {};

private _landingPad = _veh getVariable "LandingPad";
if (!isNil "_landingPad") then { deleteVehicle _landingPad };

private _side = _veh getVariable ["ownerSide", teamPlayer];
private _vehCost = A3A_vehicleResourceCosts getOrDefault [typeof _veh, 0];
if (!alive _veh || (_side != Occupants && _side != Invaders) || _vehCost == 0) exitWith {};

// Apparently some vehicles (eg. CUP C47, su25) return an empty array for getAllHitPointsDamage
Debug_1("Calculating damage for vehicle type %1", typeof _veh);
private _vehDamage = damage _veh;
if (getAllHitPointsDamage _veh isNotEqualTo []) then {
    private _allHP = getAllHitPointsDamage _veh select 2;
    private _total = 0; { _total = _total + _x } forEach _allHP;
    _vehDamage = _vehDamage max (_total / count _allHP);
};

private _pool = _veh getVariable ["A3A_resPool", "legacy"];
Debug_5("Vehicle type %1 deleted with side %2, pool %3, cost %4, damage %5", typeof _veh, _side, _pool, _vehCost, _vehDamage);

if (_pool == "legacy") then {
    // If vehicle isn't prepaid, remove partial cost now if damaged
    if (_vehDamage < 0.1) exitWith {};
    [-_vehDamage*_vehCost, _side, "legacy"] remoteExecCall ["A3A_fnc_addEnemyResources", 2];
} else {
    // If vehicle is prepaid, refund up to 2/3 if not crippled
    [(1-_vehDamage)*_vehCost*2/3, _side, _pool] remoteExecCall ["A3A_fnc_addEnemyResources", 2];
};
