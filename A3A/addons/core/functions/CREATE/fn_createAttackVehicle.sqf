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

private _vehicleGroups = [] call A3A_fnc_createAndFillVehicle;


_landPosBlacklist = [_vehicle, _vehicleGroups#0, _vehicleGroups#1, _posDestination, _markerOrigin, _landPosBlacklist] call A3A_fnc_createVehicleQRFBehaviour;
ServerDebug_5("Spawn Performed: Created vehicle %1 with %2 crew (%3) and %4 cargo (%5)", typeof _vehicle, count units (_vehicleGroups#0), _vehicleGroups#0, count units (_vehicleGroups#1), _vehicleGroups#1);

[_vehicle, _crewGroup, _cargoGroup, _landPosBlacklist];
