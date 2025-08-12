// Delete unspawned minor sites near a (major) marker that changed side

params ["_marker"];

private _markerSide = sidesX getVariable _marker;
private _size = [700, 1000] select (_marker in airportsX);
private _indexes = controlsX inAreaArrayIndexes [markerPos _marker, _size, _size];

// Issues: Shouldn't delete from hashmap live?
// can't delete unspawned sites, so need separate logic

// Two-pass, avoid changing controlsX live
private _toDelete = _indexes apply { controlsX select _x } select {
    sidesX getVariable _x != _markerSide			// should always be true, but whatever
    and spawner getVariable _x == 2 				// only delete unspawned, otherwise handled in createAIControls closedown
};

if (_toDelete isEqualTo []) exitWith {};

{ [_x] call A3A_fnc_deleteMinorSite } forEach _toDelete;
publicVariable "markersX";
publicVariable "controlsX";
