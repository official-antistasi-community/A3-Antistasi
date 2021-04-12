/*
Author: Wurzel0701
    Adds a given target to the given support

Arguments:
    <STRING> The name of the support
    <ARRAY<OBJECT|POSITION, NUMBER>> The target object or position and the support precision (range 0 - 4)
    <NUMBER> The reveal value of the call (range 0 - 1)

Return Value:
    <NIL>

Scope: Server
Environment: Scheduled
Public: No
Dependencies:
    <BOOL> supportTargetsChanging

Example:
    ["CAS0", [_myCar, 3], 0.75] spawn A3A_fnc_addSupportTarget;
*/

params
[
    ["_supportName", "", [""]],
    ["_targetParams", [], [[]]],
    ["_revealCall", 0, [0]]
];

private _fileName = "addSupportTarget";

//Wait until no targets are changing
if(supportTargetsChanging) then
{
    waitUntil {!supportTargetsChanging};
};
supportTargetsChanging = true;

private _fileName = "addSupportTarget";
private _targetList = server getVariable [format ["%1_targets", _supportName], []];

if((_targetParams select 0) isEqualType []) then
{
    private _targetPos = _targetParams select 0;
    private _index = _targetList findIf {((_x select 0 select 0) distance2D _targetPos) < 25};
    if(_index == -1) then
    {
        _targetList pushBack [_targetParams, _revealCall];
        server setVariable [format ["%1_targets", _supportName], _targetList, true];
        [2, format ["Added fire order %1 to %2s target list", _targetParams, _supportName], _fileName] call A3A_fnc_log;
    }
    else
    {
        [2, format ["Couldnt add target %1 as another target is already in the area", _targetPos], _fileName] call A3A_fnc_log;
    };
}
else
{
    private _isInList = false;
    {
        if((_x select 0 select 0) == (_targetParams select 0)) exitWith
        {
            _isInList = true;
        };
    } forEach _targetList;
    if !(_isInList) then
    {
        _targetList pushBack [_targetParams, _revealCall];
        server setVariable [format ["%1_targets", _supportName], _targetList, true];
        [3, format ["Added fire order %1 to %2s target list", _targetParams, _supportName], _fileName] call A3A_fnc_log;
    }
    else
    {
        [2, format ["Couldnt add target %1 as target is already in the list", _targetParams select 0], _fileName] call A3A_fnc_log;
    };
};

supportTargetsChanging = false;
