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

[_typeAmmunition,_rounds,_artyArrayDef1,_artyRoundsArr1,_positionTel,_positionTel2] spawn A3A_fnc_artySupportFire;
