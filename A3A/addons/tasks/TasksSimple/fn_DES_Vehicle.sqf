#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehID"];

private _side = sidesX getVariable _marker;
if (_side == teamPlayer) exitWith { Error_1("%1 already rebel", _marker) };

private _endTime = time + 3600;
private _displayTime = [60] call FUNC(minutesFromNow);

private _supportVehData = A3A_garrison get _marker get "supportVehicles" get _vehID;
if (isNil "_supportVehData") exitWith {
	// vehicle *might* have been destroyed before we get here
    Error_2("No support data for vehicle ID %1 in %2", _vehID, _marker); 
};
private _vehName = getText (configFile >> "CfgVehicles" >> (_supportVehData#2#0) >> "displayName");
//private _vehPos = (A3A_spawnPlaces get _marker) # (_supportVehData#2#1) # 1;
private _nameDest = [_marker] call A3A_fnc_localizar;

private _taskId = "DES" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[["STR_A3A_Tasks_DES_Vehicle_desc",_nameDest,_displayTime,_vehName],["STR_A3A_Tasks_DES_Vehicle_title"],""],markerPos _marker,false,0,true,"Destroy",true] call BIS_fnc_taskCreate;
[_taskId, "DES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];


// Hook for vehKilledOrCaptured
private _fnc_vehChanged = {
	params ["_taskId", "_veh", "_sideEnemy", "_captured", "_killer"];

	[_taskId, "DES", "SUCCEEDED"] call A3A_fnc_taskSetState;
	[0, 300] remoteExec ["A3A_fnc_resourcesFIA", 2];
	[20, false, _killer, 300] call A3A_tasks_fnc_rewardPlayers;     // players within 300m of killer
};

private _missionKey = _marker + "_vid" + str _vehID;
A3A_missionVehicles set [_missionKey, [_fnc_vehChanged, _taskId]];

waitUntil { sleep 5; (time > _endTime) or (sidesX getVariable _marker == teamPlayer) or !(_missionKey in A3A_missionVehicles) };

if (time > _endTime) then {
	// Timeout failure
	[_taskId, "DES", "FAILED"] call A3A_fnc_taskSetState;
	[-10, theBoss] call A3A_fnc_playerScoreAdd;
} else {
	if (sidesX getVariable _marker != teamPlayer) exitWith {};			// kill/capture success already handled

	// Marker was captured by rebels
	[_taskId, "DES", "SUCCEEDED"] call A3A_fnc_taskSetState;
	[0, 300] remoteExec ["A3A_fnc_resourcesFIA", 2];
	[20, false, markerPos _marker, 300] call A3A_tasks_fnc_rewardPlayers;     // players near marker when captured
};

[_taskId, "DES", 1200] spawn A3A_fnc_taskDelete;
