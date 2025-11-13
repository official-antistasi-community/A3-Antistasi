#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _fnc_createTask = {
	private _nameDest = [_this get "_marker"] call A3A_fnc_localizar;
	private _displayTime = [(_this get "_endTime") - time] call FUNC(minutesFromNow);
	private _holdTime = (_this get "_difficulty") * 2;

	private _taskName = "Escort Reporter";
    private _occDescription = "A trusted reporter has contacted us to organize an escort to %3 to collect pictures of %1's abuse of their people. They're currently at HQ, go talk to them, move to the city, defend them while they collect information, and move back to HQ. Get those pictures by %2.";
	private _taskDesc = format [_occDescription, FactionGet(occ,"name"), _displayTime, _nameDest];
	private _taskPos = markerPos (_this get "_marker");
	private _taskId = call FUNC(genTaskUID);
	[true, _taskId, [_taskDesc,_taskName], _taskPos, false, -1, true, "Scout", true] call BIS_fnc_taskCreate;
	_this set ["_taskId", _taskId];
};


params ["_params", "_checkpoint"];

private _task = createHashMap;

_params params ["_marker"];

// Determine end time and description
_task set ["_marker", _marker];
_task set ["_endTime", time + 60 * (60)];
_task call _fnc_createTask;

_task set ["checkpoint", "c_started"];
_task set ["state", "s_waitUntilInRange"];
_task set ["interval", 1];

_task set ["_hintTitle", "Escort"];

_task set ["c_started", {
	[_this get "_marker", (_this get "_endTime") - time, _this get "_difficulty"];
}];

_reporterGroup = [[getMarkerPos respawnTeamPlayer, 15 + random 10, random 360] call BIS_fnc_relPos, Civilian, [FactionGet(civ,"unitPress")]] call A3A_fnc_spawnGroup;
_reporterGroup deleteGroupWhenEmpty true;
private _reporter = units _reporterGroup#0;
private _firstName = "Reporter";
private _lastName = selectRandom(FactionGet(civ,"lastNames"));
_reporter setName [[_firstName,_lastName] joinString " ", _firstName, _lastName];
_task set ["_reporter",_reporter];
_reporter setVariable ["A3A_grouped", false, true];
_reporter setVariable ["A3A_stopped", false, true];
// TODO: add some sort of talking ability
[_reporter,
[
	"Join Group",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
        [_target] join (group _caller);
        _target setVariable ["A3A_grouped",true,true];
        _target globalChat "Sounds good, I'm ready. Let's go.";
        _target setCaptive true;
	},nil,3,false,true,"",
    "!(_target getVariable ['A3A_grouped', false]) && !(_target getVariable ['A3A_blockGroups', false])",
    5
]] remoteExec ["addAction", 0];
[_reporter,
[
	"Leave Group",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
        [_target] join grpNull;
        (group _target) deleteGroupWhenEmpty true;
        _target setVariable ["A3A_grouped",false,true];
        _target globalChat "Alright, as you wish.";
	},nil,3,false,true,"",
    "(_target getVariable ['A3A_grouped', false]) && !(_target getVariable ['A3A_blockGroups', false])",
    5
]] remoteExec ["addAction", 0];
[_reporter,
[
	"Move With Group",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
        _target stop false;
        _target setVariable ["A3A_stopped",false,true];
        _target globalChat "Sounds good. On you.";
	},nil,3,false,true,"",
    "(_target getVariable ['A3A_stopped', false])",
    5
]] remoteExec ["addAction", 0];
[_reporter,
[
	"Wait Here",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
        _target stop true;
        _target setVariable ["A3A_stopped",true,true];
        _target globalChat "Gotcha, I'll hold here. Let me know when to move.";
	},nil,3,false,true,"",
    "!(_target getVariable ['A3A_stopped', false])",
    5
]] remoteExec ["addAction", 0];
_reporter addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
    [_this#0, "Uh, does this thing have seatbelts?", 10] call A3A_TASKS_fnc_unitSpeakNearby;
    _this#0 removeEventHandler [_thisEvent, _thisEventHandler];
}];
private _ambientLines = [
    "Oh yeah, that one's a good picture.",
    "Ugh. Can't do anything with the lighting here.",
    "I'm glad you guys brought me out here though. Important to document.",
    format ["I visited %1 as a child. Never thought I'd see it like this.", [_task get "_marker"] call A3A_fnc_localizar],
    format ["Occupation by %1 just wasn't something I had ever considered. But here we are now.", FactionGet(occ,"name")],
    format ["I mean, we had all prepared for %1 to take hostile action, but we didn't think it would cut this close...", FactionGet(inv,"name")],
    "They apparently had several good resturaunts here. All closed down because of the war, presumably.",
    "I really shouldn't need very long, I apologize."
];
_task set ["_ambientLines", _ambientLines];

/////////////////////
// State functions //
/////////////////////

_task set ["s_waitUntilInRange",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };
    if !(alive (_this get "_reporter")) exitWith { _this set ["state", "s_failed"]; false };
    if !(captive (_this get "_reporter")) then {(_this get "_reporter") setCaptive true};
	if ((_this get "_reporter") distance (getMarkerPos (_this get "_marker")) > 300) exitWith {false};
	// Condition fulfilled, run any extra code
	_this set ["state", "s_patrolForPics"];
    (_this get "_reporter") spawn {
        [_this, "We're getting close now. Drop us near the town marker on map.", 30] call A3A_TASKS_fnc_unitSpeakNearby;
        sleep 8;
        [_this, "So you guys are, like, the real deal? You've been shot at before?", 30] call A3A_TASKS_fnc_unitSpeakNearby;
        sleep 8;
        [_this, "Damn, that's cool. I could never, my job's just to take pictures.", 30] call A3A_TASKS_fnc_unitSpeakNearby;
    };
	false;
}];

_task set ["s_patrolForPics",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };
    private _reporter = (_this get "_reporter");
    if !(alive _reporter) exitWith { _this set ["state", "s_failed"]; false };
    if !(captive _reporter) then {_reporter setCaptive true};
    if !(vehicle _reporter isEqualTo _reporter && {_reporter distance (getMarkerPos (_this get "_marker")) < 25}) exitWith {false};
    _this set ["state", "s_waitForFinish"];
    _this set ["_patrolEnd", time + 180];
    _this set ["_timeToChat", time + 40];
    _group = createGroup civilian;
    [_reporter] joinSilent _group;
    _reporter setVariable ["A3A_blockGroups", true, true];
    _group setBehaviourStrong "CARELESS";
    [_reporter, "Alright, this looks solid. Give me a few minutes to look around.", 30] call A3A_TASKS_fnc_unitSpeakNearby;
    [_reporter, getMarkerPos (_this get "_marker"), 50] call BIS_fnc_taskPatrol;
    {
		if (_x != leader _x or {_x != vehicle _x}) then { continue };
		group _x move getPosATL _reporter;
	} forEach (units Occupants inAreaArray [getPosATL _reporter, 500, 500]);
	false;
}];

_task set ["s_waitForFinish",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };
    private _reporter = _this get "_reporter";
    if !(alive _reporter) exitWith { _this set ["state", "s_failed"]; false };
    if !(captive _reporter) then {_reporter setCaptive true};
    if (_this get "_timeToChat" < time) then {
        _lines = _this get "_ambientLines";
        _selLine = selectRandom _lines;
        _lines deleteAt (_lines find _selLine);
        _this set ["_ambientLines",_lines];
        [_reporter, _selLine] call A3A_TASKS_fnc_unitSpeakNearby;
        _this set ["_timeToChat", time + 40];
        // 40 second timer also refreshes occupant move
            {
            if (_x != leader _x or {_x != vehicle _x}) then { continue };
            group _x move getPosATL _reporter;
        } forEach (units Occupants inAreaArray [getPosATL _reporter, 500, 500]);
    };
    if (_reporter getVariable ["A3A_stopped",false]) then { _this set ["_patrolEnd", _this get "_patrolEnd" + 1]};
    if (_this get "_patrolEnd" > time) exitWith {false};
    _this set ["state", "s_rtb"];
    [_reporter, "Okay, think I got enough footage here. Let's head back."] call A3A_TASKS_fnc_unitSpeakNearby;
    _reporter setVariable ["A3A_blockGroups", false, true];
	false;
}];

_task set ["s_rtb",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };
    private _reporter = (_this get "_reporter");
    if !(alive _reporter) exitWith { _this set ["state", "s_failed"]; false };
    if !(captive _reporter) then {_reporter setCaptive true};
    if !(vehicle _reporter == _reporter && {_reporter distance getMarkerPos respawnTeamPlayer < 50}) exitWith { false };
    _this set ["state", "s_succeeded"];
    [_reporter, "Okay, thanks. These will definently be in the news tomorrow."] call A3A_TASKS_fnc_unitSpeakNearby;
	false;
}];

_task set ["s_succeeded", {
	private _bonus = _this get "_difficulty";
	private _marker = _this get "_marker";

	private _playersInRange = (allPlayers - (entities "HeadlessClient_F")) inAreaArray [markerPos _marker, 250, 250];
	{[10*_bonus * tierWar, _x] call A3A_fnc_playerScoreAdd} forEach _playersInRange;
	[5*_bonus * tierWar, theBoss] call A3A_fnc_playerScoreAdd;

	[-15 * _bonus, 15 * _bonus, _marker] remoteExec ["A3A_fnc_citySupportChange", 2];
	[0, 200 * _bonus * tierWar] remoteExec ["A3A_fnc_resourcesFIA", 2];

	[_this get "_taskId", "SUCCEEDED"] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
}];
_task set ["s_failed", {
	// Need a message here just to avoid the cooldown?
	[_this get "_hintTitle", localize "STR_A3A_Tasks_LOG_Supplies_failed", getPosATL _box, 300] call FUNC(hintNear);

	[5, -5, _this get "_marker"] remoteExec ["A3A_fnc_citySupportChange", 2];
	[-10, theBoss] call A3A_fnc_playerScoreAdd;

	[_this get "_taskId", "FAILED"] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
}];
_task set ["s_cleanup", {
	// just dismantle anything remaining

	// TODO: task deletion, rate throttling?
	// maybe we should restrict tasks based on request time not completion/failure time?
	// so then throttling moves to the request management

	(_this get "taskId") spawn {
		[_this, true, true] call BIS_fnc_deleteTask;
	};
	true;		// delete the damned task
}];

// Return the task hashmap
_task;
