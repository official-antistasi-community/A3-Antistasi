params ["_structureType", "_posASL", "_dir"];

private _positionX = ASLtoATL _posASL;

private _isPlayer = if (player == build_engineerSelected) then {true} else {false};
private _timeOut = time + 30;
private _titleStr = localize "STR_A3A_fn_reinf_buildinfo_title";

if (!_isPlayer) then
{
	build_engineerSelected doMove _positionX
}
else
{
	A3A_build_time = A3A_build_time / 2;
	if ("ToolKit" in items player) then { A3A_build_time = A3A_build_time  * .6; }; // if toolkit in invertory then 40% reduction in time.
	[_titleStr, localize "STR_A3A_fn_reinf_buildCreVehCall_walk"] call A3A_fnc_customHint;
};

build_targetLocation = _positionX;
build_atBuildLocation = false;
build_cancelBuild = false;

addMissionEventHandler ["Draw3D", {
	if (build_atBuildLocation || build_cancelBuild) exitWith {
		removeMissionEventHandler ["Draw3D", _thisEventHandler];
	};
	drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", [1,1,1,1], build_targetLocation, 1,1,0,"Build", 0, 0.05, "PuristaMedium"];
}];

waitUntil {sleep 1;(time > _timeOut) or (build_engineerSelected distance _positionX < 3)};

if (time > _timeOut) exitWith
{
	build_cancelBuild = true;
	[_titleStr, localize "STR_A3A_fn_reinf_buildCreVehCall_no_move"] call A3A_fnc_customHint;
};

build_atBuildLocation = true;
build_targetLocation = nil;


if (build_cost > 0) then
	{
	if (!isMultiPlayer) then
		{
		_nul = [0, - build_cost] remoteExec ["A3A_fnc_resourcesFIA",2];
		}
	else
		{
		[-build_cost] call A3A_fnc_resourcesPlayer;
		};
	};

build_engineerSelected setVariable ["constructing",true];

_timeOut = time + A3A_build_time;

if (!_isPlayer) then
	{
	{build_engineerSelected disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
	};

build_engineerSelected playMoveNow selectRandom medicAnims;

build_engineerSelected addEventHandler ["AnimDone",
	{
	private _engineer = _this select 0;
	if (([_engineer] call A3A_fnc_canFight) and !(_engineer getVariable ["helping",false]) and !(_engineer getVariable ["rearming",false]) and (_engineer getVariable ["constructing",false])) then
		{
		_engineer playMoveNow selectRandom medicAnims;
		}
	else
		{
		_engineer removeEventHandler ["AnimDone",_thisEventHandler];
		};
	}];

waitUntil  {sleep 5; !([build_engineerSelected] call A3A_fnc_canFight) or (build_engineerSelected getVariable ["helping",false]) or (build_engineerSelected getVariable ["rearming",false]) or (build_engineerSelected distance _positionX > 4) or (time > _timeOut)};

build_engineerSelected setVariable ["constructing",false];
if (!_isPlayer) then {{build_engineerSelected enableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"]};

if (time <= _timeOut) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_buildCreVehCall_cancelled"] call A3A_fnc_customHint;};
if (!_isPlayer) then {build_engineerSelected doFollow (leader build_engineerSelected)};

private _veh = createVehicle [_structureType, _positionX, [], 0, "CAN_COLLIDE"];
_veh setDir _dir;
//save performance by turning off simulations 
_veh enableSimulationGlobal false;

if ((build_type == "SB") or (build_type == "CB")) exitWith
{
	staticsToSave pushBackUnique _veh;
	publicVariable "staticsToSave"
};


//falta inicializarlo en veh init
if (build_type == "RB") then
	{
	sleep 30;
	_l1 = "#lightpoint" createVehicle getpos _veh;
	_l1 setLightDayLight true;
	_l1 setLightColor [5, 2.5, 0];
	_l1 setLightBrightness 0.1;
	_l1 setLightAmbient [5, 2.5, 0];
	_l1 lightAttachObject [_veh, [0, 0, 0]];
	_l1 setLightAttenuation [3, 0, 0, 0.6];
	_source01 = "#particlesource" createVehicle getpos _veh;
	_source01 setParticleClass "BigDestructionFire";
	_source02 = "#particlesource" createVehicle getpos _veh;
	_source02 setParticleClass "BigDestructionSmoke";
	[_l1,_source01,_source02,_veh] spawn
		{
		private _veh = _this select 3;
		while {alive _veh} do
			{
			_veh say3D "fire";
			sleep 13;
			};
		{deleteVehicle _x} forEach (_this - [_veh]);
		};
	};

build_nearestFriendlyMarker = nil;
build_engineerSelected = nil;

while {alive _veh} do
	{
	if ((not([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits)) and (_veh distance getMarkerPos respawnTeamPlayer > 100)) then
		{
		deleteVehicle _veh
		};
	sleep 60;
	};
