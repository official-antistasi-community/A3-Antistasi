

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_policeStation"];

private _startDateNum = dateToNumber date + 90 * timeMultiplier / (365*24*60);
private _startDate = numberToDate [date select 0, _startDateNum];
private _displayTime = [_startDate] call A3A_fnc_dateToTimeString;

private _nameDest = [_marker] call A3A_fnc_localizar;
private _textX = format [localize "STR_A3A_fn_mission_conq_police_text",_nameDest,_displayTime];
private _taskName = localize "STR_A3A_fn_mission_conq_police_title";
private _taskPos = getPosATL _policeStation;        // no access to garrison data here

private _taskId = "SUPP" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[_textX,_taskName],_taskPos,false,0,true,"Target",true] call BIS_fnc_taskCreate;
[_taskId, "SUPP", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

private _timeout = time + 90*60;
waitUntil {sleep 1; (time > _timeout) or (sidesX getVariable _marker == teamPlayer) or (!alive _policeStation)};

if (time > _timeout) then
{
	[_taskId, "SUPP", "FAILED"] call A3A_fnc_taskSetState;
    [-200, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
    [-10,theBoss] call A3A_fnc_playerScoreAdd;
}
else
{
	sleep 5;            // don't block the destruction message?
	[_taskId, "SUPP", "SUCCEEDED"] call A3A_fnc_taskSetState;
    [0,200] remoteExec ["A3A_fnc_resourcesFIA",2];
    [20, _marker, false] remoteExecCall ["A3A_fnc_citySupportChange", 2];           // no scaling? hmm
    {if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([300,0,_taskPos,teamPlayer] call A3A_fnc_distanceUnits);
    [10,theBoss] call A3A_fnc_playerScoreAdd;
};

[_taskId, "SUPP", 1200] spawn A3A_fnc_taskDelete;
