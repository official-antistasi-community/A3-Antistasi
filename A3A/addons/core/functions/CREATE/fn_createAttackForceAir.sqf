/*  
Maintainer: John Jordan
    Create air attack force

Scope: Server or HC
Environment: Scheduled (sleeps between unit spawns)

Arguments:
    <SIDE> Side to create force for
    <STRING> Marker name of source base to spawn at
    <POS or STRING> Position or marker of target location for attack force
    <STRING> Resource pool to use
    <INTEGER> Total number of vehicles to create
    <INTEGER> Number of attack/support vehicles to create
    <NUMBER> Optional, tier modifier to apply to vehicle selection (Default: 0)
    <STRING> Optional, troop type to use (Default: "Normal")

Return array:
    <SCALAR> Resources spent
    <ARRAY> Array of vehicle objects created
    <ARRAY> Array of crew groups created
    <ARRAY> Array of cargo groups created
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side", "_base", "_target", "_resPool", "_vehCount", "_vehAttackCount", ["_tierMod", 0], ["_troopType", "Normal"]];
private _targpos = if (_target isEqualType []) then { _target } else { markerPos _target };
private _transportRatio = 1 - _vehAttackCount / _vehCount;

private _resourcesSpent = 0;
private _vehicles = [];
private _crewGroups = [];
private _cargoGroups = [];

private _faction = Faction(_side);
private _transportPlanes = _faction get "vehiclesPlanesTransport";
private _transportHelis = _faction get "vehiclesHelisTransport";
private _lightHelis = _faction get "vehiclesHelisLight";
private _lhFactor = 0 max (1 - (tierWar+_tierMod) / 10);            // phase out light helis at higher war tiers

private _transportPool = [];
{ _transportPool append [_x, 1 / count _transportPlanes] } forEach _transportPlanes;
{ _transportPool append [_x, 2 / count _transportHelis] } forEach _transportHelis;
{ _transportPool append [_x, 2 * _lhFactor / count _lightHelis] } forEach _lightHelis;

private _supportPool = [_side, tierWar+_tierMod] call A3A_fnc_getVehiclesAirSupport;

private _numTransports = 0;
private _isTransport = _vehAttackCount < _vehCount;            // normal case, first vehicle should be a transport

for "_i" from 1 to _vehCount do {
    private _vehType = selectRandomWeighted ([_supportPool, _transportPool] select _isTransport);

    if (_vehType == "CAS") then {
        // no reveal because it's a sub-support, delay because it's faster than the helis
        [_vehType, _side, _resPool, 500, false, _targPos, 0, 60] remoteExec ["A3A_fnc_createSupport", 2];
    } else {
        private _vehData = [_vehType, _troopType, _resPool, [], _side, _base, _targPos] call A3A_fnc_createAttackVehicle;
        if !(_vehData isEqualType []) exitWith {};          // couldn't create for some reason. Not sure why for air vehicles.

        _vehicles pushBack (_vehData#0);
        _crewGroups pushBack (_vehData#1);
        if !(isNull (_vehData#2)) then { _cargoGroups pushBack (_vehData#2) };
        _landPosBlacklist = (_vehData#3);

        private _vehCost = A3A_vehicleResourceCosts getOrDefault [_vehType, 0];
        private _crewCost = 10 * (count units (_vehData#1) + count units (_vehData#2));
        _resourcesSpent = _resourcesSpent + _vehCost + _crewCost;
        sleep 5;
    };

    if (_isTransport) then { _numTransports = _numTransports + 1 };
    _isTransport = _vehAttackCount == 0 or (_numTransports / _i) < _transportRatio;
};

[_resourcesSpent, _vehicles, _crewGroups, _cargoGroups];
