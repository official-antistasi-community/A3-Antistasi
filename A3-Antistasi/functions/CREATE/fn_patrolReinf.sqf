#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private ["_mrkDestination","_mrkOrigin","_numberX","_sideX","_typeGroup","_typeVehX","_indexX","_spawnPoint","_pos","_timeOut","_veh","_groupX","_landPos","_Vwp0","_posOrigin","_land","_pos1","_pos2"];

_mrkDestination = _this select 0;
_mrkOrigin = _this select 1;
_numberX = _this select 2;
_sideX = _this select 3;
Info_4("Spawning PatrolReinf. Dest:%1, Orig:%2, Size:%3, Side: %4",_mrkDestination,_mrkOrigin,_numberX,_sideX);
_posDestination = getMarkerPos _mrkDestination;
_posOrigin = getMarkerPos _mrkOrigin;

if ([_sideX] call A3A_fnc_remUnitCount < _numberX) exitWith {
    Info("Cancelling because maxUnits exceeded");
};

_land = if (_posOrigin distance _posDestination > distanceForLandAttack) then {false} else {true};
_typeGroup = if (_sideX == Occupants) then {if (_numberX == 4) then {selectRandom groupsNATOmid} else {selectRandom groupsNATOSquad}} else {if (_numberX == 4) then {selectRandom groupsCSATmid} else {selectRandom groupsCSATSquad}};
_typeVehX = "";
if (_land) then
{
	if (_sideX == Occupants) then {_typeVehX = selectRandom vehNATOTrucks} else {_typeVehX = selectRandom vehCSATTrucks};
}
else
{
	_vehPool = if (_sideX == Occupants) then {vehNATOTransportHelis + vehNATOTransportPlanes} else {vehCSATTransportHelis + vehCSATTransportPlanes};
    _vehPool = _vehPool arrayIntersect _vehPool;//ensure unique classnames
	if ((_numberX > 4) and (count _vehPool > 1) and !A3A_hasIFA) then {_vehPool = _vehPool - [vehNATOPatrolHeli,vehCSATPatrolHeli]};
	//_vehPool = _vehPool select {(_x isKindOf "Helicopter") and (_x in vehFastRope)};
	_typeVehX = selectRandom _vehPool;
};

_pos = [];
_veh = objNull;
_groupX = grpNull;
private _groupVeh = grpNull;
private _landpad = objNull;

if (_land) then
{
	_indexX = airportsX find _mrkOrigin;
	_spawnPoint = server getVariable (format ["spawn_%1", _mrkOrigin]);
	_pos = getMarkerPos _spawnPoint;
	_timeOut = 0;
	_pos = _pos findEmptyPosition [0,100,_typeVehX];
	while {_timeOut < 60} do
	{
		if (count _pos > 0) exitWith {};
		_timeOut = _timeOut + 1;
		_pos = _pos findEmptyPosition [0,100,_typeVehX];
		sleep 1;
	};
	if (count _pos == 0) then {_pos = getMarkerPos _spawnPoint};
	_veh = _typeVehX createVehicle _pos;
	_veh setDir (markerDir _spawnPoint);
	_groupX = [_pos,_sideX, _typeGroup,true,false] call A3A_fnc_spawnGroup;
	_groupX addVehicle _veh;
	{
		if (_x == leader _x) then {_x assignAsDriver _veh;_x moveInDriver _veh} else {_x assignAsCargo _veh;_x moveInCargo _veh};

		if (vehicle _x == _x) then
		{
			deleteVehicle _x;
		}
		else
		{
			[_x] call A3A_fnc_NATOinit;
		};
	} forEach units _groupX;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	[_veh,localize "STR_antistasi_markers_infTruck"] spawn A3A_fnc_inmuneConvoy;
//	_groupX spawn A3A_fnc_attackDrillAI;
	[_mrkOrigin,_posDestination,_groupX] call A3A_fnc_WPCreate;
	_Vwp0 = _groupX addWaypoint [_posDestination, 50];
	_Vwp0 setWaypointCompletionRadius 50;
	_Vwp0 setWaypointType "GETOUT";
	_Vwp1 = _groupX addWaypoint [_posDestination, 5];
	_Vwp1 setWaypointType "MOVE";
	}
else
{
	_pos = _posOrigin;
	_ang = 0;
	_size = [_mrkOrigin] call A3A_fnc_sizeMarker;
	_buildings = nearestObjects [_posOrigin, ["Land_LandMark_F","Land_runway_edgelight"], _size / 2];
	if (count _buildings > 1) then
	{
		_pos1 = getPos (_buildings select 0);
		_pos2 = getPos (_buildings select 1);
		_ang = [_pos1, _pos2] call BIS_fnc_DirTo;
		_pos = [_pos1, 5,_ang] call BIS_fnc_relPos;
	};
	if (count _pos == 0) then {_pos = _posOrigin};

	_vehicle=[_pos, _ang + 90,_typeVehX, _sideX] call A3A_fnc_spawnVehicle;
	_veh = _vehicle select 0;
	_vehCrew = _vehicle select 1;
	_groupVeh = _vehicle select 2;
	{ [_x] call A3A_fnc_NATOinit } forEach units _groupVeh;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;

	_groupX = [_posOrigin,_sideX,_typeGroup,true,false] call A3A_fnc_spawnGroup;
	{
		_x assignAsCargo _veh;
		_x moveInCargo _veh;
		if (vehicle _x == _x) then
		{
			deleteVehicle _x;
		}
		else
		{
			[_x] call A3A_fnc_NATOinit;
		};
	} forEach units _groupX;
	_landPos = if (_typeVehX isKindOf "Helicopter") then {[_posDestination, 0, 300, 10, 0, 0.20, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos} else {[0,0,0]};
	if !(_landPos isEqualTo [0,0,0]) then
	{
		_landPos set [2, 0];
		_landpad = createVehicle ["Land_HelipadEmpty_F", _landpos, [], 0, "NONE"];
		_wp0 = _groupVeh addWaypoint [_landpos, 0];
		_wp0 setWaypointType "TR UNLOAD";
		_wp0 setWaypointStatements ["true", "if !(local this) exitWith {}; (vehicle this) land 'GET OUT'"];
		_wp0 setWaypointBehaviour "CARELESS";
		_wp3 = _groupX addWaypoint [_landpos, 0];
		_wp3 setWaypointType "GETOUT";
//		_wp3 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) spawn A3A_fnc_attackDrillAI"];
		_wp0 synchronizeWaypoint [_wp3];
		_wp4 = _groupX addWaypoint [_posDestination, 5];
		_wp4 setWaypointType "MOVE";
		_wp2 = _groupVeh addWaypoint [_posOrigin, 1];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
		[_groupVeh,1] setWaypointBehaviour "AWARE";
	}
	else
	{
		if (_typeVehX in vehFastRope) then
		{
			[_veh,_groupX,_posDestination,_posOrigin,_groupVeh,true] spawn A3A_fnc_fastrope;
		}
		else
		{
			[_veh,_groupX,_posDestination,_mrkOrigin,true] spawn A3A_fnc_paradrop;
		};
	};
};

Info_2("Spawn performed: Vehicle type %1 with %2 troops", _typeVehX, count units _groupX);


// Allow the convoy a generous time to arrive
private _dist = _posOrigin distance _posDestination;
private _timeout = time + (if (_land) then { _dist / 3 + 300 } else { _dist / 15 + 600 });

// termination conditions:
// - everyone dead or timeout exceeded
// - group leader out of vehicle and within 50m of target
waituntil {
	sleep 10;
	private _leader = leader _groupX;
	{ alive _x } count (units _groupX) == 0 || time > _timeout
	|| { _leader == vehicle _leader && { _leader distance _posDestination < 50 } }
};


// Clean up this stuff regardless of success
if !(isNull _landpad) then { deleteVehicle _landpad };
[_veh] spawn A3A_fnc_VEHdespawner;
[_groupVeh] spawn A3A_fnc_groupDespawner;


private _units = (units _groupX) select { alive _x };
if (count _units == 0 || time > _timeout || _sideX != (sidesX getVariable _mrkDestination)) exitWith
{
	// Failure case, RTB and add to killzones

	private _wp = _groupX addWaypoint [_posOrigin, 50];
	_wp setWaypointType "MOVE";
	_groupX setCurrentWaypoint _wp;
	[_groupX] spawn A3A_fnc_groupDespawner;

	if (_sideX == (sidesX getVariable _mrkOrigin)) then {
		private _killzones = killZones getVariable [_mrkOrigin,[]];
		_killzones pushBack _mrkDestination;
		killZones setVariable [_mrkOrigin,_killzones,true];
	};

    Info_2("Reinf on %1 failed, returning with %2 units", _mrkDestination, count units _groupX);
};

Info_2("Reinf on %1 successful, adding %2 units", _mrkDestination, count units _groupX);

// Arrived successfully, add units to garrison and despawn with it
[_units, _sideX, _mrkDestination, 0] remoteExec ["A3A_fnc_garrisonUpdate", 2];
{
	_x setVariable ["markerX", _mrkDestination, true];
	_x setVariable ["spawner", nil, true];
} forEach _units;

waitUntil {sleep 5; (spawner getVariable _mrkDestination == 2)};
{ deleteVehicle _x } forEach _units;
