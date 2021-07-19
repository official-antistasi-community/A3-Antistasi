#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _groupData = FactionGet(reb,"groups");
#define GROUP(VAR) (_groupData get VAR)
private ["_typeX","_positionTel","_nearX","_garrison","_costs","_hr","_size"];
_typeX = _this select 0;

if (_typeX == "add") then {["Garrison", "Select a zone to add garrisoned troops"] call A3A_fnc_customHint;} else {["Garrison", "Select a zone to remove it's Garrison"] call A3A_fnc_customHint;};

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

if (getMarkerPos _nearX distance _positionTel > 40) exitWith {["Garrison", "You must click near a marked zone"] call A3A_fnc_customHint; _nul=CreateDialog "build_menu";};

if (not(sidesX getVariable [_nearX,sideUnknown] == teamPlayer)) exitWith {["Garrison", format ["That zone does not belong to %1",FactionGet(reb,"name")]] call A3A_fnc_customHint; _nul=CreateDialog "build_menu";};
if ([_positionX,500] call A3A_fnc_enemyNearCheck) exitWith {["Garrison", "You cannot manage this garrison while there are enemies nearby"] call A3A_fnc_customHint; _nul=CreateDialog "build_menu"};
//if (((_nearX in outpostsFIA) and !(isOnRoad _positionX)) /*or (_nearX in citiesX)*/ or (_nearX in controlsX)) exitWith {hint "You cannot manage garrisons on this kind of zone"; _nul=CreateDialog "garrison_menu"};
_outpostFIA = if (_nearX in outpostsFIA) then {true} else {false};
_wPost = if (_outpostFIA and !(isOnRoad getMarkerPos _nearX)) then {true} else {false};
_garrison = if (! _wpost) then {garrison getVariable [_nearX,[]]} else {GROUP("groupsSnipers")};

if (_typeX == "rem") then
	{
	if ((count _garrison == 0) and !(_nearX in outpostsFIA)) exitWith {["Garrison", "The place has no garrisoned troops to remove"] call A3A_fnc_customHint; _nul=CreateDialog "build_menu";};
	_costs = 0;
	_hr = 0;
	{
	if (_x == GROUP("staticCrew")) then {if (_outpostFIA) then {_costs = _costs + ([FactionGet(reb,"vehicleLightArmed")] call A3A_fnc_vehiclePrice)} else {_costs = _costs + ([FactionGet(reb,"staticMortar")] call A3A_fnc_vehiclePrice)}};
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
	["Garrison", format ["Garrison removed<br/><br/>Recovered Money: %1 €<br/>Recovered HR: %2",_costs,_hr]] call A3A_fnc_customHint;
	_nul=CreateDialog "build_menu";
	}
else
	{
	positionXGarr = _nearX;
	publicVariable "positionXGarr";
	["Garrison", format ["Info%1",[_nearX] call A3A_fnc_garrisonInfo]] call A3A_fnc_customHint;
	closeDialog 0;
	_nul=CreateDialog "garrison_recruit";
	sleep 1;
	disableSerialization;

	_display = findDisplay 100;

	if (str (_display) != "no display") then
		{
		_ChildControl = _display displayCtrl 104;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable GROUP("Mil")];
		_ChildControl = _display displayCtrl 105;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable GROUP("MG")];
		_ChildControl = _display displayCtrl 126;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable GROUP("Medic")];
		_ChildControl = _display displayCtrl 107;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable GROUP("SL")];
		_ChildControl = _display displayCtrl 108;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",(server getVariable GROUP("staticCrew")) + ([FactionGet(reb,"staticMortar")] call A3A_fnc_vehiclePrice)];
		_ChildControl = _display displayCtrl 109;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable GROUP("GL")];
		_ChildControl = _display displayCtrl 110;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable GROUP("Sniper")];
		_ChildControl = _display displayCtrl 111;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable GROUP("LAT")];
		};
	};
