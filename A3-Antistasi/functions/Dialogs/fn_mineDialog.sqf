#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _groupData = FactionGet(reb,"groups");
#define GROUP(VAR) (_groupData get VAR)
private ["_typeX","_costs","_positionTel","_quantity","_quantityMax"];

if ("Mines" in A3A_activeTasks) exitWith {["Minefields", "We can only deploy one minefield at a time."] call A3A_fnc_customHint;};

if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {["Minefields", "You need a radio in your inventory to be able to give orders to other squads"] call A3A_fnc_customHint;} else {["Minefields", "You need a Radio Man in your group to be able to give orders to other squads"] call A3A_fnc_customHint;}};

_typeX = _this select 0;

_costs = (2*(server getVariable GROUP("Exp"))) + ([FactionGet(reb,"vehicleTruck")] call A3A_fnc_vehiclePrice);
_hr = 2;
if (_typeX == "delete") then
	{
	_costs = _costs - (server getVariable GROUP("Exp"));
	_hr = 1;
	};
if ((server getVariable "resourcesFIA" < _costs) or (server getVariable "hr" < _hr)) exitWith {["Minefields", format ["Not enough resources to recruit a mine deploying team (%1 € and %2 HR needed)",_costs,_hr]] call A3A_fnc_customHint;};

if (_typeX == "delete") exitWith
	{
	["Minefields", "An Explosive Specialist is available on your High Command bar.<br/><br/>Send him anywhere on the map to deactivate mines. He will load his truck with mines he found.<br/><br/>Upon returning back to HQ he will unload mines stored in his vehicle."] call A3A_fnc_customHint;
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

if (_quantity < 5) exitWith {["Minefields", "You need at least 5 mines of this type to build a Minefield"] call A3A_fnc_customHint;};

if (!visibleMap) then {openMap true};
positionTel = [];
["Minefields", "Click on the position you wish to build the minefield."] call A3A_fnc_customHint;

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
