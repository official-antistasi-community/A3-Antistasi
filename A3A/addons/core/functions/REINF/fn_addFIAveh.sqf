#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _titleStr = localize "STR_A3A_fn_reinf_addFIAVeh_title";

if (!(isNil "placingVehicle") && {placingVehicle}) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addFIAVeh_no_placing"] call A3A_fnc_customHint;};
if (player != player getVariable ["owner",player]) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addFIAVeh_no_control"] call A3A_fnc_customHint;};
if ([getPosATL player] call A3A_fnc_enemyNearCheck) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addFIAVeh_no_enemy"] call A3A_fnc_customHint;};


private _typeVehX = _this select 0;
if (_typeVehX == "") exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addFIAVeh_no_supp"] call A3A_fnc_customHint;};

private _cost = [_typeVehX] call A3A_fnc_vehiclePrice;

private _resourcesFIA = 0;
if (!isMultiPlayer) then {_resourcesFIA = server getVariable "resourcesFIA"} else
	{
	if (player != theBoss) then
		{
		_resourcesFIA = player getVariable "moneyX";
		}
	else
		{
		_resourcesFIA = server getVariable "resourcesFIA";
		};
	};

if (_resourcesFIA < _cost) exitWith {[_titleStr, format [localize "STR_A3A_fn_reinf_addFIAVeh_no_money",_cost]] call A3A_fnc_customHint;};
private _nearestMarker = [markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer},player] call BIS_fnc_nearestPosition;
if !(player inArea _nearestMarker) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addFIAVeh_no_flag"] call A3A_fnc_customHint;};

private _extraMessage =	format ["Buying vehicle for $%1.", _cost];

private _fnc_placed = {
	params ["_vehicle", "_cost"];
	if (isNull _vehicle) exitWith {};
	if (player == theBoss) then {
		[0,(-1 * _cost)] remoteExec ["A3A_fnc_resourcesFIA",2];
	} else {
		[-1 * _cost] call A3A_fnc_resourcesPlayer;
		_vehicle setVariable ["ownerX",getPlayerUID player,true];
	};
	_vehicle setFuel random [0.10, 0.175, 0.25];
	[_vehicle, teamPlayer] call A3A_fnc_AIVehInit;
	if (_vehicle isKindOf "StaticWeapon") then {
		staticsToSave pushBack _vehicle; publicVariable "staticsToSave";
	};
};

[_typeVehX, _fnc_placed, {false}, [_cost], nil, nil, nil, _extraMessage] call HR_GRG_fnc_confirmPlacement;
