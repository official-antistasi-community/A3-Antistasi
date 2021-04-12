//Mission: Logistic supplies
if (!isServer and hasInterface) exitWith{};
private ["_markerX","_difficultX","_leave","_contactX","_groupContact","_tsk","_posHQ","_citiesX","_city","_radiusX","_positionX","_posHouse","_nameDest","_timeLimit","_dateLimit","_dateLimitNum","_pos","_truckX","_countX", "_holdTime"];

_markerX = _this select 0;

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_positionX = getMarkerPos _markerX;

_timeLimit = if (_difficultX) then {30} else {60};
if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_nameDest = [_markerX] call A3A_fnc_localizar;
_holdTime = if(_difficultX) then {4} else {2};
_taskDescription = format ["%1 population is in need of supplies. We may improve our relationship with that city if we are the ones who provide them. I have placed a crate with supplies near our HQ. Deliver the crate to %1 city center, hold it there for %3 minutes and it's done. Do this before %2.",_nameDest,_displayTime, _holdTime];

[[teamPlayer,civilian],"SUPP",[_taskDescription,"City Supplies",_markerX],_positionX,false,0,true,"Heal",true] call BIS_fnc_taskCreate;
missionsX pushBack ["SUPP","CREATED"]; publicVariable "missionsX";
_pos = (getMarkerPos respawnTeamPlayer) findEmptyPosition [1,50,"C_Van_01_box_F"];

//Creating the box
_truckX = "Land_FoodSacks_01_cargo_brown_F" createVehicle _pos;
_truckX enableRopeAttach true;
_truckX allowDamage false;
[_truckX] call A3A_fnc_logistics_addLoadAction;
_truckX addAction ["Delivery infos",
	{
		_text = format ["Deliver this box to %1, unload it to start distributing to people",(_this select 0) getVariable "destinationX"]; //This need a rework
		["Logistics Mission", _text] remoteExecCall ["A3A_fnc_customHint",_this select 2];	//This need a rework
	},
	nil,
	0,
	false,
	true,
	"",
	"(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"
];
[_truckX, teamPlayer] call A3A_fnc_AIVEHinit;
//{_x reveal _truckX} forEach (allPlayers - (entities "HeadlessClient_F"));
_truckX setVariable ["destinationX",_nameDest,true];

[_truckX,"Supply Box"] spawn A3A_fnc_inmuneConvoy;

waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or ((_truckX distance _positionX < 40) and (isNull attachedTo _truckX) and (isNull ropeAttachedTo _truckX)) or (isNull _truckX)};
_bonus = if (_difficultX) then {2} else {1};
if ((dateToNumber date > _dateLimitNum) or (isNull _truckX)) then
	{
	["SUPP",[_taskDescription,"City Supplies",_markerX],_positionX,"FAILED","Heal"] call A3A_fnc_taskUpdate;
	[5*_bonus,-5*_bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	}
else
	{
	_countX = 120*_bonus;//120
	["TaskFailed", ["", format ["%2 deploying supplies in %1",_nameDest,nameTeamPlayer]]] remoteExec ["BIS_fnc_showNotification",Occupants];
	{_friendX = _x;
	if (captive _friendX) then
		{
		[_friendX,false] remoteExec ["setCaptive",0,_friendX];
		_friendX setCaptive false;
		};
	{
	if ((side _x == Occupants) and (_x distance _positionX < distanceSPWN)) then
		{
		if (_x distance _positionX < 300) then {_x doMove _positionX} else {_x reveal [_friendX,4]};
		};
	if ((side _x == civilian) and (_x distance _positionX < 300) and (vehicle _x == _x)) then {_x doMove position _truckX};
	} forEach allUnits;
	} forEach ([300,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits);
	while {(_countX > 0)/* or (_truckX distance _positionX < 40)*/ and (dateToNumber date < _dateLimitNum) and !(isNull _truckX)} do
		{
		while {(_countX > 0) and (_truckX distance _positionX < 40) and ({[_x] call A3A_fnc_canFight} count ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits) == count ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits)) and ({(side _x == Occupants) and (_x distance _truckX < 50)} count allUnits == 0) and (dateToNumber date < _dateLimitNum) and (isNull attachedTo _truckX)} do
			{
			_formatX = format ["Keep the area clear of hostiles for %1 more seconds", _countX];
			{if (isPlayer _x) then {[petros,"hint",_formatX,"Logistics Mission"] remoteExec ["A3A_fnc_commsMP",_x]}} forEach ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits);
			sleep 1;
			_countX = _countX - 1;
			};
		if (_countX > 0) then
			{
			_countX = 120*_bonus;//120
			if (((_truckX distance _positionX > 40) or (not([80,1,_truckX,teamPlayer] call A3A_fnc_distanceUnits)) or ({(side _x == Occupants) and (_x distance _truckX < 50)} count allUnits != 0)) and (alive _truckX)) then {{[petros,"hint","Stay close to the crate, and clean all BLUFOR presence in the surroundings or count will restart", "Logistics Mission"] remoteExec ["A3A_fnc_commsMP",_x]} forEach ([100,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits)};
			waitUntil {sleep 1; ((_truckX distance _positionX < 40) and ([80,1,_truckX,teamPlayer] call A3A_fnc_distanceUnits) and ({(side _x == Occupants) and (_x distance _truckX < 50)} count allUnits == 0)) or (dateToNumber date > _dateLimitNum) or (isNull _truckX)};
			};
		if (_countX < 1) exitWith {};
		};
		if ((dateToNumber date < _dateLimitNum) and !(isNull _truckX)) then
			{
			[petros,"hint","Supplies Delivered", "Logistics Mission"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
			["SUPP",[_taskDescription,"City Supplies",_markerX],_positionX,"SUCCEEDED","Heal"] call A3A_fnc_taskUpdate;
			{if (_x distance _positionX < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
			[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
			[-15*_bonus,15*_bonus,_markerX] remoteExec ["A3A_fnc_citySupportChange",2];
            [
                3,
                "Rebels won a supply mission",
                "aggroEvent",
                true
            ] call A3A_fnc_log;
			[[-10, 60], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
			}
		else
			{
			["SUPP",[_taskDescription,"City Supplies",_markerX],_positionX,"FAILED","Heal"] call A3A_fnc_taskUpdate;
			[5*_bonus,-5*_bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
			[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
			};
	};

_ecpos = getpos _truckX;
deleteVehicle _truckX;
_emptybox = "Land_Pallet_F" createVehicle _ecpos;
[_emptybox] spawn A3A_fnc_postmortem;

//sleep (600 + random 1200);

//_nul = [_tsk,true] call BIS_fnc_deleteTask;
_nul = [900,"SUPP"] spawn A3A_fnc_deleteTask;
