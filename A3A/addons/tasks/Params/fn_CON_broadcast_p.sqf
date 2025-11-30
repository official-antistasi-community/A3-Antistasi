_possibleMarkers = [];
//append occupants antennas to list
{
    private _nearbyMarker = [markersX, getPos _x] call BIS_fnc_nearestPosition;
    if (
        (sidesX getVariable [_nearbyMarker,sideUnknown] == Occupants)
        && (getPos _x distance getMarkerPos respawnTeamPlayer < distanceMission)
    ) then {_possibleMarkers pushBack [_nearbyMarker, _x]};
} forEach antennas;

_possibleMarkers = _possibleMarkers select {spawner getVariable _x != 0};
if (_possibleMarkers isEqualTo []) exitWith { false };
selectRandom _possibleMarkers;