#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

while {true} do
{
	//sleep 600;//600
	nextTick = time + 600;
	waitUntil {sleep 15; time >= nextTick};
	if (isMultiplayer) then {waitUntil {sleep 10; isPlayer theBoss}};

	private _resAdd = 25;//0
	private _hrAdd = 0;//0
	private _popReb = 0;
	private _popGov = 0;
	private _popKilled = 0;
	private _popTotal = 0;

	private _suppBoost = 0.5 * (1+ ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports));
	private _resBoost = 1 + (0.25*({(sidesX getVariable [_x,sideUnknown] == teamPlayer) and !(_x in destroyedSites)} count factories));

	{
		private _city = _x;
		private _resAddCity = 0;
		private _hrAddCity = 0;
		private _cityData = server getVariable _city;
		_cityData params ["_numCiv", "_numVeh", "_supportGov", "_supportReb"];

		_popTotal = _popTotal + _numCiv;
		_popReb = _popReb + (_numCiv * (_supportReb / 100));
		_popGov = _popGov + (_numCiv * (_supportGov / 100));

		private _radioTowerSide = [_city] call A3A_fnc_getSideRadioTowerInfluence;
		_multiplyRes = if (_radioTowerSide != teamPlayer) then {0.5} else {1};

		if (_city in destroyedSites) then
		{
			_popKilled = _popKilled + _numCIV;
		}
		else
		{
			_resAddCity = _numciv * _multiplyRes * (_supportReb / 100) / 3;
			_hrAddCity = _numciv * (_supportReb / 10000);
			switch (_radioTowerSide) do
			{
				case teamPlayer: {[-1,_suppBoost,_city,false,true] spawn A3A_fnc_citySupportChange};
				case Occupants: {[1,-1,_city,false,true] spawn A3A_fnc_citySupportChange};
				case Invaders: {[-1,-1,_city,false,true] spawn A3A_fnc_citySupportChange};
			};
			if (sidesX getVariable [_city,sideUnknown] == Occupants) then
			{
				_resAddCity = _resAddCity / 2;
				_hrAddCity = _hrAddCity / 2;
			};
		};
		_resAdd = _resAdd + _resAddCity;
		_hrAdd = _hrAdd + _hrAddCity;

		// revuelta civil!!
		if ((_supportGov < _supportReb) and (sidesX getVariable [_city,sideUnknown] == Occupants)) then
		{
			["TaskSucceeded", ["", format [localize "STR_antistasi_notification_joined",[_city, false] call A3A_fnc_location,nameTeamPlayer]]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
			sidesX setVariable [_city,teamPlayer,true];
			[Occupants, 10, 60] remoteExec ["A3A_fnc_addAggression",2];
			_mrkD = format ["Dum%1",_city];
			_mrkD setMarkerColor colorTeamPlayer;
			garrison setVariable [_city,[],true];
			sleep 5;
			{_nul = [_city,_x] spawn A3A_fnc_deleteControls} forEach controlsX;
			if (!("CONVOY" in A3A_activeTasks) and (!bigAttackInProgress)) then
			{
				_base = [_city] call A3A_fnc_findBasesForConvoy;
				if (_base != "") then
				{
					[[_city,_base],"A3A_fnc_convoy"] call A3A_fnc_scheduler;
				};
			};
			[] call A3A_fnc_tierCheck;
		};
		if ((_supportGov > _supportReb) and (sidesX getVariable [_city,sideUnknown] == teamPlayer)) then
		{
			["TaskFailed", ["", format [localize "STR_antistasi_notification_joined",[_city, false] call A3A_fnc_location,nameOccupants]]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
			sidesX setVariable [_city,Occupants,true];
			[Occupants, -10, 45] remoteExec ["A3A_fnc_addAggression",2];
			_mrkD = format ["Dum%1",_city];
			_mrkD setMarkerColor colorOccupants;
			garrison setVariable [_city,[],true];
			sleep 5;
			[] call A3A_fnc_tierCheck;
		};
	} forEach citiesX;

	if (_popKilled > (_popTotal / 3)) then {["destroyedSites",false,true] remoteExec ["BIS_fnc_endMission"]};
	if ((_popReb > _popGov) and ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX == count airportsX)) then {["end1",true,true,true,true] remoteExec ["BIS_fnc_endMission",0]};

	{
		if ((sidesX getVariable [_x,sideUnknown] == teamPlayer) and !(_x in destroyedSites)) then
		{
			_resAdd = _resAdd + (300 * _resBoost);
		};
	} forEach resourcesX;

	_hrAdd = ceil _hrAdd;
	_resAdd = ceil _resAdd;
	server setVariable ["hr", _hrAdd + (server getVariable "hr"), true];
	server setVariable ["resourcesFIA", _resAdd + (server getVariable "resourcesFIA"), true];

	bombRuns = bombRuns + 0.25 * ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX);
	publicVariable "bombRuns";

	private _textX = format ["<t size='0.6' color='#C1C0BB'>"+localize "STR_antistasi_dynamicText_resource_income"+"<br/><t size='0.5' color='#C1C0BB'><br/>"+localize "STR_antistasi_dynamicText_resource_income_HR_money", _hrAdd, _resAdd];
	private _textArsenal = [] call A3A_fnc_arsenalManage;
	if (_textArsenal != "") then {_textX = format ["%1<br/>"+localize "STR_antistasi_dynamicText_resource_arsenalUpdated"+"<br/><br/><t size='0.5'>%2", _textX, _textArsenal]};
	[petros, "taxRep", _textX] remoteExec ["A3A_fnc_commsMP", [teamPlayer, civilian]];


	[] call A3A_fnc_FIAradio;
	[] call A3A_fnc_economicsAI;
    [] call A3A_fnc_cleanConvoyMarker;

	if (isMultiplayer) then
	{
		[] spawn A3A_fnc_promotePlayer;
		[] call A3A_fnc_assignBossIfNone;
		difficultyCoef = floor ((({side group _x == teamPlayer} count (call A3A_fnc_playableUnits)) - ({side group _x != teamPlayer} count (call A3A_fnc_playableUnits))) / 5);
		publicVariable "difficultyCoef";
	};

	private _missionChance = 5 * count (allPlayers - (entities "HeadlessClient_F"));
	if ((!bigAttackInProgress) and (random 100 < _missionChance)) then {[] spawn A3A_fnc_missionRequest};
	//Removed from scheduler for now, as it errors on Headless Clients.
	//[[],"A3A_fnc_reinforcementsAI"] call A3A_fnc_scheduler;
	[] spawn A3A_fnc_reinforcementsAI;
	{
	_veh = _x;
	if ((_veh isKindOf "StaticWeapon") and ({isPlayer _x} count crew _veh == 0) and (alive _veh)) then
		{
		_veh setDamage 0;
		[_veh,1] remoteExec ["setVehicleAmmo",_veh];
		};
	} forEach vehicles;
	sleep 3;
    _numWreckedAntennas = count antennasDead;
	//Probability of spawning a mission in.
    _shouldSpawnRepairThisTick = round(random 100) < 20;
    if ((_numWreckedAntennas > 0) && _shouldSpawnRepairThisTick && !("REP" in A3A_activeTasks)) then
		{
		_potentials = [];
		{
		_markerX = [markersX, _x] call BIS_fnc_nearestPosition;
		if ((sidesX getVariable [_markerX,sideUnknown] == Occupants) and (spawner getVariable _markerX == 2)) exitWith
			{
			_potentials pushBack [_markerX,_x];
			};
		} forEach antennasDead;
		if (count _potentials > 0) then
			{
			_potential = selectRandom _potentials;
			[[_potential select 0,_potential select 1],"A3A_fnc_REP_Antenna"] call A3A_fnc_scheduler;
			};
		}
	else
		{
		_changingX = false;
		{
		_chance = 5;
		if ((_x in resourcesX) and (sidesX getVariable [_x,sideUnknown] == Invaders)) then {_chance = 20};
		if (random 100 < _chance) then
			{
			_changingX = true;
			destroyedSites = destroyedSites - [_x];
			_nameX = [_x] call A3A_fnc_localizar;
			["TaskSucceeded", ["", format [localize "STR_antistasi_customHint_rebuild_rebuild",_nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer,civilian]];
			sleep 2;
			};
		} forEach (destroyedSites - citiesX) select {sidesX getVariable [_x,sideUnknown] != teamPlayer};
		if (_changingX) then {publicVariable "destroyedSites"};
		};
	if (isDedicated) then
		{
		{
		if (side _x == civilian) then
			{
			_var = _x getVariable "statusAct";
			if (isNil "_var") then
				{
				if (local _x) then
					{
					if ((_x getVariable "unitType") in arrayCivs) then
						{
						if (vehicle _x == _x) then
							{
							if (primaryWeapon _x == "") then
								{
								_groupX = group _x;
								deleteVehicle _x;
								if ({alive _x} count units _groupX == 0) then {deleteGroup _groupX};
								};
							};
						};
					};
				};
			};
		} forEach allUnits;
		};

	sleep 4;
};
