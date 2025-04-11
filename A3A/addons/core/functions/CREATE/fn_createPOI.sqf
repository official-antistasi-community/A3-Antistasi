if (!isServer and hasInterface) exitWith{};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_markerX"];




params ["_markerX"];
_positionX = getMarkerPos _markerX;
_sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);

ServerInfo_2("Spawning Control Point %2 %1", _markerX, _sideX);

if ((_sideX == teamPlayer) or (_sideX == sideUnknown)) exitWith {};
if ({if ((sidesX getVariable [_x,sideUnknown] != _sideX) and (_positionX inArea _x)) exitWith {1}} count markersX >1) exitWith {};
_vehiclesX = [];
_soldiers = [];
private _dogs = [];
private _groups = [];
_pilots = [];
_conquered = false;
_groupX = grpNull;
_isFIA = false;
_leave = false;



private _A3A_fnc_POI_NoAction = { 
	[[], [], [], [], []];
};
private _A3A_fnc_POI_Battle = { 
	#include "..\POI\poi_CivPolBattle.sqf"
};

//Weights for events 
private _probabilityNA = 90;

private _proxyTown = 0;
private _rebelTown = 0;
private _occupTown = 0;
private _aliveTown = 1;
private _occInfluenceTown = 0;
private _rebInfluenceTown = 0;

private _proxyOutpost = 0;
private _rebOutpost = 0;
private _occOutpost = 0;
private _invOutpost = 0;

private _frontline = 0;

private _town = "";
private _milPos = "";
{
	_town = [citiesX, _positionX] call BIS_fnc_nearestPosition;
	_proxyTown = (getMarkerPos _town) distance _positionX;
	_proxyTown = _proxyTown max 0.01;
	if(_town in destroyedSites) exitWith {
		_aliveTown = 0;
	};

	private _info = server getVariable _town;
	_occInfluenceTown = _info select 2;
	_rebInfluenceTown = _info select 3;

	if(_rebInfluenceTown > _occInfluenceTown) then {
		_rebelTown = 1;
	} else {
		_occupTown = 1;
	};
};

{
	_milPos = [outposts + seaports + airportsX, _positionX] call BIS_fnc_nearestPosition;
	_proxyOutpost = (getMarkerPos _milPos) distance _positionX;
	_proxyOutpost = _proxyOutpost max 0.01;

	switch (sidesX getVariable [_milPos,sideUnknown]) do {
		case Occupants: { _occOutpost = 1 };
		case Invaders: { _invOutpost = 1 };
		case teamPlayer: { _rebOutpost = 1 };
		default { };
	};
};

_frontline = [0.0,1.0] select ([[[_town, _milPos], _positionX] call BIS_fnc_nearestPosition] call A3A_fnc_isFrontline);

private _invaderEvents = [];
private _militaryEvents = [];
private _militiaEvents = [];
private _policeEvents = [];
private _civilianEvents = [];
private _rebelEvents = [_A3A_fnc_POI_Battle];

private _poiEvents = [
	_A3A_fnc_POI_NoAction, 0,
	_A3A_fnc_POI_Battle, _aliveTown*(_rebelTown + _occupTown/2)*_frontline*(_rebInfluenceTown+_occInfluenceTown)*((1/(_proxyTown max 1)) - (1/(_proxyOutpost max 1))),
	//event, only alive towns, 50% chance reduction from occupant town, only at the front, more likely hood in towns with high influence of both towns, less likely closer to outposts
	_A3A_fnc_POI_NoAction, 0
];

for "_i" from 1 to (count _poiEvents) step 2 do { 
	_poiEvents set [1, _poiEvents#1 + _i];
};
_poiEvents set [1, 0.1 * _probabilityNA * _poiEvents#1];

private _eventClass = ["INVADER", "MILITARY", "MILITIA", "POLICE", "CIV", "REBEL"];
private _eventFunc = selectRandomWeighted _poiEvents;

private _eventReturn = [];

_eventReturn = [_markerX] call _eventFunc;

if(count _eventReturn == 0) exitWith {};
if (_leave) exitWith {};

_groups = _eventReturn#0;
_soldiers = _eventReturn#1;
_vehiclesX = _eventReturn#2;
_dogs = _eventReturn#3;
_pilots = _eventReturn#04;

{ _x setVariable ["originalPos", getPos _x] } forEach _vehiclesX;

_spawnStatus = 0;
while {(spawner getVariable _markerX != 2) and ({[_x,_markerX] call A3A_fnc_canConquer} count _soldiers > 0)} do
	{
	if ((spawner getVariable _markerX == 1) and (_spawnStatus != spawner getVariable _markerX)) then
		{
		_spawnStatus = 1;
		if (isMultiplayer) then
			{
			{if (vehicle _x == _x) then {[_x,false] remoteExec ["enableSimulationGlobal",2]}} forEach _soldiers
			}
		else
			{
			{if (vehicle _x == _x) then {_x enableSimulationGlobal false}} forEach _soldiers
			};
		}
	else
		{
		if ((spawner getVariable _markerX == 0) and (_spawnStatus != spawner getVariable _markerX)) then
			{
			_spawnStatus = 0;
			if (isMultiplayer) then
				{
				{if (vehicle _x == _x) then {[_x,true] remoteExec ["enableSimulationGlobal",2]}} forEach _soldiers
				}
			else
				{
				{if (vehicle _x == _x) then {_x enableSimulationGlobal true}} forEach _soldiers
				};
			};
		};
	sleep 3;
	};
["locationSpawned", [_markerX, "POI", true]] call EFUNC(Events,triggerEvent);

waitUntil {sleep 1;((spawner getVariable _markerX == 2))  or ({[_x,_markerX] call A3A_fnc_canConquer} count _soldiers == 0)};

waitUntil {sleep 1;(spawner getVariable _markerX == 2)};


{ if (alive _x) then { deleteVehicle _x } } forEach (_soldiers + _pilots);
{ deleteVehicle _x } forEach _dogs;

{ deleteGroup _x } forEach _groups;

{
	// delete all vehicles that haven't been captured
	if (_x getVariable ["ownerSide", _sideX] == _sideX) then {
		if (_x distance2d (_x getVariable "originalPos") < 100) then { deleteVehicle _x }
		else { if !(_x isKindOf "StaticWeapon") then { [_x] spawn A3A_fnc_VEHdespawner } };
	};
} forEach _vehiclesX;

["locationSpawned", [_markerX, "POI", false]] call EFUNC(Events,triggerEvent);
