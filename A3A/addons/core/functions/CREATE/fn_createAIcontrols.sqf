if (!isServer and hasInterface) exitWith{};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_pos","_veh","_roads","_conquered","_dirVeh","_markerX","_positionX","_vehiclesX","_soldiers","_radiusX","_bunker","_groupE","_unit","_typeGroup","_groupX","_timeLimit","_dateLimit","_dateLimitNum","_base","_dog","_sideX","_cfg","_isFIA","_leave","_isControl","_radiusX","_typeVehX","_typeUnit","_markersX","_frontierX","_uav","_groupUAV","_allUnits","_closest","_winner","_timeLimit","_dateLimit","_dateLimitNum","_size","_base","_mineX","_loser","_sideX"];

_markerX = _this select 0;
_positionX = getMarkerPos _markerX;
if (_positionX isEqualTo [0,0,0]) exitWith {
	Error_1("Control point %1 doesn't exist, exiting", _markerX);
};
_sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);

ServerInfo_1("Spawning Control Point %1", _markerX);

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

_isControl = if (isOnRoad _positionX) then {true} else {false};

if (_isControl) then
	{
	if (gameMode != 4) then
		{
		if (_sideX == Occupants) then
			{
			if ((random 10 > (tierWar + difficultyCoef)) and (!([_markerX] call A3A_fnc_isFrontline))) then
				{
				_isFIA = true;
				}
			};
		}
	else
		{
		if (_sideX == Invaders) then
			{
			if ((random 10 > (tierWar + difficultyCoef)) and (!([_markerX] call A3A_fnc_isFrontline))) then
				{
				_isFIA = true;
				}
			};
		};

	// Sanity-checking should be handled already
	private _road = roadAt _positionX;
	private _roadscon = roadsConnectedto _road;
	_dirveh = [_road, _roadscon select 0] call BIS_fnc_DirTo;

	if (!_isFIA) then
		{
		_groupE = grpNull;
		if !(A3A_hasIFA) then
			{
			_pos = [getPosATL _road, 7, _dirveh + 270] call BIS_Fnc_relPos;
			if ((worldname == "SPE_Normandy") or (worldname == "SPE_Mortain")) then {
				_bunker = "Land_SPE_Sandbag_Nest" createVehicle _pos;
				_bunker setDir _dirveh;
				_pos = _bunker modelToWorld [-0.200684,-0.91333,-0.421184];
			} else {
				_bunker = "Land_BagBunker_01_Small_green_F" createVehicle _pos;
				_bunker setDir _dirveh;
				_pos = getPosATL _bunker;
			};
			_vehiclesX pushBack _bunker;
			_typeVehX = selectRandom (_faction get "staticMGs");
			_veh = _typeVehX createVehicle _positionX;
			_vehiclesX pushBack _veh;
			_veh setPosATL _pos;
			_veh setDir _dirVeh;

			_groupE = createGroup _sideX;
			_typeUnit = _faction get "unitStaticCrew";
			_unit = [_groupE, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
			_unit moveInGunner _veh;
			_soldiers pushBack _unit;
			sleep 1;
			_pos = [getPosATL _road, 7, _dirveh + 90] call BIS_Fnc_relPos;
			if ((worldname == "SPE_Normandy") or (worldname == "SPE_Mortain")) then {
				_bunker = "Land_SPE_Sandbag_Nest" createVehicle _pos;
				_bunker setDir _dirveh + 180;
				_pos = _bunker modelToWorld [-0.200684,-0.91333,-0.421184];
				_vehiclesX pushBack _bunker;
				_typeVehX = selectRandom (_faction get "staticMGs");
				_veh = _typeVehX createVehicle _positionX;
				_vehiclesX pushBack _veh;
				_veh setPosATL _pos;
				_veh setDir _dirVeh + 180;

				_typeUnit = _faction get "unitStaticCrew";
				_unit = [_groupE, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
				_unit moveInGunner _veh;
				_soldiers pushBack _unit;
			} else {
				_bunker = "Land_BagBunker_01_Small_green_F" createVehicle _pos;
				_bunker setDir _dirveh + 180;
				_pos = getPosATL _bunker;
				_vehiclesX pushBack _bunker;
			};
			_pos = [getPos _bunker, 6, getDir _bunker] call BIS_fnc_relPos;
			_typeVehX = _faction get "flag";
			_veh = createVehicle [_typeVehX, _pos, [],0, "NONE"];
			_vehiclesX pushBack _veh;
			if (flagTexture _veh != (_faction get "flagTexture")) then {[_veh,(_faction get "flagTexture")] remoteExec ["setFlagTexture",_veh]};
			_veh setPosATL _pos;
			_veh setDir _dirVeh;
			sleep 1;
			_unit = [_groupE, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
			_unit moveInGunner _veh;
			_soldiers pushBack _unit;
			sleep 1;
			{ [_x, _sideX] call A3A_fnc_AIVEHinit } forEach _vehiclesX;
			};
        _typeGroup = selectRandom (_faction get "groupsMedium");
		_groupX = [_positionX,_sideX, _typeGroup, true] call A3A_fnc_spawnGroup;
		if !(isNull _groupX) then
			{
			if !(A3A_hasIFA) then
				{
				{[_x] join _groupX} forEach units _groupE;
				deleteGroup _groupE;
				};
			if (random 10 < 2.5) then
				{
				_dog = [_groupX, "Fin_random_F",_positionX,[],0,"FORM"] call A3A_fnc_createUnit;
				_dogs pushBack _dog;
				[_dog,_groupX] spawn A3A_fnc_guardDog;
				};

			[_groupX, "Patrol_Defend", 0, 50, -1, true, _positionX, false] call A3A_fnc_patrolLoop;
			_groups pushBack _groupX;

			// Forced non-spawner as they're very static.
			{[_x,"",false] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _groupX;
			};
		}
	else
		{
		_typeVehX = selectRandom (_faction get "vehiclesMilitiaLightArmed");
		_veh = _typeVehX createVehicle getPosATL _road;
		_veh setDir _dirveh + 90;
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		_vehiclesX pushBack _veh;
		sleep 1;
		_typeGroup = selectRandom (_faction get "groupsMilitiaMedium");
		_groupX = [_positionX, _sideX, _typeGroup, true] call A3A_fnc_spawnGroup;
		if !(isNull _groupX) then
			{
			_unit = [_groupX, _faction get "unitMilitiaGrunt", _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
			_unit moveInGunner _veh;
			{_soldiers pushBack _x; [_x,"", false] call A3A_fnc_NATOinit} forEach units _groupX;
			};
		};
	}
else
	{
	if (true) then
		{
		_cfg =  selectRandom (_faction get "groupSpecOpsRandom");
		if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then
			{
			_sideX = Occupants;
			};
		_size = [_markerX] call A3A_fnc_sizeMarker;
		if ({if (_x inArea _markerX) exitWith {1}} count allMines == 0) then
			{
			Debug_1("Creating a Minefield at %1", _markerX);
				private _mines = (_faction get "minefieldAPERS");
				private _placedMines = [];
				for "_i" from 1 to 30 do {
					_placedMines pushBack createMine [ selectRandom _mines ,_positionX,[], 200];
				};
				// Don't put mines on roads otherwise we might start blowing up civs
				{
					if (_x nearRoads 20 isNotEqualTo [] or surfaceIsWater getPosATL _x) then { deleteVehicle _x; continue };
					_sideX revealMine _x;
				} forEach _placedMines;
			};
		_groupX = [_positionX,_sideX, _cfg] call A3A_fnc_spawnGroup;

		[_groupX, "Patrol_Area", 25, 150, 300, false, [], false] call A3A_fnc_patrolLoop;
		_groups pushBack _groupX;

		_typeVehX = selectRandom (_faction get "uavsPortable");
		if !(isNil "_typeVehX") then
			{
			sleep 1;
			{_soldiers pushBack _x} forEach units _groupX;
			_uav = createVehicle [_typeVehX, _positionX, [], 0, "FLY"];
			[_sideX, _uav] call A3A_fnc_createVehicleCrew;
			_vehiclesX pushBack _uav;
			_groupUAV = group (crew _uav select 1);
			{[_x] joinSilent _groupX; _pilots pushBack _x} forEach units _groupUAV;
			deleteGroup _groupUAV;
			};
		{[_x, "", false] call A3A_fnc_NATOinit} forEach units _groupX;
		}
	else
		{
		_leave = true;
		};
	};
if (_leave) exitWith {};

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
["locationSpawned", [_markerX, "Control", true]] call EFUNC(Events,triggerEvent);

waitUntil {sleep 1;((spawner getVariable _markerX == 2))  or ({[_x,_markerX] call A3A_fnc_canConquer} count _soldiers == 0)};

_conquered = false;
_winner = Occupants;
if (spawner getVariable _markerX != 2) then
	{
	_conquered = true;
	_allUnits = allUnits select {(side _x != civilian) and (side _x != _sideX) and (alive _x) and (!captive _x)};
	_closest = [_allUnits,_positionX] call BIS_fnc_nearestPosition;
	_winner = side _closest;
	_loser = Occupants;
    Debug_3("Control %1 captured by %2. Is Roadblock: %3", _markerX, _winner, _isControl);
	if (_isControl) then
		{
		["TaskSucceeded", ["", localize "STR_A3A_fn_base_craicts_rbDestr"]] remoteExec ["BIS_fnc_showNotification",_winner];
		["TaskFailed", ["", localize "STR_A3A_fn_base_roadblockFight_lost"]] remoteExec ["BIS_fnc_showNotification",_sideX];
		};
	if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then
		{
		if (_winner == Invaders) then
			{
			_nul = [-5,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
			sidesX setVariable [_markerX,Invaders,true];
			}
		else
			{
			sidesX setVariable [_markerX,teamPlayer,true];
			};
		}
	else
		{
		_loser = Invaders;
		if (_winner == Occupants) then
			{
			sidesX setVariable [_markerX,Occupants,true];
			_nul = [5,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
			}
		else
			{
			sidesX setVariable [_markerX,teamPlayer,true];
			_nul = [0,5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
			};
		};
	};

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


// Check whether there's an enemy base nearby on despawn
//private _markers = citiesX + outposts + seaports + factories + resourcesX;
//if (_markers select { sidesX getVariable _x != _sideX } inAreaArrayIndexes [_positionX, 700, 700] isNotEqualTo []) then { _conquered = true };
//if (airportsX select { sidesX getVariable _x != _sideX } inAreaArrayIndexes [_positionX, 1000, 1000] isNotEqualTo []) then { _conquered = true };

if (_conquered) then {
	[_markerX, true] remoteExecCall ["A3A_fnc_deleteMinorSite", 2];
};

["locationSpawned", [_markerX, "Control", false]] call EFUNC(Events,triggerEvent);
