// Based on BIS_fnc_setTaskLocal

params ["_taskId", "_state", "_center", "_radius"];

private _notifyType = if (_state == "CREATED") then { "taskUnassignedIcon" } else { "task" + _state + "Icon" };
private _typeTexture = [[_taskId] call BIS_fnc_taskType] call BIS_fnc_taskTypeIcon;
private _title = [_taskId] call BIS_fnc_taskDescription select 1 select 0;      // For some reason this is an array of arrays of strings...

private _nearPlayers = playableUnits inAreaArray [_center, _radius, _radius];
[_notifyType, [_typeTexture, _title]] remoteExecCall ["BIS_fnc_showNotification", _nearPlayers];
