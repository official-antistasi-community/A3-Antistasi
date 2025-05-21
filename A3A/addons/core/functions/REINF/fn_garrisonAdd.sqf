#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unitType",["_markerX",""]];

private _titleStr = localize "STR_A3A_garrison_header";

if (_markerX isEqualTo "") then {_markerX = positionXGarr}; // var wont be defined otherwise

if (not(sidesX getVariable [_markerX,sideUnknown] == teamPlayer)) exitWith {
	[_titleStr, format [localize "STR_A3A_fn_reinf_garrDia_zone_belong",FactionGet(reb,"name")]] call A3A_fnc_customHint;
};

private _hr = server getVariable "hr";

if (_hr < 1) exitWith {
	[_titleStr, localize "STR_A3A_garrison_error_no_hr"] call A3A_fnc_customHint;
};

private _resourcesFIA = server getVariable "resourcesFIA";
private _costs = server getVariable _unitType;

if (_costs > _resourcesFIA) exitWith {
	[_titleStr,  format [localize "STR_A3A_garrison_error_no_money", _costs]] call A3A_fnc_customHint;
};

if ((_unitType == FactionGet(reb, "unitCrew")) and _markerX in outpostsFIA) exitWith {
	[_titleStr, localize "STR_A3A_garrison_error_no_mortar"] call A3A_fnc_customHint;
};

private _positionX = getMarkerPos _markerX;

if (surfaceIsWater _positionX) exitWith {
	[_titleStr, localize "STR_A3A_garrison_error_still_updating"] call A3A_fnc_customHint;
};

if ([_positionX] call A3A_fnc_enemyNearCheck) exitWith {
	[_titleStr, localize "STR_A3A_garrison_error_enemies_near"] call A3A_fnc_customHint;
};

private _garrison = garrison getVariable [_markerX,[]];
private _limit = [_markerX] call A3A_fnc_getGarrisonLimit;

if (_limit != -1 && {count _garrison >= _limit}) exitWith {
	[localize "STR_A3A_garrisons_header", localize "STR_A3A_garrison_reached_limit"] call A3A_fnc_customHint;
};


_nul = [-1,-_costs] remoteExec ["A3A_fnc_resourcesFIA",2];

private _countX = count _garrison;
[_unitType,teamPlayer,_markerX,1] remoteExec ["A3A_fnc_garrisonUpdate",2];
waitUntil {(_countX < count (garrison getVariable [_markerX, []])) or (sidesX getVariable [_markerX,sideUnknown] != teamPlayer)};

if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then {
	private _garrisonInfo = format [localize "STR_A3A_garrison_recruit_success", [_markerX] call A3A_fnc_garrisonInfo];
	[_titleStr, _garrisonInfo] call A3A_fnc_customHint;

	if (spawner getVariable _markerX != 2) then {
		[_markerX,_unitType] remoteExec ["A3A_fnc_createSDKGarrisonsTemp",2];
	};
};
