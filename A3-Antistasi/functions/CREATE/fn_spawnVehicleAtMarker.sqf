params
[
    ["_marker", "", [""]],
    ["_vehicle", "", [""]]
];

/*  Spawns the given vehicle at the given marker, only works if the marker as spawn places defined, not recommended for planes

    Execution on: HC or Server

    Called by: call

    Params:
        _marker : STRING : The name of the marker, where the vehicle should be spawned in
        _vehicle : STRING : The configname of the vehicle, which should be spawned in

    Returns:
        OBJECT : The vehicle object, objNull if spawn wasnt possible
*/
private _fileName = "spawnVehicleAtMarker";

if(_vehicle == "" || _marker == "") exitWith
{
    [1, format ["Function called with bad input, was %1", _this], _fileName] call A3A_fnc_log;
    objNull;
};

private _vehicleObj = objNull;
if(_vehicle isKindOf "Air") exitWith
{
    _vehicleObj = [_vehicle, getMarkerPos _marker, 100, 5, true] call A3A_fnc_safeVehicleSpawn;
    _vehicleObj;
};

//Get the spawn place of the marker
private _spawnParams = [_marker, "Vehicle"] call A3A_fnc_findSpawnPosition;

if(_spawnParams isEqualType []) then
{
    //Place found spawn in vehicle now
    _vehicleObj = createVehicle [_vehicle, (_spawnParams select 0), [], 0, "CAN_COLLIDE"];
    _vehicleObj setDir (_spawnParams select 1);
};

_vehicleObj;
