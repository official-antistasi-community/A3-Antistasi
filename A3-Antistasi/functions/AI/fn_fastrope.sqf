private ["_veh","_groupX","_positionX","_posOrigin","_heli","_landpos","_wp","_d","_wp2","_wp3","_xRef","_yRef","_reinf","_dist"];

_veh = _this select 0;
_groupX = _this select 1;
_positionX = _this select 2;
_posOrigin = _this select 3;
_heli = _this select 4;
_reinf = if (count _this > 5) then {_this select 5} else {false};


_xRef = 2;
_yRef = 1;
/*
if (typeOf _veh == "B_Heli_Transport_01_camo_F") then
	{
	_xRef = 2;
	_yRef = 1;
	};
*/
_landpos = [];
_dist = if (_reinf) then {30} else {100 + random 100};

{_x disableAI "TARGET"; _x disableAI "AUTOTARGET"} foreach units _heli;
while {true} do
	{
 	_landpos = _positionX getPos [_dist,random 360];
 	if (!surfaceIsWater _landpos) exitWith {};
	};
_landpos set [2,0];
{_x setBehaviour "CARELESS";} forEach units _heli;
_wp = _heli addWaypoint [_landpos, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointSpeed "FULL";
_wp setWaypointCompletionRadius 3;



waitUntil {sleep 1; (not alive _veh) or (_veh distance _landpos < 550) or !(canMove _veh)};

_veh flyInHeight 15;

//_veh animateDoor ['door_R', 1];

waitUntil {sleep 1; (not alive _veh) or ((speed _veh < 1) and (speed _veh > -1)) or !(canMove _veh)};

if (alive _veh) then
	{
	[_veh] call A3A_fnc_smokeCoverAuto;

	{
	[_veh,_x,_xRef,_yRef] spawn
		{
		private ["_veh","_unit","_d","_xRef","_yRef"];
		_veh = _this select 0;
		_unit = _this select 1;
		_xRef = _this select 2;
		_yRef = _this select 3;
		waitUntil {((speed _veh < 1) and (speed _veh > -1))};
		_d = -1;
		unassignVehicle _unit;
		moveOut _unit;
		[_unit,"gunner_standup01"] remoteExec ["switchmove"];
		_unit attachTo [_veh, [_xRef,_yRef,_d]];
		while {((getposATL _unit select 2) > 1) and (alive _veh) and (alive _unit) and (speed _veh < 10) and (speed _veh > -10)} do
			{
			_unit attachTo [_veh, [2,1,_d]];
			_d = _d - 0.35;
			sleep 0.005;
			};
		detach _unit;
		[_unit,""] remoteExec ["switchMove"];
		sleep 0.5;
		};
	sleep 5 + random 2;
	} forEach units _groupX;
	};

waitUntil {sleep 1; (not alive _veh) or ((count assignedCargo _veh == 0) and (count attachedObjects _veh == 0))};


sleep 5;
_veh flyInHeight 150;
//_veh animateDoor ['door_R', 0];

if !(_reinf) then
	{
	_wp2 = _groupX addWaypoint [(position (leader _groupX)), 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) spawn A3A_fnc_attackDrillAI"];
	_wp2 = _groupX addWaypoint [_positionX, 1];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointStatements ["true","if !(local this) exitWith {}; {if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
	_wp2 = _groupX addWaypoint [_positionX, 2];
	_wp2 setWaypointType "SAD";
	}
else
	{
	_wp2 = _groupX addWaypoint [_positionX, 0];
	_wp2 setWaypointType "MOVE";
	};
_wp3 = _heli addWaypoint [_posOrigin, 1];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "NORMAL";
_wp3 setWaypointBehaviour "CARELESS";
_wp3 setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
{_x setBehaviour "CARELESS";} forEach units _heli;
