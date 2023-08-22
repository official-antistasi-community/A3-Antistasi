#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!(isNil "placingVehicle") && {placingVehicle}) exitWith {["Add Vehicle", "Unable to buy vehicle, you are already placing something."] call A3A_fnc_customHint;};
if (player != player getVariable ["owner",player]) exitWith {["Add Vehicle", "You cannot buy vehicles while you are controlling AI."] call A3A_fnc_customHint;};
if ([getPosATL player] call A3A_fnc_enemyNearCheck) exitWith {["Add Vehicle", "You cannot buy vehicles with enemies nearby."] call A3A_fnc_customHint;};


private _typeVehX = _this select 0;
if (_typeVehX == "") exitWith {["Add Vehicle", "The vehicle you requested is not supported in your current modset."] call A3A_fnc_customHint;};

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

if (_resourcesFIA < _cost) exitWith {["Add Vehicle", format ["You do not have enough money for this vehicle: %1 € required.",_cost]] call A3A_fnc_customHint;};
private _nearestMarker = [markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer},player] call BIS_fnc_nearestPosition;
if !(player inArea _nearestMarker) exitWith {["Add Vehicle", "You need to be close to the flag to be able to purchase a vehicle."] call A3A_fnc_customHint;};

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
		["", _vehicle] remoteExecCall ["A3A_fnc_addVehicleToGarrison", 2];
	};
};

[_typeVehX, _fnc_placed, {false}, [_cost], nil, nil, nil, _extraMessage] call HR_GRG_fnc_confirmPlacement;
