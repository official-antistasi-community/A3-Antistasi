
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()


// Don't use checkpoints for minor missions
params ["_params", "_checkpoint"];
_params params ["_marker", "_startPos", "_startDir", "_destMrk"];
Trace_1("Params: %1", _params);

private _task = createHashMap;

_task set ["_hintTitle", localize "STR_A3A_Tasks_taxi_title"];
_task set ["_marker", _marker];
_task set ["_destMrk", _destMrk];
_task set ["_endTime", time + 15*60];

// Create the dude
private _passenger = [createGroup [civilian, true], FactionGet(civ, "unitMan"), _startPos, [], 0, "NONE"] call A3A_fnc_createUnit;
_passenger setDir _startDir;
_passenger disableAI "PATH";
_passenger disableAI "FSM";      // attempt to prevent occasional case of jumping out and running off
_passenger disableAI "AUTOCOMBAT";
group _passenger setBehaviourStrong "SAFE";
_task set ["_passenger", _passenger];

// Add global action
private _addActionCode = {
    params ["_unit"];
    private _condition = toString { (isPlayer _this) and (alive _target) and (_target getVariable ["A3A_taxiDriver", objNull] != _this) };
    _unit addAction [localize "STR_A3A_Tasks_taxi_leave", {
        params ["_target", "_caller"];
        _target setVariable ["A3A_taxiDriver", _caller, true];
        [_target, _caller] remoteExec ["A3A_fnc_AIfollow", _target];
    },nil,0,false,true,"",_condition, 4];
};
[_passenger, _addActionCode] remoteExec ["call", 0, _passenger];

// Create the task
// TODO: Pick better icon
private _displayTime = [((_task get "_endTime") - time) / 60] call FUNC(minutesFromNow);
private _taskDesc = format [localize "STR_A3A_Tasks_taxi_desc", _marker, _displayTime];
private _taskId = call FUNC(genTaskUID);
[true, _taskId, [_taskDesc, _task get "_hintTitle"], _startPos, false, -1, false, "Car", true] call BIS_fnc_taskCreate;
_task set ["_taskId", _taskId];
[_taskId, "CREATED", markerPos _marker, 1300] call FUNC(taskNotifyNear);

// find actual destination building
private _radius = 500 min vectorMagnitude markerSize _destMrk;
private _house = selectRandom nearestTerrainObjects [markerPos _destMrk, ["House", "Building"], _radius];
private _compRad = (boundingBox _house # 2) + 20;
_task set ["_destPos", getPosATL _house];
_task set ["_destRad", _compRad];

// Function to be run passenger-local on completion
_task set ["_fnc_getOut", {
    params ["_passenger", "_destPos"];
    terminate (_unit getVariable ["A3A_AIScriptHandle", scriptNull]);       // turn off the follow logic
    unassignVehicle _passenger;
    moveOut _passenger;
    [_passenger] joinSilent createGroup [civilian, true];
    _passenger doMove _destPos;
}];

_task set ["state", "s_waitForPickup"];
_task set ["interval", 1];

Trace_1("Initial data: %1" _task);

/////////////////////
// State functions //
/////////////////////

_task set ["s_waitForPickup", {
    private _passenger = _this get "_passenger";
    if !(_passenger isNil "A3A_taxiDriver") exitWith {

        // Play start message & set description
        private _hintStr = format [localize "STR_A3A_Tasks_taxi_start", _this get "_destMrk"];
        [_this get "_hintTitle", _hintStr, getPosATL _passenger, 50] call FUNC(hintNear);

        _this set ["_endTime", (_this get "_endTime") + 45*60];
	    private _displayTime = [((_this get "_endTime") - time) / 60] call FUNC(minutesFromNow);
        private _taskDesc = format [localize "STR_A3A_Tasks_taxi_startDesc", _this get "_destMrk", _displayTime];
        [_this get "_taskId", [_taskDesc, _this get "_hintTitle", ""]] call BIS_fnc_taskSetDescription;
        [_this get "_taskId", _this get "_destPos"] call BIS_fnc_taskSetDestination;         // reposition to destination

        _this set ["state", "s_transit"]; false;
    };

    if (!alive _passenger or time > _this get "_endTime") exitWith {
        _this set ["state", "s_failure"]; false;
    };
    false;
}];

_task set ["s_transit", {
    private _passenger = _this get "_passenger";
    if (!alive _passenger) exitWith {
    	[-2, _this get "_marker"] remoteExecCall ["A3A_fnc_citySupportChange", 2];
        [_this get "_taskId", "FAILED", getPosATL _passenger, 100] call FUNC(taskNotifyNear);
        _this set ["state", "s_failure"]; false;
    };

    private _destPos = _this get "_destPos";
    private _vehSpeed = vectorMagnitude velocity vehicle _passenger;
    if (vehicle _passenger distance2d _destPos < _this get "_destRad" and _vehSpeed < 2) exitWith {

        // What would be a good success hint? Not really needed?
        // Thanks for the lift. This will help the war effort in %1.
        //private _nearPlayers = units (_this get "_taxiGroup") inAreaArray [getPosATL _passenger, 50, 50];
        //[_this get "_hintTitle", localize "STR_A3A_Tasks_Taxi_happy"] remoteExecCall ["A3A_fnc_customHint", _nearPlayers];

        [[_passenger, _this get "_destPos"], _this get "_fnc_getOut"] remoteExec ["call", _passenger];
        _this set ["state", "s_success"]; false;
    };

    // If you go fast enough he'll stick around
    if (time > _this get "_endTime" and _vehSpeed < 2) exitWith {

        // Are you just driving me around in circles? I'm outta here.
        [_this get "_hintTitle", localize "STR_A3A_Tasks_taxi_angry", getPosATL _passenger, 50] call FUNC(hintNear);

        [[_passenger, _this get "_destPos"], _this get "_fnc_getOut"] remoteExec ["call", _passenger];
        _this set ["state", "s_failure"]; false;
    };
    false;
}];

_task set ["s_success", {
    // TODO: Reward should probably be based on distance
	private _playersInRange = playableUnits inAreaArray [_this get "_passenger", 100, 100];
	{[10 / count _playersInRange, _x] call A3A_fnc_playerScoreAdd} forEach _playersInRange;
	[2, theBoss] call A3A_fnc_playerScoreAdd;

    // TODO: Maybe both ends?
    private _distance = markerPos (_this get "_marker") distance2d (_this get "_destPos");
	[5 + _distance/400, _this get "_marker"] remoteExecCall ["A3A_fnc_citySupportChange", 2];
	[0, 200] remoteExec ["A3A_fnc_resourcesFIA", 2];            // some faction cash

    [_this get "_taskId", "SUCCEEDED", getPosATL (_this get "_passenger"), 100] call FUNC(taskNotifyNear);
	[_this get "_taskId", "SUCCEEDED", false] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
}];

_task set ["s_failure", {
	[_this get "_taskId", "FAILED", false] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
}];

_task set ["s_cleanup", {
    // Clean up the passenger
    private _passenger = _this get "_passenger";
    _passenger spawn { sleep 60; deleteVehicle _this };

	(_this get "_taskId") spawn {
		sleep 600;
		[_this, true, true] call BIS_fnc_deleteTask;
	};
	true;		// delete the task
}];

_task;
