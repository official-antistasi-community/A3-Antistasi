/*
Maintainer: Shoter
    Vehicle class pools the junkyard draws from, shared with factory production (A3A_fnc_factoryBuildable).
    Statics, blacklisted garage classes and vehicles from disabled DLC are excluded. Every call returns fresh arrays,
    so callers may delete from them. The wildcard scan of every drivable class is cached in A3A_junkyardWildcardPool.

Arguments:
    None

Return Value:
    <ARRAY>
        0: <ARRAY<STRING>> civilian pool
        1: <ARRAY<STRING>> rebel faction pool
        2: <ARRAY<STRING>> occupant pool
        3: <ARRAY<STRING>> invader pool
        4: <ARRAY<STRING>> every drivable vehicle class loaded (wildcards), the pools above included

Scope: Server
Environment: Any (the first call scans CfgVehicles and takes a moment)
Public: No
Dependencies: HR_GRG_fnc_getCatIndex, A3A_fnc_getModOfConfigClass

Example:
    ([] call A3A_fnc_junkyardPools) params ["_civ", "_reb", "_occ", "_inv", "_wildcards"];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define Reb(VAR) FactionGetOrDefault(reb, VAR, [])

private _fnc_valid = {
    params ["_class"];
    private _cfg = configFile >> "CfgVehicles" >> _class;
    if !(isClass _cfg) exitWith { false };
    if (_cfg call A3A_fnc_getModOfConfigClass in A3A_disabledDLC) exitWith { false };
    private _cat = [_class] call HR_GRG_fnc_getCatIndex;
    _cat >= 0 && _cat != 7;      // 7 = garage static index, -1 unsupported, -2 blacklisted
};

private _fnc_cleanPool = {
    (_this arrayIntersect _this) select { _x call _fnc_valid };
};

// Conflict pools
private _civ = (Reb("vehiclesCivCar") + Reb("vehiclesCivTruck") + Reb("vehiclesCivHeli") + Reb("vehiclesCivPlane")
    + Reb("vehiclesCivBoat") + Reb("vehiclesCivSupply") + arrayCivVeh + civBoats) call _fnc_cleanPool;
private _reb = (Reb("vehiclesBasic") + Reb("vehiclesLightUnarmed") + Reb("vehiclesTruck") + Reb("vehiclesLightArmed")
    + Reb("vehiclesMedical") + Reb("vehiclesAT") + Reb("vehiclesAA") + Reb("vehiclesBoat") + Reb("vehiclesPlane")) call _fnc_cleanPool;

private _militaryKeys = [
    "vehiclesBasic", "vehiclesTrucks", "vehiclesCargoTrucks", "vehiclesAmmoTrucks", "vehiclesRepairTrucks", "vehiclesFuelTrucks", "vehiclesMedical",
    "vehiclesLightUnarmed", "vehiclesLightArmed", "vehiclesLightAPCs", "vehiclesAPCs", "vehiclesIFVs", "vehiclesLightTanks", "vehiclesTanks", "vehiclesHeavyTanks",
    "vehiclesAA", "vehiclesSAM", "vehiclesRadar", "vehiclesArtillery", "vehiclesTransportBoats", "vehiclesGunBoats", "vehiclesAmphibious",
    "vehiclesHelisLight", "vehiclesHelisTransport", "vehiclesHelisLightAttack", "vehiclesHelisAttack",
    "vehiclesPlanesCAS", "vehiclesPlanesAA", "vehiclesPlanesTransport", "vehiclesAirPatrol",
    "vehiclesPolice", "vehiclesMilitiaCars", "vehiclesMilitiaTrucks", "vehiclesMilitiaLightArmed"
];
private _occ = [];
private _inv = [];
{
    _occ append FactionGetOrDefault(occ, _x, []);
    _inv append FactionGetOrDefault(inv, _x, []);
} forEach _militaryKeys;
_occ = _occ call _fnc_cleanPool;
_inv = _inv call _fnc_cleanPool;

// Everything drivable that is loaded, scanned once per session
if (isNil "A3A_junkyardWildcardPool") then {
    private _candidates = "getNumber (_x >> 'scope') == 2
        and {toLower getText (_x >> 'simulation') in ['carx', 'tankx', 'helicopterrtd', 'helicopterx', 'airplanex', 'shipx', 'submarinex']}
        and {getText (_x >> 'model') != ''}" configClasses (configFile >> "CfgVehicles");
    A3A_junkyardWildcardPool = (_candidates apply { configName _x }) call _fnc_cleanPool;
    Info_1("Junkyard wildcard pool built with %1 classes", count A3A_junkyardWildcardPool);
};

[_civ, _reb, _occ, _inv, +A3A_junkyardWildcardPool];
