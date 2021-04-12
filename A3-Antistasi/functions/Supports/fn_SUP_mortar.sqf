params ["_side", "_timerIndex", "_supportPos", "_supportName"];

/*  Places the mortar used for fire support and initializes them

    Execution on: Server

    Scope: Internal

    Params:
        _side: SIDE : The side for which the support should be called in
        _timerIndex: NUMBER
        _supportPos: POSITION : The position the mortar should be able to target
        _supportName: STRING : The call name of the mortar support

    Returns:
        The name of the marker, covering the whole support area
*/

private _fileName = "SUP_mortar";
private _mortarType = if(_side == Occupants) then {NATOMortar} else {CSATMortar};
private _shellType = SDKMortarHEMag;
private _isMortar = true;

//If war level between 6 and 8 there is a chance (25%/50%/75%) that it switches to a howitzer instead, above it howitzer is guaranteed
if((25 * (tierWar - 5)) > random 100) then
{
    _mortarType = if(_side == Occupants) then {vehNATOMRLS} else {vehCSATMRLS};
    _shellType = if(_side == Occupants) then {vehNATOMRLSMags} else {vehCSATMRLSMags};
    _isMortar = false;
};

[2, format ["Mortar support %1 will be carried out by a %2 with %3 mags", _supportName, _mortarType, _shellType], _fileName] call A3A_fnc_log;

private _mortar = objNull;
private _spawnRadius = 5;
private _spawnPos = [];
private _spawnDir = 0;


if(_isMortar) then
{
    //Search for a outpost, that isnt more than 2 kilometers away, which isnt spawned
    private _possibleBases = (outposts + airportsX) select
    {
        (sidesX getVariable [_x, sideUnknown] == _side) &&
        {((getMarkerPos _x) distance2D _supportPos <= 3000) &&
        {spawner getVariable [_x, -1] == 2}}
    };

    if(count _possibleBases == 0) exitWith {};

    //Search for an outpost with a designated mortar position if possible
    private _index = -1;
    private _spawnParams = -1;
    {
        _spawnParams = [_x, "Mortar"] call A3A_fnc_findSpawnPosition;
        if (_spawnParams isEqualType []) exitWith
        {
            //Will occupy a mortar spawn position until the outpost spawnes in and despawns again (Currently we dont spawn mortars at outposts anyways)
            _spawnRadius = 0;
            _index = _forEachIndex;
        };
        [_x] spawn A3A_fnc_freeSpawnPositions;
    } forEach _possibleBases;

    if(_index != -1) then
    {
        _spawnPos = _spawnParams select 0;
        _spawnDir = _spawnParams select 1;
    }
    else
    {
        private _base = selectRandom _possibleBases;
        _spawnPos = getMarkerPos _base;
    };
}
else
{
    private _possibleBases = airportsX select
    {
        (sidesX getVariable [_x, sideUnknown] == _side) &&
        {((getMarkerPos _x) distance2D _supportPos <= 10000) &&
        {((getMarkerPos _X) distance2D _supportPos > 2000) &&
        {spawner getVariable [_x, -1] == 2}}}
    };

    if(count _possibleBases == 0) exitWith {};

    private _base = selectRandom _possibleBases;
    _spawnPos = getMarkerPos _base;
    _spawnDir = random 360;
    _spawnRadius = 50;
};

if(_spawnPos isEqualTo []) exitWith
{
    [2, format ["Couldn't spawn in mortar %1, no suitable position found!", _supportName], _fileName] call A3A_fnc_log;
    ["", 0, 0];
};

//Spawn in mortar
_mortar = [_mortarType, _spawnPos, _spawnRadius, 5, true] call A3A_fnc_safeVehicleSpawn;

//Spawn in crew
private _mortarGroup = createVehicleCrew _mortar;

_mortar setVariable ["shellType", _shellType, true];

//Creates the marker which coveres the area in which the support can help
private _coverageMarker = createMarker [format ["%1_coverage", _supportName], getPos _mortar];
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

private _timerArray = if(_side == Occupants) then {occupantsMortarTimer} else {invadersMortarTimer};
if(_isMortar) then
{
    _coverageMarker setMarkerSize [3000, 3000];
    _timerArray set [_timerIndex, time + 3600];
}
else
{
    _coverageMarker setMarkerSize [10000, 10000];
    _timerArray set [_timerIndex, time + 7200];
};

_coverageMarker setMarkerAlpha 0;

_mortar setVariable ["TimerArray", _timerArray, true];
_mortar setVariable ["TimerIndex", _timerIndex, true];

//Setting up the EH for support destruction
_mortar addEventHandler
[
    "Killed",
    {
        params ["_mortar"];
        ["TaskSucceeded", ["", "Mortar Support Destroyed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
        private _timerArray = _mortar getVariable "TimerArray";
        private _timerIndex = _mortar getVariable "TimerIndex";
        _timerArray set [_timerIndex, (_timerArray select _timerIndex) + 7200];
    }
];

_mortar addEventHandler
[
    "GetIn",
    {
        params ["_vehicle", "_role", "_unit", "_turret"];
        if(side (group _unit) == teamPlayer) then
        {
            ["TaskSucceeded", ["", "Mortar Support Stolen"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
            _vehicle setVariable ["Stolen", true, true];
            _vehicle removeAllEventHandlers "GetIn";
            private _timerArray = _vehicle getVariable "TimerArray";
            private _timerIndex = _vehicle getVariable "TimerIndex";
            _timerArray set [_timerIndex, (_timerArray select _timerIndex) + 7200];
        };
    }
];

_mortarGroup setVariable ["Mortar", _mortar, true];
{
    _x addEventHandler
    [
        "Killed",
        {
            params ["_unit"];
            private _group = group _unit;
            if({alive _x} count (units _group) == 0) then
            {
                ["TaskSucceeded", ["", "Mortar Support crew killed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
                private _mortar = _group getVariable "Mortar";
                private _timerArray = _mortar getVariable "TimerArray";
                private _timerIndex = _mortar getVariable "TimerIndex";
                _timerArray set [_timerIndex, (_timerArray select _timerIndex) + 3600];
            };
        }
    ];
} forEach (units _mortarGroup);

private _setupTime = 900 - ((tierWar - 1) * 75);
private _minSleepTime = (1 - (tierWar - 1) * 0.1) * _setupTime;
private _sleepTime = _minSleepTime + random (_setupTime - _minSleepTime);

_mortarGroup deleteGroupWhenEmpty true;
[_mortar, _mortarGroup, _supportName, _side, _sleepTime] spawn A3A_fnc_SUP_mortarRoutine;

private _result = [_coverageMarker, _minSleepTime, _setupTime];
_result;
