//Mission: Capture/destroy the convoy
if (!isServer and hasInterface) exitWith {};
params ["_mrkDest", "_mrkOrigin", ["_convoyType", ""]];

private _difficult = if (random 10 < tierWar) then {true} else {false};
private _sideX = if (sidesX getVariable [_mrkOrigin,sideUnknown] == Occupants) then {Occupants} else {Invaders};
_isMilitia = false;
if (_sideX == Occupants and (random 10 >= tierWar) and !(_difficult)) then { _isMilitia = true };

private _posOrigin = getMarkerPos _mrkOrigin;
private _posDest = getMarkerPos _mrkDest;
private _posHQ = getMarkerPos respawnTeamPlayer;

private _soldiers = [];
private _vehiclesX = [];
private _POWS = [];
private _reinforcementsX = [];


// Setup start/end times and convoy type

private _timeXfin = 120;
private _dateFinal = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeXfin];
private _enddateNum = dateToNumber _dateFinal;

private _convoyTypes = [];
if ((_mrkDest in airportsX) or (_mrkDest in outposts)) then
{
	_convoyTypes = ["Ammunition","Armor"];
	if (_mrkDest in outposts) then {if (((count (garrison getVariable [_mrkDest, []]))/2) >= [_mrkDest] call A3A_fnc_garrisonSize) then {_convoyTypes pushBack "Reinforcements"}};
}
else
{
	if (_mrkDest in citiesX) then
	{
		if (sidesX getVariable [_mrkDest,sideUnknown] == Occupants) then {_convoyTypes = ["Supplies"]} else {_convoyTypes = ["Supplies"]}
	}
	else
	{
		if ((_mrkDest in resourcesX) or (_mrkDest in factories)) then {_convoyTypes = ["Money"]} else {_convoyTypes = ["Prisoners"]};
		if (((count (garrison getVariable [_mrkDest, []]))/2) >= [_mrkDest] call A3A_fnc_garrisonSize) then {_convoyTypes pushBack "Reinforcements"};
	};
};

if (_convoyType == "") then { _convoyType = selectRandom _convoyTypes };

private _timeLimit = if (_difficult) then {0} else { (round random 5)+5 }; // 0 or 5-10 minute limit - there's already good a chance for 0 seconds, why have a double chance (0-10)?
private _dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
private _dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly when put through the function
private _displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

private _nameDest = [_mrkDest] call A3A_fnc_localizar;
private _nameOrigin = [_mrkOrigin] call A3A_fnc_localizar;
[_mrkOrigin,30] call A3A_fnc_addTimeForIdle;

private _textX = "";
private _taskState = "CREATED";
private _taskTitle = "";
private _taskIcon = "";
private _taskState1 = "CREATED";
private _typeVehObj = "";

switch (_convoyType) do
{
	case "Ammunition":
	{
		_textX = format ["A convoy from %1 is about to depart at %2. It will provide ammunition to %3. Try to intercept it. Steal or destroy that truck before it reaches it's destination.",_nameOrigin,_displayTime,_nameDest];
		_taskTitle = "Ammo Convoy";
		_taskIcon = "rearm";
		_typeVehObj = if (_sideX == Occupants) then {vehNATOAmmoTruck} else {vehCSATAmmoTruck};
	};
	case "Armor":
	{
		_textX = format ["A convoy from %1 is about to depart at %2. It will reinforce %3 with armored vehicles. Try to intercept it. Steal or destroy that thing before it reaches it's destination.",_nameOrigin,_displayTime,_nameDest];
		_taskTitle = "Armored Convoy";
		_taskIcon = "Destroy";
		_typeVehObj = if (_sideX == Occupants) then {vehNATOAA} else {vehCSATAA};
	};
	case "Prisoners":
	{
		_textX = format ["A group of POWs is being transported from %1 to %3, and it's about to depart at %2. Try to intercept it. Kill or capture the truck driver to make them join you and bring them to HQ. Alive if possible.",_nameOrigin,_displayTime,_nameDest];
		_taskTitle = "Prisoner Convoy";
		_taskIcon = "run";
		_typeVehObj = if (_sideX == Occupants) then {selectRandom vehNATOTrucks} else {selectRandom vehCSATTrucks};
	};
	case "Reinforcements":
	{
		_textX = format ["Reinforcements are being sent from %1 to %3 in a convoy, and it's about to depart at %2. Try to intercept and kill all the troops and vehicle objective.",_nameOrigin,_displayTime,_nameDest];
		_taskTitle = "Reinforcements Convoy";
		_taskIcon = "run";
		_typeVehObj = if (_sideX == Occupants) then {selectRandom vehNATOTrucks} else {selectRandom vehCSATTrucks};
	};
	case "Money":
	{
		_textX = format ["A truck with plenty of money is being moved from %1 to %3, and it's about to depart at %2. Steal that truck and bring it to HQ. Those funds will be very welcome.",_nameOrigin,_displayTime,_nameDest];
		_taskTitle = "Money Convoy";
		_taskIcon = "move";
		_typeVehObj = "C_Van_01_box_F";
	};
	case "Supplies":
	{
		_textX = format ["A truck with medical supplies destination %3 it's about to depart at %2 from %1. Steal that truck bring it to %3 and let people in there know it is %4 who's giving those supplies.",_nameOrigin,_displayTime,_nameDest,nameTeamPlayer];
		_taskTitle = "Supply Convoy";
		_taskIcon = "heal";
		_typeVehObj = "C_Van_01_box_F";
	};
};

[[teamPlayer,civilian],"CONVOY",[_textX,_taskTitle,_mrkDest],_posDest,false,0,true,_taskIcon,true] call BIS_fnc_taskCreate;
[[_sideX],"CONVOY1",[format ["A convoy from %1 to %3, it's about to depart at %2. Protect it from any possible attack.",_nameOrigin,_displayTime,_nameDest],"Protect Convoy",_mrkDest],_posDest,false,0,true,"run",true] call BIS_fnc_taskCreate;
missionsX pushBack ["CONVOY","CREATED"]; publicVariable "missionsX";
sleep (_timeLimit * 60);


// Setup spawn data

private _posOrig = [];
if (_mrkOrigin in airportsX) then
{
	// use the map-defined spawnpoint as a starting point for airfields
	private _spawnPoint = server getVariable (format ["spawn_%1", _mrkOrigin]);
	_posOrig = getMarkerPos _spawnPoint;
}
else
{
	private _spawnRoad = [getMarkerPos _mrkOrigin] call A3A_fnc_findNearestGoodRoad;
	_posOrig = position _spawnRoad;
};

// Shift to nearest nav point so that we don't drive backwards
_posOrig = [[_posOrig] call A3A_fnc_findNearestNavPoint] call A3A_fnc_getNavPos;

private _route = [_posOrig, _posDest] call A3A_fnc_findPath;
if (_route isEqualTo []) then {
	_route = [_posOrig, _posDest]
} else {
	_route deleteAt 0;		// origin will be doubled
};

private _vecdir = (_route select 0) vectorFromTo (_route select 1);
private _dir = (_route select 0) getDir (_route select 1);
private _distOffset = 30;					// how far down the road to place next vehicle
private _speedLimit = 40;

private _vehPool = [_sideX, ["Air"]] call A3A_fnc_getVehiclePoolForQRFs;


// Spawning worker functions

private _fnc_spawnConvoyVehicle = {
	params ["_vehType", "_markName"];

	private _pos = _posOrig vectorAdd (_vecdir vectorMultiply _distOffset);
	private _veh = createVehicle [_vehType, _pos, [], 5];
	_veh setDir _dir;
	_veh allowDamage false;
	_veh limitSpeed _speedLimit;

	private _group = createVehicleCrew _veh;
	_group addVehicle _veh;
	{
		// probably don't want civilian drivers here, but it's a pain atm
		if (side _group != civilian) then { [_x] call A3A_fnc_NATOinit };
		_x allowDamage false;
	} forEach (units _group);
	_soldiers append (units _group);

	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	[_veh, _markName] spawn A3A_fnc_inmuneConvoy;			// NOTE: should not be called unless moving within 60s
	_vehiclesX pushBack _veh;
	_distOffset = _distOffset - 15;
	_veh;
};

private _fnc_spawnEscortVehicle = {

	private _typeVehEsc = selectRandomWeighted _vehPool;
	private _veh = [_typeVehEsc, "Convoy Escort"] call _fnc_spawnConvoyVehicle;

	if (!_isMilitia) then
	{
		if (not(_typeVehEsc in vehTanks)) then
		{
			private _typeGroup = [_typeVehEsc,_sideX] call A3A_fnc_cargoSeats;
			private _groupEsc = [_posOrigin,_sideX, _typeGroup] call A3A_fnc_spawnGroup;
			{[_x] call A3A_fnc_NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh;} forEach units _groupEsc;
			_soldiers append (units _groupEsc);
		};
	}
	else
	{
		if (not(_typeVehEsc == vehFIAArmedCar)) then
		{
			private _typeGroup = selectRandom groupsFIASquad;
			if (_typeVehEsc == vehFIACar) then
			{
				_typeGroup = selectRandom groupsFIAMid;
			};
			private _groupEsc = [_posOrigin,_sideX, _typeGroup] call A3A_fnc_spawnGroup;
			{[_x] call A3A_fnc_NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh;} forEach units _groupEsc;
			_soldiers append (units _groupEsc);
		};
	};
};


// Convoy vehicle spawning

// Lead vehicle
private _typeVehX = if (_sideX == Occupants) then {if (!_isMilitia) then {selectRandom vehNATOLightArmed} else {vehPoliceCar}} else {selectRandom vehCSATLightArmed};
private _vehLead = [_typeVehX, "Convoy Lead"] call _fnc_spawnConvoyVehicle;


// Initial escort vehicles
private _countX = if (_difficult) then {2} else {1};
for "_i" from 1 to _countX do
{
	sleep 2;
	[] call _fnc_spawnEscortVehicle;
};

//Objective creation starts here ----------------------------------------------
sleep 2;
private _objText = if (_difficult) then {" Convoy Objective"} else {"Convoy Objective"};
private _vehObj = [_typeVehObj, _objText] call _fnc_spawnConvoyVehicle;

if (_convoyType == "Armor") then {_vehObj lock 3};// else {_vehObj forceFollowRoad true};
if (_convoyType == "Prisoners") then
{
	private _grpPOW = createGroup teamPlayer;
	for "_i" from 1 to (1+ round (random 11)) do
	{
		private _unit = [_grpPOW, SDKUnarmed, _posOrigin, [], 0, "NONE"] call A3A_fnc_createUnit;
		_unit setCaptive true;
		_unit disableAI "MOVE";
		_unit setBehaviour "CARELESS";
		_unit allowFleeing 0;
		_unit assignAsCargo _vehObj;
		_unit moveInCargo [_vehObj, _i + 3];
		removeAllWeapons _unit;
		removeAllAssignedItems _unit;
		[_unit,"refugee"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
		_POWS pushBack _unit;
		[_unit] call A3A_fnc_reDress;
	};
};
if (_convoyType == "Reinforcements") then
{
	private _typeGroup = [_typeVehObj,_sideX] call A3A_fnc_cargoSeats;
	private _groupEsc = [_posOrigin,_sideX,_typeGroup] call A3A_fnc_spawnGroup;
	{[_x] call A3A_fnc_NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh;} forEach units _groupEsc;
	_soldiers append (units _groupEsc);
	_reinforcementsX append (units _groupEsc);
};
if ((_convoyType == "Money") or (_convoyType == "Supplies")) then
{
	reportedVehs pushBack _vehObj;
	publicVariable "reportedVehs";
	_vehObj addEventHandler ["HandleDamage",{if (((_this select 1) find "wheel" != -1) and ((_this select 4=="") or (side (_this select 3) != teamPlayer)) and (!isPlayer driver (_this select 0))) then {0} else {(_this select 2)}}];
};

// Tail escort
sleep 2;
[] call _fnc_spawnEscortVehicle;


// Send vehicles on their way

private _fsmHandles = [];
_route deleteAt 0;
{
	_fsmHandles pushBack ([_x, _route] execFSM "FSMs\DriveAlongPath.fsm");
	sleep 3;
} forEach _vehiclesX;

// Remove spawn-suicide protection
{_x allowDamage true} forEach _vehiclesX;
{_x allowDamage true; if (vehicle _x == _x) then {deleteVehicle _x}} forEach _soldiers;


// Termination condition handling

private _bonus = if (_difficult) then {2} else {1};
private _distanceFromTargetForArrival = 200;

private _fnc_applyResults =
{
	params ["_success", "_success1", "_adjustCA", "_adjustBoss", "_aggroMod", "_aggroTime", "_type"];

	_taskState = if (_success) then { "SUCCEEDED" } else { "FAILED" };
	_taskState1 = if (_success1) then { "SUCCEEDED" } else { "FAILED" };

	[_adjustCA, _sideX] remoteExec ["A3A_fnc_timingCA", 2];
	[_adjustBoss, theBoss] call A3A_fnc_playerScoreAdd;

	if (_sideX == Occupants) then {
		[[_aggroMod, _aggroTime], [0, 0]] remoteExec ["A3A_fnc_prestige", 2]
	} else {
		[[0, 0], [_aggroMod, _aggroTime]] remoteExec ["A3A_fnc_prestige", 2]
	};

	if !(_success1) then {
		_killZones = killZones getVariable [_mrkOrigin,[]];
		_killZones = _killZones + [_mrkDest,_mrkDest];
		killZones setVariable [_mrkOrigin,_killZones,true];
	};

	private _eventText = format ["Rebels %1 a %2 convoy mission", ["lost", "won"] select _success, _type];
	[3, _eventText, "aggroEvent"] call A3A_fnc_log;
};

if (_convoyType == "Ammunition") then
{
	waitUntil {sleep 1; (dateToNumber date > _enddateNum) or (_vehObj distance _posDest < _distanceFromTargetForArrival) or (not alive _vehObj) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer))};
	if ((_vehObj distance _posDest < _distanceFromTargetForArrival) or (dateToNumber date >_enddateNum)) then
	{
		[false, true, -1200*_bonus, -10*_bonus, -5, 60, "ammo"] call _fnc_applyResults;
		clearMagazineCargoGlobal _vehObj;
		clearWeaponCargoGlobal _vehObj;
		clearItemCargoGlobal _vehObj;
		clearBackpackCargoGlobal _vehObj;
	}
	else
	{
		[true, false, 1800*_bonus, 5*_bonus, 25, 120, "ammo"] call _fnc_applyResults;
		[0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
		{
            if (isPlayer _x) then
            {
                [10*_bonus,_x] call A3A_fnc_playerScoreAdd
            };
        } forEach ([500,0,_vehObj,teamPlayer] call A3A_fnc_distanceUnits);
    };
};

if (_convoyType == "Armor") then
{
	waitUntil {sleep 1; (dateToNumber date > _enddateNum) or (_vehObj distance _posDest < _distanceFromTargetForArrival) or (not alive _vehObj) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer))};
	if ((_vehObj distance _posDest < _distanceFromTargetForArrival) or (dateToNumber date > _enddateNum)) then
	{
		[false, true, -1200*_bonus, -10*_bonus, -5, 60, "armor"] call _fnc_applyResults;
		server setVariable [_mrkDest,dateToNumber date,true];
	}
	else
	{
		[true, false, 1800*_bonus, 5*_bonus, 20, 90, "armor"] call _fnc_applyResults;
		[0,5*_bonus,_posDest] remoteExec ["A3A_fnc_citySupportChange",2];
		{
            if (isPlayer _x) then
            {
                [10*_bonus,_x] call A3A_fnc_playerScoreAdd
            };
        } forEach ([500,0,_vehObj,teamPlayer] call A3A_fnc_distanceUnits);
	};
};

if (_convoyType == "Prisoners") then
{
	waitUntil {sleep 1; (dateToNumber date > _enddateNum) or (_vehObj distance _posDest < _distanceFromTargetForArrival) or (not alive driver _vehObj) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer)) or ({alive _x} count _POWs == 0)};
	if ((_vehObj distance _posDest < _distanceFromTargetForArrival) or ({alive _x} count _POWs == 0) or (dateToNumber date > _enddateNum)) then
	{
		[false, true, 0, -10*_bonus, -10, 60, "prisoner"] call _fnc_applyResults;
	};
	if ((not alive driver _vehObj) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer))) then
	{
		{
            [_x,false] remoteExec ["setCaptive",_x];
            _x enableAI "MOVE";
            [_x] orderGetin false;
        } forEach _POWs;
		waitUntil {sleep 2; ({alive _x} count _POWs == 0) or ({(alive _x) and (_x distance _posHQ < 50)} count _POWs > 0) or (dateToNumber date > _enddateNum)};

		if (({alive _x} count _POWs == 0) or (dateToNumber date > _enddateNum)) then
		{
			[false, false, 0, -10*_bonus, 20, 120, "prisoner"] call _fnc_applyResults;
		}
		else
		{
			_countX = {(alive _x) and (_x distance _posHQ < 150)} count _POWs;
			[true, false, 0, _bonus*_countX/2, 10, 120, "prisoner"] call _fnc_applyResults;

			[_countX,_countX*300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
			[0,10*_bonus,_posOrigin] remoteExec ["A3A_fnc_citySupportChange",2];
			{[_countX,_x] call A3A_fnc_playerScoreAdd} forEach (allPlayers - (entities "HeadlessClient_F"));
		};
	};
};

if (_convoyType == "Reinforcements") then
{
	waitUntil {sleep 1; (dateToNumber date > _enddateNum) or (_vehObj distance _posDest < _distanceFromTargetForArrival) or ({(!alive _x) or (captive _x)} count _reinforcementsX == count _reinforcementsX)};
	if ({(!alive _x) or (captive _x)} count _reinforcementsX == count _reinforcementsX) then
	{
		[true, false, 0, 5*_bonus, 10, 90, "reinforcement"] call _fnc_applyResults;
		[0,10*_bonus,_posOrigin] remoteExec ["A3A_fnc_citySupportChange",2];
		{if (_x distance _vehObj < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
	}
	else
	{
		[false, true, 0, -10*_bonus, -10, 60, "reinforcement"] call _fnc_applyResults;
		_countX = {alive _x} count _reinforcementsX;
		if (_countX <= 8) then {_taskState1 = "FAILED"};
		if (sidesX getVariable [_mrkDest,sideUnknown] != teamPlayer) then
		{
			_typesX = [];
			{_typesX pushBack (typeOf _x)} forEach (_reinforcementsX select {alive _x});
			[_typesX,_sideX,_mrkDest,0] remoteExec ["A3A_fnc_garrisonUpdate",2];
		};
	};
};

if (_convoyType == "Money") then
{
	waitUntil {sleep 1; (dateToNumber date > _enddateNum) or (_vehObj distance _posDest < _distanceFromTargetForArrival) or (not alive _vehObj) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer))};
	if ((dateToNumber date > _enddateNum) or (_vehObj distance _posDest < _distanceFromTargetForArrival) or (not alive _vehObj)) then
	{
		if ((dateToNumber date > _enddateNum) or (_vehObj distance _posDest < _distanceFromTargetForArrival)) then
		{
			[false, true, -1200, -10*_bonus, -5, 60, "money"] call _fnc_applyResults;
		}
		else
		{
			[false, false, 1200, 0, -5, 60, "money"] call _fnc_applyResults;
		};
	};
	if ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer)) then
	{
		waitUntil {sleep 2; (_vehObj distance _posHQ < 50) or (not alive _vehObj) or (dateToNumber date > _enddateNum)};
		if ((not alive _vehObj) or (dateToNumber date > _enddateNum)) then
		{
			[false, false, 1200, 0, -5, 60, "money"] call _fnc_applyResults;
		};
		if (_vehObj distance _posHQ < 50) then
		{
			[true, false, 1200, 5*_bonus, 25, 120, "money"] call _fnc_applyResults;
			[0,5000*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
			{if (_x distance _vehObj < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
		};
	};
	reportedVehs = reportedVehs - [_vehObj];
	publicVariable "reportedVehs";
};

if (_convoyType == "Supplies") then
{
	waitUntil {sleep 1; (dateToNumber date > _enddateNum) or (_vehObj distance _posDest < _distanceFromTargetForArrival) or (not alive _vehObj) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer))};
	if (not alive _vehObj) then
	{
		[false, false, 0, -10*_bonus, 20, 120, "supply"] call _fnc_applyResults;
	};
	if ((dateToNumber date > _enddateNum) or (_vehObj distance _posDest < 300) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer))) then
	{
		if ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer)) then
		{
			waitUntil {sleep 1; (_vehObj distance _posDest < 100) or (not alive _vehObj) or (dateToNumber date > _enddateNum)};
			if (_vehObj distance _posDest < 100) then
			{
				[true, false, 0, 5*_bonus, 10, 90, "supply"] call _fnc_applyResults;
				[0,15*_bonus,_mrkDest] remoteExec ["A3A_fnc_citySupportChange",2];
				{if (_x distance _vehObj < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
			}
			else
			{
				[false, false, 0, -10*_bonus, -10, 60, "supply"] call _fnc_applyResults;
				[5*_bonus,-10*_bonus,_mrkDest] remoteExec ["A3A_fnc_citySupportChange",2];
			};
		}
		else
		{
			[false, true, 0, -10*_bonus, -10, 60, "supply"] call _fnc_applyResults;
			[15*_bonus,0,_mrkDest] remoteExec ["A3A_fnc_citySupportChange",2];
		};
	};
	reportedVehs = reportedVehs - [_vehObj];
	publicVariable "reportedVehs";
};

["CONVOY",[_textX,_taskTitle,_mrkDest],_posDest,_taskState] call A3A_fnc_taskUpdate;
["CONVOY1",[format ["A convoy from %1 to %3, it's about to depart at %2. Protect it from any possible attack.",_nameOrigin,_displayTime,_nameDest],"Protect Convoy",_mrkDest],_posDest,_taskState1] call A3A_fnc_taskUpdate;


// Cleanup

{ deleteVehicle _x } forEach _POWs;

_nul = [600,"CONVOY"] spawn A3A_fnc_deleteTask;
_nul = [0,"CONVOY1"] spawn A3A_fnc_deleteTask;

// abort active FSMs so that the groups merge
{ _x setFSMVariable ["_abort", true] } forEach _fsmHandles;
sleep 2;

// Groups change due to convoy crew group split/merge, so we recreate them
private _groups = [];
{ if (alive _x) then {_groups pushBackUnique (group _x)} } forEach _soldiers;
{ [_x] spawn A3A_fnc_groupDespawner } forEach _groups;
{ [_x] spawn A3A_fnc_VEHdespawner } forEach _vehiclesX;
