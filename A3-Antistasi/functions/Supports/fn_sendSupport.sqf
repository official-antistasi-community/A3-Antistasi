/*
Author: Wurzel0701
    Sends the given support to the given position

Arguments:
    <OBJECT> The target object that should be supported against
    <NUMBER> The precision that should be used against the target (range 0 - 4)
    <ARRAY<STRING>> The list of possible supports (first available send)
    <SIDE> The side which should send the support (cannot be teamPlayer)
    <NUMBER> The reveal value for this support (range 0 - 1)

Return Value:
    <NIL>

Scope: Server
Environment: Scheduled
Public: Yes
Dependencies:
    <SIDE> teamPlayer
    <BOOL> supportCallInProgress
    <SIDE> Occupants
    <ARRAY> occupantsSupports
    <ARRAY> invadersSupports

Example:
[player, 2, ["QRF", "AIRSTRIKE"], Occupants, 0.75] call A3A_fnc_sendSupport;
*/

params
[
    "_target",
    ["_precision", 0, [0]],
    ["_supportTypes", [], [[]]],
    ["_side", sideEnemy, [sideEnemy]],
    ["_revealCall", 0, [0]]
];

private _fileName = "sendSupport";

//Ensure this is running on the main server, otherwise it will break
if(!isServer) exitWith
{
    [1, format ["SendSupport tried to execute on %1, which is not the hosting server!", clientOwner], _fileName] call A3A_fnc_log;
    _this remoteExec ["A3A_fnc_sendSupport", 2];
};

if(_side == teamPlayer) exitWith {};

waitUntil {sleep 0.1; !supportCallInProgress};
supportCallInProgress = true;

//Calculate deprecision on position
private _deprecisionRange = random (150 - ((_precision/4) * (_precision/4) * 125));
private _randomDir = random 360;
private _supportPos = _target getPos [_deprecisionRange, _randomDir];

//Search for any support already active in the area matching the _supportTypes
private _supportObject = "";
private _supportType = "";
private _blockedSupports = [];

private _supportArray = if(_side == Occupants) then {occupantsSupports} else {invadersSupports};
{
    _supportType = _x;
    private _index = -1;
    _index = _supportArray findIf {((_x select 0) == _supportType) && {_supportPos inArea (_x select 1)}};

    if((_index != -1) && {_supportType in ["AIRSTRIKE", "QRF"]}) then
    {
        [2, format ["Blocking %1 support for given position, as another support of this type is near", _supportType], _fileName] call A3A_fnc_log;
        _index = -1;
        _blockedSupports pushBack _supportType;
    };

    if(_index != -1) exitWith
    {
        _supportObject = _supportArray select _index select 2;
    };
} forEach _supportTypes;


//Support is already in the area, send instructions to them
if (_supportObject != "") exitWith
{
    supportCallInProgress = false;
    if(_supportType != "QRF") then
    {
        [
            2,
            format ["Support of type %1 is already in the area, transmitting attack orders", _supportType],
            _fileName
        ] call A3A_fnc_log;

        //Attack with already existing support
        if(_supportType in ["MORTAR"]) then
        {
            //Areal support methods, transmit position info
            [_supportObject, [_supportPos, _precision], _revealCall] call A3A_fnc_addSupportTarget;
        };
        if(_supportType in ["CAS", "ASF", "SAM", "GUNSHIP", "MISSILE", "CAS"]) then
        {
            //Target support methods, transmit target info
            [_supportObject, [_target, _precision], _revealCall] call A3A_fnc_addSupportTarget;
        };
    };
};
//Delete blocked supports
_supportTypes = _supportTypes - _blockedSupports;

private _selectedSupport = "";
private _timerIndex = -1;
{
    _timerIndex = [_x, _side, _supportPos] call A3A_fnc_supportAvailable;
    if (_timerIndex != -1) exitWith
    {
        _selectedSupport = _x;
    };
} forEach _supportTypes;

if(_selectedSupport == "") exitWith
{
    [2, format ["No support available to support at %1", _supportPos], _fileName] call A3A_fnc_log;
    supportCallInProgress = false;
};

[2, format ["Sending support type %1 to help at %2", _selectedSupport, _supportPos], _fileName] call A3A_fnc_log;

if(_selectedSupport in ["MORTAR", "QRF", "AIRSTRIKE", "ORBSTRIKE", "CARPETBOMB"]) then
{
    //Areal support methods, transmit position info
    [_side, _timerIndex, _selectedSupport, _supportPos, _precision, _revealCall] spawn A3A_fnc_createSupport;
};
if(_selectedSupport in ["CAS", "ASF", "SAM", "GUNSHIP", "MISSILE"]) then
{
    //Target support methods, transmit target info
    [_side, _timerIndex, _selectedSupport, _target, _precision, _revealCall] spawn A3A_fnc_createSupport;
};

//Blocks the same support for ten minutes or until a new support happens
server setVariable ["lastSupport", [_selectedSupport, time + 600], true];
