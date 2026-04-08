// Note: delete case is dead and has been for a very long time

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_typeX","_costs","_groupX","_unit","_radiusX","_roads","_road","_pos","_truckX","_textX","_mrk","_hr","_exists","_positionTel","_isRoad","_typeGroup","_resourcesFIA","_hrFIA"];
private _titleStr = localize "STR_A3A_fn_base_outpdiag_title";

if ("outpostsFIA" in A3A_activeTasks) exitWith {[_titleStr, localize "STR_A3A_fn_base_outpdiag_no_one"] call A3A_fnc_customHint;};
if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {[localize "STR_A3A_fn_base_outpdiag_radio", localize "STR_A3A_fn_base_outpdiag_no_radio"] call A3A_fnc_customHint;} 
else {[localize "STR_A3A_fn_base_outpdiag_radioman", localize "STR_A3A_fn_base_outpdiag_no_radioman"] call A3A_fnc_customHint;}};

_typeX = _this select 0;
if (_typeX == "delete") exitWith {[_titleStr, localize "STR_A3A_fn_base_createoutpfia_outdated"] call A3A_fnc_customHint;};

if (!visibleMap) then {openMap true};
positionTel = [];
if (_typeX != "delete") then {[_titleStr, localize "STR_A3A_fn_base_outpdiag_click_position"] call A3A_fnc_customHint;} 
else {[_titleStr, localize "STR_A3A_fn_base_outpdiag_click_delete"] call A3A_fnc_customHint;};

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 0.1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_positionTel = positionTel;
_pos = [];

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

	{_costs = _costs + (server getVariable _x); _hr = _hr +1} forEach _typeGroup;
	}


// Check for both marker name collision and nearby rebel posts
private _nearPosts = outpostsFIA inAreaArrayIndexes [_positionTel, 300, 300];
private _isNearMrk = format ["RebPost%1", mapGridPosition _positionTel] in outpostsFIA;
if (count _nearPosts > 0 or _isNearMrk) exitWith {
	[_titleStr, localize "STR_A3A_fn_base_createoutpfia_alreadynear"] call A3A_fnc_customHint;
};

_resourcesFIA = server getVariable "resourcesFIA";
_hrFIA = server getVariable "hr";
if (_resourcesFIA < _costs or _hrFIA < _hr) exitWith {[_titleStr, format [localize "STR_A3A_fn_base_outpdiag_no_resources",_hr,_costs]] call A3A_fnc_customHint;};
[-_hr,-_costs] remoteExec ["A3A_fnc_resourcesFIA",2];

[_typeX,_positionTel] remoteExec ["A3A_fnc_createOutpostsFIA", 2];
