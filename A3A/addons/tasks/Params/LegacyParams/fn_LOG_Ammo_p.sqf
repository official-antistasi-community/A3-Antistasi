private _findIfNearAndHostile = {
	/*
	Input : single array of markers, do 'array + array' for multiple.
	Returns: array of markers within max mission distance and is not rebel.
	*/
	params ["_Markers"];
	_Markers select {(getMarkerPos _x distance2D getMarkerPos respawnTeamPlayer < distanceMission) && (sidesX getVariable [_x,sideUnknown] != teamPlayer)}
};

//Add unspawned outposts for ammo trucks, and seaports for salvage
_possibleMarkers = [outposts] call _findIfNearAndHostile;
_possibleMarkers = _possibleMarkers select {(_x in seaports) or (spawner getVariable _x != 0)};

if (_possibleMarkers isEqualTo []) exitWith {false};

selectRandom _possibleMarkers
