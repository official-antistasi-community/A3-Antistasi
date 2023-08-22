#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_typeX","_positionTel","_nearX","_garrison","_costs","_hr","_size"];
_typeX = _this select 0;

if (_typeX == "add") then {["Garrison", "Select a zone to add garrisoned troops."] call A3A_fnc_customHint;} else {["Garrison", "Select a zone to remove it's Garrison."] call A3A_fnc_customHint;};

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

if (getMarkerPos _nearX distance _positionTel > 40) exitWith {
	["Garrison", "You must click near a marked zone."] call A3A_fnc_customHint;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	_nul=CreateDialog "build_menu";
#endif
};

if (not(sidesX getVariable [_nearX,sideUnknown] == teamPlayer)) exitWith {
	["Garrison", format ["That zone does not belong to %1.",FactionGet(reb,"name")]] call A3A_fnc_customHint;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	_nul=CreateDialog "build_menu";
#endif
};
if ([_positionX] call A3A_fnc_enemyNearCheck) exitWith {
	["Garrison", "You cannot manage this garrison while there are enemies nearby."] call A3A_fnc_customHint;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
_nul=CreateDialog "build_menu";
#endif
};

if (_nearX in forcedSpawn) exitWith {
	["Garrison", "You cannot manage this garrison when there's a major attack incoming."] call A3A_fnc_customHint;
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
_nul=CreateDialog "build_menu";
#endif
};


//if (((_nearX in outpostsFIA) and !(isOnRoad _positionX)) /*or (_nearX in citiesX)*/ or (_nearX in controlsX)) exitWith {hint "You cannot manage garrisons on this kind of zone"; _nul=CreateDialog "garrison_menu"};
//_outpostFIA = if (_nearX in outpostsFIA) then {true} else {false};
//_wPost = if (_outpostFIA and !(isOnRoad getMarkerPos _nearX)) then {true} else {false};
//_garrison = if (! _wpost) then {garrison getVariable [_nearX,[]]} else {FactionGet(reb,"groupSniper")};

if (_typeX == "rem") exitWith
{
	[_nearX, true] remoteExecCall ["A3A_fnc_clearGarrison", 2];

	CreateDialog "build_menu";
};


// Get server to send customHint with selected garrison data
[_nearX, clientOwner] remoteExecCall ["A3A_fnc_showSiteInfo", 2];

closeDialog 0;
A3A_editingGarrison = _nearX;
CreateDialog "garrison_recruit";
sleep 1;
disableSerialization;

// shouldn't this crap be in an onLoad handler?
_display = findDisplay 100;
if (!isNull _display) then
{
	(_display displayCtrl 104) ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitRifle")];
	(_display displayCtrl 105) ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitMG")];
	(_display displayCtrl 126) ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitMedic")];
	(_display displayCtrl 107) ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitSL")];
	(_display displayCtrl 108) ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitCrew")];		// TODO: replace with something else?
	(_display displayCtrl 109) ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitGL")];
	(_display displayCtrl 110) ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitSniper")];
	(_display displayCtrl 111) ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitLAT")];
	(_display displayCtrl 112) ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitAT")];
	(_display displayCtrl 113) ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitAA")];
};
