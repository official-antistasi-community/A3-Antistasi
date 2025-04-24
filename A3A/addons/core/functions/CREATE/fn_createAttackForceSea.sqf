/*  
Maintainer: Tiny
    Create sea attack force

Scope: Server or HC
Environment: Scheduled (sleeps between unit spawns)

Arguments:
    <SIDE> Side to create force for
    <STRING> Marker name of source marker to spawn at (for ships, can use any marker for that side)
    <POS or STRING> Position or marker of target location for attack force
    <STRING> Resource pool to use
    <INTEGER> Total number of vehicles to create
    <INTEGER> Number of attack/support vehicles to create
    <NUMBER> Optional, tier modifier to apply to vehicle selection (Default: 0)
    <STRING> Optional, troop type to use (Default: "Normal")
    <ARRAY> Path of positions from landing point to deep sea

Return array:
    <SCALAR> Resources spent
    <ARRAY> Array of vehicle objects created
    <ARRAY> Array of crew groups created
    <ARRAY> Array of cargo groups created
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side", "_marker", "_target", "_resPool", "_vehCount", "_vehAttackCount", ["_tierMod", 0], ["_troopType", "Normal"], "_seaPath"];
private _targpos = if (_target isEqualType []) then { _target } else { markerPos _target };

private _resourcesSpent = 0;
private _vehicles = [];
private _crewGroups = [];
private _cargoGroups = [];

private _faction = Faction(_side);
private _transportBoats = _faction get "vehiclesTransportBoats";
private _attackBoats = _faction get "vehiclesGunBoats";

private _isTransport = (_vehAttackCount == 0); // gunboats spawned first to cover
private _landPosBlacklist = [];

for "_i" from 1 to _vehCount do {
    private _vehType = selectRandom ([_attackBoats, _transportBoats] select _isTransport);
    private _vehData = [_vehType, _troopType, _resPool, _landPosBlacklist, _side, _marker, _targPos, _seaPath] call A3A_fnc_createAttackVehicle;
    if !(_vehData isEqualType []) exitWith {};          // couldn't create for some reason

    _vehicles pushBack (_vehData#0);
    _crewGroups pushBack (_vehData#1);
    if !(isNull (_vehData#2)) then { _cargoGroups pushBack (_vehData#2) };

    private _vehCost = A3A_vehicleResourceCosts getOrDefault [_vehType, 0];
    private _crewCost = 10 * (count units (_vehData#1) + count units (_vehData#2));
    _resourcesSpent = _resourcesSpent + _vehCost + _crewCost;
    sleep 5;
    _isTransport = (_i >= _vehAttackCount);
};

[_resourcesSpent, _vehicles, _crewGroups, _cargoGroups];
