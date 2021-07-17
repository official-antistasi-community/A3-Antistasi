if (!isServer and hasInterface) exitWith {};
private ["_posOrigin","_typeGroup","_nameOrigin","_markTsk","_wp1","_soldiers","_landpos","_pad","_vehiclesX","_wp0","_wp3","_wp4","_wp2","_groupX","_groups","_typeAirVehicle","_vehicle","_pilots","_rnd","_resourcesAAF","_nVeh","_radiusX","_roads","_Vwp1","_tanksX","_road","_veh","_vehCrew","_groupVeh","_Vwp0","_size","_Hwp0","_groupX1","_uav","_groupUAV","_uwp0","_tsk","_vehicle","_soldierX","_pilot","_attackDestination","_posDestination","_prestigeCSAT","_base","_airportX","_nameDestination","_missionExpireTime","_soldiersSpawned","_nul","_pos","_timeOut"];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
_attackDestination = _this select 0;
_attackOrigin = _this select 1;
bigAttackInProgress = true;
publicVariable "bigAttackInProgress";
_posDestination = getMarkerPos _attackDestination;
_posOrigin = getMarkerPos _attackOrigin;
_groups = [];
_soldiers = [];
_pilots = [];
_vehiclesX = [];
_civilians = [];

Info_2("Launching CSAT Punish Against %1 from %2", _attackDestination, _attackOrigin);

_nameDestination = [_attackDestination] call A3A_fnc_localizar;
private _taskId = "invaderPunish" + str A3A_taskCount;
[[teamPlayer,civilian,Occupants],_taskId,[format [localize "STR_antistasi_mission_invader_text",_nameDestination,nameInvaders],format [localize "STR_antistasi_mission_invader_name",nameInvaders],_attackDestination],getMarkerPos _attackDestination,false,0,true,"Defend",true] call BIS_fnc_taskCreate;
[_taskId, "invaderPunish", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];


private _reveal = [_posDestination, Invaders] call A3A_fnc_calculateSupportCallReveal;
[_posDestination, 4, ["MORTAR"], Invaders, _reveal] remoteExec ["A3A_fnc_sendSupport", 2];
private _sideTarget = if (sidesX getVariable [_attackDestination,sideUnknown] == Occupants) then {Occupants} else {teamPlayer};
_missionExpireTime = time + 3600;

private _invaderAirTransport = vehCSATTransportHelis + vehCSATTransportPlanes;

for "_i" from 1 to 3 do {
	_typeAirVehicle = if (_i != 3) then {selectRandom (vehCSATAir select {[_x] call A3A_fnc_vehAvailable})} else {selectRandom (_invaderAirTransport select {[_x] call A3A_fnc_vehAvailable})};
	_timeOut = 0;
	_pos = _posOrigin findEmptyPosition [0,100,_typeAirVehicle];
	while {_timeOut < 60} do {
		if (count _pos > 0) exitWith {};
		_timeOut = _timeOut + 1;
		_pos = _posOrigin findEmptyPosition [0,100,_typeAirVehicle];
		sleep 1;
	};
	if (count _pos == 0) then {_pos = _posOrigin};
	private _spawnResult = [_pos, 0, _typeAirVehicle, Invaders] call A3A_fnc_spawnVehicle;
	private _veh = _spawnResult select 0;
	private _vehCrew = _spawnResult select 1;
	{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
	[_veh, Invaders] call A3A_fnc_AIVEHinit;
	_groupVeh = _spawnResult select 2;
	_pilots append _vehCrew;
	_groups pushBack _groupVeh;
	_vehiclesX pushBack _veh;

	//If spawning a plane, it needs moving into the air.
	if (_typeAirVehicle isKindOf "Plane") then {
		_veh setDir ((getDir _veh) + (_veh getRelDir _posDestination));
		_veh setPos (getPos _veh vectorAdd [0, 0, 300]);
		_veh setVelocityModelSpace (velocityModelSpace _veh vectorAdd [0, 150, 10]);
	};

	//If we're an attack vehicle.
	if (not(_typeAirVehicle in _invaderAirTransport)) then {
		_wp1 = _groupVeh addWaypoint [_posDestination, 0];
		_wp1 setWaypointType "SAD";
		//[_veh,"Air Attack"] spawn A3A_fnc_inmuneConvoy;
	} else {
		{_x setBehaviour "CARELESS";} forEach units _groupVeh;
		_typeGroup = [_typeAirVehicle,Invaders] call A3A_fnc_cargoSeats;
		_groupX = [_posOrigin, Invaders, _typeGroup] call A3A_fnc_spawnGroup;
		{_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x; [_x] call A3A_fnc_NATOinit; _x setVariable ["originX",_attackOrigin]} forEach units _groupX;
		_groups pushBack _groupX;
		//[_veh,"CSAT Air Transport"] spawn A3A_fnc_inmuneConvoy;

		if (_typeAirVehicle isKindOf "Plane") then {
			[_veh,_groupX,_attackDestination,_attackOrigin] spawn A3A_fnc_paradrop;
		} else {
			if (not(_typeAirVehicle in vehFastRope)) then {
				_landPos = _posDestination getPos [(random 500) + 300, random 360];
				_landPos = [_landPos, 200, 350, 10, 0, 0.20, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
				if !(_landPos isEqualTo [0,0,0]) then {
					_landPos set [2, 0];
					_pad = createVehicle ["Land_HelipadEmpty_F", _landpos, [], 0, "NONE"];
					_vehiclesX pushBack _pad;
					_wp0 = _groupVeh addWaypoint [_landpos, 0];
					_wp0 setWaypointType "TR UNLOAD";
					_wp0 setWaypointStatements ["true", "if !(local this) exitWith {}; (vehicle this) land 'GET OUT'"];
					[_groupVeh,0] setWaypointBehaviour "CARELESS";
					_wp3 = _groupX addWaypoint [_landpos, 0];
					_wp3 setWaypointType "GETOUT";
					_wp0 synchronizeWaypoint [_wp3];
					_wp4 = _groupX addWaypoint [_posDestination, 1];
					_wp4 setWaypointType "SAD";
					_wp4 setWaypointStatements ["true","if !(local this) exitWith {}; {if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
					_wp2 = _groupVeh addWaypoint [_posOrigin, 1];
					_wp2 setWaypointType "MOVE";
					_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
					[_groupVeh,1] setWaypointBehaviour "AWARE";
				};
			} else {
				{_x disableAI "TARGET"; _x disableAI "AUTOTARGET"} foreach units _groupVeh;
				[_veh,_groupX,_posDestination,_posOrigin,_groupVeh] spawn A3A_fnc_fastrope;
			};
		};
	};
	sleep 20;
};

_dataX = server getVariable _attackDestination;
_numCiv = _dataX select 0;
_numCiv = round (_numCiv /10);
//Is this intended to be another attack or should that be a small attack instead?
if (sidesX getVariable [_attackDestination,sideUnknown] == Occupants) then
{
    private _reveal = [_posDestination, Invaders] call A3A_fnc_calculateSupportCallReveal;
    [_posDestination, 4, ["QRF"], Invaders, _reveal] remoteExec ["A3A_fnc_sendSupport", 2];
};
if (_numCiv < 8) then {_numCiv = 8};
if (_numCiv > 40) then {_numCiv = 40};

_size = [_attackDestination] call A3A_fnc_sizeMarker;

_groupCivil = createGroup _sideTarget;
_groups pushBack _groupCivil;
_typeUnit = if (_sideTarget == teamPlayer) then {SDKUnarmed} else {NATOUnarmed};
for "_i" from 0 to _numCiv do {
	while {true} do {
		_pos = _posDestination getPos [random _size,random 360];
		if (!surfaceIsWater _pos) exitWith {};
	};
	_civ = [_groupCivil, _typeUnit,_pos, [],0,"NONE"] call A3A_fnc_createUnit;
	[_civ] call A3A_fnc_civInit;
	_rnd = random 100; 
  	if (_rnd < 75) then { 
			[_civ, selectRandom (unlockedsniperrifles + unlockedshotguns + Unlockedrifles + unlockedsmgs), 5, 0] call BIS_fnc_addWeapon;  
		} else {  
			[_civ, selectRandom (unlockedmachineguns + unlockedshotguns + Unlockedrifles + unlockedsmgs), 5, 0] call BIS_fnc_addWeapon;   
	}; 
	_civilians pushBack _civ;
	_civ setSkill 0.5;
	sleep 0.5;
};

_nul = [leader _groupCivil, _attackDestination, "AWARE","SPAWNED","NOVEH2"] execVM "scripts\UPSMON.sqf";//TODO need delete UPSMON link
_soldiersSpawned = count _soldiers;

if (tierWar >= 5) then {
	for "_i" from 0 to round random 1 do {
		if ([vehCSATPlane] call A3A_fnc_vehAvailable) then {
            private _reveal = [_posDestination, Invaders] call A3A_fnc_calculateSupportCallReveal;
            [_posDestination, 4, ["AIRSTRIKE"], Invaders, _reveal] remoteExec ["A3A_fnc_sendSupport", 2];
			sleep 30;
		};
	};
};

waitUntil {sleep 5; (({not (captive _x)} count _soldiers) < ({captive _x} count _soldiers)) or ({alive _x} count _soldiers < round (_soldiersSpawned / 3)) or (({(_x distance _posDestination < _size*2) and (not(vehicle _x isKindOf "Air")) and (alive _x) and (!captive _x)} count _soldiers) > 6*({(alive _x) and (_x distance _posDestination < _size*2)} count _civilians)) or (time > _missionExpireTime)};

if ((({not (captive _x)} count _soldiers) < ({captive _x} count _soldiers)) or ({alive _x} count _soldiers < round (_soldiersSpawned / 3)) or (time > _missionExpireTime)) then {
	{_x doMove [0,0,0]} forEach _soldiers;
	[_taskId, "invaderPunish", "SUCCEEDED"] call A3A_fnc_taskSetState;
	if ({(side _x == teamPlayer) and (_x distance _posDestination < _size * 2)} count allUnits >= {(side _x == _sideTarget) and (_x distance _posDestination < _size * 2)} count allUnits) then {
		if (sidesX getVariable [_attackDestination,sideUnknown] == Occupants) then {[-15,15,_posDestination] remoteExec ["A3A_fnc_citySupportChange",2]} else {[-5,15,_posDestination] remoteExec ["A3A_fnc_citySupportChange",2]};
        Debug("aggroEvent | Rebels won a punishment mission");
        [Occupants, -10, 90] remoteExec ["A3A_fnc_addAggression",2];
        [Invaders, 40, 150] remoteExec ["A3A_fnc_addAggression",2];
		{[-10,10,_x] remoteExec ["A3A_fnc_citySupportChange",2]} forEach citiesX;
		{if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posDestination,teamPlayer] call A3A_fnc_distanceUnits);
		[10,theBoss] call A3A_fnc_playerScoreAdd;
	} else {
		if (sidesX getVariable [_attackDestination,sideUnknown] == Occupants) then {[15,0,_posDestination] remoteExec ["A3A_fnc_citySupportChange",2]} else {[15,0,_posDestination] remoteExec ["A3A_fnc_citySupportChange",2]};
		{[10,0,_x] remoteExec ["A3A_fnc_citySupportChange",2]} forEach citiesX;
	};
} else {
	[_taskId, "invaderPunish", "FAILED"] call A3A_fnc_taskSetState;
	[-20,-20,_posDestination] remoteExec ["A3A_fnc_citySupportChange",2];
	{[-10,-10,_x] remoteExec ["A3A_fnc_citySupportChange",2]} forEach citiesX;
	destroyedSites = destroyedSites + [_attackDestination];
	publicVariable "destroyedSites";
	for "_i" from 1 to 60 do {
		_mineX = createMine ["APERSMine",_posDestination,[],_size];
		Invaders revealMine _mineX;
	};
	[_attackDestination] call A3A_fnc_destroyCity;
};

sleep 15;
[_taskId, "invaderPunish", 0] spawn A3A_fnc_taskDelete;
[3600, Invaders] remoteExec ["A3A_fnc_timingCA", 2];

bigAttackInProgress = false;
publicVariable "bigAttackInProgress";


// Order remaining aggressor units back to base, hand them to the group despawner
{
	private _wp = _x addWaypoint [_posOrigin, 50];
	_wp setWaypointType "MOVE";
	_x setCurrentWaypoint _wp;
	[_x] spawn A3A_fnc_groupDespawner;
} forEach _groups;

{ [_x] spawn A3A_fnc_VEHdespawner } forEach _vehiclesX;


// When the city marker is despawned, get rid of the civilians
waitUntil {sleep 5; (spawner getVariable _attackDestination == 2)};
{deleteVehicle _x} forEach _civilians;
deleteGroup _groupCivil;
