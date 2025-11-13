#define MINDISTMARKER 500
private _threatRad = distanceMission + MINDISTMARKER; 
private _threatPositions = (markersX + controlsX) apply { markerPos _x };
private _posHQ = markerPos respawnTeamPlayer; 
 
_threatPositions = _threatPositions inAreaArray [_posHQ, _threatRad, _threatRad]; 
private _num = 0; 
private _solution = false; 
 
while {_solution isEqualType false && {_num < 100}} do { 
	_num = _num + 1; 
	private _testPos =  _posHQ getPos [distanceMission * sqrt random 1, random 360]; 
	if (_threatPositions inAreaArray [_testPos, MINDISTMARKER, MINDISTMARKER] isNotEqualTo []) then { continue };
	if (surfaceIsWater _testPos) then { continue }; 
	_solution = _testPos; 
}; 
if (_solution isEqualType false) exitWith { false }; 
private _nearestMarker = [markersX + controlsX, _solution] call BIS_fnc_nearestPosition; 
private _side = sidesX getVariable _nearestMarker;
[_solution, _side]