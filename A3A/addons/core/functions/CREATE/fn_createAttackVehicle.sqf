/*  Creates a vehicle for a QRF or small attack, including crew and cargo

    Execution on: HC or Server

    Environment: Scheduled. Land vehicles delay after spawning until place is cleared
    Scope: Internal

    Parameters:
        _vehicleType: STRING : The name of the vehicle to spawn
        _troopType: STRING : Type of cargo units to use
        _resPool: STRING : Resource pool name for vehicle/troops, probably "attack" or "defence"
        _landPosBlacklist: ARRAY : List of blacklisted position
        _side: SIDE : The side of the attacker
        _markerOrigin: STRING : The name of the marker marking the origin
        _posDestination: ARRAY : Target position (ASL or ATL? probably used as 2d anyway)
        _seaPath: ARRAY : Optional, needed for boats. Path of positions from landing point to deep sea

    Returns:
        ARRAY : [_vehicle, _crewGroup, _cargoGroup, _landPosBlacklist]
        or
        OBJECT : objNull if the spawning did not worked
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_vehicleType", "_troopType", "_resPool", "_landPosBlacklist", "_side", "_markerOrigin", "_posDestination", ["_seaPath", []]];

private _faction = Faction(_side);
private _vehicle = if (_vehicleType isKindOf "Ship") then {
    private _veh = [_vehicleType, _seaPath#-1, 100, 5, true] call A3A_fnc_safeVehicleSpawn;
    _veh setDir (_seaPath#-1 getDir _seaPath#1);
    _veh;
} else {
    [_markerOrigin, _vehicleType] call A3A_fnc_spawnVehicleAtMarker;
};
if(isNull _vehicle) exitWith {objNull};

[_vehicle, _troopType, _resPool, _side] call A3A_fnc_fillVehicleCrewCargo params ["_crewGroup", "_cargoGroup"];

_landPosBlacklist = [_vehicle, _crewGroup, _cargoGroup, _posDestination, _markerOrigin, _landPosBlacklist, _seaPath] call A3A_fnc_createVehicleQRFBehaviour;
ServerDebug_5("Spawn Performed: Created vehicle %1 with %2 crew (%3) and %4 cargo (%5)", typeof _vehicle, count units _crewGroup, _crewGroup, count units _cargoGroup, _cargoGroup);

// Wait until land vehicle has cleared the spawn place.
if (_vehicleType isKindOf "Land") then {

    private _spawnPos = getPosATL _vehicle;
    private _spawnTime = time + 10;
    waitUntil { _spawnPos distance2d _vehicle > 10 or time > _spawnTime };

    if (_spawnPos distance2d _vehicle < 10) then {
        Error_2("Vehicle %1 failed to clear spawn at %2", _vehicle, _markerOrigin);
        // teleport to first waypoint
        // arguably should just return empty array...
        private _wayPos = waypointPosition (waypoints _crewGroup # 0);
        _vehicle setVehiclePosition [_wayPos, [], 10, "NONE"];
        _crewGroup setCurrentWaypoint [_crewGroup, 1];
    };
};

[_vehicle, _crewGroup, _cargoGroup, _landPosBlacklist];




