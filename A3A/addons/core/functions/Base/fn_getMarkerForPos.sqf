
// Needs to return *smallest* marker that the position is in
// which is annoying because that's end-to-start.

params ["_pos"];

private _inMarkers = markersX select { _pos inArea _x };
if (_inMarkers isEqualTo []) exitWith {""};

private _minSize = 1e7;
private _smallest = "";
{
    private _size = (markerSize _x#0) * (markerSize _x#1);
    if (_size < _minSize) then { _smallest = _x; _minSize = _size };
} forEach _inMarkers;

_smallest;
