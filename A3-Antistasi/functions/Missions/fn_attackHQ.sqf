//Mission: HQ is under attack
if (!isServer and hasInterface) exitWith{};

_positionX = getMarkerPos respawnTeamPlayer;

_pilots = [];
_vehiclesX = [];
_groups = [];
_soldiers = [];

if ({(_x distance _positionX < 500) and (typeOf _x == staticAAteamPlayer)} count staticsToSave > 4) exitWith {};

_airportsX = airportsX select {(sidesX getVariable [_x,sideUnknown] != teamPlayer) and (spawner getVariable _x == 2)};
if (count _airportsX == 0) exitWith {};
_airportX = [_airportsX,_positionX] call BIS_fnc_nearestPosition;
_posOrigin = getMarkerPos _airportX;
_sideX = if (sidesX getVariable [_airportX,sideUnknown] == Occupants) then {Occupants} else {Invaders};

private _taskId = "DEF_HQ" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[format [localize "STR_antistasi_mission_defend_text",name petros],format [localize "STR_antistasi_mission_defend_name",name petros],respawnTeamPlayer],_positionX,true,10,true,"Defend",true] call BIS_fnc_taskCreate;
[[_sideX],_taskId+"B",[format [localize "STR_antistasi_mission_kill_text",name petros, nameTeamPlayer],format [localize "STR_antistasi_mission_kill_name",name petros],respawnTeamPlayer],_positionX,true,10,true,"Attack",true] call BIS_fnc_taskCreate;
[_taskId, "DEF_HQ", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

_typesVeh = if (_sideX == Occupants) then {vehNATOAttackHelis} else {vehCSATAttackHelis};
_typesVeh = _typesVeh select {[_x] call A3A_fnc_vehAvailable};

if (count _typesVeh > 0) then
	{
	_typeVehX = selectRandom _typesVeh;
	//_pos = [_positionX, distanceSPWN * 3, random 360] call BIS_Fnc_relPos;
	_vehicle=[_posOrigin, 0, _typeVehX, _sideX] call A3A_fnc_spawnVehicle;
	_heli = _vehicle select 0;
	_heliCrew = _vehicle select 1;
	_groupHeli = _vehicle select 2;
	_pilots = _pilots + _heliCrew;
	_groups pushBack _groupHeli;
	_vehiclesX pushBack _heli;
	{[_x] call A3A_fnc_NATOinit} forEach _heliCrew;
	[_heli, _sideX] call A3A_fnc_AIVEHinit;
	_wp1 = _groupHeli addWaypoint [_positionX, 0];
	_wp1 setWaypointType "SAD";
	//[_heli,"Air Attack"] spawn A3A_fnc_inmuneConvoy;
	sleep 30;
	};
_typesVeh = if (_sideX == Occupants) then {vehNATOTransportHelis} else {vehCSATTransportHelis};
if (_typesVeh isEqualTo []) then {if (_sideX == Occupants) then {vehNATOTransportPlanes} else {vehCSATTransportPlanes};};
_typeGroup = if (_sideX == Occupants) then {NATOSpecOp} else {CSATSpecOp};

for "_i" from 0 to (round random 2) do
	{
	_typeVehX = selectRandom _typesVeh;
	//_pos = [_positionX, distanceSPWN * 3, random 360] call BIS_Fnc_relPos;
	_vehicle=[_posOrigin, 0, _typeVehX, _sideX] call A3A_fnc_spawnVehicle;
	_heli = _vehicle select 0;
	_heliCrew = _vehicle select 1;
	_groupHeli = _vehicle select 2;
	_pilots = _pilots + _heliCrew;
	_groups pushBack _groupHeli;
	_vehiclesX pushBack _heli;

	{_x setBehaviour "CARELESS";} forEach units _groupHeli;
	_groupX = [_posOrigin, _sideX, _typeGroup] call A3A_fnc_spawnGroup;
	{_x assignAsCargo _heli; _x moveInCargo _heli; _soldiers pushBack _x; [_x] call A3A_fnc_NATOinit} forEach units _groupX;
	_groups pushBack _groupX;
	//[_heli,"Air Transport"] spawn A3A_fnc_inmuneConvoy;
	if (_typeVehX isKindOf "Plane") then {
		[_heli,_groupX,_positionX,_posOrigin] spawn A3A_fnc_paradrop;
	} else {
		[_heli,_groupX,_positionX,_posOrigin,_groupHeli] spawn A3A_fnc_fastrope;
	};


	sleep 10;
	};

waitUntil {sleep 1;({[_x] call A3A_fnc_canFight} count _soldiers < {!([_x] call A3A_fnc_canFight)} count _soldiers) or (_positionX distance getMarkerPos respawnTeamPlayer > 999) or (!alive petros)};

if (!alive petros) then
	{
	[_taskId, "DEF_HQ", "FAILED", true] call A3A_fnc_taskSetState;
	}
else
	{
	[_taskId, "DEF_HQ", "SUCCEEDED", true] call A3A_fnc_taskSetState;
	if (_positionX distance getMarkerPos respawnTeamPlayer < 999) then
		{
        if(_sideX == Occupants) then
        {
            [Occupants, 10, 60] remoteExec ["A3A_fnc_addAggression",2];
            [Invaders, 5, 60] remoteExec ["A3A_fnc_addAggression",2];
        }
        else
        {
            [Occupants, 5, 60] remoteExec ["A3A_fnc_addAggression",2];
            [Invaders, 10, 60] remoteExec ["A3A_fnc_addAggression",2];
        };
		[0,300] remoteExec ["A3A_fnc_resourcesFIA",2];
		//[-5,5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		{if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_positionX,teamPlayer] call A3A_fnc_distanceUnits);
		};
	};

[_taskId, "DEF_HQ", 1200, true] spawn A3A_fnc_taskDelete;
sleep 60;

{
	// return to base
	private _wp = _x addWaypoint [_posOrigin, 50];
	_wp setWaypointType "MOVE";
	_x setCurrentWaypoint _wp;
	[_x] spawn A3A_fnc_groupDespawner;
} forEach _groups;

{ [_x] spawn A3A_fnc_VEHdespawner } forEach _vehiclesX;
