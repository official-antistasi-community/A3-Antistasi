/*
    A3A_fnc_taskUpdate

    Maintains the A3A task list and related vars:
    A3A_tasksData: array of all active tasks, format [taskID, type, state, creationTime, (clearTime)]. Non-public.
        clearTime is set once the task is being deleted, see DELETING.
    A3A_taskCooldowns: task type -> serverTime when the type stops being blocked. Non-public.
    A3A_activeTasks: unique string array of all active task types, completed or not. Public.
    A3A_taskCount: number of tasks created. Used to help generate unique task IDs. Public.

    Parameters:
    <STRING> taskID: Unique ID for task.
    <STRING> taskType: Task type. Will act appropriately if non-unique.
    <STRING> state/action: CREATED, DELETED, SUCCEEDED, FAILED, DELETING
    <NUMBER> DELETING only: serverTime when the task will be deleted

    Scope: Server, preferably unscheduled
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_taskId", "_taskType", "_state", ["_clearTime", 0]];
private _taskIndex = A3A_tasksData findIf { (_x#0) isEqualTo _taskId };

if (_state isEqualTo "CREATED") exitWith
{
    A3A_taskCount = A3A_taskCount + 1; publicVariable "A3A_taskCount";

    if (_taskIndex != -1) exitWith { Error_1("Non-unique task ID %1 created", _taskId) };
    A3A_tasksData pushBack [_taskId, _taskType, "CREATED", serverTime];

    if (A3A_activeTasks find _taskType != -1) exitWith { Error_1("Task type %1 already active", _taskType) };
    A3A_activeTasks pushBack _taskType; publicVariable "A3A_activeTasks";
};

if (_taskIndex == -1) exitWith { Error_2("Task ID %1 not found for state %2", _taskId, _state) };

// Task is over and will be deleted at _clearTime. Its type stays blocked until then
if (_state isEqualTo "DELETING") exitWith {
    (A3A_tasksData#_taskIndex) set [4, _clearTime];
    A3A_taskCooldowns set [_taskType, (A3A_taskCooldowns getOrDefault [_taskType, 0]) max _clearTime];
};

if (_state isEqualTo "DELETED") exitWith {
    A3A_tasksData deleteAt _taskIndex;
    if (A3A_tasksData findIf { (_x#1) isEqualTo _taskType } != -1) exitWith {};				// non-unique task type
    A3A_activeTasks deleteAt (A3A_activeTasks find _taskType); publicVariable "A3A_activeTasks";
};

if !(_state in ["SUCCEEDED", "FAILED"]) exitWith { Error_2("Bad state %1 for task ID %2", _state, _taskId) };
(A3A_tasksData#_taskIndex) set [2, _state];
