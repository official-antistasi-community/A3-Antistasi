params ["_markerX", ["_ignoreFrontier", false]];

if ("carrier" in _markerX) exitWith { 0 };

private _frontierX = if (_ignoreFrontier) then { false } else { [_markerX] call A3A_fnc_isFrontline };

if (_markerX in citiesX) exitWith {
    private _numCiv = server getVariable _markerX select 0;       // should be city pop?
    2 * ceil (sqrt _numCiv / 2);
};

if (_markerX in controlsX) exitWith {
    if (isOnRoad markerPos _markerX) then {6} else {8};
};

if (_markerX in outpostsFIA or _markerX == "SyndHQ") exitWith { 0 };

private _size = [_markerX] call A3A_fnc_sizeMarker;
private _groups = 0;
if (_markerX in airportsX) then
{
    _groups = 2 + round (_size/30);
    _groups = _groups min 11;
    if (_frontierX) then {_groups = _groups + 3};
}
else
{
    if (_markerX in outposts) then
    {
        _groups = 1 + round (_size/30);
        _buildings = nearestObjects [getMarkerPos _markerX,(["Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_Communication_F"]) + A3A_milBuildingWhitelist, _size];
        if (count _buildings > 0) then {_groups = _groups + 2};
        _groups = _groups min 7;
        if (_frontierX) then {_groups = _groups + 2};
    }
    else
    {
        _groups = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {1 + round (_size/45)} else {1 + round (_size/30)};
        _groups = _groups min 5;
        if (_frontierX) then {_groups = _groups + 1};
    };
};
_groups = _groups + 2;          // adjustment because patrols are no longer free

4 * (_groups max 2);
