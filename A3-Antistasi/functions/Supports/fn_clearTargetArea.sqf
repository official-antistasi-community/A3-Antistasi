/*
Author: Wurzel0701
    Forces all units of the given side (and maybe civs) to move out of the given
    area. As AI sucks, these are still most likely to be bombed/mortared/orbital
    striked into the shadow realm

Arguments:
    <SIDE> The side that should flee, Occupants include civ
    <MARKER> The area that should be cleared

Return Value:
    <NIL>

Scope: Server
Environment: Any
Public: Yes/No
Dependencies:
    <SIDE> Occupants

Example:
    [Occupants, _myTargetMarker] call A3A_fnc_clearTargetArea
*/

params
[
    ["_side", sideUnknown, [sideUnknown]],
    ["_targetArea", "", [""]]
];

private _targetPoint = getMarkerPos _targetArea;
private _targetSize = getMarkerSize _targetArea;
_targetSize = (_targetSize select 0) max (_targetSize select 1);

private _fleeingSides = [_side];
if(_side == Occupants) then
{
    _fleeingSides pushBack civilian;
};

{
    if(((side (group _x)) in _fleeingSides) && {_x inArea _targetArea}) then
    {
        private _dir = _targetPoint getDir (getPos _x);
        private _pos = _x getPos [_dir, (_targetSize + 10 + random 25)];
        _x doMove _pos;
    };
} forEach allUnits;
