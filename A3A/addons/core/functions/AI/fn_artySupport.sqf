#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _titleStr = localize "STR_A3A_fn_ai_artySupport_title";

if (count hcSelected player == 0) exitWith {[_titleStr, localize "STR_A3A_fn_ai_artySupport_select"] call A3A_fnc_customHint;};

private ["_groups","_artyArray","_artyRoundsArr","_hasAmmunition","_areReady","_hasArtillery","_areAlive","_soldierX","_veh","_typeAmmunition","_typeArty","_positionTel","_artyArrayDef1","_artyRoundsArr1","_piece","_isInRange","_positionTel2","_rounds","_roundsMax","_markerX","_size","_forcedX","_textX","_mrkFinal","_mrkFinal2","_mrkEllipse2","_mrkBarrageLine","_timeX","_eta","_countX","_pos","_ang"];

_groups = hcSelected player;
_unitsX = [];
{_groupX = _x;
{_unitsX pushBack _x} forEach units _groupX;
} forEach _groups;
typeAmmunition = nil;
_artyArray = [];
_artyRoundsArr = [];

_hasAmmunition = 0;
_areReady = false;
_hasArtillery = false;
_areAlive = false;

{
_soldierX = _x;
_veh = vehicle _soldierX;
if ((_veh != _soldierX) and (not(_veh in _artyArray))) then
	{
	if (( "Artillery" in (getArray (configfile >> "CfgVehicles" >> typeOf _veh >> "availableForSupportTypes")))) then
		{
		_hasArtillery = true;
		if ((canFire _veh) and (alive _veh) and (isNil "typeAmmunition")) then
			{
			_areAlive = true;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
			_nul = createDialog "mortar_type";
#endif
			waitUntil {!dialog or !(isNil "typeAmmunition")};
			if !(isNil "typeAmmunition") then
				{
				_typeAmmunition = typeAmmunition;
				//typeAmmunition = nil;
			//	};
			//if (! isNil "_typeAmmunition") then
				//{
				{
				if (_x select 0 == _typeAmmunition) then
					{
					_hasAmmunition = _hasAmmunition + 1;
					};
				} forEach magazinesAmmo _veh;
				};
			if (_hasAmmunition > 0) then
				{
				if (unitReady _veh) then
					{
					_areReady = true;
					_artyArray pushBack _veh;
					_artyRoundsArr pushBack (((magazinesAmmo _veh) select 0)select 1);
					};
				};
			};
		};
	};
} forEach _unitsX;

if (!_hasArtillery) exitWith {[_titleStr, localize "STR_A3A_fn_ai_artySupport_selectOr"] call A3A_fnc_customHint;};
if (!_areAlive) exitWith {[_titleStr, localize "STR_A3A_fn_ai_artySupport_cannotfire"] call A3A_fnc_customHint;};
if ((_hasAmmunition < 2) and (!_areReady)) exitWith {[_titleStr, localize "STR_A3A_fn_ai_artySupport_noammo"] call A3A_fnc_customHint;};
if (!_areReady) exitWith {[_titleStr, localize "STR_A3A_fn_ai_artySupport_busy"] call A3A_fnc_customHint;};
if (_typeAmmunition == "") exitWith {[_titleStr, localize "STR_A3A_fn_ai_artySupport_modno"] call A3A_fnc_customHint;};
if (isNil "_typeAmmunition") exitWith {};

hcShowBar false;
hcShowBar true;

if (_typeAmmunition != "2Rnd_155mm_Mo_LG") then
	{
	closedialog 0;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	_nul = createDialog "strike_type";
#endif
	}
else
	{
	typeArty = "NORMAL";
	};

waitUntil {!dialog or (!isNil "typeArty")};

if (isNil "typeArty") exitWith {};

_typeArty = typeArty;
typeArty = nil;


positionTel = [];

[_titleStr, localize "STR_A3A_fn_ai_artySupport_selectposstart"] call A3A_fnc_customHint;

if (!visibleMap) then {openMap true};
onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (!visibleMap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_positionTel = positionTel;

_artyArrayDef1 = [];
_artyRoundsArr1 = [];

for "_i" from 0 to (count _artyArray) - 1 do
	{
	_piece = _artyArray select _i;
	_isInRange = _positionTel inRangeOfArtillery [[_piece], ((getArtilleryAmmo [_piece]) select 0)];
	if (_isInRange) then
		{
		_artyArrayDef1 pushBack _piece;
		_artyRoundsArr1 pushBack (_artyRoundsArr select _i);
		};
	};

if (count _artyArrayDef1 == 0) exitWith {[_titleStr, localize "STR_A3A_fn_ai_artySupport_oob"] call A3A_fnc_customHint;};

private _mrkEllipse1 = createMarkerLocal [format ["Arty%1", random 100], _positionTel];
_mrkEllipse1 setMarkerShapeLocal "ELLIPSE";
_mrkEllipse1 setMarkerBrushLocal "FDIAGONAL";
_mrkEllipse1 setMarkerSizeLocal [30, 30];        // actually a radius
_mrkEllipse1 setMarkerColor "ColorGUER";
_mrkFinal = createMarkerLocal [format ["Arty%1", random 100], _positionTel];
_mrkFinal setMarkerShapeLocal "ICON";
_mrkFinal setMarkerTypeLocal "hd_destroy";
_mrkFinal setMarkerColor "ColorBlack";

positionTel2 = [];
if (_typeArty == "BARRAGE") then
	{
	_mrkFinal setMarkerText localize "STR_A3A_fn_ai_artySupport_mrkFinal";

	[_titleStr, localize "STR_A3A_fn_ai_artySupport_selectposend"] call A3A_fnc_customHint;

	if (!visibleMap) then {openMap true};
	onMapSingleClick "positionTel2 = _pos;";

	waitUntil {sleep 1; (count positionTel2 > 0) or (!visibleMap)};
	onMapSingleClick "";
	};
private _positionTel2 = positionTel2;

if ((_typeArty == "BARRAGE") and (count _positionTel2 < 2)) exitWith {deleteMarker _mrkFinal; deleteMarker _mrkEllipse1}; // map was closed after initial target selection

if (_typeArty != "BARRAGE") then
	{
	if (_typeAmmunition != "2Rnd_155mm_Mo_LG") then
		{
		closedialog 0;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
		_nul = createDialog "rounds_number";
#endif
		}
	else
		{
		roundsX = 1;
		};
	waitUntil {!dialog or (!isNil "roundsX")};
	};

if ((isNil "roundsX") and (_typeArty != "BARRAGE")) exitWith {deleteMarker _mrkFinal; deleteMarker _mrkEllipse1};

if (_typeArty != "BARRAGE") then
	{
	_mrkFinal setMarkerText localize "STR_A3A_fn_ai_artySupport_artyStrike";
	_rounds = roundsX;
	_roundsMax = _rounds;
	roundsX = nil;
	}
else
	{
	_rounds = round (_positionTel distance _positionTel2) / 10;
	_roundsMax = _rounds;
	};

/*_markerX = [markersX,_positionTel] call BIS_fnc_nearestPosition;
_size = [_markerX] call A3A_fnc_sizeMarker;
_forcedX = false;

if ((not(_markerX in forcedSpawn)) and (_positionTel distance (getMarkerPos _markerX) < _size) and ((spawner getVariable _markerX != 0))) then
	{
	_forcedX = true;
	forcedSpawn pushBack _markerX;
	publicVariable "forcedSpawn";
	};
*/

_roundPlural = if (round _rounds == 1) then {localize "STR_A3A_fn_ai_artySupport_singleRound"} else {localize "STR_A3A_fn_ai_artySupport_multiRound"};
_textX = format [localize "STR_A3A_fn_ai_artySupport_fireMission", mapGridPosition _positionTel, round _rounds, _roundPlural];
[theBoss,"sideChat",_textX] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];

if (_typeArty == "BARRAGE") then
	{
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
	private _barrageMarkers = [_mrkFinal,_mrkEllipse1,_mrkFinal2,_mrkEllipse2,_mrkBarrageLine];
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
	} else {_mrkEllipse1 setMarkerText localize "STR_A3A_fn_ai_artySupport_artyStrike";};

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
	_eta = (_artyArrayDef1 select 0) getArtilleryETA [_positionTel, ((getArtilleryAmmo [(_artyArrayDef1 select 0)]) select 0)];
	_timeX = time + _eta - 5;
	if (isNil "_timeX") exitWith {
        #define ARTILLERY_ERROR_INFORMATION [_positionTel, ((getArtilleryAmmo [(_artyArrayDef1 select 0)]) select 0)]
        Error_4("Params: %1,%2,%3,%4,%5",_artyArrayDef1 select 0,_positionTel,((getArtilleryAmmo [(_artyArrayDef1 select 0)]) select 0),(_artyArrayDef1 select 0) getArtilleryETA ARTILLERY_ERROR_INFORMATION);
    };
	_roundPlural = if ((_roundsMax - _rounds) == 1) then {localize "STR_A3A_fn_ai_artySupport_singleRound"} else {localize "STR_A3A_fn_ai_artySupport_multiRound"};
	_textX = format [localize "STR_A3A_fn_ai_artySupport_yesSingle",round _eta,_roundsMax - _rounds, _roundPlural];
	[petros,"sideChat",_textX] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
	waitUntil {sleep 1; time > _timeX};
	[petros,"sideChat",localize "STR_A3A_fn_ai_artySupport_splash"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
	sleep 10;
	deleteMarker _mrkFinal;
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