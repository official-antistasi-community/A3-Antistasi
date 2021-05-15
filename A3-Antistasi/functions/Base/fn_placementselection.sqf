#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
scriptName "fn_placementSelection.sqf";
private _newGame = isNil "placementDone";
private _disabledPlayerDamage = false;
private _markersX = markersX select {sidesX getVariable [_x,sideUnknown] != teamPlayer};

hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload",{
	0 = _this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];

if (_newGame) then {
	ServerInfo("New Session Selected");
	"Initial HQ Placement Selection" hintC ["Click on the Map Position you want to start the Game.","Close the map with M to start in the default position.","Don't select areas with enemies nearby!!\n\nGame experience changes a lot on different starting positions."];
	_markersX = _markersX - controlsX;
	openMap true;

} else {
	player allowDamage false;
	_disabledPlayerDamage = true;
	ServerInfo("Petros is dead, Setting new HQ Location.");
	format ["%1 is Dead",name petros] hintC format ["%1 has been killed. You lost part of your assets and need to select a new HQ position far from the enemies.",name petros];
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
	
	//Assume the position chosen is valid.
	_positionIsInvalid = false;
	
	_positionClicked = positionClickedDuringHQPlacement;
	_markerX = [_markersX,_positionClicked] call BIS_fnc_nearestPosition;
	
	switch (true) do {
		case (not visiblemap):
			{
				ServerError("HQ Placement cancelled, defaulting to last location.");
				_positionIsInvalid = false;
			};
		case (getMarkerPos _markerX distance _positionClicked < 500): 
			{
				ServerError("HQ Placement too near Enemy zones.");
				["HQ Position", "Place selected is very close to enemy zones.<br/><br/> Please select another position"] call A3A_fnc_customHint;
				_positionIsInvalid = true; 
			};
		case (!_positionIsInvalid && {surfaceIsWater _positionClicked}): 
			{
				ServerError("HQ Placement in Water.");
				["HQ Position", "Selected position cannot be in water"] call A3A_fnc_customHint;
				_positionIsInvalid = true;
			};
		case (!_positionIsInvalid && (_positionClicked findIf { (_x < 0) || (_x > worldSize)} != -1)):
			{
				ServerError("HQ Placement attempted out of Map.");
				["HQ Position", "Selected position cannot be outside the map"] call A3A_fnc_customHint;
				_positionIsInvalid = true;
			};
		case ((allUnits findIf {(side _x == Occupants || side _x == Invaders) && {_x distance _positionClicked < 500}}) > -1):
			{
				ServerError("HQ Placement attempted near Enemy Forces.");
				["HQ Position", "Enemy detected near chosen deployment"] call A3A_fnc_customHint;
				_positionIsInvalid = true;
			};
		default
			{
				ServerError("HQ Placement chosen, setting up.");
				_positionIsInvalid = false;
			};
	};
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
		// New game, Teleport Everyone to Starting base.
		sleep 1;
		{
			if ((side _x == teamPlayer) or (side _x == civilian)) then {
				_x setPos getPos petros;
			};
		} forEach (call A3A_fnc_playableUnits);
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
	openmap [false,false];
};

if (_disabledPlayerDamage) then {player allowDamage true};

{deleteMarkerLocal _x} forEach _mrkDangerZone;
"Synd_HQ" setMarkerPos (getMarkerPos respawnTeamPlayer);
posHQ = getMarkerPos respawnTeamPlayer; publicVariable "posHQ";
if (_newGame) then {placementDone = true; publicVariable "placementDone"};
chopForest = false; publicVariable "chopForest";
