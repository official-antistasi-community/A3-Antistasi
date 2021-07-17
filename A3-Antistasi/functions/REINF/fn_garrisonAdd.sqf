private ["_hr","_resourcesFIA","_typeX","_costs","_markerX","_garrison","_positionX","_unit","_groupX","_veh","_pos"];

_hr = server getVariable "hr";

if (_hr < 1) exitWith {[localize "STR_antistasi_garrisons", localize "STR_antistasi_garrisons_noHR"] call A3A_fnc_customHint;};

_resourcesFIA = server getVariable "resourcesFIA";

_typeX = _this select 0;

_costs = 0;

if (_typeX isEqualType "") then
	{
	_costs = server getVariable _typeX;
	_costs = _costs + ([SDKMortar] call A3A_fnc_vehiclePrice);
	}
else
	{
	_typeX = if (random 20 <= skillFIA) then {_typeX select 1} else {_typeX select 0};
	_costs = server getVariable _typeX;
	};

if (_costs > _resourcesFIA) exitWith {[localize "STR_antistasi_garrisons", format [localize "STR_antistasi_garrisons_noMoney",_costs]] call A3A_fnc_customHint;};

_markerX = positionXGarr;

if ((_typeX == staticCrewTeamPlayer) and (_markerX in outpostsFIA)) exitWith {[localize "STR_antistasi_garrisons", localize "STR_antistasi_garrisons_mortar"] call A3A_fnc_customHint;};

_positionX = getMarkerPos _markerX;

if (surfaceIsWater _positionX) exitWith {[localize "STR_antistasi_garrisons", localize "STR_antistasi_garrisons_wait"] call A3A_fnc_customHint;};

if ([_positionX,500] call A3A_fnc_enemyNearCheck) exitWith {[localize "STR_antistasi_garrisons", localize "STR_antistasi_garrisons_enemy"] call A3A_fnc_customHint;};
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
	[localize "STR_antistasi_garrisons", format [localize "STR_antistasi_garrisons_recruit",[_markerX] call A3A_fnc_garrisonInfo]] call A3A_fnc_customHint;

	if (spawner getVariable _markerX != 2) then
		{
		//[_markerX] remoteExec ["tempMoveMrk",2];
		[_markerX,_typeX] remoteExec ["A3A_fnc_createSDKGarrisonsTemp",2];
		};
	};
