//Mission: Logistics bank mission
//el sitio de la boxX es el 21
if (!isServer and hasInterface) exitWith {};
private ["_banco","_markerX","_difficultX","_leave","_contactX","_groupContact","_tsk","_posHQ","_citiesX","_city","_radiusX","_positionX","_posHouse","_nameDest","_timeLimit","_dateLimit","_dateLimitNum","_posBase","_pos","_truckX","_countX","_mrkFinal","_mrk","_soldiers"];
_banco = _this select 0;
_markerX = [citiesX,_banco] call BIS_fnc_nearestPosition;

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_positionX = getPosASL _banco;

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

_pos = (getMarkerPos respawnTeamPlayer) findEmptyPosition [1,50,"C_Van_01_box_F"];

_truckX = "C_Van_01_box_F" createVehicle _pos;
{_x reveal _truckX} forEach (allPlayers - (entities "HeadlessClient_F"));
[_truckX, teamPlayer] call A3A_fnc_AIVEHinit;
_truckX setVariable ["destinationX",_nameDest,true];
_truckX addEventHandler ["GetIn",
	{
	if (_this select 1 == "driver") then
		{
		_textX = format ["Bring this truck to %1 Bank and park it in the main entrance",(_this select 0) getVariable "destinationX"];
		["Bank Mission", _textX] remoteExecCall ["A3A_fnc_customHint", _this select 2];
		};
	}];

[_truckX,"Mission Vehicle"] spawn A3A_fnc_inmuneConvoy;

[[teamPlayer,civilian],"LOG",[format ["We know Gendarmes are guarding a large amount of money in the bank of %1. Take this truck and go there before %2, hold the truck close to tha bank's main entrance for 2 minutes and the money will be transferred to the truck. Bring it back to HQ and the money will be ours.",_nameDest,_displayTime],"Bank Robbery",_mrkFinal],_positionX,false,0,true,"Interact",true] call BIS_fnc_taskCreate;
missionsX pushBack ["LOG","CREATED"]; publicVariable "missionsX";
_mrk = createMarkerLocal [format ["%1patrolarea", floor random 100], _positionX];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [30,30];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrk setMarkerAlphaLocal 0;

_groups = [];
_soldiers = [];
for "_i" from 1 to 4 do
	{
	_groupX = if (_difficultX) then {[_positionX,Occupants, groupsNATOSentry] call A3A_fnc_spawnGroup} else {[_positionX,Occupants, groupsNATOGen] call A3A_fnc_spawnGroup};
	sleep 1;
	_nul = [leader _groupX, _mrk, "SAFE","SPAWNED", "NOVEH2", "FORTIFY"] execVM "scripts\UPSMON.sqf";
	{[_x,""] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _groupX;
	_groups pushBack _groupX;
	};

_positionX = _banco buildingPos 1;

waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or (!alive _truckX) or (_truckX distance _positionX < 7)};
_bonus = if (_difficultX) then {2} else {1};
if ((dateToNumber date > _dateLimitNum) or (!alive _truckX)) then
	{
	["LOG",[format ["We know Gendarmes is guarding a large amount of money in the bank of %1. Take this truck and go there before %2, hold the truck close to tha bank's main entrance for 2 minutes and the money will be transferred to the truck. Bring it back to HQ and the money will be ours.",_nameDest,_displayTime],"Bank Robbery",_mrkFinal],_positionX,"FAILED","Interact"] call A3A_fnc_taskUpdate;
	[-1800*_bonus, Occupants] remoteExec ["A3A_fnc_timingCA",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	}
else
	{
	_countX = 120*_bonus;//120
    private _reveal = [_positionX , Invaders] call A3A_fnc_calculateSupportCallReveal;
    [_positionX, 4, ["QRF"], Invaders, _reveal] remoteExec ["A3A_fnc_sendSupport", 2];
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
	while {(_countX > 0) or (_truckX distance _positionX < 7) and (alive _truckX) and (dateToNumber date < _dateLimitNum)} do
		{
		while {(_countX > 0) and (_truckX distance _positionX < 7) and (alive _truckX)} do
			{
			_formatX = format ["%1", _countX];
			{if (isPlayer _x) then {[petros,"countdown",_formatX] remoteExec ["A3A_fnc_commsMP",_x]}} forEach ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits);
			sleep 1;
			_countX = _countX - 1;
			};
		if (_countX > 0) then
			{
			_countX = 120*_bonus;//120
			if (_truckX distance _positionX > 6) then {{[petros,"hint","Don't get the truck far from the bank or count will restart", "Bank Mission"] remoteExec ["A3A_fnc_commsMP",_x]} forEach ([200,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits)};
			waitUntil {sleep 1; (!alive _truckX) or (_truckX distance _positionX < 7) or (dateToNumber date < _dateLimitNum)};
			}
		else
			{
			if (alive _truckX) then
				{
				{if (isPlayer _x) then {[petros,"hint","Drive the Truck back to base to finish this mission", "Bank Mission"] remoteExec ["A3A_fnc_commsMP",_x]}} forEach ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits);
				_exit = true;
				};
			//waitUntil {sleep 1; (!alive _truckX) or (_truckX distance _positionX > 7) or (dateToNumber date < _dateLimitNum)};
			};
		if (_exit) exitWith {};
		};
	};


waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or (!alive _truckX) or (_truckX distance _posbase < 50)};
if ((_truckX distance _posbase < 50) and (dateToNumber date < _dateLimitNum)) then
	{
	["LOG",[format ["We know Gendarmes is guarding a large amount of money in the bank of %1. Take this truck and go there before %2, hold the truck close to tha bank's main entrance for 2 minutes and the money will be transferred to the truck. Bring it back to HQ and the money will be ours.",_nameDest,_displayTime],"Bank Robbery",_mrkFinal],_positionX,"SUCCEEDED","Interact"] call A3A_fnc_taskUpdate;
	[0,5000*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
    [
        3,
        "Rebels won a bank mission",
        "aggroEvent",
        true
    ] call A3A_fnc_log;
	[[20 * _bonus, 120], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
	[1800*_bonus, Occupants] remoteExec ["A3A_fnc_timingCA",2];
	{if (_x distance _truckX < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
	[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	waitUntil {sleep 1; speed _truckX == 0};

	[_truckX] call A3A_fnc_empty;
	};
if (!alive _truckX) then
	{
	["LOG",[format ["We know Gendarmes is guarding a large amount of money in the bank of %1. Take this truck and go there before %2, hold the truck close to tha bank's main entrance for 2 minutes and the money will be transferred to the truck. Bring it back to HQ and the money will be ours.",_nameDest,_displayTime],"Bank Robbery",_mrkFinal],_positionX,"FAILED","Interact"] call A3A_fnc_taskUpdate;
	[1800*_bonus, Occupants] remoteExec ["A3A_fnc_timingCA",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	};


deleteVehicle _truckX;

_nul = [1200,"LOG"] spawn A3A_fnc_deleteTask;

{ [_x] spawn A3A_fnc_groupDespawner } forEach _groups;

//sleep (600 + random 1200);
//_nul = [_tsk,true] call BIS_fnc_deleteTask;
deleteMarker _mrk;
deleteMarker _mrkFinal;
