
// Use a car that's already placed? not within LoS of players?

// Create a dude standing next to it.
// Damage the engine

// ok, better: It's a car loaded with hidden explosives instead
// courier abandoned it. You need to get it to the rebel safe house, however you want to do that

// bonus: If the car actually dies then it explodes extremely violently
// need to lock the car after you leave it there?
// nah, just a hold for 30 seconds



#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

// Don't use checkpoints for minor missions
params ["_params", "_checkpoint"];
_params params ["_marker", "_carPos", "_carDir"];
Trace_1("Params: %1", _params);

private _task = createHashMap;

_task set ["_hintTitle", localize "STR_A3A_Tasks_repair_title"];
_task set ["_marker", _marker];
_task set ["_endTime", time + 30*60];

// Create the car. It's rebel so doesn't need cleanup
private _car = objNull;
isNil {
    private _vehType = selectRandomWeighted civVehiclesWeighted;
    _car = createVehicle [_vehType, _carPos, [], 0, "CAN_COLLIDE"];
    _car setDir _carDir;
};
[_car, teamPlayer] call A3A_fnc_AIVehInit;
_car setFuel 0.1;
_car setHitPointDamage ["hitEngine", 1.0];
_task set ["_car", _car];

// Create a goon patrol
private _policePos = [getPosATL _car, 5, 30, 2] call A3A_fnc_findPatrolPos;
private _groupType = ["groupsPoliceSmall", "groupsMilitiaSmall"] select (random 8 < tierWar);
private _policeGroup = createGroup [Occupants, true];
{
    private _unit = [_policeGroup, _x, _policePos, [], 0, "NONE"] call A3A_fnc_createUnit;
    [_unit, "", false, "legacy"] call A3A_fnc_NATOinit;
} forEach selectRandom (A3A_faction_occ get _groupType);

[_policeGroup, "Patrol_Area", 5, 30, -1, false, getPosATL _car, false, false] call A3A_fnc_patrolLoop;
_task set ["_policeGroup", _policeGroup];

// Select a building further away for the garage
private _radius = 500 min vectorMagnitude markerSize _marker;
private _houses = nearestObjects [markerPos _marker, ["House"], _radius];
private _house = selectRandom _houses;
for "_i" from 1 to 10 do {
    private _house2 = selectRandom _houses;
    if (_car distance2d _house < _car distance2d _house2) then { _house = _house2 };
};
private _compRad = (boundingBox _house # 2) + 20;
_task set ["_destPos", getPosATL _house];
_task set ["_destRad", _compRad];

// Create the mechanic near the house. Put him undercover for now.
private _emptyPos = [_house, 2] call A3A_fnc_findPosNearHouse;
if (_emptyPos isEqualTo []) then { _emptyPos = getPosATL _house getPos [random 50, random 360] };
private _mechanic = [createGroup [teamPlayer, true], FactionGet(reb, "unitEng"), _emptyPos, [], 0, "NONE"] call A3A_fnc_createUnit;
_mechanic forceAddUniform selectRandom (A3A_faction_civ get "uniforms");
_mechanic setCaptive true;
_mechanic disableAI "FSM";
_task set ["_mechanic", _mechanic];

// Create the task
private _displayTime = [((_task get "_endTime") - time) / 60] call FUNC(minutesFromNow);
private _taskDesc = format [localize "STR_A3A_Tasks_repair_desc", _marker, _displayTime];
private _taskId = call FUNC(genTaskUID);
[true, _taskId, [_taskDesc, _task get "_hintTitle"], _task get "_car", false, -1, false, "use", true] call BIS_fnc_taskCreate;
_task set ["_taskId", _taskId];
[_taskId, "CREATED", markerPos _marker, 1300] call FUNC(taskNotifyNear);


// Also need a marker for the safehouse
private _houseMrk = createMarkerLocal ["task_repair_" + _taskId, getPosATL _house];
_houseMrk setMarkerShapeLocal "ICON";
_houseMrk setMarkerTypeLocal "loc_Tourism";
_houseMrk setMarkerColorLocal "ColorBlack";
_houseMrk setMarkerText localize "STR_A3A_Tasks_repair_markername";
_task set ["_houseMrk", _houseMrk];

_task set ["state", "s_fetchCar"];
_task set ["interval", 1];

Trace_1("Initial data: %1", _task);

_task set ["s_fetchCar", {
    private _car = _this get "_car";
    private _mechanic = _this get "_mechanic";
    if (time > _this get "_endTime" or !alive _car or !alive _mechanic) exitWith {
        _this set ["state", "s_failure"]; false;
    };

    if (_car distance2d (_this get "_destPos") < (_this get "_destRad") and speed _car < 0.01) exitWith {

        // Tell players to park up (and keep enemies away?) while the mechanic gets the contraband from the car
        if (captive _mechanic) then {
            [_this get "_hintTitle", localize "STR_A3A_Tasks_repair_defend", getPosATL _car, 50] call FUNC(hintNear);
        };

        // Find spot behind car for mechanic to work
        _mechanic setCaptive false;
        _mechanic doMove (_car modelToWorld [0, boundingBoxReal [_car, "Geometry"]#0#1, 0]);

        _this set ["_countShown", false];
        _this set ["state", "s_defendMechanic"]; false;
    };
    false;
}];

_task set ["s_defendMechanic", {
    private _car = _this get "_car";
    private _mechanic = _this get "_mechanic";
    if (!alive _car or !alive _mechanic) exitWith {
        [_this get "_hintTitle", "", getPosATL _car, 100] call FUNC(hintNear);
        [_this get "_taskId", "FAILED", getPosATL _car, 200] call FUNC(taskNotifyNear);
        _this set ["state", "s_failure"]; false;
    };

    // If the car gets moved then we return to park mode
    if (_car distance2d (_this get "_destPos") > (_this get "_destRad") or speed _car > 0.01) exitWith {
        [_this get "_hintTitle", localize "STR_A3A_Tasks_repair_nomove", getPosATL _car, 50] call FUNC(hintNear);
        _mechanic switchMove "";
        _mechanic doMove getPosATL _mechanic;
        _this set ["state", "s_fetchCar"]; false;
    };

    // Make the mechanic play an animation once he gets to the car
    if (unitReady _mechanic and animationState _mechanic != medicAnims#1) then {
        _mechanic lookAt _car;
        _mechanic setDir (_mechanic getDir _car);
        _mechanic playMoveNow medicAnims#1;
    };

	// Need to know actual time since the previous update
	private _timeDiff = time - (_this get "lastUpdate");
	private _countdown = (_this getOrDefault ["_countdown", 65]) - _timeDiff;
	_this set ["_countdown", _countdown];
    if (_countdown > 60) exitWith { false };        // don't whack the previous message

	// Delivery completion success
	if (_countdown <= 0) exitWith {
        [_this get "_hintTitle", localize "STR_A3A_Tasks_repair_success", getPosATL _car, 50] call FUNC(hintNear);
         _this set ["state", "s_success"]; false;
    };

	// Show the countdown if it's not already running
    if (_this get "_countShown") exitWith { false };
    Trace("Countdown triggered");
    _this set ["_countShown", true];
    private _nearPlayers = allPlayers inAreaArray [getPosATL _car, 50, 50];
    private _endTime = serverTime + _countdown;
    [_this get "_hintTitle", localize "STR_A3A_Tasks_repair_countdown", _endTime, _car, 50] remoteExec ["A3A_fnc_customHintCountdown", _nearPlayers];
    false;
}];

_task set ["s_success", {
    private _car = _this get "_car";
	private _playersInRange = allPlayers inAreaArray [getPosATL _car, 100, 100];
	{[5, _x] call A3A_fnc_playerScoreAdd} forEach _playersInRange;
	[5, theBoss] call A3A_fnc_playerScoreAdd;

	[8, _this get "_marker"] remoteExecCall ["A3A_fnc_citySupportChange", 2];

    // Fix up the car and add some explosives to the cargo
    _car setHitPointDamage ["hitEngine", 0];
    private _magazine = selectRandom allExplosiveCharges;
    if (!isNil "_magazine") then {
        private _magweight = 5 max getNumber (configFile >> "CfgMagazines" >> _magazine >> "mass");
        _car addItemCargoGlobal [_magazine, ceil (50 / _magweight)];
    };

    [_this get "_taskId", "SUCCEEDED", getPosATL _car, 100] call FUNC(taskNotifyNear);
	[_this get "_taskId", "SUCCEEDED", false] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
}];

_task set ["s_failure", {
	[_this get "_taskId", "FAILED", false] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
}];

_task set ["s_cleanup", {
    // Get rid of the marker
    deleteMarker (_task get "_houseMrk");

    // Clean up the mechanic
    private _mechanic = _this get "_mechanic";
    if (alive _mechanic) then {
        _mechanic setCaptive true;
        _mechanic switchMove "";
        _mechanic doWatch objNull;
        _mechanic doMove (_this get "_destPos");
    };
    _mechanic spawn { sleep 60; deleteVehicle _this };

    // Clean up the goons
    // TODO: sync them with garrison maybe...
    [_this get "_policeGroup"] spawn A3A_fnc_groupDespawner;

	(_this get "_taskId") spawn {
		sleep 600;
		[_this, true, true] call BIS_fnc_deleteTask;
	};
	true;		// delete the task
}];

_task;