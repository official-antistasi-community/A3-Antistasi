params ["_side", "_timerIndex", "_supportObj", "_supportName"];

/*  Prepares the SAM launcher and marker

    Execution on: Server

    Scope: Internal

    Params:
        _side: SIDE : The side for which the support should be called in
        _timerIndex: NUMBER
        _supportPos: POS
        _supportName: STRING : The call name of the support

    Returns:
        The name of the marker, covering the whole support area
*/

private _fileName = "SUP_SAM";

private _supportPos = getPos _supportObj;
private _spawnPos = [];
private _availableAirports = airportsX select
{
    (getMarkerPos _x distance2D _supportPos <= 8000) &&
    (getMarkerPos _x distance2D _supportPos > 1500) &&
    (sidesX getVariable [_x, sideUnknown] == _side) &&
    (spawner getVariable _x == 2)
};

if(count _availableAirports == 0) exitWith
{
    [2, "No airport suitable to place SAM on it", _fileName] call A3A_fnc_log;
    "";
};

//Check which airports are able to fire at the given position
private _finalAirports = [];
{
    private _airportPos = getMarkerPos _x;
    private _dir = _airportPos getDir _supportPos;
    private _intercectPoint = _airportPos getPos [250, _dir];
    _intercectPoint = _intercectPoint vectorAdd [0, 0, 300];
    if !(terrainIntersect [_intercectPoint, _supportPos]) then
    {
        _finalAirports pushBack _x;
    };
} forEach _availableAirports;

private _spawnMarker = "";

if(count _finalAirports == 0) then
{
    _spawnMarker = [_availableAirports, _supportPos] call BIS_fnc_nearestPosition;
}
else
{
    if(count _finalAirports == 1) then
    {
        _spawnMarker = _finalAirports select 0;
    }
    else
    {
        _spawnMarker = [_finalAirports, _supportPos] call BIS_fnc_nearestPosition;
    };
};

private _coverageMarker = createMarker [format ["%1_coverage", _supportName], _supportPos];
_coverageMarker setMarkerShape "ELLIPSE";
_coverageMarker setMarkerBrush "Grid";
if(_side == Occupants) then
{
    _coverageMarker setMarkerColor colorOccupants;
}
else
{
    _coverageMarker setMarkerColor colorInvaders;
};
_coverageMarker setMarkerSize [8000, 8000];
_coverageMarker setMarkerAlpha 0;

if(_side == Occupants) then
{
    occupantsSAMTimer set [0, time + (3600 * 2)];
}
else
{
    invadersSAMTimer set [0, time + (3600 * 2)];
};

private _spawnPos = getMarkerPos _spawnMarker;

private _launcher = objNull;
if(_side == Occupants) then
{
    _launcher = ["B_SAM_System_03_F", _spawnPos, 50, 5, true] call A3A_fnc_safeVehicleSpawn;
}
else
{
    _launcher = ["O_SAM_System_04_F", _spawnPos, 50, 5, true] call A3A_fnc_safeVehicleSpawn;
};
createVehicleCrew _launcher;
_launcher setVariable ["side", _side];

_launcher addEventHandler ["Fired",
{
    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
    [_unit, _projectile] spawn
    {
        params ["_unit", "_projectile"];
        private _target = _unit getVariable ["currentTarget", objNull];
        if (isNull _target) exitWith {};

        private _textMarker = createMarker [format ["%1_text_%2", _supportName, _rounds], getPos _target];
        _textMarker setMarkerShape "ICON";
        _textMarker setMarkerType "mil_objective";
        _textMarker setMarkerText "SAM Target";

        if(_unit getVariable "side" == Occupants) then
        {
            _textMarker setMarkerColor colorOccupants;
        }
        else
        {
            _textMarker setMarkerColor colorInvaders;
        };
        _textMarker setMarkerAlpha 0;

        _unit setVariable ["currentTextmarker", _textMarker];
        [_projectile, _textMarker] spawn
        {
            params ["_projectile", "_textMarker"];
            waitUntil {sleep 1; (isNull _projectile) || !{alive _projectile}};
            deleteMarker _textMarker;
        };
    };
}];

private _setupTime = 1368 - ((tierWar - 1) * 102);
private _minSleepTime = (1 - (tierWar - 1) * 0.1) * _setupTime;
private _sleepTime = _minSleepTime + random (_setupTime - _minSleepTime);

[_sleepTime, _launcher, _side, _supportName] spawn A3A_fnc_SUP_SAMRoutine;

private _result = [_coverageMarker, _minSleepTime, _setupTime];
_result;
