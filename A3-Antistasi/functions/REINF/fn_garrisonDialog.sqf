private ["_typeX","_positionTel","_nearX","_garrison","_costs","_hr","_size"];
_typeX = _this select 0;

if (_typeX == "add") then {[localize "STR_antistasi_garrisons", localize "STR_antistasi_garrisons_maps_add"] call A3A_fnc_customHint;} else {[localize "STR_antistasi_garrisons", localize "STR_antistasi_garrisons_maps_remove"] call A3A_fnc_customHint;};

if (!visibleMap) then {openMap true};
positionTel = [];

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_positionTel = positionTel;
positionXGarr = "";

_nearX = [markersX,_positionTel] call BIS_fnc_nearestPosition;
_positionX = getMarkerPos _nearX;

if (getMarkerPos _nearX distance _positionTel > 40) exitWith {[localize "STR_antistasi_garrisons", localize "STR_antistasi_garrisons_marker"] call A3A_fnc_customHint; _nul=CreateDialog "build_menu";};

if (not(sidesX getVariable [_nearX,sideUnknown] == teamPlayer)) exitWith {[localize "STR_antistasi_garrisons", format [localize "STR_antistasi_garrisons_noBelong",nameTeamPlayer]] call A3A_fnc_customHint; _nul=CreateDialog "build_menu";};
if ([_positionX,500] call A3A_fnc_enemyNearCheck) exitWith {[localize "STR_antistasi_garrisons", localize "STR_antistasi_garrisons_enemyZone"] call A3A_fnc_customHint; _nul=CreateDialog "build_menu"};
//if (((_nearX in outpostsFIA) and !(isOnRoad _positionX)) /*or (_nearX in citiesX)*/ or (_nearX in controlsX)) exitWith {hint "You cannot manage garrisons on this kind of zone"; _nul=CreateDialog "garrison_menu"};
_outpostFIA = if (_nearX in outpostsFIA) then {true} else {false};
_wPost = if (_outpostFIA and !(isOnRoad getMarkerPos _nearX)) then {true} else {false};
_garrison = if (! _wpost) then {garrison getVariable [_nearX,[]]} else {SDKSniper};

if (_typeX == "rem") then
	{
	if ((count _garrison == 0) and !(_nearX in outpostsFIA)) exitWith {[localize "STR_antistasi_garrisons", localize "STR_antistasi_garrisons_noGar"] call A3A_fnc_customHint; _nul=CreateDialog "build_menu";};
	_costs = 0;
	_hr = 0;
	{
	if (_x == staticCrewTeamPlayer) then {if (_outpostFIA) then {_costs = _costs + ([vehSDKLightArmed] call A3A_fnc_vehiclePrice)} else {_costs = _costs + ([SDKMortar] call A3A_fnc_vehiclePrice)}};
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
	[localize "STR_antistasi_garrisons", format [localize"STR_antistasi_garrisons_moveHQ_remove",_costs,_hr]] call A3A_fnc_customHint;
	_nul=CreateDialog "build_menu";
	}
else
	{
	positionXGarr = _nearX;
	publicVariable "positionXGarr";
	[localize "STR_antistasi_garrisons", format ["Info%1",[_nearX] call A3A_fnc_garrisonInfo]] call A3A_fnc_customHint;
	closeDialog 0;
	_nul=CreateDialog "garrison_recruit";
	sleep 1;
	disableSerialization;

	_display = findDisplay 100;

	if (str (_display) != "no display") then
		{
		_ChildControl = _display displayCtrl 104;
		_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost",server getVariable (SDKMil select 0)];
		_ChildControl = _display displayCtrl 105;
		_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost",server getVariable (SDKMG select 0)];
		_ChildControl = _display displayCtrl 126;
		_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost",server getVariable (SDKMedic select 0)];
		_ChildControl = _display displayCtrl 107;
		_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost",server getVariable (SDKSL select 0)];
		_ChildControl = _display displayCtrl 108;
		_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost",(server getVariable staticCrewTeamPlayer) + ([SDKMortar] call A3A_fnc_vehiclePrice)];
		_ChildControl = _display displayCtrl 109;
		_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost",server getVariable (SDKGL select 0)];
		_ChildControl = _display displayCtrl 110;
		_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost",server getVariable (SDKSniper select 0)];
		_ChildControl = _display displayCtrl 111;
		_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost",server getVariable (SDKATman select 0)];
		};
	};