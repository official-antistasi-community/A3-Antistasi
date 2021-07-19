#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _groupData = FactionGet(reb,"groups");
#define GROUP(VAR) (_groupData get VAR)
private ["_hr","_resourcesFIA","_typeX","_costs","_markerX","_garrison","_positionX","_unit","_groupX","_veh","_pos"];

_hr = server getVariable "hr";

if (_hr < 1) exitWith {["Garrisons", "You lack of HR to make a new recruitment"] call A3A_fnc_customHint;};

_resourcesFIA = server getVariable "resourcesFIA";

_typeX = _this select 0;

_costs = 0;

_costs = server getVariable _typeX;
if (_typeX == GROUP("staticCrew")) then {_costs = _costs + ([FactionGet(reb,"staticMortar")] call A3A_fnc_vehiclePrice)};

if (_costs > _resourcesFIA) exitWith {["Garrisons", format ["You do not have enough money for this kind of unit (%1 € needed)",_costs]] call A3A_fnc_customHint;};

_markerX = positionXGarr;

if ((_typeX == GROUP("staticCrew")) and (_markerX in outpostsFIA)) exitWith {["Garrisons", "You cannot add mortars to a Roadblock garrison"] call A3A_fnc_customHint;};

_positionX = getMarkerPos _markerX;

if (surfaceIsWater _positionX) exitWith {["Garrisons", "This Garrison is still updating, please try again in a few seconds"] call A3A_fnc_customHint;};

if ([_positionX,500] call A3A_fnc_enemyNearCheck) exitWith {["Garrisons", "You cannot Recruit Garrison Units with enemies near the zone"] call A3A_fnc_customHint;};
_nul = [-1,-_costs] remoteExec ["A3A_fnc_resourcesFIA",2];
/*
_garrison = [];
_garrison = _garrison + (garrison getVariable [_markerX,[]]);
_garrison pushBack _typeX;
garrison setVariable [_markerX,_garrison,true];
//[_markerX] call A3A_fnc_mrkUpdate;*/
_countX = count (garrison getVariable [_markerX,[]]);
[_typeX,teamPlayer,_markerX,1] remoteExec ["A3A_fnc_garrisonUpdate",2];
waitUntil {(_countX < count (garrison getVariable [_markerX, []])) or (sidesX getVariable [_markerX,sideUnknown] != teamPlayer)};

if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then
	{
	["Garrisons", format ["Soldier recruited.%1",[_markerX] call A3A_fnc_garrisonInfo]] call A3A_fnc_customHint;

	if (spawner getVariable _markerX != 2) then
		{
		//[_markerX] remoteExec ["tempMoveMrk",2];
		[_markerX,_typeX] remoteExec ["A3A_fnc_createSDKGarrisonsTemp",2];
		};
	};
