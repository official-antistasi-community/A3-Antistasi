// Only called from new battle menu
// Most code taken from garrisonAdd, should be no condition where you cant dismiss a guy
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unitType","_markerX"];
private _hr = server getVariable "hr";
private _titleStr = localize "STR_A3A_garrison_header";
private _resourcesFIA = server getVariable "resourcesFIA";
private _costs = server getVariable _unitType;
[1,_costs] remoteExec ["A3A_fnc_resourcesFIA",2];

[_unitType,teamPlayer,_markerX,-1] remoteExec ["A3A_fnc_garrisonUpdate",2];
waitUntil {(_countX < count (garrison getVariable [_markerX, []])) or (sidesX getVariable [_markerX,sideUnknown] != teamPlayer)};

if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then {
	private _garrisonInfo = format [localize "STR_A3A_garrison_dismiss_success", [_markerX] call A3A_fnc_garrisonInfo];
	[_titleStr, _garrisonInfo] call A3A_fnc_customHint;

	if (spawner getVariable _markerX != 2) then {
		[_markerX,_unitType] remoteExec ["A3A_fnc_createSDKGarrisonsTemp",2];
	};
};
