// Delete unspawned minor sites near a (major) marker that changed side

params ["_marker"];

private _markerSide = sidesX getVariable _marker;
private _size = [700, 1000] select (_marker in airportsX);
private _indexes = controlsX inAreaArrayIndexes [markerPos _marker, _size, _size];

// Two-pass, avoid changing controlsX live
private _toDelete = _indexes apply { controlsX select _x } select {
    sidesX getVariable _x != _markerSide			// should always be true, but whatever
};

{
    if (_x in A3A_markersToDelete) then { continue };
    isNil { [_x, true] call A3A_fnc_garrisonServer_clear };         // calls deleteMinorSite after clearing garrison
} forEach _toDelete;
