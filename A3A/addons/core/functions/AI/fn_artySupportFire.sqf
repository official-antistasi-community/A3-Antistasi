#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define BARRAGEINTERVAL 10

params ["_units","_typeAmmunition","_shortName","_strikeType","_rounds","_startPos","_detail"];
private _mainFuncParams = _this;
diag_log _this;

private _ang = 0;

_roundPlural = if (round _rounds == 1) then {localize "STR_A3A_fn_ai_artySupport_singleRound"} else {localize "STR_A3A_fn_ai_artySupport_multiRound"};
_textX = format [localize "STR_A3A_fn_ai_artySupport_fireMission", mapGridPosition _startPos, round _rounds, _roundPlural];
[theBoss,"sideChat",_textX] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];

private _fnc_manageMarkers = {
	params ["_mainParams","_strikeTime"];
	_mainParams params ["_group","_typeAmmunition","_shortName","_strikeType","_rounds","_startPos","_detail"];
	private _fnc_makeEllipse = {
		params ["_mrkEllipse", ["_strikeType", "point"],["_detail", 30]];
		_mrkEllipse setMarkerShapeLocal "ELLIPSE";
		_mrkEllipse setMarkerBrushLocal "FDIAGONAL";
		private _radius = [30, _detail] select (_strikeType == "suppress");
		_mrkEllipse setMarkerSizeLocal [_radius, _radius];
		_mrkEllipse1 setMarkerColor "ColorGUER";
	};
	private _fnc_makeFinal = {
		_mrkFinal1 setMarkerShapeLocal "ICON";
		_mrkFinal1 setMarkerTypeLocal "hd_dot";
		_mrkFinal1 setMarkerColor "ColorBlack";
	};
	private _mrkEllipse1 = createMarkerLocal [format ["Arty%1", random 100], _startPos];
	[_mrkEllipse1] call _fnc_makeEllipse;
	private _mrkFinal1 = createMarkerLocal [format ["Arty%1", random 100], _startPos];
	[_mrkFinal1] call _fnc_makeFinal;
	private _markers = [_mrkEllipse1, _mrkFinal1];
	private _notiString = "";
	switch (_strikeType) do {
		case ("point"): 
		{
			private _mrkText1 = format ["Point strike: %1x %2", str _rounds, _shortName];
			_mrkFinal1 setMarkerText _mrkText1;
			_notiString = format ["point strike: %1x %2", str _rounds, _shortName];
		};
		case ("barrage"): 
		{
			private _endPos = _detail;
			private _mrkEllipse2 = createMarkerLocal [format ["Arty%1", random 100], _endPos];
			[_mrkEllipse2] call _fnc_makeEllipse;
			private _mrkFinal2 = createMarkerLocal [format ["Arty%1", random 100], _endPos];
			[_mrkFinal2] call _fnc_makeFinal;
			_ang = [_startPos,_endPos] call BIS_fnc_dirTo;
			_barrageCenterX = (_startPos#0 + _endPos#0)/2;
			_barrageCenterY = (_startPos#1 + _endPos#1)/2;
			private _mrkBarrageLine = createMarkerLocal [format ["ArtyBarrage%1", random 100], [_barrageCenterX,_barrageCenterY]];
			_mrkBarrageLine setMarkerShapeLocal "RECTANGLE";
			_mrkBarrageLine setMarkerDirLocal _ang;
			_mrkBarrageLine setMarkerColorLocal "ColorGUER";
			_mrkBarrageLine setMarkerBrushLocal "FDIAGONAL";
			_distance = _startPos distance2D _endPos;
			_mrkBarrageLine setMarkerSize [30, _distance/2];
			private _mrkTextBarrage = format ["Barrage: %1x %2", str _rounds, _shortName];
			_mrkBarrageLine setMarkerText _mrkTextBarrage;
			_markers append [_mrkBarrageLine, _mrkEllipse2, _mrkFinal2];
			_notiString = _mrkTextBarrage;
		};
		case ("suppress"): 
		{
			private _mrkText1 = format ["Mortar suppression: %1x %2", str _rounds, _shortName];
			_mrkFinal1 setMarkerText _mrkText1;
			_mrkEllipse setMarkerSize [_detail, _detail];
			_notiString = format ["suppression: %1x %2", str _rounds, _shortName]; 
		};
		case ("cont"): 
		{
			private _mrkText1 = format ["Continuous fire: 1 %1 every %2s", _shortName, str _detail];
			_mrkFinal1 setMarkerText _mrkText1;
			_notiString = format ["continuous fire: %1x %2", str _rounds, _shortName];
		};
	};
	//Broadcast message to nearby players
	private _fullNotiString = ["Mortars inbound",_notiString] joinString ", ";
	private _nearbyPlayers = allPlayers select {(_x distance2D _startPos) <= 500};
	if(count _nearbyPlayers > 0) then
	{
		["MessageHQ", [_fullNotiString]] remoteExec ["BIS_fnc_showNotification",_nearbyPlayers];
	};
	waitUntil {sleep 1; time > _strikeTime};
	[petros,"sideChat",localize "STR_A3A_fn_ai_artySupport_splash"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
	sleep _rounds*4;
	{deleteMarker _x} forEach _markers;
};

private _eta = (_units#0) getArtilleryETA [_startPos, ((getArtilleryAmmo [_units#0])#0)];
_textX = if (_rounds == 1) then {
	format ["Acknowledged. Fire mission is inbound. ETA %1 secs to impact.",round _eta];
} else {
	format [localize "STR_A3A_fn_ai_artySupport_yesBarrage",round _eta]
};
[petros,"sideChat",_textX] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
private _strikeTime = time + _eta;
[_mainFuncParams, _strikeTime] spawn _fnc_manageMarkers;

_startPos = [_startPos,random 10,random 360] call BIS_fnc_relPos; // close by target position, they're not 100% accurate

private _intervalHM = createHashMapFromArray [
		["point",2],
		["barrage",3],
		["suppress",10],
		["cont", _detail]
	];
private _interval = _intervalHM get _strikeType;
private _roundsPerUnit = floor (_rounds / (count _units));
private _ang = if (_strikeType == "barrage") then {[_startPos,_detail] call BIS_fnc_dirTo;} else {9};
{
	diag_log _this;
	[_x, _roundsPerUnit, _typeAmmunition, _strikeType, _startPos, _interval, _ang, _detail] spawn {
		diag_log _this;
		params ["_piece", "_rounds", "_ammo", "_strikeType", "_startPos", "_interval", "_ang"," _radius"];
		private _pos = [_startPos,random 10,random 360] call BIS_fnc_relPos; // close by target position, they're not 100% accurate;
		for "_r" from 1 to _rounds do
		{
			_piece commandArtilleryFire [_pos,_ammo,1];
			if (_strikeType == "barrage") then
			{
				_pos = [_pos,BARRAGEINTERVAL,_ang + 5 - (random 10)] call BIS_fnc_relPos;
			};
			if (_strikeType == "suppress") then 
			{
				_pos = [_startPos,_radius, random 360] call BIS_fnc_relPos
			};
			sleep _interval;
			waitUntil {sleep 0.1; _piece weaponReloadingTime [gunner _piece, currentWeapon _piece] == 0};
		};
	};
} forEach _units; // all mortar gunners	