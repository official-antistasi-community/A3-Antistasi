#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
#include "..\..\..\gui\dialogues\ids.inc" // include new UI ids for update
private ["_typeX","_positionTel","_nearX","_garrison","_costs","_hr","_size"];
private _titleStr = localize "STR_A3A_fn_reinf_garrDia_title";

_typeX = _this select 0;
params [["_typeX","add"],["_marker",""]];
private _noMarker = (_marker isEqualTo "");
if (_noMarker) then { // is normal mode
	if (_typeX == "add") then {[_titleStr, localize "STR_A3A_fn_reinf_garrDia_zone_add"] call A3A_fnc_customHint;} else {[_titleStr, localize "STR_A3A_fn_reinf_garrDia_zone_remove"] call A3A_fnc_customHint;};

	if (!visibleMap) then {openMap true};
	positionTel = [];

	onMapSingleClick "positionTel = _pos;";

	waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
	onMapSingleClick "";
};
if (!visibleMap && _noMarker) exitWith {};
if (_noMarker) then {
	_positionTel = positionTel;
	positionXGarr = "";
	_nearX = [markersX,_positionTel] call BIS_fnc_nearestPosition;
} else {
	_nearX = _marker;
	_typeX = "rem";
};

_positionX = getMarkerPos _nearX;

if (_noMarker && {getMarkerPos _nearX distance _positionTel > 40}) exitWith { // lazy eval
	[_titleStr, localize "STR_A3A_fn_reinf_garrDia_zone_click"] call A3A_fnc_customHint;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	if (_noMarker) then {_nul=CreateDialog "build_menu"};
#endif
};

if (not(sidesX getVariable [_nearX,sideUnknown] == teamPlayer)) exitWith {
	[_titleStr, format [localize "STR_A3A_fn_reinf_garrDia_zone_belong",FactionGet(reb,"name")]] call A3A_fnc_customHint;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	if (_noMarker) then {_nul=CreateDialog "build_menu"};
#endif
};
if ([_positionX] call A3A_fnc_enemyNearCheck) exitWith {
	[_titleStr, localize "STR_A3A_fn_reinf_garrDia_no_enemy"] call A3A_fnc_customHint;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	if (_noMarker) then {_nul=CreateDialog "build_menu"};
#endif
};

if (_nearX in forcedSpawn) exitWith {
	[_titleStr, localize "STR_A3A_fn_reinf_garrDia_no_att"] call A3A_fnc_customHint;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	if (_noMarker) then {_nul=CreateDialog "build_menu"};
#endif
};

//if (((_nearX in outpostsFIA) and !(isOnRoad _positionX)) /*or (_nearX in citiesX)*/ or (_nearX in controlsX)) exitWith {hint "You cannot manage garrisons on this kind of zone"; _nul=CreateDialog "garrison_menu"};
_outpostFIA = (_nearX in outpostsFIA);
_wPost = (_outpostFIA and !(isOnRoad getMarkerPos _nearX));
_garrison = if (! _wpost) then {garrison getVariable [_nearX,[]]} else {FactionGet(reb,"groupSniper")};

if (_wPost && (_typeX isNotEqualTo "rem")) exitWith {
	[_titleStr, localize "STR_A3A_fn_reinf_garrDia_no_wPost"] call A3A_fnc_customHint;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	if (_noMarker) then {_nul=CreateDialog "build_menu"};
#endif
};

if (_typeX == "rem") then
	{
	if ((count _garrison == 0) and !(_nearX in outpostsFIA)) exitWith {
		[_titleStr, localize "STR_A3A_fn_reinf_garrDia_no_troops"] call A3A_fnc_customHint;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	if (_noMarker) then {_nul=CreateDialog "build_menu"};
#endif
	};
	_costs = 0;
	_hr = 0;
	{
	if (_x == FactionGet(reb,"unitCrew")) then {if (_outpostFIA) then {_costs = _costs + ([(FactionGet(reb,"vehiclesLightArmed")) # 0] call A3A_fnc_vehiclePrice)} else {_costs = _costs + ([(FactionGet(reb,"staticMortars")) # 0] call A3A_fnc_vehiclePrice)}};
	_hr = _hr + 1;
	_costs = _costs + (server getVariable [_x,0]);
	} forEach _garrison;
	[_hr,_costs] remoteExec ["A3A_fnc_resourcesFIA",2];
	if (_outpostFIA) then
		{
		garrison setVariable [_nearX,nil,true];
		outpostsFIA = outpostsFIA - [_nearX]; publicVariable "outpostsFIA";
		markersX = markersX - [_nearX]; publicVariable "markersX";
		deleteMarker _nearX;
		sidesX setVariable [_nearX,nil,true];
		}
	else
		{
		garrison setVariable [_nearX,[],true];
		//[_nearX] call A3A_fnc_mrkUpdate;
		//[_nearX] remoteExec ["tempMoveMrk",2];
		{if (_x getVariable ["markerX",""] == _nearX) then {deleteVehicle _x}} forEach allUnits;
		};
	[_nearX] call A3A_fnc_mrkUpdate;
	[_titleStr, format [localize "STR_A3A_fn_reinf_garrDia_removed",_costs,_hr]] call A3A_fnc_customHint;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	if (_noMarker) then {_nul=CreateDialog "build_menu"};
#endif
	}
else
	{
	positionXGarr = _nearX;
	publicVariable "positionXGarr";
	[_titleStr, format ["Info%1",[_nearX] call A3A_fnc_garrisonInfo]] call A3A_fnc_customHint;
	closeDialog 0;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	if (_noMarker) then {_nul=CreateDialog "garrison_recruit"};
#endif
	sleep 1;
	disableSerialization;

	_display = findDisplay 100;

	if (str (_display) != "no display") then
		{
		private _unitCost = localize "STR_A3A_fn_reinf_garrisonDialog_cost";
		private _unitCostFull = [_unitCost + ": %1 €"];
		_ChildControl = _display displayCtrl 104;
		_ChildControl  ctrlSetTooltip format [_unitCostFull,server getVariable FactionGet(reb,"unitRifle")];
		_ChildControl = _display displayCtrl 105;
		_ChildControl  ctrlSetTooltip format [_unitCostFull,server getVariable FactionGet(reb,"unitMG")];
		_ChildControl = _display displayCtrl 126;
		_ChildControl  ctrlSetTooltip format [_unitCostFull,server getVariable FactionGet(reb,"unitMedic")];
		_ChildControl = _display displayCtrl 107;
		_ChildControl  ctrlSetTooltip format [_unitCostFull,server getVariable FactionGet(reb,"unitSL")];
		_ChildControl = _display displayCtrl 108;
		_ChildControl  ctrlSetTooltip format [_unitCostFull,(server getVariable FactionGet(reb,"unitCrew")) + ([(FactionGet(reb,"staticMortars")) # 0] call A3A_fnc_vehiclePrice)];
		_ChildControl = _display displayCtrl 109;
		_ChildControl  ctrlSetTooltip format [_unitCostFull,server getVariable FactionGet(reb,"unitGL")];
		_ChildControl = _display displayCtrl 110;
		_ChildControl  ctrlSetTooltip format [_unitCostFull,server getVariable FactionGet(reb,"unitSniper")];
		_ChildControl = _display displayCtrl 111;
		_ChildControl  ctrlSetTooltip format [_unitCostFull,server getVariable FactionGet(reb,"unitLAT")];
		_ChildControl = _display displayCtrl 112;
		_ChildControl  ctrlSetTooltip format [_unitCostFull,server getVariable FactionGet(reb,"unitAT")];
		_ChildControl = _display displayCtrl 113;
		_ChildControl  ctrlSetTooltip format [_unitCostFull,server getVariable FactionGet(reb,"unitAA")];
		};
	};

disableSerialization;

private _display = findDisplay A3A_IDD_HQDIALOG; // if garrison menu open, update
if !(isNull _display) then {
	["updateGarrisonTab"] call A3A_GUI_fnc_hqDialog;
	private _garrisonMap = _display displayCtrl A3A_IDC_GARRISONMAP;
	_garrisonMap setVariable ["selectedMarker", ""]; // fix bug where garrison map would reset to 0 0 on dismiss
};