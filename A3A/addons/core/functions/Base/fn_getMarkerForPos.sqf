// Needs to return *smallest* marker that the position is in
// which is annoying because that's end-to-start.
// only supported & used for rebel garrisons at the moment

params ["_pos"];

// posts always smallest, so check those first
private _nearPosts = outpostsFIA inAreaArrayIndexes [_pos, 30, 30] apply { outpostsFIA#_x };
if (_nearPosts isNotEqualTo []) exitWith { _nearPosts#0 };

private _nearMarkers = markersX inAreaArrayIndexes [_pos, 600, 600] apply { markersX#_x };
if (A3A_petrosMoving) then { _nearMarkers = _nearMarkers - ["Synd_HQ"] };
private _inIndex = _nearMarkers findIf { _pos inArea _x };
if (_inIndex == -1) exitWith { "" };
_nearMarkers # _inIndex;

/* Slow version for unsorted markers
private _inMarkers = markersX select { _pos inArea _x };
_inMarkers append (outpostsFIA select { _pos inArea _x });
if (_inMarkers isEqualTo []) exitWith {""};

private _minSize = 1e7;
private _smallest = "";
{
    private _size = vectorMagnitude markerSize _x;
    if (_size < _minSize) then { _smallest = _x; _minSize = _size };
} forEach _inMarkers;

_smallest;
*/

// ok, sooo....
// outpostsFIA always smaller so check those first?
// also, always the same size, so can just use inAreaArray

// everything else, do 600m check with inAreaArrayIndexes


