#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

while {true} do
{
	// what's wrong with sleep 600, really?
	//sleep 600;//600
	nextTick = time + 600;
	waitUntil {sleep 15; time >= nextTick};
    waitUntil {sleep 10; A3A_activePlayerCount > 0};

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
		if (_city in destroyedSites) then { _popKilled = _popKilled + _numCiv; continue };

		_popReb = _popReb + (_numCiv * (_supportReb / 100));
		_popGov = _popGov + (_numCiv * (_supportGov / 100));

		private _radioTowerSide = [_city] call A3A_fnc_getSideRadioTowerInfluence;
		switch (_radioTowerSide) do
		{
			case teamPlayer: {[-1,_suppBoost,_city,false,true] spawn A3A_fnc_citySupportChange};
			case Occupants: {[1,-1,_city,false,true] spawn A3A_fnc_citySupportChange};
			case Invaders: {[-1,-1,_city,false,true] spawn A3A_fnc_citySupportChange};
		};

		_resAddCity = _numCiv * (_supportReb / 100) / 3;
		_hrAddCity = _numCiv * (_supportReb / 10000);

		if (sidesX getVariable [_city,sideUnknown] == Occupants) then
		{
			_resAddCity = _resAddCity / 2;
			_hrAddCity = _hrAddCity / 2;
		};
		if (_radioTowerSide != teamPlayer) then { _resAddCity = _resAddCity / 2 };

		_resAdd = _resAdd + _resAddCity;
		_hrAdd = _hrAdd + _hrAddCity;


		// revuelta civil!!
		if ((_supportGov < _supportReb) and (sidesX getVariable [_city,sideUnknown] == Occupants)) then
		{
			["TaskSucceeded", ["", format ["%1 joined %2",_city,FactionGet(reb,"name")]]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
			sidesX setVariable [_city,teamPlayer,true];
			[Occupants, 10, 60] remoteExec ["A3A_fnc_addAggression",2];
			garrison setVariable [_city,[],true];
			[_city] call A3A_fnc_mrkUpdate;
			sleep 5;
			{_nul = [_city,_x] spawn A3A_fnc_deleteControls} forEach controlsX;
			[] call A3A_fnc_tierCheck;
		};
		if ((_supportGov > _supportReb) and (sidesX getVariable [_city,sideUnknown] == teamPlayer)) then
		{
			["TaskFailed", ["", format ["%1 joined %2",_city,FactionGet(occ,"name")]]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
			sidesX setVariable [_city,Occupants,true];
			[Occupants, -10, 45] remoteExec ["A3A_fnc_addAggression",2];
			garrison setVariable [_city,[],true];
			[_city] call A3A_fnc_mrkUpdate;
			sleep 5;
			[] call A3A_fnc_tierCheck;
		};
	} forEach citiesX;

	if (_popKilled > (_popTotal / 3)) then {
		isNil { ["ended", true] call A3A_fnc_writebackSaveVar };
		["destroyedSites",false,true] remoteExec ["BIS_fnc_endMission"];
	};
	if ((_popReb > _popGov) and ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX == count airportsX)) then {
		isNil { ["ended", true] call A3A_fnc_writebackSaveVar };
		["end1",true,true,true,true] remoteExec ["BIS_fnc_endMission",0];
	};

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

	// Regular income of finite starting weapons
	private _equipMul = A3A_balancePlayerScale / 30;		// difficulty scaled. Hmm.
	{
		if (_x isEqualType "") then { continue };
		_x params ["_class", "_initCount"];
		private _count = _initCount * _equipMul;
		_count = if (_count % 1 > random 1) then { ceil _count } else { floor _count };
		private _arsenalTab = _class call jn_fnc_arsenal_itemType;
		[_arsenalTab, _class, _count] call jn_fnc_arsenal_addItem;
	} forEach (A3A_faction_reb get "initialRebelEquipment");

	private _textX = format ["<t size='0.6' color='#C1C0BB'>Taxes Income.<br/> <t size='0.5' color='#C1C0BB'><br/>Manpower: +%1<br/>Money: +%2 €", _hrAdd, _resAdd];
	private _textArsenal = [] call A3A_fnc_arsenalManage;
	if (_textArsenal != "") then {_textX = format ["%1<br/>Arsenal Updated<br/><br/>%2", _textX, _textArsenal]};
	[petros, "taxRep", _textX] remoteExec ["A3A_fnc_commsMP", [teamPlayer, civilian]];

	[] call A3A_fnc_generateRebelGear;

	[] call A3A_fnc_FIAradio;

    // Random-walk the defence multipliers for markers to add some persistent variation
    // Maybe add some logic to this later
/*    {
        private _r = _x#4 - 0.1 + random 0.2;
        _x set [4, 0.5 max _r min 1.0];
    } forEach A3A_supportMarkerTypes;
*/
	if (isMultiplayer) then
	{
		[] spawn A3A_fnc_promotePlayer;
		[] call A3A_fnc_assignBossIfNone;
	};

	// Decrease HQ knowledge values, old ones faster than current
	if (A3A_curHQInfoOcc < 1) then { A3A_curHQInfoOcc = 0 max (A3A_curHQInfoOcc - 0.01) };
	if (A3A_curHQInfoInv < 1) then { A3A_curHQInfoInv = 0 max (A3A_curHQInfoInv - 0.01) };
 	A3A_oldHQInfoOcc = A3A_oldHQInfoOcc select { _x set [2, _x#2 - 0.1]; _x#2 > 0 };			// arrays of [xpos, ypos, knowledge]
	A3A_oldHQInfoInv = A3A_oldHQInfoInv select { _x set [2, _x#2 - 0.1]; _x#2 > 0 };

	private _missionChance = 5 * A3A_activePlayerCount;
	if ((!bigAttackInProgress) and (random 100 < _missionChance)) then {[] spawn A3A_fnc_missionRequest};

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
			["TaskSucceeded", ["", format ["%1 Rebuilt",_nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer,civilian]];
			sleep 2;
			};
		} forEach (destroyedSites - citiesX) select {sidesX getVariable [_x,sideUnknown] != teamPlayer};
		if (_changingX) then {publicVariable "destroyedSites"};
		};

	sleep 4;
};
