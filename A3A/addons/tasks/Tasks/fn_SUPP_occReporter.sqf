#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _fnc_createTask = {
	private _nameDest = [_this get "_marker"] call A3A_fnc_localizar;
	private _displayTime = [(_this get "_endTime") - time] call FUNC(minutesFromNow);

	private _taskName = format ["%1 Reporter", FactionGet(occ, "name")];
	private _taskDesc = format ["A known name in the press world has been bought out by %1 to produce their propaganda. They're publishing an article later today about fake crimes %2 has committed, and we can't let that damage come through to our reputation. Get to their house in %3, eliminate their guard, and give them a scare. DO NOT KILL THEM. Do this by %4 before the article goes up.", FactionGet(occ,"name"), FactionGet(reb,"name"), _nameDest, _displayTime];
	private _taskPos = getPosATL _houseX;
	private _taskId = call FUNC(genTaskUID);
	[true, _taskId, [_taskDesc,_taskName], _taskPos, false, -1, true, "Documents", true] call BIS_fnc_taskCreate;
	_this set ["_taskId", _taskId];
};

params ["_params", "_checkpoint"];

private _task = createHashMap;

_params params ["_marker"];

// Determine end time and description

_task set ["_side", Occupants];
_task set ["_marker", _marker];
_task set ["_endTime", time + 60 * (60)];

_task set ["state", "s_waitForContact"];
_task set ["interval", 1];

_task set ["_hintTitle", "Reporter"];

_radiusX = [_marker] call A3A_fnc_sizeMarker;
_markerPos = getMarkerPos _marker;
_houses = (nearestObjects [_markerPos, ["house"], _radiusX]) select {!((typeOf _x) in A3A_buildingBlacklist)};
_posHouse = [];
_houseX = selectRandom _houses;
while {count _posHouse < 3} do
	{
	_houseX = selectRandom _houses;
	_posHouse = _houseX buildingPos -1;
	if (count _posHouse < 3) then {_houses = _houses - [_houseX]};
	};

_max = (count _posHouse) - 1;
_rnd = floor random _max;
_posReporter = _posHouse select _rnd;
_posSol1 = _posHouse select (_rnd + 1);
_posSol2 = (_houseX buildingExit 0);

_task call _fnc_createTask;

private _reporterGroup = [_posReporter, Civilian, [FactionGet(civ,"unitPress")]] call A3A_fnc_spawnGroup;
private _reporter = units _reporterGroup#0;
_reporter stop true;
_task set ["_reporter", _reporter];
_groupBodyguard = [_posSol1, Occupants, [FactionGet(occ,"unitBodyguard"), FactionGet(occ,"unitBodyguard")]] call A3A_fnc_spawnGroup;
(units _groupBodyguard#0) setPos _posSol1;
(units _groupBodyguard#1) setPos _posSol2;
{[_x,""] call A3A_fnc_NATOinit; _x allowFleeing 0} forEach units _groupBodyguard;
_groupPatrol = [[getPosATL _houseX, 20, random 360] call BIS_fnc_relPos, Occupants, FactionGet(occ,"groupPoliceEscort")] call A3A_fnc_spawnGroup;
[_groupPatrol, getPosATL _houseX, 50] call BIS_fnc_taskPatrol;
_reporter addEventHandler ["FiredNear", {
	private _reporter = (_this#0);
    (_reporter) removeEventHandler [_thisEvent, _thisEventHandler];
    [_reporter, "What the fuck?", 60] call A3A_TASKS_fnc_unitSpeakNearby;
    _reporter setVariable ["A3A_alerted",true,true];
    private _anim = "ApanPknlMstpSnonWnonDnon_G01";
    [_reporter, [_anim]] remoteExec ["switchMove"];
}];
// conversation format: speaker, delay, text
// to be replaced with a real conversation framework



[_reporter,
[
	"Talk",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		private _calmConversation = [
			["reb", 3, "Hey, I need to talk to you."],
			["civ", 5, "What the hell are you doing in my house? You need to leave. Now."],
			["reb", 6, format ["Ah, not so fast. We were sent by the %1 to resolve a little problem we have.", FactionGet(reb,"name")]],
			["civ", 5, format ["The %1? I'm sorry, I...don't know what you're talking about.", FactionGet(reb,"name")]],
			["reb", 7, format ["See, I'm afraid you do. We know you're paid off by %1 to write and publish their propaganda.", FactionGet(reb,"name")]],
			["reb", 6, "Now, I can't say I know a lot about the news, but I know who's in charge around here."],
			["reb", 5, "And I would prefer not to have to go back and tell them you weren't cooperative."],
			["reb", 5, "Because your bodyguard won't stand a chance. Do I make myself clear?"],
			["civ", 5, "Okay, yes, I understand. I won't post the article. Please just...get out of my house."]
		];
		private _alertedConversation = [
			["reb", 3, "Hey asshole! I'm talking to you!"],
			["civ", 4, "What the fuck is wrong with you? Why are you in my house?"],
			["reb", 3, "Shut up and listen! I'm not gonna ask again!"],
			["reb", 5, format ["We know you're writing propaganda for %1. Don't try to lie to us.", FactionGet(occ,"name")]],
			["reb", 4, "You're spitting in the face of all those who fight for freedom."],
			["reb", 7, "We've killed your silly little honor guard. Don't make us come back and finish the job. Am I clear?"],
			["civ", 3, "Okay, okay, I get it! Please don't kill me!"]
		];
		[_target, _caller, [_calmConversation,_alertedConversation] select (_target getVariable ["A3A_alerted",false])] spawn {
			// sheduled		
			params ["_reporter", "_rebel", "_dialogue"];
			_reporter setVariable ["A3A_inDialogue",true,true];
			private _completed = true;
			{
				_x params ["_speaker", "_wait", "_line"];
				if !(_rebel call A3A_fnc_canFight && {_rebel distance _reporter < 10}) exitWith {_completed = false};
				_unit = if (toLower _speaker isEqualTo "civ") then {_reporter} else {_rebel};
				[_unit, _line] call A3A_TASKS_fnc_unitSpeakNearby;
				sleep _wait;
			} forEach _dialogue;
			if (_completed) then {_reporter setVariable ["A3A_dialogueComplete",true,true]};
			_reporter setVariable ["A3A_inDialogue",false,true];
		};
	},nil,3,false,true,"",
    "!(_target getVariable ['A3A_inDialogue', false])",
    5
]] remoteExec ["addAction", 0];

/////////////////////
// State functions //
/////////////////////

_task set ["s_waitForContact",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };
    if !(alive (_this get "_reporter")) exitWith { _this set ["state", "s_failed"]; false };
	diag_Log ((_this get "_reporter") getVariable ["A3A_inDialogue", false]);
	if ((_this get "_reporter") getVariable ["A3A_inDialogue", false]) exitWith { _this set ["state", "s_waitForFinish"]; false };
	if (!((_this get "_reporter") getVariable ["A3A_alerted", false]) && {(allPlayers select {_x distance (_this get "_reporter") < 10 && (insideBuilding _x > 0.5)}) isNotEqualTo []}) exitWith {
		_this set ["state", "s_waitForFinish"];
		[(_this get "_reporter"), "Is someone there?"] call A3A_TASKS_fnc_unitSpeakNearby;
		false;
	};

	false;
}];

_task set ["s_waitForFinish",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };
	if !(alive (_this get "_reporter")) exitWith { _this set ["state", "s_failed"]; false };
	if ((_this get "_reporter") getVariable ["A3A_dialogueComplete", false]) exitWith { _this set ["state", "s_succeeded"]; false };
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
