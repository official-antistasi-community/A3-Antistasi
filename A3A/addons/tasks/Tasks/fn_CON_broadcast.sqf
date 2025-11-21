#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _fnc_createTask = {
	private _nameDest = [_this get "_marker"] call A3A_fnc_localizar;
	private _displayTime = [(_this get "_endTime") - time] call FUNC(minutesFromNow);
    private _convertTime = 4 / (_this get "_difficulty");
	private _holdTime = ((_this get "_difficulty") * 3) + 2;

	private _taskName = "Disrupt Broadcast";
	private _taskDesc = format ["%1 has currently shut down all non-state media sources in a massive media blackout to run an informational broadcast on the crimes of %2 forces. Several engineers are broadcasting from a radio tower at %3. We need a team to get there, take down the broadcast, reactivate it within %4 seconds before people leave to show our own footage, and hold the area until the %5 minute broadcast completes. We need to move before their broadcast completes at %6.", FactionGet(occ,"name"), FactionGet(reb,"name"), _nameDest, _convertTime, _holdTime, _displayTime];
	private _taskPos = getPosATL (_this get "_radioTower");
	private _taskId = call FUNC(genTaskUID);
	[true, _taskId, [_taskDesc,_taskName], _taskPos, false, -1, true, "Upload", true] call BIS_fnc_taskCreate;
	_this set ["_taskId", _taskId];
};
private _fnc_spawnHackableObject = {
    private _startPos = getPos (_this get "_radioTower");
    private _techie = _this get "_technician";
    private _pos = _startPos findEmptyPosition [3, 15, (_faction get "placeIntel_desk")#0];
    private _laptopType = (_faction get "placeIntel_itemLarge")#0;
    private _laptop = objNull;
    if (_laptopType isEqualTo "Land_Laptop_unfolded_F") then {
        (_faction get "placeIntel_desk") params ["_classname_desk","_azimuth"];
        private _desk = createVehicle [_classname_desk, [0, 0, 0], [], 0, "CAN_COLLIDE"];
        _desk setDir _azimuth;
        _desk setPosATL _pos;
        _desk enableSimulation false;

        sleep 1;
        _laptop = createVehicle [_laptopType, [0,0,0], [], 0, "CAN_COLLIDE"];
        [_desk, _laptop, [0.5, 0, 0.82], _azimuth] call BIS_fnc_relPosObject;
        private _anim = "Acts_Accessing_Computer_Loop";
        [_laptop, _techie, [0, 0.650, -0.82], _azimuth + 180] call BIS_fnc_relPosObject;
        [_techie, _anim] remoteExec ["switchMove"];
    } else {
        // use a base game antenna
        _laptopType = "OmniDirectionalAntenna_01_black_F";
        _laptop = createVehicle [_laptopType, _pos, [], 0, "CAN_COLLIDE"];
    };
    _laptop enableSimulation false;
    _laptop allowDamage false;
    private _id = _this get "_taskId";
    diag_log ["_id: %1", _id];
    _laptop setVariable ["_taskID",_id,true];
    [
        _laptop,														        // Object the action is attached to
        "Upload Broadcast",													    // Title of the action
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa",    // Idle icon shown on screen
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa",	// Progress icon shown on screen
        "(!(missionNamespace getVariable [[(_target getVariable '_taskID'),'UploadComplete'] joinString '',false]) && {_this distance _target < 3});",									        // Condition for the action to be shown
        "_caller distance _target < 3",									        // Condition for the action to progress
        {},																        // Code executed when action starts
        {},																        // Code executed on every progress tick
        {missionNamespace setVariable [[(_this#0 getVariable "_taskID"),"UploadComplete"] joinString "",true,true];}, // Code executed on completion
        {},																        // Code executed on interrupted
        [],																        // Arguments passed to the scripts as _this select 3
        10,																        // Action duration in seconds
        0,																        // Priority
        true,															        // Remove on completion
        false															        // Show in unconscious state
    ] remoteExec ["BIS_fnc_holdActionAdd", 0, _laptop];				        // MP-compatible implementation
};

params ["_params", "_checkpoint"];

private _task = createHashMap;

_params params ["_marker", "_radioTower"];

// Determine end time and description
private _difficulty = [1, 2] select (random 10 < tierWar);

_task set ["_marker", _marker];
_task set ["_difficulty", _difficulty];
_task set ["_endTime", time + 60 * (30 + 30*_difficulty)];
_task set ["_radioTower", _radioTower];
_task call _fnc_createTask;

_task set ["state", "s_waitForBroadcastDown"];
_task set ["interval", 1];

_task set ["_hintTitle", "Broadcast"];

// anything to construct should go here
private _faction = Faction(Occupants);
private _rtPos = getPos _radioTower;
private _technicianGroup = [_rtPos, Occupants, [_faction get "unitGrunt"]] call A3A_fnc_spawnGroup;
private _technician = units _technicianGroup#0;
_task set ["_technician", _technician];
[_technician] call A3A_fnc_NATOinit;
_technician removeWeaponGlobal (primaryWeapon _technician);
_task call _fnc_spawnHackableObject;
//spawning guard inf
_guard = [[_rtPos,10,random 360] call BIS_fnc_relPos, Occupants, selectRandom (_faction get "groupsMedium")] call A3A_fnc_spawnGroup;
{[_x] call A3A_fnc_NATOinit} forEach units _guard;

//tell guard group to guard desk
_guardWP = [_guard, _deskPos, 20] call BIS_fnc_taskPatrol;


/////////////////////
// State functions //
/////////////////////

_task set ["s_waitForBroadcastDown",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };

	if (animationState (_this get "_technician") isNotEqualTo ("acts_accessing_computer_loop")) exitWith {
        // Condition fulfilled, run any extra code
        _this set ["_countdownBroadcastDown", 240 / (_this get "_difficulty")];			// maybe shouldn't reset?

        _this set ["state", "s_broadcastDown"];

        private _nearPlayers = playableUnits inAreaArray [_rtPos, 300, 300];
        private _endTime = serverTime + _countdown;
        [_this get "_hintTitle", "The broadcast is down. We need to get to the radio tower and reactivate it within %1 seconds.", _endTime, _rtPos, 300] remoteExec ["A3A_fnc_customHintCountdown", _nearPlayers];
        private _rtPos = getPos (_this get "_radioTower");
        [_rtPos] spawn {
            params ["_pos"];
            sleep 20 + random 10;
            private _airbase = [Occupants, _pos] call A3A_fnc_availableBasesAir;
            private _data = [Occupants, _airbase, _pos, "defence", round (1 + A3A_balancePlayerScale / 1.5), 0, [], "Broadcast", 1] call A3A_fnc_createAttackForceMixed;
        };

    };
	false;
}];

_task set ["s_broadcastDown",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };

	if !(missionNamespace getVariable [[(_this getVariable '_taskID'),'UploadComplete'] joinString '',false]) exitWith {
        _this set ["state", "s_holdingBroadcast"];
        _this set ["_countdownHoldingBroadcast", ((_this get "_difficulty") * 3) + 2];
        private _rtPos = getPos (_this get "_radioTower");
        private _nearPlayers = playableUnits inAreaArray [_rtPos, 300, 300];
        private _endTime = serverTime + _countdown;
        [_this get "_hintTitle", "Our broadcast is up. Hold the area for %1 more seconds so we can finish our broadcast.", _endTime, _rtPos, 300] remoteExec ["A3A_fnc_customHintCountdown", _nearPlayers];

        false;
    };

    // Need to know actual time since the previous update
	private _timeDiff = time - (_this get "lastUpdate");
	private _countdown = (_this get "_countdownBroadcastDown") - _timeDiff;
	_this set ["_countdownBroadcastDown", _countdown];

    // Failure - time to restart ran out
	if (_countdown <= 0) exitWith {
        private _rtPos = getPos (_this get "_radioTower");
		[_this get "_hintTitle", "Everybody has stopped watching, our chance to intercept the broadcast has passed.", _rtPos, 300] call FUNC(hintNear);
		_this set ["state", "s_failed"];	
        false;
	};

	false;
}];

_task set ["s_holdingBroadcast",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };
    private _destroyer = _this get "_destroyer";
    private _rtPos = getPos (_this get "_radioTower");
    private _taskID = _this get "_taskId";
    if (isNull _destroyer || {!(_destroyer call A3A_fnc_canFight)}) then {
        private _nearEnemies = (units Occupants) inAreaArray [_rtPos, 30, 30];
        private _closest = [objNull, 50];
        {
            if (_x distance _rtPos < (_closest#1)) then {_closest = [_x, _x distance _rtPos]};
        } forEach _nearEnemies;
        private _destroyer = _closest#0;
        _this set ["_destroyer",_destroyer];
        [_this, _destroyer, _rtPos, _taskID] spawn {
            params ["_hm","_destroyer","_rtPos","_taskID"];
            _destroyer doMove _rtPos;
            private _timeout = time + 60;
            waitUntil {sleep 1; (!(_destroyer call A3A_fnc_canFight) || {_destroyer distance _rtPos < 2 || {time > _timeOut}})};
            if (!(_destroyer call A3A_fnc_canFight) || {time > _timeout}) exitWith {_hm set ["_destroyer",objNull]};
            _destroyer playMove "MountSide";
            sleep 5;
            if !(_destroyer call A3A_fnc_canFight) exitWith {_hm set ["_destroyer",objNull]};
            missionNamespace setVariable [[_taskID,"Recaptured"] joinString "",true];
        };
    };
    if (missionNamespace getVariable [[_taskID,"Recaptured"] joinString "", false]) exitWith {
        [_this get "_hintTitle", "Enemies have reached and disrupted the broadcast.", _this get "_marker", 300] call FUNC(hintNear);
		_this set ["state", "s_failed"];	
        false;
    };

    private _timeDiff = time - (_this get "lastUpdate");
	private _countdown = (_this get "_countdownHoldingBroadcast") - _timeDiff;
	_this set ["_countdownHoldingBroadcast", _countdown];

	// Success, RT was defended
	if (_countdown <= 0) exitWith {
		[_this get "_hintTitle", "Transmission completed.", _this get "_marker", 300] call FUNC(hintNear);
		_this set ["state", "s_succceeded"];	
        false;
	};

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
