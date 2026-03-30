/*
Author: Wurzel0701
    Trims a path down to its junction nodes for actual units

Arguments:
    <ARRAY> The path which should be trimmed

Return Value:
    <ARRAY> Simplified path

Scope: Any
Environment: Any
Public: No
Dependencies:
    <NULL>

Example:
    [_path] call A3A_fnc_trimPath;
*/

params [ ["_path", [], [[]]]];

//Skip first step if unneeded
if(count _path > 3) then
{
    private _firstVector = (_path select 1 select 0) vectorDiff (_path select 0 select 0);
    private _secondVector = (_path select 2 select 0) vectorDiff (_path select 1 select 0);

    if(_firstVector vectorDotProduct _secondVector <= 0) then
    {
        _path deleteAt 1;
    };
};

//Skip last step if unneeded
private _pathCount = count _path;
if(_pathCount > 5) then
{
    private _firstVector = (_path select (_pathCount - 2) select 0) vectorDiff (_path select (_pathCount - 1) select 0);
    private _secondVector = (_path select (_pathCount - 3) select 0) vectorDiff (_path select (_pathCount - 2) select 0);

    if(_firstVector vectorDotProduct _secondVector <= 0) then
    {
        _path deleteAt (_pathCount - 2);
    };
};

_path apply {_x#0};

/*
// Removes everything except junctions
private _simplifiedPath = [];
{
    if(_x select 1) then
    {
        _simplifiedPath pushBack (_x select 0);
    };
} forEach _path;
_simplifiedPath;
