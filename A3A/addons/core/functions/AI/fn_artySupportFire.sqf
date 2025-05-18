#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_typeAmmunition","_rounds","_artyArrayDef1","_artyRoundsArr1","_positionTel",["_positionTel2",[]]];

private _typeArty = ["BARRAGE","NORMAL"] select (_positionTel2 isEqualTo []);
private _roundsMax = _rounds;
private _ang = 0;
private ["_mrkFinal1","_mrkFinal2","_mrkEllipse1","_mrkEllipse2","_mrkBarrageLine"];

_roundPlural = if (round _rounds == 1) then {localize "STR_A3A_fn_ai_artySupport_singleRound"} else {localize "STR_A3A_fn_ai_artySupport_multiRound"};
_textX = format [localize "STR_A3A_fn_ai_artySupport_fireMission", mapGridPosition _positionTel, round _rounds, _roundPlural];
[theBoss,"sideChat",_textX] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];

_mrkEllipse1 = createMarkerLocal [format ["Arty%1", random 100], _positionTel];
_mrkEllipse1 setMarkerShapeLocal "ELLIPSE";
_mrkEllipse1 setMarkerBrushLocal "FDIAGONAL";
_mrkEllipse1 setMarkerSizeLocal [30, 30];        // actually a radius
_mrkEllipse1 setMarkerColor "ColorGUER";
_mrkFinal1 = createMarkerLocal [format ["Arty%1", random 100], _positionTel];
_mrkFinal1 setMarkerShapeLocal "ICON";
_mrkFinal1 setMarkerTypeLocal "hd_destroy";
_mrkFinal1 setMarkerColor "ColorBlack";

if (_typeArty == "BARRAGE") then
	{
	_mrkFinal1 setMarkerText localize "STR_A3A_fn_ai_artySupport_mrkFinal";
	_mrkEllipse2 = createMarkerLocal [format ["Arty%1", random 100], _positionTel2];
	_mrkEllipse2 setMarkerShapeLocal "ELLIPSE";
	_mrkEllipse2 setMarkerBrushLocal "FDIAGONAL";
	_mrkEllipse2 setMarkerSizeLocal [30, 30];
	_mrkEllipse2 setMarkerColor "ColorGUER";
	_mrkFinal2 = createMarkerLocal [format ["Arty%1", random 100], _positionTel2];
	_mrkFinal2 setMarkerShapeLocal "ICON";
	_mrkFinal2 setMarkerTypeLocal "hd_destroy";
	_mrkFinal2 setMarkerColorLocal "ColorBlack";
	_mrkFinal2 setMarkerText localize "STR_A3A_fn_ai_artySupport_mrkFinal2";
	_ang = [_positionTel,_positionTel2] call BIS_fnc_dirTo;
	sleep 5;
	_barrageCenterX = (_positionTel#0 + _positionTel2#0)/2;
	_barrageCenterY = (_positionTel#1 + _positionTel2#1)/2;
	_mrkBarrageLine = createMarkerLocal [format ["ArtyBarrage%1", random 100], [_barrageCenterX,_barrageCenterY]];
	_mrkBarrageLine setMarkerShapeLocal "RECTANGLE";
	_mrkBarrageLine setMarkerDirLocal _ang;
	_mrkBarrageLine setMarkerColorLocal "ColorGUER";
	_mrkBarrageLine setMarkerBrushLocal "FDIAGONAL";
	_distance = _positionTel distance2D _positionTel2;
	_mrkBarrageLine setMarkerSize [30, _distance/2];
	private _barrageMarkers = [_mrkFinal1,_mrkEllipse1,_mrkFinal2,_mrkEllipse2,_mrkBarrageLine];
	_eta = (_artyArrayDef1 select 0) getArtilleryETA [_positionTel, ((getArtilleryAmmo [(_artyArrayDef1 select 0)]) select 0)];
	_timeX = time + _eta;
	_textX = format [localize "STR_A3A_fn_ai_artySupport_yesBarrage",round _eta];
	[petros,"sideChat",_textX] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
	[_timeX, _rounds, _barrageMarkers] spawn
		{
		params ["_timeX","_rounds", "_barrageMarkers"];
		waitUntil {sleep 1; time > _timeX};
		[petros,"sideChat",localize "STR_A3A_fn_ai_artySupport_splash"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
		private _sleepTime = _rounds*4;
		sleep _sleepTime;
		{deleteMarker _x;} forEach _barrageMarkers;
		};
	} else {_mrkFinal1 setMarkerText localize "STR_A3A_fn_ai_artySupport_artyStrike";};

//Broadcast message to nearby players
private _isSmoke = (_typeAmmunition in FactionGet(reb,"staticMortarMagSmoke"));
private _string = if (_isSmoke) then {
	["STR_A3A_fn_ai_artySupport_precisionHintSmoke","STR_A3A_fn_ai_artySupport_barrageHintSmoke"] select (_typeArty == "BARRAGE");
} else {
	["STR_A3A_fn_ai_artySupport_precisionHintHE","STR_A3A_fn_ai_artySupport_barrageHintHE"] select (_typeArty == "BARRAGE");
};
private _text = format [localize _string, mapGridPosition _positionTel];
private _nearbyPlayers = allPlayers select {(_x distance2D _positionTel) <= 500};
if(count _nearbyPlayers > 0) then
{
    ["MessageHQ", [_text]] remoteExec ["BIS_fnc_showNotification",_nearbyPlayers];
};

_pos = [_positionTel,random 10,random 360] call BIS_fnc_relPos;

for "_i" from 0 to (count _artyArrayDef1) - 1 do
	{
	if (_rounds > 0) then
		{
		_piece = _artyArrayDef1 select _i;
		_countX = _artyRoundsArr1 select _i;
		//hint format ["roundsX que faltan: %1, roundsX que tiene %2",_rounds,_countX];
		if (_countX >= _rounds) then
			{
			if (_typeArty != "BARRAGE") then
				{
				_piece commandArtilleryFire [_pos,_typeAmmunition,_rounds];
				}
			else
				{
				for "_r" from 1 to _rounds do
					{
					_piece commandArtilleryFire [_pos,_typeAmmunition,1];
					sleep 2;
					_pos = [_pos,10,_ang + 5 - (random 10)] call BIS_fnc_relPos;
					};
				};
			_rounds = 0;
			}
		else
			{
			if (_typeArty != "BARRAGE") then
				{
				_piece commandArtilleryFire [[_pos,random 10,random 360] call BIS_fnc_relPos,_typeAmmunition,_countX];
				}
			else
				{
				for "_r" from 1 to _countX do
					{
					_piece commandArtilleryFire [_pos,_typeAmmunition,1];
					sleep 2;
					_pos = [_pos,10,_ang + 5 - (random 10)] call BIS_fnc_relPos;
					};
				};
			_rounds = _rounds - _countX;
			};
		};
	};

if (_typeArty != "BARRAGE") then
	{
	sleep 5;
    diag_log _artyArrayDef1;
    diag_log (_artyArrayDef1 select 0);
    diag_log _positionTel;
    diag_log (getArtilleryAmmo [(_artyArrayDef1 select 0)]);
    diag_log ((_artyArrayDef1 select 0) getArtilleryETA [_positionTel, ((getArtilleryAmmo [(_artyArrayDef1 select 0)]) select 0)]);
	_eta = (_artyArrayDef1 select 0) getArtilleryETA [_positionTel, ((getArtilleryAmmo [(_artyArrayDef1 select 0)]) select 0)];
    diag_log _eta;
	_timeX = time + _eta - 5;
	_roundPlural = if ((_roundsMax - _rounds) == 1) then {localize "STR_A3A_fn_ai_artySupport_singleRound"} else {localize "STR_A3A_fn_ai_artySupport_multiRound"};
	_textX = format [localize "STR_A3A_fn_ai_artySupport_yesSingle",round _eta,_roundsMax - _rounds, _roundPlural];
	[petros,"sideChat",_textX] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
	waitUntil {sleep 1; time > _timeX};
	[petros,"sideChat",localize "STR_A3A_fn_ai_artySupport_splash"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
	sleep 10;
	deleteMarker _mrkFinal1;
	deleteMarker _mrkEllipse1;
	};

/*if (_forcedX) then
	{
	sleep 20;
	if (_markerX in forcedSpawn) then
		{
		forcedSpawn = forcedSpawn - [_markerX];
		publicVariable "forcedSpawn";
		};
	};
*/