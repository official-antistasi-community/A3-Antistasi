//TODO: add header

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _titleStr = localize "STR_A3A_fn_dialogs_ftradio_title";

private _groupX = player;
private _isHC = false;
if (count hcSelected player > 1) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_grp_select"] call A3A_fnc_customHint;};
if (count hcSelected player == 1) then {_groupX = hcSelected player select 0; _isHC = true};

private _blockers = [player, _groupX, nil] call A3A_fnc_canFastTravel;
if (_blockers isNotEqualTo []) exitWith {
	[_titleStr, localize ("STR_A3A_fn_dialogs_ftradio_" + (_blockers#0))] call A3A_fnc_customHint;
};


[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_click_zone"] call A3A_fnc_customHint;
private _visMap = visibleMap;
if (!visibleMap) then {openMap true};
showCommandingMenu "";
positionTel = [];
onMapSingleClick "positionTel = _pos; true";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";
if (not visiblemap) exitWith {};

private _markersX = markersX + outpostsFIA + [respawnTeamPlayer];
private _base = [_markersX, positionTel] call BIS_Fnc_nearestPosition;
if (positionTel distance getMarkerPos _base > 50) 
exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_click_marker"] call A3A_fnc_customHint;};

_blockers = [player, _groupX, _base] call A3A_fnc_canFastTravel;
if (_blockers isNotEqualTo []) exitWith {
	[_titleStr, localize ("STR_A3A_fn_dialogs_ftradio_" + (_blockers#0))] call A3A_fnc_customHint;
	if (!_visMap) then { openMap false };
};

[_groupX, _base, player] call A3A_fnc_fastTravelMove;
