#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_taskHM"];

//get task state from hm
private _taskID = _taskHM get "taskID";
if (isNil "_taskID") then { _taskID = call FUNC(genTaskUID); _taskHM set ["taskID", _taskID]; };
if (_taskID isEqualType []) then {_taskID = _taskID#0};

private _description = [
    _taskHM getOrDefault ["description", ""],
    _taskHM get "title",
    _taskHM getOrDefault ["marker", ""]
];
if (isNil {_description#1}) exitWith { Error_1("No title set for task %1", configName (_taskHM get "cfg")) };

private _destination = _taskHM getOrDefault ["destination",objNull];
private _state = _taskHM getOrDefault ["state","CREATED"];
private _priority = _taskHM getOrDefault ["priority", -1];
private _showNotification = _taskHM getOrDefault ["showNotification",true];
private _type = _taskHM getOrDefault ["type",""];
private _visibleIn3D = _taskHM getOrDefault ["visibleIn3D",false];

//update task state
if !([_taskID] call BIS_fnc_taskExists) then {
    Debug_1("Task created | ID: %1", _taskHM get "taskID");
    [
        true, _taskHM get "taskID", _description, _destination, _state, _priority, _showNotification, _type, _visibleIn3D
    ] call BIS_fnc_taskCreate;
};

if (_taskID call BIS_fnc_taskState isNotEqualTo _state) then {
    [_taskID, _state, _showNotification] call BIS_fnc_taskSetState;
};

if (_taskID call BIS_fnc_taskDescription isNotEqualTo _description) then {
    [_taskID, _description] call BIS_fnc_taskSetDescription;
};

private _destinationCheck = switch (true) do {
    case (_destination isEqualType objNull): { getPos _destination };
    case (_destination isEqualType ""): { getMarkerPos _destination };
    default { _destination };
};
if (_taskId call BIS_fnc_taskDestination isNotEqualTo _destinationCheck) then {
    [_taskID, _destination] call BIS_fnc_taskSetDestination;
};

if (_taskId call BIS_fnc_taskType isNotEqualTo _type) then {
    [_taskID, _type] call BIS_fnc_taskSetType;
};

if (_taskID call BIS_fnc_taskAlwaysVisible isNotEqualTo _visibleIn3D) then {
    [_taskID, _visibleIn3D] call BIS_fnc_taskSetAlwaysVisible;
};

//update child tasks
{ _x call FUNC(updateTaskState) } forEach (_taskHM getOrDefault ["Children", []]);

//task removal
if (_state in ["SUCCEEDED","FAILED","CANCELED"]) then {
    _taskID spawn {
        sleep (GVAR(settings) get "taskLingerTime");
        [_this, true, true] call BIS_fnc_deleteTask;
    };
};
