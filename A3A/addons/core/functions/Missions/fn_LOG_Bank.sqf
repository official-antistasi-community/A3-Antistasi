//Mission: Logistics bank mission
//el sitio de la boxX es el 21
if (!isServer and hasInterface) exitWith {};
private ["_banco","_markerX","_difficultX","_leave","_contactX","_groupContact","_tsk","_posHQ","_citiesX","_city","_radiusX","_positionX","_posHouse","_nameDest","_timeLimit","_dateLimit","_dateLimitNum","_posBase","_pos","_truckX","_countX","_mrkFinal","_mrk","_soldiers"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
_banco = _this select 0;
_markerX = [citiesX,_banco] call BIS_fnc_nearestPosition;

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_positionX = getPosATL _banco;

_posbase = getMarkerPos respawnTeamPlayer;

_timeLimit = if (_difficultX) then {60} else {120};
if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_city = [citiesX, _positionX] call BIS_fnc_nearestPosition;
_mrkFinal = createMarker [format ["LOG%1", random 100], _positionX];
_nameDest = [_city] call A3A_fnc_localizar;
_mrkFinal setMarkerShape "ICON";
//_mrkFinal setMarkerType "hd_destroy";
//_mrkFinal setMarkerColor "ColorBlue";
//_mrkFinal setMarkerText "Bank";

private _bankVehicleClass = selectRandom (FactionGet(reb, "vehiclesCivSupply"));

_pos = (getMarkerPos respawnTeamPlayer) findEmptyPosition [1,50,_bankVehicleClass];

_truckX = _bankVehicleClass createVehicle _pos;
{_x reveal _truckX} forEach (allPlayers - (entities "HeadlessClient_F"));
[_truckX, teamPlayer] call A3A_fnc_AIVEHinit;
_truckX setVariable ["destinationX",_nameDest,true];
_truckX addEventHandler ["GetIn",
	{
	if (_this select 1 == "driver") then
		{
		_textX = format [localize "STR_A3A_fn_mission_log_bank_hint_text1",(_this select 0) getVariable "destinationX"];
		[localize "STR_A3A_fn_mission_log_bank_hint_title1", _textX] remoteExecCall ["A3A_fnc_customHint", _this select 2];
		};
	}];

[_truckX,"Mission Vehicle"] spawn A3A_fnc_inmuneConvoy;

private _taskId = "LOG" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[format [localize "STR_A3A_fn_mission_log_bank_text",_nameDest,_displayTime],localize "STR_A3A_fn_mission_log_bank_titel",_mrkFinal],_positionX,false,0,true,"Interact",true] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

_groups = [];
_soldiers = [];
for "_i" from 1 to 4 do
	{
	private _groupType = if (_difficultX) then { FactionGet(occ, "groupSentry") } else { FactionGet(occ, "groupPolice") };
	_groupX = [_positionX,Occupants,_groupType] call A3A_fnc_spawnGroup;
	sleep 1;

	[_groupX, "Patrol_Area", 25, 50, 100, true, _positionX, true] call A3A_fnc_patrolLoop;


	{[_x,""] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _groupX;
	_groups pushBack _groupX;
	};

private _bb = flatten boundingBoxReal _banco apply { abs _x };
private _bankDistMax = selectMin _bb + 10;

waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or (!alive _truckX) or (_truckX distance _banco < _bankDistMax)};
_bonus = if (_difficultX) then {2} else {1};
if ((dateToNumber date > _dateLimitNum) or (!alive _truckX)) then
	{
	[_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
	[-200, Occupants] remoteExec ["A3A_fnc_timingCA",2];
	[-10,theBoss] call A3A_fnc_playerScoreAdd;
	}
else
	{
	_countX = 120*_bonus;//120
    private _reveal = [_positionX, Occupants] call A3A_fnc_calculateSupportCallReveal;
    [Occupants, _truckX, _positionX, 4, _reveal] remoteExec ["A3A_fnc_requestSupport", 2];
	[10*_bonus,-20*_bonus,_markerX] remoteExec ["A3A_fnc_citySupportChange",2];
	["TaskFailed", ["", format ["Bank of %1 being assaulted",_nameDest]]] remoteExec ["BIS_fnc_showNotification",Occupants];
	{_friendX = _x;
	if (_friendX distance _truckX < 300) then
		{
		if ((captive _friendX) and (isPlayer _friendX)) then {[_friendX,false] remoteExec ["setCaptive",0,_friendX]; _friendX setCaptive false};
		{if (side _x == Occupants) then {_x reveal [_friendX,4]};
		} forEach allUnits;
		};
	} forEach ([distanceSPWN,0,_positionX,teamPlayer] call A3A_fnc_distanceUnits);
	_exit = false;
	while {(_countX > 0) or (_truckX distance _banco < _bankDistMax) and (alive _truckX) and (dateToNumber date < _dateLimitNum)} do
		{
		while {(_countX > 0) and (_truckX distance _banco < _bankDistMax) and (alive _truckX)} do
			{
			_formatX = format ["%1", _countX];
			{if (isPlayer _x) then {[petros,"countdown",_formatX] remoteExec ["A3A_fnc_commsMP",_x]}} forEach ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits);
			sleep 1;
			_countX = _countX - 1;
			};
		if (_countX > 0) then
			{
			_countX = 120*_bonus;//120
			if (_truckX distance _banco > _bankDistMax-1) then {{[petros,"hint",localize "STR_A3A_fn_mission_log_bank_hint_text2", localize "STR_A3A_fn_mission_log_bank_hint_title1"] remoteExec ["A3A_fnc_commsMP",_x]} forEach ([200,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits)};
			waitUntil {sleep 1; (!alive _truckX) or (_truckX distance _banco < _bankDistMax) or (dateToNumber date < _dateLimitNum)};
			}
		else
			{
			if (alive _truckX) then
				{
				{if (isPlayer _x) then {[petros,"hint",localize "STR_A3A_fn_mission_log_bank_hint_text3", localize "STR_A3A_fn_mission_log_bank_hint_title1"] remoteExec ["A3A_fnc_commsMP",_x]}} forEach ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits);
				_exit = true;
				};
			//waitUntil {sleep 1; (!alive _truckX) or (_truckX distance _banco > _bankDistMax) or (dateToNumber date < _dateLimitNum)};
			};
		if (_exit) exitWith {};
		};
	};


waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or (!alive _truckX) or (_truckX distance _posbase < 50)};
if ((_truckX distance _posbase < 50) and (dateToNumber date < _dateLimitNum)) then
	{
	[_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;
	[0,5000*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
    Debug("aggroEvent | Rebels won a bank mission");
	[Occupants, 10, 120] remoteExec ["A3A_fnc_addAggression",2];
	[400*_bonus, Occupants] remoteExec ["A3A_fnc_timingCA",2];
	{if (_x distance _truckX < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
	[10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	waitUntil {sleep 1; speed _truckX == 0};

	[_truckX] call A3A_fnc_empty;
	};
if (!alive _truckX) then
	{
	[_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
	//[400*_bonus, Occupants] remoteExec ["A3A_fnc_timingCA",2];
	};


deleteVehicle _truckX;

[_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;

{ [_x] spawn A3A_fnc_groupDespawner } forEach _groups;

deleteMarker _mrkFinal;
