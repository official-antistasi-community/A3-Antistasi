//TODO: add header

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_typeX","_costs","_positionTel","_quantity","_quantityMax"];
private _titleStr = localize "STR_A3A_fn_dialogs_minediag_title";

if ("Mines" in A3A_activeTasks) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_minediag_no_one"] call A3A_fnc_customHint;};

if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {[_titleStr, localize "STR_A3A_fn_dialogs_minediag_no_radio"] call A3A_fnc_customHint;} 
else {[_titleStr, localize "STR_A3A_fn_dialogs_minediag_no_radioman"] call A3A_fnc_customHint;}};

_typeX = _this select 0;

_costs = 2*(server getVariable FactionGet(reb,"unitExp")) + ([(FactionGet(reb,"vehiclesTruck")) # 0] call A3A_fnc_vehiclePrice);
_hr = 2;
if (_typeX == "delete") then
	{
	_costs = _costs - (server getVariable FactionGet(reb,"unitExp"));
	_hr = 1;
	};
if ((server getVariable "resourcesFIA" < _costs) or (server getVariable "hr" < _hr)) exitWith {[_titleStr, format [localize "STR_A3A_fn_dialogs_minediag_no_resource",_costs,_hr]] call A3A_fnc_customHint;};

if (_typeX == "delete") exitWith
	{
	[_titleStr, localize "STR_A3A_fn_dialogs_minediag_available"] call A3A_fnc_customHint;
	[[],"A3A_fnc_mineSweep"] remoteExec ["A3A_fnc_scheduler",2];
	};

#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

_pool = jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT;
_quantity = 0;
_quantityMax = 40;
_typeM =FactionGet(reb,"mineAPERS");
if (_typeX == "ATMine") then
	{
	_quantityMax = 20;
	_typeM = FactionGet(reb,"mineAT");
	};

{
if (_x select 0 == _typeM) exitWith {_quantity = _x select 1}
} forEach _pool;

if (_quantity < 5 && _quantity isNotEqualTo -1) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_minediag_timer"] call A3A_fnc_customHint;};

if (!visibleMap) then {openMap true};
positionTel = [];
[_titleStr, localize "STR_A3A_fn_dialogs_minediag_click"] call A3A_fnc_customHint;

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_positionTel = positionTel;

if (_quantity > _quantityMax) then
	{
	_quantity = _quantityMax;
	};

[[_typeX,_positionTel,_quantity],"A3A_fnc_buildMinefield"] remoteExec ["A3A_fnc_scheduler",2];
