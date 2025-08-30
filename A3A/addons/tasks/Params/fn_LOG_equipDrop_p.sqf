#define MINDISTHQ 750
#define MINDISTMARKER 750
private _startPos = getMarkerPos respawnTeamPlayer;
private _selPos = [0,0,0];
private _avoid = markersX + controlsX;
private _solution = false;
// 100 random positions
for "_i" from 1 to 100 do {
    _selPos = [_startPos, random 360, MINDISTHQ + random (distanceMission - MINDISTHQ)] call BIS_fnc_relPos;
    _nearestMarker = [_avoid, _selPos] call BIS_fnc_nearestPosition;
    if (getMarkerPos _nearestMarker distance2D _selPos > MINDISTMARKER) then {_solution = true; break};
};
if !(_solution) exitWith { false };
_selPos;