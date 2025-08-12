params ["_newPosition", "_isNewGame"];

// Update cur/old HQ knowledge. Shouldn't be interrupted
isNil {
	if (_isNewGame) exitWith {};
	private _oldPos = markerPos "Synd_HQ";
	_oldPos set [2, A3A_curHQInfoOcc];
	A3A_oldHQInfoOcc pushBack +_oldPos;
	A3A_curHQInfoOcc = 0;
	{
		private _dist = _x distance2d _newPosition;
		A3A_curHQInfoOcc = A3A_curHQInfoOcc max linearConversion [0, 1000, _dist, _x#2, 0, true];
	} forEach A3A_oldHQInfoOcc;

	_oldPos set [2, A3A_curHQInfoInv];
	A3A_oldHQInfoInv pushBack +_oldPos;
	A3A_curHQInfoInv = 0;
	{
		private _dist = _x distance2d _newPosition;
		A3A_curHQInfoInv = A3A_curHQInfoInv max linearConversion [0, 1000, _dist, _x#2, 0, true];
	} forEach A3A_oldHQInfoInv;
};

respawnTeamPlayer setMarkerPos _newPosition;
posHQ = _newPosition; publicVariable "posHQ";
"Synd_HQ" setMarkerPos _newPosition;
chopForest = false; publicVariable "chopForest";

[respawnTeamPlayer, 1, teamPlayer] call A3A_fnc_setMarkerAlphaForSide;
[respawnTeamPlayer, 1, civilian] call A3A_fnc_setMarkerAlphaForSide;

// Move headless client logic objects near HQ so that firedNear EH etc. work more reliably
private _hcpos = _newPosition vectorAdd [-100, -100, 0];
{ _x setPosATL _hcpos } forEach (entities "HeadlessClient_F");

private _alignNormals = {
	private _thing = _this;
	_thing setVectorUp surfaceNormal getPos _thing;
};

private _firePos = [_newPosition, 3, getDir petros] call BIS_Fnc_relPos;
//Extra height on the fire to avoid it clipping into the ground
fireX setPos (_firePos vectorAdd [0,0,0.1]);
_rnd = getdir petros;
_pos = [_firePos, 3, _rnd] call BIS_Fnc_relPos;
boxX setPos _pos;
_rnd = _rnd + 45;
_pos = [_firePos, 3, _rnd] call BIS_Fnc_relPos;
mapX setDir ([_firePos, _pos] call BIS_fnc_dirTo);
mapX setPos _pos;
_rnd = _rnd + 45;
_pos = [_firePos, 3, _rnd] call BIS_Fnc_relPos;
_emptyPos = _pos findEmptyPosition [0,50,(typeOf flagX)];
_pos = if (count _emptyPos > 0) then {_emptyPos} else {_pos};
flagX setPos _pos;
_rnd = _rnd + 45;
_pos = [_firePos, 3, _rnd] call BIS_Fnc_relPos;
vehicleBox setPos _pos;

//Align with ground. Deliberately ignoring flagX, because a flag pole at 45 degrees looks /weird/
{_x call _alignNormals} forEach [fireX, boxX, mapX, vehicleBox];

boxX hideObjectGlobal false;
vehicleBox hideObjectGlobal false;
mapX hideObjectGlobal false;
fireX hideObjectGlobal false;
flagX hideObjectGlobal false;


