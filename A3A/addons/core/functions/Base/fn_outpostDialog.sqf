// Note: delete case is dead and has been for a very long time

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

waitUntil {sleep 0.1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

if (_typeX == "delete") exitWith {[_titleStr, localize "STR_A3A_fn_base_createoutpfia_outdated"] call A3A_fnc_customHint;};

[positionTel] remoteExec ["A3A_fnc_createOutpostsFIA", 2];
