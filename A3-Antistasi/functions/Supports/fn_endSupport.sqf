/*
Author: Wurzel0701
    Ends the given support and deletes all the related data

Arguments:
    <STRING> The name of the support that should end
    <SIDE> The side the support belongs to
    <NUMBER> The amount of minutes to wait before deleting the support data (can be 0)

Return Value:
    <NIL>

Scope: Server
Environment: Any
Public: No
Dependencies:
    <NAMESPACE> server
    <SIDE> Occupants
    <ARRAY> occupantsSupports
    <ARRAY> invadersSupports

Example:
["MORTAR0", Occupants, 0] call A3A_fnc_endSupport;
*/

params
[
    ["_supportName", "", [""]],
    ["_side", sideEnemy, [sideEnemy]],
    ["_timeTillExecution", 0, [0]]
];

private _fileName = "endSupport";
if(_supportName == "" || _side == sideEnemy) exitWith
{
    [1, format ["Bad input, was %1", _this], _fileName] call A3A_fnc_log;
};

if(_timeTillExecution != 0) then
{
    sleep (_timeTillExecution * 60);
};

server setVariable [format ["%1_targets", _supportName], nil, true];

if (_side == Occupants) then
{
    private _index = occupantsSupports findIf {(_x select 2) == _supportName};
    occupantsSupports deleteAt _index;
};

if(_side == Invaders) then
{
    private _index = invadersSupports findIf {(_x select 2) == _supportName};
    invadersSupports deleteAt _index;
};

deleteMarker (format ["%1_coverage", _supportName]);
deleteMarker (format ["%1_text", _supportName]);

[2, format ["Ended support and deleted data for %1", _supportName], _fileName] call A3A_fnc_log;
