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

//diag_log format ["Path: Start %1, end %2", _startIndex, _endIndex];

private _endPos = NavGrid#_endIndex#0;
private _curEntry = [0, _startIndex, 0, 0, false];            // curGH is really (NavGrid#_startIndex#0 distance2d _endPos), but not accessed here
private _open = [];
private _touched = createHashMapFromArray [[_startIndex, true]];
private _success = false;

private ["_newIndex", "_newG", "_newH", "_newRealG"];      // optimization
private _roadTypeMul = [2,1,0.5];               // road type to distance multiplier lookup

scopeName "main";
while {!isNil "_curEntry"} do
{
    _curEntry params ["", "_curIndex", "_curG", "_realG"];        // full is [curGH, curIndex, curG, realG, curParent]
    //diag_log format ["Opened node %1 at %2, G %3, realG %4, GH %5", _curIndex, Navgrid#_curIndex#0, _curG, _realG, _curEntry#0];
    {
        _newIndex = _x#0;
        if (_newIndex in _touched) then { continue };
        if (_newIndex == _endIndex) then { _success = true; breakTo "main" };                            // found the end, done

        _newG = _curG + (_x#2) * (_roadTypeMul#(_x#1));
        _newRealG = _realG + (_x#2);
        _newH = 1.2*(NavGrid#_newIndex#0 distance _endPos);
        if (_newRealG + _newH < _maxDist) then { _open pushBack [_newG + _newH, _newIndex, _newG, _newRealG, _curEntry] };
        _touched set [_newIndex, true];

    } forEach (NavGrid#_curIndex#3);

    _open sort true;
    _curEntry = _open deleteAt 0;
};

if (!_success) exitWith {false};

// "Return" total real distance in maxdist input parameter
_this set [2, (_curEntry#3) + (NavGrid#(_curEntry#1)#0 distance2d NavGrid#_endIndex#0)];

// Walk parents to generate route
private _route = [_endIndex];
while {_curEntry#4 isEqualType []} do {
    _route pushBack (_curEntry select 1);
    _curEntry = _curEntry select 4;
};
_route pushBack _startIndex;
reverse _route;
_route;
