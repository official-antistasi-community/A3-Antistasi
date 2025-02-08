/*  Creates a vehicle for a QRF or small attack, including crew and cargo

    Execution on: HC or Server

    Scope: Internal

    Parameters:
        _vehicleType: STRING : The name of the vehicle to spawn
        _troopType: STRING : Type of cargo units to use
        _resPool: STRING : Resource pool name for vehicle/troops, probably "attack" or "defence"
        _landPosBlacklist: ARRAY : List of blacklisted position
        _side: SIDE : The side of the attacker
        _markerOrigin: STRING : The name of the marker marking the origin
        _posDestination: ARRAY : Target position (ASL or ATL? probably used as 2d anyway)

    Returns:
        ARRAY : [_vehicle, _crewGroup, _cargoGroup, _landPosBlacklist]
        or
        OBJECT : objNull if the spawning did not worked
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_vehicleType", "_troopType", "_resPool", "_landPosBlacklist", "_side", "_markerOrigin", "_posDestination"];

private _faction = Faction(_side);
private _vehicle = [_markerOrigin, _vehicleType] call A3A_fnc_spawnVehicleAtMarker;

if(isNull _vehicle) exitWith {objNull};

// Fill cargo turrets with crew for attack helis
private _isAttackHeli = _vehicleType in FactionGet(all, "vehiclesHelisAttack") + FactionGet(all, "vehiclesHelisLightAttack");
private _crewGroup = [_side, _vehicle, nil, _isAttackHeli] call A3A_fnc_createVehicleCrew;
{
    [_x, nil, nil, _resPool] call A3A_fnc_NATOinit
} forEach (units _crewGroup);
[_vehicle, _side, _resPool] call A3A_fnc_AIVEHinit;

private _cargoGroup = grpNull;
private _expectedCargo = ([_vehicleType, true] call BIS_fnc_crewCount) - ([_vehicleType, false] call BIS_fnc_crewCount);
if (_expectedCargo >= 2 and !_isAttackHeli) then
{
    //Vehicle is able to transport units
    private _groupType = call {
        if (_troopType == "Normal") exitWith { [_vehicleType, _side] call A3A_fnc_cargoSeats };
        if (_troopType == "Specops") exitWith { _faction get "groupSpecOps" };
        if (_troopType == "Air") exitWith { _faction get "groupAA" };
        if (_troopType == "Tank") exitWith { _faction get "groupAT" };
    };

    // Find turret paths that count as cargo seats
    private _fnc_addCargoTurrets = {
        params ["_config", ["_path", []]];
        {
            private _turretPath = _path + [_forEachIndex];
            [_x, _turretPath] call _fnc_addCargoTurrets;                // Handle nested turrets
            if (getNumber (_x >> "showAsCargo") != 0) then { _cargoTurrets pushBack _turretPath };
        } forEach ("true" configClasses (_config >> "Turrets"));
    };
    private _cargoTurrets = [];
private _blacklistTypes = ["LIB_Li2","LIB_C47_RAF","LIB_C47_Skytrain","LIB_C47_RAF_bob","LIB_C47_RAF_snafu"];
    if !(_vehicleType in _blacklistTypes) then {
        [configFile >> "CfgVehicles" >> _vehicleType] call _fnc_addCargoTurrets;
    };

    if (_expectedCargo < count _groupType) then { _groupType resize _expectedCargo };           // trim to cargo seat count
    _cargoGroup = [getMarkerPos _markerOrigin, _side, _groupType, true, false] call A3A_fnc_spawnGroup;         // force spawn, should be pre-checked
    {
        if (_cargoTurrets isNotEqualTo []) then {
            private _turretPath = _cargoTurrets deleteAt 0;
            _x assignAsTurret [_vehicle, _turretPath];
            _x moveInTurret [_vehicle, _turretPath];
        } else {
            _x assignAsCargo _vehicle;
            _x moveInCargo _vehicle;
        };
        [_x, nil, nil, _resPool] call A3A_fnc_NATOinit;
    } forEach units _cargoGroup;
};

_landPosBlacklist = [_vehicle, _crewGroup, _cargoGroup, _posDestination, _markerOrigin, _landPosBlacklist] call A3A_fnc_createVehicleQRFBehaviour;
ServerDebug_5("Spawn Performed: Created vehicle %1 with %2 crew (%3) and %4 cargo (%5)", typeof _vehicle, count units _crewGroup, _crewGroup, count units _cargoGroup, _cargoGroup);

[_vehicle, _crewGroup, _cargoGroup, _landPosBlacklist];
