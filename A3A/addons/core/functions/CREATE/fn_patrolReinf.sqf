#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mrkDest", "_mrkOrigin", "_numTroops", "_side"];
private _faction = Faction(_side);
private _lowAir = _faction getOrDefault ["attributeLowAir", false];
private _posDest = getMarkerPos _mrkDest;
private _posOrigin = getMarkerPos _mrkOrigin;
private _groupType = selectRandom (_faction get (if (_numTroops == 4) then {"groupsMedium"} else {"groupsSquads"}));

private _isLand = if (_lowAir) then { true } else {						// land markers guaranteed by reinforcementsAI for low air
	private _targNavIndex = _mrkDest call A3A_fnc_getMarkerNavPoint;
	private _suppMarkers = [_targNavIndex, _lowAir] call A3A_fnc_findLandSupportMarkers apply { _x#0 };
	_mrkOrigin in _suppMarkers;
};

ServerInfo_5("Spawning PatrolReinf. Dest:%1 Orig:%2 Size:%3 Side:%4 Land:%5",_mrkDest,_mrkOrigin,_numTroops,_side,_isLand);

private _vehicleType = if (_isLand) then {
	selectRandom (_faction get "vehiclesTrucks");
} else {
	private _transportPlanes = _faction get "vehiclesPlanesTransport";
	private _transportHelis = _faction get "vehiclesHelisTransport";
	if (count _groupType <= 4) then { _transportHelis append (_faction get "vehiclesHelisLight") };

	private _transportsWeighted = [];
	{ _transportsWeighted append [_x, 1 / count _transportPlanes] } forEach _transportPlanes;
	{ _transportsWeighted append [_x, 2 / count _transportHelis] } forEach _transportHelis;
	selectRandomWeighted _transportsWeighted;
};

private _vehicle = [_mrkOrigin, _vehicleType] call A3A_fnc_spawnVehicleAtMarker;
if (isNull _vehicle) exitWith {
	Error_2("Failed to spawn vehicle type %1 at %2", _vehicleType, _mrkOrigin);
};
private _crewGroup = [_side, _vehicle] call A3A_fnc_createVehicleCrew;
{ [_x, nil, false, "legacy"] call A3A_fnc_NATOinit } forEach (units _crewGroup);
[_vehicle, _side, "legacy"] call A3A_fnc_AIVEHinit;				// don't pay up-front for reinf vehicles/crew, assumed to return


private _expectedCargo = ([_vehicleType, true] call BIS_fnc_crewCount) - ([_vehicleType, false] call BIS_fnc_crewCount);
if (_expectedCargo < count _groupType) then { _groupType resize _expectedCargo };           // trim to cargo seat count
private _cargoGroup = [_posOrigin, _side, _groupType, true, false] call A3A_fnc_spawnGroup;         // force spawn, should be pre-checked
{
    _x assignAsCargo _vehicle;			// unnecessary, done by moveInXXX anyway?
	if (_vehicleType == "uns_an2_transport") then { _x moveInAny _vehicle} else { _x moveInCargo _vehicle };				// moveInCargo busted for unsung an2?
	[_x, nil, false, "defence"] call A3A_fnc_NATOinit;
} forEach units _cargoGroup;

[-10*count units _cargoGroup, _side, "defence"] remoteExec ["A3A_fnc_addEnemyResources", 2];

private _landPad = objNull;
if (_isLand) then {
	private _landPos = [_posDest, getPosATL _vehicle, true, []] call A3A_fnc_findSafeRoadToUnload;		// should actually be safe...
	Debug_1("Landpos veh = %1", _landPos);
	[getPosATL _vehicle, _landPos, _crewGroup] call A3A_fnc_WPCreate;

	//Turn final waypoint into disembark. Should still be behaviour SAFE...
	private _dismountWP = [_crewGroup, count waypoints _crewGroup - 1];
	_dismountWP setWaypointType "TR UNLOAD";
	private _returnWP = _crewGroup addWaypoint [_posOrigin, 50];
	_returnWP setWaypointType "MOVE";

	private _reinfWP = _cargoGroup addWaypoint [_posDest, 0];
	_reinfWP setWaypointBehaviour "AWARE";

	// Free the spawn position after 60 seconds
	_vehicle spawn {
		sleep 60;
		if (isNull _this) exitWith {};
		[_this getVariable "spawnPlace"] call A3A_fnc_freeSpawnPositions;
		_this setVariable ["spawnPlace", nil];
	};
}
else
{
	_landPos = if (_vehicleType isKindOf "Helicopter") then {[_posDest, 0, 300, 10, 0, 0.20, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos} else {[0,0,0]};
	Debug_1("Landpos air = %1", _landPos);
	if !(_landPos isEqualTo [0,0,0]) then
	{
		_landPos set [2, 0];
		_landpad = createVehicle ["Land_HelipadEmpty_F", _landpos, [], 0, "NONE"];
		_landWP = _crewGroup addWaypoint [_landpos, 0];
		_landWP setWaypointType "TR UNLOAD";
		_landWP setWaypointStatements ["true", "if !(local this) exitWith {}; (vehicle this) land 'GET OUT'"];
		_landWP setWaypointBehaviour "CARELESS";
		_returnWP = _crewGroup addWaypoint [_posOrigin, 50];
		_returnWP setWaypointStatements ["true", "if (!local this or !alive this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];

		_getoutWP = _cargoGroup addWaypoint [_landpos, 0];
		//_getoutWP setWaypointType "GETOUT";
		_getoutWP setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this)"];
		_reinfWP = _cargoGroup addWaypoint [_posDest, 0];
		_reinfWP setWaypointBehaviour "AWARE";
		_landWP synchronizeWaypoint [_getoutWP];
	}
	else
	{
		if (_vehicleType in vehFastRope) then
		{
			[_vehicle, _cargoGroup, _posDest, _posOrigin, _crewGroup, true] spawn A3A_fnc_fastrope;
		}
		else
		{
			[_vehicle, _cargoGroup, _posDest, _mrkOrigin, true] spawn A3A_fnc_paradrop;
		};
	};
};

ServerInfo_2("Spawn performed: Vehicle type %1 with %2 troops", _vehicleType, count units _cargoGroup);


// Allow the convoy a generous time to arrive
private _timeout = if (_isLand) then {
	time + ([_mrkDest, _mrkOrigin] call A3A_fnc_findNavDistance) / 6 + 300;
} else {
	time + (_posOrigin distance2d _posDest) / 30 + 600;
};

// termination conditions:
// - everyone dead or timeout exceeded
// - group leader out of vehicle and within 200m of target
waituntil {
	sleep 10;
	private _leader = leader _cargoGroup;
	{ alive _x } count (units _cargoGroup) == 0 || time > _timeout
	|| { _leader == vehicle _leader && { _leader distance _posDest < 200 } }
};


// Clean up this stuff regardless of success
if !(isNull _landpad) then { deleteVehicle _landpad };
[_vehicle] spawn A3A_fnc_VEHdespawner;
[_crewGroup] spawn A3A_fnc_enemyReturnToBase;


private _units = (units _cargoGroup) select { alive _x };
if (count _units == 0 || time > _timeout || _side != (sidesX getVariable _mrkDest)) exitWith
{
	Debug_2("patrolReinf failure: time %1, units %2", _timeout - time, count _units);

	// Failure case, RTB and add to killzones
	[_cargoGroup] spawn A3A_fnc_enemyReturnToBase;

	// TODO: Only care about actual pathfinding (timeout) for killzones maybe?
	if (_isLand and _side == (sidesX getVariable _mrkOrigin)) then {
		private _killzones = killZones getVariable [_mrkOrigin,[]];
		_killzones pushBack _mrkDest;
		killZones setVariable [_mrkOrigin,_killzones,true];
	};

    ServerInfo_2("Reinf on %1 failed, returning with %2 units", _mrkDest, count units _cargoGroup);
};

ServerInfo_2("Reinf on %1 successful, adding %2 units", _mrkDest, count units _cargoGroup);

[_cargoGroup, _mrkDest] call A3A_fnc_enemyGarrison;
