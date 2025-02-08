#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer and hasInterface) exitWith{};

private ["_pos","_markerX","_vehiclesX","_groups","_soldiers","_busy","_buildings","_pos1","_pos2","_groupX","_countX","_typeVehX","_veh","_unit","_arrayVehAAF","_nVeh","_frontierX","_size","_ang","_mrk","_typeGroup","_flagX","_dog","_typeUnit","_garrison","_sideX","_cfg","_max","_vehicle","_vehCrew","_groupVeh","_roads","_dist","_road","_roadscon","_roadcon","_dirveh","_bunker","_typeGroup"];
_markerX = _this select 0;

//Not sure if that ever happens, but it reduces redundance
if(spawner getVariable _markerX == 2) exitWith {};

ServerDebug_1("Spawning Airbase %1", _markerX);

_vehiclesX = [];
_AAvehicles = []; // to disable AA driver AI until everything else is dealt with
_groups = [];
_soldiers = [];
private _dogs = [];
private _spawnsUsed = [];

_positionX = getMarkerPos (_markerX);
private _patrolSize = [_markerX] call A3A_fnc_sizeMarker;
_pos = [];

_size = [_markerX] call A3A_fnc_sizeMarker;
//_garrison = garrison getVariable _markerX;

_frontierX = [_markerX] call A3A_fnc_isFrontline;
_busy = false;		//if (dateToNumber date > server getVariable _markerX) then {false} else {true};
_nVeh = round (_size/60);

_sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);

_max = if (_frontierX) then {2} else {1};
for "_i" from 1 to _max do
{
	private _spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
	
	if !(_spawnParameter isEqualType []) exitWith {};
	_spawnsUsed pushBack _spawnParameter#2;
	isNil {
		_veh = createVehicle [selectRandom (_faction get "vehiclesAA"), (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
		_veh setDir (_spawnParameter select 1);
  	};

	_groupVeh = [_sideX, _veh] call A3A_fnc_createVehicleCrew;
	{[_x,_markerX] call A3A_fnc_NATOinit} forEach units _groupVeh;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	driver _veh disableAI "MOVE";
	_soldiers append units _groupVeh;
	_groups pushBack _groupVeh;
	_vehiclesX pushBack _veh;
	_AAvehicles pushBack _veh;
	sleep 1;
};

if (_frontierX) then
{
	_roads = _positionX nearRoads _size;
	if (count _roads != 0) then
	{
		_groupX = createGroup _sideX;
		_groups pushBack _groupX;
		_dist = 0;
		_road = objNull;
		{if ((position _x) distance _positionX > _dist) then {_road = _x;_dist = position _x distance _positionX}} forEach _roads;
		_roadscon = roadsConnectedto _road;
		_roadcon = objNull;
		{if ((position _x) distance _positionX > _dist) then {_roadcon = _x}} forEach _roadscon;
		_dirveh = [_roadcon, _road] call BIS_fnc_DirTo;
		_pos = [getPos _road, 7, _dirveh + 270] call BIS_Fnc_relPos;
		_bunker = "Land_BagBunker_01_small_green_F" createVehicle _pos;
		_vehiclesX pushBack _bunker;
		_bunker setDir _dirveh;
		_pos = getPosATL _bunker;
		_typeVehX = selectRandom (_faction get "staticAT");
		_veh = _typeVehX createVehicle _positionX;
		_vehiclesX pushBack _veh;
		_veh setDir _dirVeh + 180;
		_veh setPos _pos;
		_typeUnit = _faction get "unitStaticCrew";
		_unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
		_unit moveInGunner _veh;
		[_unit,_markerX] call A3A_fnc_NATOinit;
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		_soldiers pushBack _unit;
	};
};


_mrk = createMarkerLocal [format ["%1patrolarea", random 100], _positionX];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [(distanceSPWN/2),(distanceSPWN/2)];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_ang = markerDir _markerX;
_mrk setMarkerDirLocal _ang;
if (!debug) then {_mrk setMarkerAlphaLocal 0};
_garrison = garrison getVariable [_markerX,[]];
_garrison = _garrison call A3A_fnc_garrisonReorg;
_radiusX = count _garrison;
private _patrol = true;
if (_radiusX < ([_markerX] call A3A_fnc_garrisonSize)) then
{
	_patrol = false;
}
else
{
		//No patrol if patrol area overlaps with an enemy site
		_patrol = ((markersX findIf {(getMarkerPos _x inArea _mrk) && {sidesX getVariable [_x, sideUnknown] != _sideX}}) == -1);
};
if (_patrol) then
{
	_countX = 0;
	while {_countX < 4} do
	{
		_arraygroups = _faction get "groupsSmall";
		if ([_markerX,false] call A3A_fnc_fogCheck < 0.3) then {_arraygroups = _arraygroups - (_faction get "groupSniper")};
		_typeGroup = selectRandom _arraygroups;
		private _spawnPosition = [_positionX, 25, round (_patrolSize / 2), 5, 0, -1, 0] call A3A_fnc_getSafePos;
		if (_spawnPosition isEqualTo [0,0]) exitWith {
			ServerDebug("Unable to find spawn position for patrol unit.");
		};
		_groupX = [_spawnPosition,_sideX, _typeGroup,false,true] call A3A_fnc_spawnGroup;
		if !(isNull _groupX) then
		{
			sleep 1;
			if ((random 10 < 2.5) and (_typeGroup isNotEqualTo (_faction get "groupSniper"))) then
			{
				_dog = [_groupX, "Fin_random_F",_spawnPosition,[],0,"FORM"] call A3A_fnc_createUnit;
				_dogs pushBack _dog;
				[_dog] spawn A3A_fnc_guardDog;
				sleep 1;
			};

			[_groupX, "Patrol_Area", 25, 150, 300, false, [], false] call A3A_fnc_patrolLoop;
			_groups pushBack _groupX;

			{[_x,_markerX] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _groupX;
		};
		_countX = _countX +1;
	};
};
_countX = 0;

// Mortar spawning
_groupX = createGroup _sideX;
_groups pushBack _groupX;
_typeUnit = _faction get "unitStaticCrew";
while {true} do {
	private _spawnParameter = [_markerX, "Mortar"] call A3A_fnc_findSpawnPosition;
	if (_spawnParameter isEqualType false) exitWith {};
//	if ((_spawnParameter select 0) nearObjects ["StaticWeapon", 5] isNotEqualTo []) then { continue };		// hack, already a (support?) mortar on the point

	_spawnsUsed pushBack _spawnParameter#2;
	_typeVehX = selectRandom (_faction get "staticMortars");
	_veh = _typeVehX createVehicle (_spawnParameter select 0);
	_veh setDir (_spawnParameter select 1);
	_unit = [_groupX, _typeUnit, _positionX, [], 0, "CAN_COLLIDE"] call A3A_fnc_createUnit;
	_unit moveInGunner _veh;
	[_unit,_markerX] call A3A_fnc_NATOinit;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	[_groupX] call A3A_fnc_artilleryAdd;
	_soldiers pushBack _unit;
	_vehiclesX pushBack _veh;
	sleep 1;
};

_ret = [_markerX,_size,_sideX,_frontierX] call A3A_fnc_milBuildings;
_groups pushBack (_ret select 0);
_vehiclesX append (_ret select 1);
_soldiers append (_ret select 2);
_spawnsUsed append (_ret select 3);
{[_x, _sideX] call A3A_fnc_AIVEHinit} forEach (_ret select 1);

if(random 100 < (50 + tierWar * 3)) then
{
	_large = (random 100 < (40 + tierWar * 2));
	[_markerX, _large] spawn A3A_fnc_placeIntel;
};

if (!_busy) then
{
	//Newer system in place
	private _runwaySpawnLocation = [_markerX] call A3A_fnc_getRunwayTakeoffForAirportMarker;
	if !(_runwaySpawnLocation isEqualTo []) then
	{
		_pos = _runwaySpawnLocation select 0;
		_ang = _runwaySpawnLocation select 1;
	};
	_groupX = createGroup _sideX;
	_groups pushBack _groupX;
	_countX = 0;
	while {_countX < 3} do
	{
		private _veh = objNull;
		private _spawnParameter = [_markerX, "Plane"] call A3A_fnc_findSpawnPosition;
		if(_spawnParameter isEqualType []) then
		{
			private _vehPool = (_faction get "vehiclesPlanesCAS") + (_faction get "vehiclesPlanesAA");
			if(count _vehPool > 0) then
			{
				_spawnsUsed pushBack _spawnParameter#2;
				_typeVehX = selectRandom _vehPool;
				isNil {
					_veh = createVehicle [_typeVehX, (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
					_veh setDir (_spawnParameter select 1);
				};
				_vehiclesX pushBack _veh;
				[_veh, _sideX] call A3A_fnc_AIVEHinit;
			};
		}
		else
		{
			if !(_runwaySpawnLocation isEqualTo []) then
			{
				_typeVehX = selectRandom (
                    (_faction get "vehiclesHelisLight")
                    + (_faction get "vehiclesHelisTransport")
                    + (_faction get "vehiclesPlanesCAS")
                    + (_faction get "vehiclesPlanesAA")
                    + (_faction get "vehiclesPlanesTransport")
                );
				_veh = createVehicle [_typeVehX, _pos, [],50, "NONE"];
				_veh setDir (_ang);
				_pos = [_pos, 50,_ang] call BIS_fnc_relPos;
				_vehiclesX pushBack _veh;
				[_veh, _sideX] call A3A_fnc_AIVEHinit;
			}
			else
			{
				//No places found, neither hangar nor runway
				_countX = 3;
			};
		};
		_countX = _countX + 1;
	};
};

_typeVehX = _faction get "flag";
_flagX = createVehicle [_typeVehX, _positionX, [],0, "NONE"];
_flagX allowDamage false;
[_flagX,"take"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];
_vehiclesX pushBack _flagX;
if (flagTexture _flagX != (_faction get "flagTexture")) then {[_flagX,(_faction get "flagTexture")] remoteExec ["setFlagTexture",_flagX]};

// Only create ammoBox if it's been recharged (see reinforcementsAI)
private _ammoBox = if (garrison getVariable [_markerX + "_lootCD", 0] == 0) then
{
	private _ammoBoxType = _faction get "ammobox";
	private _ammoBox = [_ammoBoxType, _positionX, 15, 5, true] call A3A_fnc_safeVehicleSpawn;
	// Otherwise when destroyed, ammoboxes sink 100m underground and are never cleared up
	_ammoBox addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];
	[_ammoBox] spawn A3A_fnc_fillLootCrate;
	[_ammoBox, nil, true] call A3A_Logistics_fnc_addLoadAction;

	[_ammoBox] spawn {
		sleep 1;    //make sure fillLootCrate finished clearing the crate
		{
			if (getText(configFile >> "CfgVehicles" >> _x >> "vehicleClass") isEqualTo "Backpacks") then {
				_this#0 addBackpackCargoGlobal [_x, round random [5,15,15]];
			} else {
				_this#0 addItemCargoGlobal [_x, round random [5,15,15]];
			};
		} forEach (A3A_faction_reb get "flyGear");
	};
	_ammoBox;
};


if (!_busy) then
{
	private _vehTypesHeavy = 
        (_faction get "vehiclesLightAPCs") + 
        (_faction get "vehiclesAPCs") + 
        (_faction get "vehiclesIFVs") + 
        (_faction get "vehiclesLightTanks") + 
        (_faction get "vehiclesTanks") + 
        (_faction get "vehiclesHeavyTanks");
	for "_i" from 1 to (round (random 2)) do
	{
		_spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
		if (_spawnParameter isEqualType []) then
		{
			_spawnsUsed pushBack _spawnParameter#2;
			isNil {
				_veh = createVehicle [selectRandom _vehTypesHeavy, (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
				_veh setDir (_spawnParameter select 1);
			};
			_vehiclesX pushBack _veh;
			[_veh, _sideX] call A3A_fnc_AIVEHinit;
			_nVeh = _nVeh -1;
			sleep 1;
		};
	};
};

private _vehTypesLight = 
    (_faction get "vehiclesLightArmed") + 
    (_faction get "vehiclesLightUnarmed") + 
    (_faction get "vehiclesTrucks") + 
    (_faction get "vehiclesAmmoTrucks") + 
    (_faction get "vehiclesRepairTrucks") + 
    (_faction get "vehiclesFuelTrucks") + 
    (_faction get "vehiclesMedical");
_countX = 0;

while {_countX < _nVeh && {_countX < 3}} do
{
	_typeVehX = selectRandom _vehTypesLight;
	_spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
	if(_spawnParameter isEqualType []) then
	{
		_spawnsUsed pushBack _spawnParameter#2;
		isNil {
			_veh = createVehicle [_typeVehX, (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
			_veh setDir (_spawnParameter select 1);
		};
		_vehiclesX pushBack _veh;
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		sleep 1;
		_countX = _countX + 1;
	}
	else
	{
		//No further spaces to spawn vehicle
		_countX = _nVeh;
	};
};

{ _x setVariable ["originalPos", getPosATL _x] } forEach _vehiclesX;

_array = [];
_subArray = [];
_countX = 0;
_radiusX = _radiusX -1;
while {_countX <= _radiusX} do {
	_array pushBack (_garrison select [_countX,7]);
	_countX = _countX + 8;
};
for "_i" from 0 to (count _array - 1) do {
	private _groupX = if (_i == 0) then {
		[_positionX, _sideX, (_array select _i), true, false] call A3A_fnc_spawnGroup;
	} else {
		private _spawnPosition = [_positionX, 50, 100, 5, 0, -1, 0] call A3A_fnc_getSafePos;
		[_spawnPosition, _sideX, (_array select _i), false, true] call A3A_fnc_spawnGroup;
	};
	_groups pushBack _groupX;
	{
		[_x, _markerX] call A3A_fnc_NATOinit; 
		_soldiers pushBack _x;
	} forEach units _groupX;
	if (_i == 0) then {
		// Sets first loop as garrison, returns additional defense groups if not enough positions found.
		private _additionalGroups = [_groupX, getMarkerPos _markerX, _size] call A3A_fnc_patrolGroupGarrison;
		_groups append _additionalGroups;
	} else {
		[_groupX, "Patrol_Defend", 0, 200, -1, true, _positionX, false] call A3A_fnc_patrolLoop;
	};
};

{
	driver _x enableAI "MOVE"; // reenable movement for spawned AA vehicles
	[_groupVeh, "Patrol_Area", 25, 100, 250, true, _positionX, false] call A3A_fnc_patrolLoop; // start patrol
} forEach _AAvehicles;

["locationSpawned", [_markerX, "Airport", true]] call EFUNC(Events,triggerEvent);

waitUntil {sleep 1; (spawner getVariable _markerX == 2)};

deleteMarker _mrk;
{ if (alive _x) then { deleteVehicle _x } } forEach _soldiers;
{ deleteVehicle _x } forEach _dogs;
{ deleteGroup _x } forEach _groups;

{
	// delete all vehicles that haven't been stolen
	if (_x getVariable ["ownerSide", _sideX] == _sideX) then {
		if (_x distance2d (_x getVariable "originalPos") < 100) then { deleteVehicle _x }
		else { if !(_x isKindOf "StaticWeapon") then { [_x] spawn A3A_fnc_VEHdespawner } };
	};
} forEach _vehiclesX;

_spawnsUsed call A3A_fnc_freeSpawnPositions;

// If loot crate was stolen, set the cooldown
if (!isNil "_ammoBox") then {
	if ((alive _ammoBox) and (_ammoBox distance2d _positionX < 100)) exitWith { deleteVehicle _ammoBox };
	if (alive _ammoBox) then { [_ammoBox] spawn A3A_fnc_VEHdespawner };
	private _lootCD = 120*16 / ([_markerX] call A3A_fnc_garrisonSize);
	garrison setVariable [_markerX + "_lootCD", _lootCD, true];
};
["locationSpawned", [_markerX, "Airport", false]] call EFUNC(Events,triggerEvent);
