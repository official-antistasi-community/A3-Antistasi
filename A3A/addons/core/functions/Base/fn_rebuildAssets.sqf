#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _titleStr = localize "STR_A3A_fn_base_rebasset_title";

private _resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < 5000) exitWith {[_titleStr, localize "STR_A3A_fn_base_rebasset_no_money"] call A3A_fnc_customHint;};

if (!visibleMap) then {openMap true};
positionTel = [];
[_titleStr, localize "STR_A3A_fn_base_rebasset_click_zone"] call A3A_fnc_customHint;

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

private _positionTel = positionTel;

private _siteX = [markersX,_positionTel] call BIS_fnc_nearestPosition;

if (getMarkerPos _siteX distance2d _positionTel > 50) exitWith {[_titleStr, localize "STR_A3A_fn_base_rebasset_click_marker"] call A3A_fnc_customHint;};
if (sidesX getVariable [_siteX, sideUnknown] != teamPlayer) exitWith {[_titleStr, localize "STR_A3A_fn_base_rebasset_click_marker"] call A3A_fnc_customHint;};

private _destroyedSites = destroyedSites - citiesX;
if (_siteX in _destroyedSites) exitWith {
    private _nameX = [_siteX] call A3A_fnc_localizar;
    [_titleStr, format [localize "STR_A3A_fn_base_rebasset_done_1", _nameX]] call A3A_fnc_customHint;

    [0,10,_positionTel] remoteExec ["A3A_fnc_citySupportChange",2];
    [Occupants, 10, 30] remoteExec ["A3A_fnc_addAggression",2];
    [Invaders, 10, 30] remoteExec ["A3A_fnc_addAggression",2];
    destroyedSites = destroyedSites - [_siteX];
    publicVariable "destroyedSites";
    [0,-5000] remoteExec ["A3A_fnc_resourcesFIA",2];
};

private _radioTowers = antennasDead select {_x inArea _siteX};
if (_radioTowers isNotEqualTo []) exitWith {
    [_titleStr, localize "STR_A3A_fn_base_rebasset_done_2"] call A3A_fnc_customHint;
    [_radioTowers#0] remoteExec ["A3A_fnc_rebuildRadioTower", 2];
    [0,-5000] remoteExec ["A3A_fnc_resourcesFIA",2];
};

[_titleStr, localize "STR_A3A_fn_base_rebasset_no_nothing"] call A3A_fnc_customHint;
