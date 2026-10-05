/*
    A3A_fnc_taskDelete
    Worker function to remove A3A and BIS tasks after a random delay

    Parameters:
    <STRING> unique task ID
    <STRING> task type (eg. LOG, RES, CONVOY)
    <NUMBER> Average delay in seconds. If zero, will be processed immediately
    <BOOL> default false, if true, also deletes twin BIS task (taskID+"B")

    Scope: Scheduled-only if delay > 0
*/

params ["_taskID", "_taskType", "_delay", ["_isTwin", false]];

if (_delay > 0) then { _delay = (_delay/2) + random _delay };
[_taskID, _taskType, "DELETING", serverTime + _delay] remoteExecCall ["A3A_fnc_taskUpdate", 2];
if (_delay > 0) then { sleep _delay };

[_taskID, _taskType, "DELETED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];
[_taskID] call BIS_fnc_deleteTask;
if (_isTwin) then { [_taskID+"B"] call BIS_fnc_deleteTask };
