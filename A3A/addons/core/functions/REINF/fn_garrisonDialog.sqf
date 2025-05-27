// Old-UI function to handle clicks on garrison map

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_typeX","add"]];

private _titleStr = localize "STR_A3A_fn_reinf_garrDia_title";

if (_typeX == "add") then {
	[_titleStr, localize "STR_A3A_fn_reinf_garrDia_zone_add"] call A3A_fnc_customHint;
} else {
	[_titleStr, localize "STR_A3A_fn_reinf_garrDia_zone_remove"] call A3A_fnc_customHint;
};

if (!visibleMap) then {openMap true};
positionTel = [];

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

private _positionTel = positionTel;
private _nearX = [markersX + outpostsFIA, _positionTel] call BIS_fnc_nearestPosition;

if (getMarkerPos _nearX distance2d _positionTel > 40) exitWith { // lazy eval
	[localize "STR_A3A_fn_reinf_garrDia_title", localize "STR_A3A_fn_reinf_garrDia_zone_click"] call A3A_fnc_customHint;
	createDialog "build_menu";
};

if !(_marker call A3A_fnc_canEditGarrison) exitWith { createDialog "build_menu" };

// Conditions passed, now either delete the garrison or open the recruiting menu

if (_typeX == "rem") exitWith {
	[_nearX, true] remoteExecCall ["A3A_fnc_garrisonServer_clear", 2];
	createDialog "build_menu";
};

// Get server to send customHint with selected garrison data
[_nearX, clientOwner] remoteExecCall ["A3A_fnc_showSiteInfo", 2];

closeDialog 0;
A3A_editingGarrison = _nearX;
createDialog "garrison_recruit";
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
