#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
scriptName "fn_placementSelection.sqf";
private _newGame = isNil "placementDone";
private _disabledPlayerDamage = false;

if (_newGame) then {
    Info("New session selected");
	localize "STR_antistasi_customHint_startPosition" hintC [localize "STR_antistasi_customHint_startPosition_text"];
} else {
	player allowDamage false;
	_disabledPlayerDamage = true;
	format [localize "STR_antistasi_customHint_carry_dead",name petros] hintC format [localize "STR_antistasi_customHint_startPosition_petrosDead",name petros];
};

hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload",{
	0 = _this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];

private _markersX = markersX select {sidesX getVariable [_x,sideUnknown] != teamPlayer};

if (_newGame) then {
	_markersX = _markersX - controlsX;
	openMap true;
} else {
	_markersX = _markersX - (controlsX select {!isOnRoad (getMarkerPos _x)});
	openMap [true,true];
};
private _mrkDangerZone = [];

{
	_mrk = createMarkerLocal [format ["%1dumdum", count _mrkDangerZone], getMarkerPos _x];
	_mrk setMarkerShapeLocal "ELLIPSE";
	_mrk setMarkerSizeLocal [500,500];
	_mrk setMarkerTypeLocal "hd_warning";
	_mrk setMarkerColorLocal "ColorRed";
	_mrk setMarkerBrushLocal "DiagGrid";
	_mrkDangerZone pushBack _mrk;
} forEach _markersX;

private _positionClicked = [];
private _positionIsInvalid = true;

while {_positionIsInvalid} do {
	positionClickedDuringHQPlacement = [];
	onMapSingleClick "positionClickedDuringHQPlacement = _pos;";
	waitUntil {sleep 1; (count positionClickedDuringHQPlacement > 0) or (not visiblemap)};
	onMapSingleClick "";

	//If they quit the map, keep HQ where it is.
	if (not visiblemap) exitWith {};

	//Assume the position chosen is valid.
	_positionIsInvalid = false;

	_positionClicked = positionClickedDuringHQPlacement;
	_markerX = [_markersX,_positionClicked] call BIS_fnc_nearestPosition;

	if (getMarkerPos _markerX distance _positionClicked < 500) then {
		[localize "STR_antistasi_customHint_HQ_position", localize "STR_antistasi_customHint_HQ_close"] call A3A_fnc_customHint;
		_positionIsInvalid = true;
	};

	if (!_positionIsInvalid && {surfaceIsWater _positionClicked}) then {
		[localize "STR_antistasi_customHint_HQ_position", localize "STR_antistasi_customHint_HQ_water"] call A3A_fnc_customHint;
		_positionIsInvalid = true;
	};

	if (!_positionIsInvalid && (_positionClicked findIf { (_x < 0) || (_x > worldSize)} != -1)) then {
		[localize "STR_antistasi_customHint_HQ_position", localize "STR_antistasi_customHint_HQ_outside"] call A3A_fnc_customHint;
		_positionIsInvalid = true;
	};

	if (!_positionIsInvalid && !_newGame) then {
		//Invalid if enemies nearby
		_positionIsInvalid = (allUnits findIf {(side _x == Occupants || side _x == Invaders) && {_x distance _positionClicked < 500}}) > -1;
		if (_positionIsInvalid) then {[localize "STR_antistasi_customHint_HQ_position", localize "STR_antistasi_customHint_HQ_enemy"] call A3A_fnc_customHint;};
	};
	sleep 0.1;
};

//If we're still in the map, we chose a place.
if (visiblemap) then {
	if (_newGame) then {
		{
			if (getMarkerPos _x distance _positionClicked < distanceSPWN) then {
				sidesX setVariable [_x,teamPlayer,true];
			};
		} forEach controlsX;
		petros setPos _positionClicked;
	} else {
		_controlsX = controlsX select {!(isOnRoad (getMarkerPos _x))};
		{
			if (getMarkerPos _x distance _positionClicked < distanceSPWN) then {
				sidesX setVariable [_x,teamPlayer,true];
			};
		} forEach _controlsX;
		[_positionClicked] remoteExec ["A3A_fnc_createPetros", 2];
	};
	[_positionClicked] call A3A_fnc_relocateHQObjects;
	//If it's a new game, we teleport everyone to new HQ, yay!
	if (_newGame) then {
		{
			if ((side _x == teamPlayer) or (side _x == civilian)) then {
				_x setPos getPos petros;
			};
		} forEach (call A3A_fnc_playableUnits);
	};
	openmap [false,false];
};

if (_disabledPlayerDamage) then {player allowDamage true};

{deleteMarkerLocal _x} forEach _mrkDangerZone;
"Synd_HQ" setMarkerPos (getMarkerPos respawnTeamPlayer);
posHQ = getMarkerPos respawnTeamPlayer; publicVariable "posHQ";
if (_newGame) then {placementDone = true; publicVariable "placementDone"};
chopForest = false; publicVariable "chopForest";
