/*
    A3A_fnc_findPathSimple
    Find shortest path between two positions or nav indices using simple A*
    Takes account of road type

Parameters:
    <INTEGER|POS2D|STRING> Start marker, position or nav index.
    <INTEGER|POS2D|STRING> End marker, position or nav index.
    <SCALAR> Optional: Maximum travel distance in metres.

Returns:
    <ARRAY> Navgrid indices from start to end, or false if none found or max dist exceeded
*/

params ["_start", "_end", ["_maxDist", 1e5]];

private _startIndex = if (_start isEqualType 0) then { _start } else { [_start] call A3A_fnc_getNearestNavPoint };
private _endIndex = if (_end isEqualType 0) then { _end } else { [_end] call A3A_fnc_getNearestNavPoint };
if (_startIndex < 0 or _endIndex < 0) exitWith { false };
if (NavGrid#_startIndex#1 != NavGrid#_endIndex#1) exitWith { false };          // different islands, no route

// TODO: subtract start->nav and end->nav from distance? Or fancier?


private _endPos = NavGrid#_endIndex#0;
private _curEntry = [0, _startIndex, 0, false];            // curGH is really (NavGrid#_startIndex#0 distance2d _endPos), but not accessed here
private _open = [];
private _touched = createHashMapFromArray [[_startIndex, true]];
private _success = false;

private ["_newIndex", "_newG", "_newGH"];      // optimization
private _roadTypeMul = [2,1,0.5];               // road type to distance multiplier lookup

scopeName "main";
while {!isNil "_curEntry"} do
{
    _curEntry params ["", "_curIndex", "_curG"];        // full is [curGH, curIndex, curG, curParent]
    {
        _newIndex = _x#0;
        if (_newIndex in _touched) then { continue };
        if (_newIndex == _endIndex) then { _success = true; breakTo "main" };                            // found the end, done

        _newG = _curG + (_x#2) * (_roadTypeMul#(_x#1));
        _newGH = _newG + 1.2*(NavGrid#_newIndex#0 distance _endPos);
        if (_newGH < _maxDist) then { _open pushBack [_newGH, _newIndex, _newG, _curEntry] };
        _touched set [_newIndex, true];

    } forEach (NavGrid#_curIndex#3);

    _open sort true;
    _curEntry = _open deleteAt 0;
};

if (!_success) exitWith {false};

// Walk parents to generate route
private _route = [_endIndex];
while {_curEntry#3 isEqualType []} do {
    _route pushBack (_curEntry select 1);
    _curEntry = _curEntry select 3;
};
reverse _route;
