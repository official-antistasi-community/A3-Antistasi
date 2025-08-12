// Only called from new battle menu
// Most code taken from garrisonAdd, should be no condition where you cant dismiss a guy
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unitType","_markerX"];
private _garrison = garrison getVariable [_markerX, []];

private _hr = server getVariable "hr";
private _titleStr = localize "STR_A3A_garrison_header";
private _resourcesFIA = server getVariable "resourcesFIA";
private _costs = server getVariable _unitType;

private _countX = count _garrison;
private _units = {_x in _unitType} count _garrison;
if (_units == 0) exitWith {};
[_unitType,teamPlayer,_markerX,-1] remoteExec ["A3A_fnc_garrisonUpdate",2];
[1,_costs] remoteExec ["A3A_fnc_resourcesFIA",2];
