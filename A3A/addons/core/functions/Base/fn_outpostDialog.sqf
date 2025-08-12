#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_typeX","_costs","_groupX","_unit","_radiusX","_roads","_road","_pos","_truckX","_textX","_mrk","_hr","_exists","_positionTel","_isRoad","_typeGroup","_resourcesFIA","_hrFIA"];
private _titleStr = localize "STR_A3A_fn_base_outpdiag_title";

if ("outpostsFIA" in A3A_activeTasks) exitWith {[_titleStr, localize "STR_A3A_fn_base_outpdiag_no_one"] call A3A_fnc_customHint;};
if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {[localize "STR_A3A_fn_base_outpdiag_radio", localize "STR_A3A_fn_base_outpdiag_no_radio"] call A3A_fnc_customHint;} 
else {[localize "STR_A3A_fn_base_outpdiag_radioman", localize "STR_A3A_fn_base_outpdiag_no_radioman"] call A3A_fnc_customHint;}};

_typeX = _this select 0;

if (!visibleMap) then {openMap true};
positionTel = [];
if (_typeX != "delete") then {[_titleStr, localize "STR_A3A_fn_base_outpdiag_click_position"] call A3A_fnc_customHint;} 
else {[_titleStr, localize "STR_A3A_fn_base_outpdiag_click_delete"] call A3A_fnc_customHint;};

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_positionTel = positionTel;
_pos = [];

if ((_typeX == "delete") and (count outpostsFIA < 1)) exitWith {[_titleStr, localize "STR_A3A_fn_base_outpdiag_no_delete"] call A3A_fnc_customHint;};
if ((_typeX == "delete") and ({(alive _x) and (!captive _x) and ((side _x == Occupants) or (side _x == Invaders)) and (_x distance _positionTel < 500)} count allUnits > 0)) exitWith {[_titleStr, localize "STR_A3A_fn_base_outpdiag_no_enemies"] call A3A_fnc_customHint;};

_costs = 0;
_hr = 0;

if (_typeX != "delete") then
	{
	_isRoad = isOnRoad _positionTel;

	_typeGroup = FactionGet(reb,"groupSniper");

	if (_isRoad) then
		{
		_typeGroup = FactionGet(reb,"groupAT");
		_costs = _costs + ([(FactionGet(reb,"vehiclesLightArmed")) # 0] call A3A_fnc_vehiclePrice) + (server getVariable FactionGet(reb,"unitCrew"));
		_hr = _hr + 1;
		};

	//_formatX = (configfile >> "CfgGroups" >> "teamPlayer" >> "Guerilla" >> "Infantry" >> _typeGroup);
	//_unitsX = [_formatX] call groupComposition;
	{_costs = _costs + (server getVariable _x); _hr = _hr +1} forEach _typeGroup;
	}
else
	{
	_mrk = [outpostsFIA,_positionTel] call BIS_fnc_nearestPosition;
	_pos = getMarkerPos _mrk;
	if (_positionTel distance _pos >10) exitWith {[_titleStr, localize "STR_A3A_fn_base_outpdiag_no_post"] call A3A_fnc_customHint;};
	};
//if ((_typeX == "delete") and (_positionTel distance _pos >10)) exitWith {hint "No post nearby"};

_resourcesFIA = server getVariable "resourcesFIA";
_hrFIA = server getVariable "hr";

if (((_resourcesFIA < _costs) or (_hrFIA < _hr)) and (_typeX!= "delete")) exitWith {[_titleStr, format [localize "STR_A3A_fn_base_outpdiag_no_resources",_hr,_costs]] call A3A_fnc_customHint;};

if (_typeX != "delete") then
	{
	[-_hr,-_costs] remoteExec ["A3A_fnc_resourcesFIA",2];
	};

 [_typeX,_positionTel] remoteExec ["A3A_fnc_createOutpostsFIA", 2];
