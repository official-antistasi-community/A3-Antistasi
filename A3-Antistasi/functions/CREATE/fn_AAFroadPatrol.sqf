#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private ["_soldiers","_vehiclesX","_groups","_base","_posBase","_roads","_typeCar","_arrayAirports","_arrayDestinations","_radiusX","_road","_veh","_vehCrew","_groupVeh","_groupX","_groupP","_distanceX","_spawnPoint"];

Debug("Spawning AAF Road Patrol");

_soldiers = [];
_vehiclesX = [];
_groups = [];
_base = "";
_roads = [];

_arrayAirports = if (A3A_hasIFA) then {(airportsX + outposts) select {((spawner getVariable _x != 0)) and (sidesX getVariable [_x,sideUnknown] != teamPlayer)}} else {(seaports + airportsX + outposts) select {((spawner getVariable _x != 0)) and (sidesX getVariable [_x,sideUnknown] != teamPlayer)}};
_arrayAirports1 = [];

private _isValidPatrolOrigin = if (isMultiplayer) then {
	{playableUnits findIf {(side (group _x) == teamPlayer) and (_x distance2d _this < distanceForLandAttack)} != -1};
} else {
	{[distanceForLandAttack,1,_this,teamPlayer] call A3A_fnc_distanceUnits};
};

{
	_airportX = _x;
	_pos = getMarkerPos _airportX;
	if (_pos call _isValidPatrolOrigin) then {_arrayAirports1 pushBack _airportX};
} forEach _arrayAirports;

if (_arrayAirports1 isEqualTo []) exitWith {};

_base = selectRandom _arrayAirports1;
_typeCar = "";
_sideX = Occupants;
_typePatrol = "LAND";
if (sidesX getVariable [_base,sideUnknown] == Occupants) then
	{
	if ((_base in seaports) and ([vehNATOBoat] call A3A_fnc_vehAvailable)) then
		{
		_typeCar = vehNATOBoat;
		_typePatrol = "SEA";
		}
	else
		{
		if (random 100 < aggressionOccupants) then
			{
			_typeCar = if (_base in airportsX) then {selectRandom (vehNATOLight + [vehNATOPatrolHeli])} else {selectRandom vehNATOLight};
			if (_typeCar == vehNATOPatrolHeli) then {_typePatrol = "AIR"};
			}
		else
			{
			_typeCar = selectRandom [vehPoliceCar,vehFIAArmedCar];
			};
		};
	}
else
	{
	_sideX = Invaders;
	if ((_base in seaports) and ([vehCSATBoat] call A3A_fnc_vehAvailable)) then
		{
		_typeCar = vehCSATBoat;
		_typePatrol = "SEA";
		}
	else
		{
		_typeCar = if (_base in airportsX) then {selectRandom (vehCSATLight + [vehCSATPatrolHeli])} else {selectRandom vehCSATLight};
		if (_typeCar == vehCSATPatrolHeli) then {_typePatrol = "AIR"};
		};
	};

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
[_veh,localize "STR_antistasi_markers_patrol"] spawn A3A_fnc_inmuneConvoy;
_vehCrew = _vehicle select 1;
// Forced non-spawner for performance reasons. They can travel a lot through rebel territory.
{[_x,"",false] call A3A_fnc_NATOinit} forEach _vehCrew;
_groupVeh = _vehicle select 2;
_soldiers = _soldiers + _vehCrew;
_groups = _groups + [_groupVeh];
_vehiclesX = _vehiclesX + [_veh];


if (_typeCar in vehNATOLightUnarmed) then
	{
	sleep 1;
	_groupX = [_posbase, _sideX, groupsNATOSentry] call A3A_fnc_spawnGroup;
	{_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x; [_x] joinSilent _groupVeh; [_x,"",false] call A3A_fnc_NATOinit} forEach units _groupX;
	deleteGroup _groupX;
	};
if (_typeCar in vehCSATLightUnarmed) then
	{
	sleep 1;
	_groupX = [_posbase, _sideX, groupsCSATSentry] call A3A_fnc_spawnGroup;
	{_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x; [_x] joinSilent _groupVeh; [_x,"",false] call A3A_fnc_NATOinit} forEach units _groupX;
	deleteGroup _groupX;
	};

//if (_typePatrol == "LAND") then {_veh forceFollowRoad true};

while {alive _veh} do
	{
	if (count _arrayDestinations < 2) exitWith {};
	_destinationX = selectRandom _arrayDestinations;
	if (debug) then {player globalChat format ["Patrulla AI generada. originX: %2 destinationX %1", _destinationX, _base]; sleep 3};
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

	waitUntil {sleep 60; (_veh distance _posDestination < _distanceX) or ({[_x] call A3A_fnc_canFight} count _soldiers == 0) or (!canMove _veh)};
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

{
	private _wp = _x addWaypoint [getMarkerPos _base, 50];
	_wp setWaypointType "MOVE";
	_x setCurrentWaypoint _wp;
	[_x] spawn A3A_fnc_groupDespawner;		// this one did care about enemies. Not sure why.
} forEach _groups;

{ [_x] spawn A3A_fnc_vehDespawner } forEach _vehiclesX;

AAFpatrols = AAFpatrols - 1;
