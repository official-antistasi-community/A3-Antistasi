//Mission: Conquer the outpost
if (!isServer and hasInterface) exitWith{};

private ["_markerX"];

_markerX = _this select 0;

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_positionX = getMarkerPos _markerX;
_timeLimit = if (_difficultX) then {30} else {90};//120
if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

private _markerSide = sidesX getVariable [_markerX, sideUnknown];

_nameDest = [_markerX] call A3A_fnc_localizar;
_textX = format [localize "STR_A3A_fn_mission_conq_outp_text3",_displayTime];
_taskName = localize "STR_A3A_fn_mission_conq_outp_titel4";
if (_markerX in resourcesX) then
	{
	_textX = format [localize "STR_A3A_fn_mission_conq_outp_text1",_nameDest,_displayTime];
	_taskName = localize "STR_A3A_fn_mission_conq_outp_titel1";
	};
if (_markerX in outposts) then 
	{
	_textX = format [localize "STR_A3A_fn_mission_conq_outp_text2",_nameDest,_displayTime];
	_taskName = localize "STR_A3A_fn_mission_conq_outp_titel2";
	};
if (_markerX in controlsX) then 
	{
	_textX = format [localize "STR_A3A_fn_mission_conq_outp_text2",_nameDest,_displayTime];
	_taskName = localize "STR_A3A_fn_mission_conq_outp_titel3";
	};

private _taskId = "CON" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[_textX,_taskName,_markerX],_positionX,false,0,true,"Target",true] call BIS_fnc_taskCreate;
[_taskId, "CON", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or (sidesX getVariable [_markerX,sideUnknown] == teamPlayer)};

if (dateToNumber date > _dateLimitNum) then
	{
	[_taskId, "CON", "FAILED"] call A3A_fnc_taskSetState;
	if (_difficultX) then
		{
		[-200, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		[-10,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		[-200, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		[-10,theBoss] call A3A_fnc_playerScoreAdd;
		};
	}
else
	{
	sleep 10;
	[_taskId, "CON", "SUCCEEDED"] call A3A_fnc_taskSetState;
	if (_difficultX) then
		{
		[0,400] remoteExec ["A3A_fnc_resourcesFIA",2];
		[800, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		{if (isPlayer _x) then {[20,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_positionX,teamPlayer] call A3A_fnc_distanceUnits);
		[20,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		[0,200] remoteExec ["A3A_fnc_resourcesFIA",2];
		[400, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		{if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_positionX,teamPlayer] call A3A_fnc_distanceUnits);
		[10,theBoss] call A3A_fnc_playerScoreAdd;
		};
	};

[_taskId, "CON", 1200] spawn A3A_fnc_taskDelete;
