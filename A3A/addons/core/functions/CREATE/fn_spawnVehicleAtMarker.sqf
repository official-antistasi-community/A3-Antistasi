params
[
    ["_marker", "", [""]],
    ["_vehicle", "", [""]],
    "_posDest"
];

/*  Spawns the given vehicle at the given marker, only works if the marker as spawn places defined, not recommended for planes

    Execution on: HC or Server

    Called by: call

    Params:
        _marker : STRING : The name of the marker, where the vehicle should be spawned in
        _vehicle : STRING : The configname of the vehicle, which should be spawned in
        _posDest : ARRAY : Optional approximate target position, for determining spawn heading of aircraft

    Returns:
        OBJECT : The vehicle object, objNull if spawn wasnt possible
        If it was a land vehicle, the spawnPlace variable on it is set to the spawn place used
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if(_vehicle == "" || _marker == "") exitWith
{
    Error_1("Function called with bad input, was %1", _this);
    objNull;
};

private _vehicleObj = objNull;
if ((_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) exitWith
{
    _vehicleObj = [_vehicle, getMarkerPos _marker, 100, 5, true] call A3A_fnc_safeVehicleSpawn;
    if !(isNil "_posDest") then {
        private _rVel = velocityModelSpace _vehicleObj;
        _vehicleObj setDir (_vehicleObj getDir _posDest);
        _vehicleObj setVelocityModelSpace _rVel;
    };
    _vehicleObj;
};

// alt, faster but less readable
//private _lastPlaceIndex = A3A_spawnPlaceStats get _marker get "vehicle" select 0 select -1;
//if (isNil "_lastPlaceIndex") exitWith { objNull };
//A3A_spawnPlacesHM get _marker select _lastPlaceIndex params ["", "_spawnPos", "_spawnDir"];

// should always exist? Earlier code shouldn't suggest this marker unless it's available
private _vehiclePlace = A3A_spawnPlacesHM get _marker select { _x#0 == "vehicle" } select -1;
if (isNil "_vehiclePlace") exitWith { objNull };
_vehiclePlace params ["", "_spawnPos", "_spawnDir"];

isNil {
    _vehicleObj = createVehicle [_vehicle, _spawnPos, [], 0, "CAN_COLLIDE"];
    _vehicleObj setDir _spawnDir;
};
_vehicleObj setVariable ["spawnPos", _spawnPos];

_vehicleObj;
