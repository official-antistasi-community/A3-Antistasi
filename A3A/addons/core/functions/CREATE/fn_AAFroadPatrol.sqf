//ToDo: this function needs a refactor bad
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_soldiers","_vehiclesX","_groups","_base","_posBase","_roads","_typeCar","_arrayAirports","_arrayDestinations","_radiusX","_road","_veh","_vehCrew","_groupVeh","_groupX","_groupP","_distanceX","_spawnPoint"];

Debug("Spawning AAF Road Patrol");

_soldiers = [];
_vehiclesX = [];
_groups = [];
_base = "";
_roads = [];

private _players = allPlayers - entities "HeadlessClient_F";
private _bases = (seaports + airportsX + outposts) select {
	call {
		if ((_players inAreaArray [markerPos _x, 2000, 2000] isEqualTo [])) exitWith {false};
		if (!(_players inAreaArray [markerPos _x, 350, 350] isEqualTo [])) exitWith {false};
		private _side = sidesX getVariable [_x, sideUnknown];
		if (_side == teamPlayer) exitWith {false};
		if (_x in seaports and Faction(_side) get "vehiclesGunBoats" isEqualTo []) exitWith {false};
		if (_x call A3A_fnc_getMarkerNavPoint == -1) exitWith {false};
		true;
	};
};
if (_bases isEqualTo []) exitWith {};
Debug_1("Possible patrol bases %1", _bases);

_base = selectRandom _bases;

_sideX = sidesX getVariable [_base,sideUnknown];
private _faction = Faction(_sideX);

_typeCar = "";
_typePatrol = "LAND";
if (_base in seaports) then 
{
	_typeCar = selectRandom (_faction get "vehiclesGunBoats");
	_typePatrol = "SEA";
}
else 
{
	if ( _sideX isEqualTo Invaders || random 10 < tierWar + aggressionOccupants/10) then 
	{
		private _lowAir = _faction getOrDefault ["attributeLowAir", false];
		if (!_lowAir and (_base in airportsX) and (random 1 < 0.5)) exitWith 
		{
			_typeCar = selectRandom (_faction get "vehiclesHelisLight");
			if(count (_faction get "vehiclesAirPatrol") > 0) then 
			{
				_typeCar = selectRandom (_faction get "vehiclesAirPatrol");
			};
			_typePatrol = "AIR";
		};
		_typeCar = selectRandom ((_faction get "vehiclesLightArmed") + (_faction get "vehiclesLightUnarmed"));
	}
	else 
	{
		_typeCar = selectRandom ((_faction get "vehiclesPolice") + (_faction get "vehiclesMilitiaLightArmed"));
	};
};

Info_3("Sending patrol of type %1 vehicle %2 from %3", _typePatrol, _typeCar, _base);

_posbase = getMarkerPos _base;


if (_typePatrol == "AIR") then
{
	_arrayDestinations = markersX select {sidesX getVariable [_x,sideUnknown] == _sideX};
	_distanceX = 200;
}
else
{
	if (_typePatrol == "SEA") then
	{
		_arrayDestinations = seaMarkers select {(getMarkerPos _x) distance _posbase < 2500};
		_distanceX = 100;
	}
	else
	{
		_arrayDestinations = markersX select {sidesX getVariable [_x,sideUnknown] == _sideX};
		_arrayDestinations = [_arrayDestinations,_posBase] call A3A_fnc_patrolDestinations;
		_distanceX = 50;
	};
};

if (count _arrayDestinations < 4) exitWith {};

AAFpatrols = AAFpatrols + 1;

if (_typePatrol != "AIR") then
{
	if (_typePatrol == "SEA") then
	{
		_posbase = [_posbase,50,150,10,2,0,0] call BIS_Fnc_findSafePos;
	}
	else
	{
		_indexX = airportsX find _base;
		if (_indexX != -1) then
		{
			_spawnPoint = server getVariable (format ["spawn_%1", _base]);
			_posBase = getMarkerPos _spawnPoint;
		}
		else
		{
			_posbase = position ([_posbase] call A3A_fnc_findNearestGoodRoad);
		};
	};
};

_vehicle=[_posBase, 0,_typeCar, _sideX] call A3A_fnc_spawnVehicle;
_veh = _vehicle select 0;
[_veh, _sideX] call A3A_fnc_AIVEHinit;
[_veh,"Patrol"] spawn A3A_fnc_inmuneConvoy;
_vehCrew = _vehicle select 1;
// Forced non-spawner for performance reasons. They can travel a lot through rebel territory.
{[_x,"",false] call A3A_fnc_NATOinit} forEach _vehCrew;
_groupVeh = _vehicle select 2;
_soldiers = _soldiers + _vehCrew;
_groups = _groups + [_groupVeh];
_vehiclesX = _vehiclesX + [_veh];


if (_typeCar in (_faction get "vehiclesLightUnarmed")) then
{
	sleep 1;
	_groupX = [_posbase, _sideX, _faction get "groupSentry"] call A3A_fnc_spawnGroup;
	{_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x; [_x] joinSilent _groupVeh; [_x,"",false] call A3A_fnc_NATOinit} forEach units _groupX;
	deleteGroup _groupX;
};

//if (_typePatrol == "LAND") then {_veh forceFollowRoad true};

while {alive _veh} do
{
	if (count _arrayDestinations < 2) exitWith {};
	_destinationX = selectRandom _arrayDestinations;
	if (debug) then {player globalChat format ["Generated AI patrol. Origin %2, destination %1.", _destinationX, _base]; sleep 3};
	_posDestination = getMarkerPos _destinationX;
	if (_typePatrol == "LAND") then
	{
		_road = [_posDestination] call A3A_fnc_findNearestGoodRoad;
		_posDestination = position _road;
	};
	_Vwp0 = _groupVeh addWaypoint [_posDestination, 0];
	_Vwp0 setWaypointType "MOVE";
	_Vwp0 setWaypointBehaviour "SAFE";
	_Vwp0 setWaypointSpeed "LIMITED";
	_veh setFuel 1;

	private _timeout = time + (_veh distance2d _posDestination) / 6 + 300;			// stuck detection
	waitUntil {sleep 60; (_veh distance _posDestination < _distanceX) or (time > _timeout) or ({[_x] call A3A_fnc_canFight} count _soldiers == 0) or (!canMove _veh)};
	if !(_veh distance _posDestination < _distanceX) exitWith {};
	if (_typePatrol == "AIR") then
	{
		_arrayDestinations = markersX select {sidesX getVariable [_x,sideUnknown] == _sideX};
	}
	else
	{
		if (_typePatrol == "SEA") then
		{
			_arrayDestinations = seaMarkers select {(getMarkerPos _x) distance position _veh < 2500};
		}
		else
		{
			_arrayDestinations = markersX select {sidesX getVariable [_x,sideUnknown] == _sideX};
			_arrayDestinations = [_arrayDestinations,position _veh] call A3A_fnc_patrolDestinations;
		};
	};
};

{ [_x] spawn A3A_fnc_VEHDespawner } forEach _vehiclesX;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach _groups;

AAFpatrols = AAFpatrols - 1;
