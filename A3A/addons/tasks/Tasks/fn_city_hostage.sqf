#include "..\script_component.hpp"
FIX_LINE_NUMBERS()


// Don't use checkpoints for minor missions
params ["_params", "_checkpoint"];
_params params ["_marker", "_house"];
Trace_1("Params: %1", _params);

private _task = createHashMap;

_task set ["_hintTitle", localize "STR_A3A_Tasks_hostage_title"];
_task set ["_marker", _marker];
_task set ["_endTime", time + 20*60];


// Create the dude
private _positions = _house buildingPos -1;
private _hostagePos = _positions deleteAt (floor random count _positions);
private _hostage = [createGroup [civilian, true], FactionGet(civ, "unitMan"), _hostagePos, [], 0, "NONE"] call A3A_fnc_createUnit;
_hostage setDir (_house getRelDir _hostagePos);
_hostage disableAI "PATH";
_task set ["_hostage", _hostage];

// Add global action
private _addActionCode = {
    params ["_unit"];
    private _condition = toString { (isPlayer _this) and (lifeState _target == "HEALTHY") and (_target isNil "A3A_taxiDriver") };
    _unit addAction [localize "STR_A3A_Tasks_taxi_leave", {
        params ["_target", "_caller"];
        _target setVariable ["A3A_taxiDriver", _caller, true];
    },nil,0,false,true,"",_condition, 4];
};
[_hostage, _addActionCode] remoteExec ["call", 0, _hostage];

// Create cops
private _groupType = ["groupsPoliceSmall", "groupsMilitiaSmall"] select (random 8 < tierWar);
private _policeGroup = createGroup [Occupants, true];
{
    private _pos = _positions deleteAt (floor random count _positions);
    private _unit = [_policeGroup, _x, _pos, [], 0, "NONE"] call A3A_fnc_createUnit;
    [_unit, "", false, "legacy"] call A3A_fnc_NATOinit;
} forEach selectRandom (A3A_faction_occ get _groupType);
_task set ["_policeGroup", _policeGroup];

// Create the task
private _displayTime = [((_task get "_endTime") - time) / 60] call FUNC(minutesFromNow);
private _taskDesc = format [localize "STR_A3A_Tasks_hostage_desc", _marker, _displayTime];
private _taskId = call FUNC(genTaskUID);
[true, _taskId, [_taskDesc, _task get "_hintTitle"], _hostage, false, -1, true, "Meet", true] call BIS_fnc_taskCreate;
_task set ["_taskId", _taskId];


_task set ["state", "s_waitForPickup"];
_task set ["interval", 1];

Trace_1("Initial data: %1" _task);

_task set ["s_waitForPickup", {
    private _hostage = _this get "_hostage";
    if !(_hostage isNil "A3A_taxiDriver") exitWith {

        private _taxiGroup = group (_hostage getVariable "A3A_taxiDriver");
        _this set ["_taxiGroup", _taxiGroup];
        _this set ["_endTime", (_this get "_endTime") + 30*60];

        // Play start message & set description
        // I'm glad you're here. Get me to any rebel location and I'll figure it out from there.
        [_this get "_hintTitle", localize "STR_A3A_Tasks_hostage_start"] remoteExecCall ["A3A_fnc_customHint", units _taxiGroup];

	    private _displayTime = [((_this get "_endTime") - time) / 60] call FUNC(minutesFromNow);
        private _taskDesc = format [localize "STR_A3A_Tasks_hostage_startDesc", _displayTime];
        [_this get "_taskId", [_taskDesc, _this get "_hintTitle", ""]] call BIS_fnc_taskSetDescription;

        // Join group
        _hostage enableAI "PATH";
        [_hostage] joinSilent _taxiGroup;

        _this set ["state", "s_transit"]; false;
    };

    if (!alive _hostage or time > _this get "_endTime") exitWith {
        _this set ["state", "s_failure"]; false;
    };
    false;
}];

_task set ["s_transit", {
    private _hostage = _this get "_hostage";
    if (!alive _hostage) exitWith {
        [-2, _this get "_marker"] remoteExecCall ["A3A_fnc_citySupportChange", 2];
        [-2, theBoss] call A3A_fnc_playerScoreAdd;
        _this set ["state", "s_failure"]; false;
    };

    private _curMarker = [getPosATL _hostage] call A3A_fnc_getMarkerForPos;
    private _vehSpeed = vectorMagnitude velocity vehicle _hostage;
    if (sidesX getVariable [_curMarker, sideUnknown] == teamPlayer and _vehSpeed < 2) exitWith {
        moveOut _hostage;
        [_hostage] joinSilent createGroup [civilian, true];
        private _house = nearestBuilding getPosATL _hostage;
        private _destPos = if (isNull _house) then { markerPos _curMarker } else { getPosATL _house };
        group _hostage addWaypoint [_destPos, 0];     // should work even if wrong locality
        _this set ["state", "s_success"]; false;
    };

    // If you go fast enough he'll stick around
    if (time > _this get "_endTime" and _vehSpeed < 2) exitWith {

        // Are you even trying to get anywhere? I'll find my own way out.
        private _nearPlayers = units (_this get "_taxiGroup") inAreaArray [getPosATL _hostage, 50, 50];
        [_this get "_hintTitle", localize "STR_A3A_Tasks_hostage_angry"] remoteExecCall ["A3A_fnc_customHint", _nearPlayers];

        moveOut _hostage;
        [_hostage] joinSilent createGroup [civilian, true];
        group _hostage addWaypoint [getPosATL _hostage getPos [1000, random 360], 50];     // should work even if wrong locality

        _this set ["state", "s_failure"]; false;
    };
    false;
}];

_task set ["s_success", {
	private _playersInRange = units (_this get "_taxiGroup") inAreaArray [getPosATL (_this get "_hostage"), 250, 250];
	{[10, _x] call A3A_fnc_playerScoreAdd} forEach _playersInRange;
	[5, theBoss] call A3A_fnc_playerScoreAdd;

	[10, _this get "_marker"] remoteExecCall ["A3A_fnc_citySupportChange", 2];

	[_this get "_taskId", "SUCCEEDED"] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
}];

_task set ["s_failure", {
	[_this get "_taskId", "FAILED"] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
}];

_task set ["s_cleanup", {
    // Clean up the passenger
    private _hostage = _this get "_hostage";
    _hostage spawn { sleep 60; deleteVehicle _this };

    // Clean up the goons
    [_this get "_policeGroup"] spawn A3A_fnc_groupDespawner;

	(_this get "_taskId") spawn {
		sleep 600;
		[_this, true, true] call BIS_fnc_deleteTask;
	};
	true;		// delete the task
}];

_task;
