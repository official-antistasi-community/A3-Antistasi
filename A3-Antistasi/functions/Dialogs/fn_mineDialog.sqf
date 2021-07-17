private ["_typeX","_costs","_positionTel","_quantity","_quantityMax"];

if ("Mines" in A3A_activeTasks) exitWith {[localize "STR_antistasi_journal_entry_header_commander_10", localize "STR_antistasi_customHint_minefields_one"] call A3A_fnc_customHint;};

if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {[localize "STR_antistasi_journal_entry_header_commander_10", localize "STR_antistasi_customHint_minefields_noradio"] call A3A_fnc_customHint;} else {["Minefields", "You need a Radio Man in your group to be able to give orders to other squads"] call A3A_fnc_customHint;}};

_typeX = _this select 0;

_costs = (2*(server getVariable (SDKExp select 0))) + ([vehSDKTruck] call A3A_fnc_vehiclePrice);
_hr = 2;
if (_typeX == "delete") then
	{
	_costs = _costs - (server getVariable (SDKExp select 0));
	_hr = 1;
	};
if ((server getVariable "resourcesFIA" < _costs) or (server getVariable "hr" < _hr)) exitWith {[localize "STR_antistasi_journal_entry_header_commander_10", format [localize "STR_antistasi_customHint_minefields_no_resources",_costs,_hr]] call A3A_fnc_customHint;};

if (_typeX == "delete") exitWith
	{
	[localize "STR_antistasi_journal_entry_header_commander_10", localize "STR_antistasi_customHint_minefields_HC"] call A3A_fnc_customHint;
	[[],"A3A_fnc_mineSweep"] remoteExec ["A3A_fnc_scheduler",2];
	};

#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

_pool = jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT;
_quantity = 0;
_quantityMax = 40;
_typeM =APERSMineMag;
if (_typeX == "ATMine") then
	{
	_quantityMax = 20;
	_typeM = ATMineMag;
	};

{
if (_x select 0 == _typeM) exitWith {_quantity = _x select 1}
} forEach _pool;

if (_quantity < 5) exitWith {[localize "STR_antistasi_journal_entry_header_commander_10",format [localize "STR_antistasi_customHint_minefields_no_mine",5]] call A3A_fnc_customHint;};

if (!visibleMap) then {openMap true};
positionTel = [];
[localize "STR_antistasi_journal_entry_header_commander_10", localize "STR_antistasi_customHint_minefields_map"] call A3A_fnc_customHint;

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