
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

// only public vars:
// state - key of state function
// checkpoint - key of checkpoint function (retrieves data for save)
// interval - time until next update in seconds
// lastUpdate - time previous update was run (from time command)

// init call:
// params ["_task", "_params", "_checkpoint"];
// every other call: _this = task

/*
Ok, weapons truck rework

Spawning:
- Truck spawned on convoy route, essentially. Not too close to either end
- Use the city code for roadside placement

Initial behaviour:
- One dude working on vehicle, another standing nearby (crew)
- 2-man patrol + support called from destination outpost

Termination:
- At time limit, crew enters vehicle if still canFight, then gets RTB, everyone else RTB
- Mission remains active until despawn?
*/

private _fnc_createTask = {
    private _displayTime = [((_this get "_endTime") - time) / 60] call FUNC(minutesFromNow);
    private _taskName = localize "STR_A3A_Tasks_LOG_Weapons_title";
    private _taskDesc = format [localize "STR_A3A_Tasks_LOG_Weapons_desc", _displayTime];
    private _taskId = call FUNC(genTaskUID);
    private _notify = true;
    [true, _taskId, [_taskDesc, _taskName], _placePos, false, -1, _notify, "Rearm", true] call BIS_fnc_taskCreate;
    _this set ["_taskId", _taskId];
};

// Don't bother with checkpoint yet
params ["_params", "_checkpoint"];
_params params ["_placePos", "_placeDir", "_destMrk"];
private _side = sidesX getVariable _destMrk;

private _task = createHashMap;
_task set ["_destMrk", _destMrk];
_task set ["_endTime", time + 30*60];
_task call _fnc_createTask;

A3A_activeTasks pushBack "LOG";			// backwards compat with missionRequest

// Create the truck
private _faction = Faction(_side);
private _truckType = call {
    private _types = (_faction get "vehiclesTrucks") + (_faction get "vehiclesCargoTrucks");
    _types = _types select { _x in FactionGet(all,"vehiclesCargoTrucks") };         // avoid troops-only trucks. Should prebuild?
    selectRandom _types;
};
private _truck = objNull;
isNil {
    _truck = createVehicle [_truckType, _placePos, [], 0, "CAN_COLLIDE"];
    _truck setDir _placeDir;
};
[_truck, _side] call A3A_fnc_AIVEHinit;
_truck setHitPointDamage ["hitEngine", 1];
_task set ["_truck", _truck];

// Create & load the crate
private _crate = createVehicle [_faction get "ammobox", _placePos vectorAdd [0,0,-200], [], 0, "CAN_COLLIDE"];
[_crate] call A3A_Logistics_fnc_addLoadAction;
private _nodes = [_truck, _crate] call A3A_Logistics_fnc_canLoad;
(_nodes + [true]) call A3A_Logistics_fnc_load;
[_crate] spawn A3A_fnc_fillLootCrate;
_task set ["_crate", _crate];

// Driver & repair guy
private _crewGroup = createGroup [_side, true];
private _repairPos = _truck modelToWorld [0, 1 + (boundingBoxReal [_truck, "Geometry"] #1#1)];		// 1m in front of truck
private _driverPos = _repairPos getPos [3 + random 2, getDir _truck - random 90];
_repairPos set [2, 0];
private _mechanic = [_crewGroup, _faction get "unitEngineer", _repairPos, [], 0, "CAN_COLLIDE"] call A3A_fnc_createUnit;
private _driver = [_crewGroup, _faction get "unitGrunt", _driverPos, [], 0, "NONE"] call A3A_fnc_createUnit;
_driver setDir random 360;
_driver disableAI "PATH";
_mechanic setDir (getDir _truck + 180);
_mechanic disableAI "ANIM";
_mechanic playMoveNow medicAnims#1;
_task set ["_crewGroup", _crewGroup];
_task set ["_crewTroops", [_driver, _mechanic]];

// 2-man patrol
private _spawnPos = [getPosATL _truck, 10, 50, 3] call A3A_fnc_findPatrolPos;
private _typeGroup = selectRandom (_faction get (["groupsMilitiaSmall", "groupsSmall"] select (tierWar > random 6)));
private _patrolGroup = [_spawnPos, _side, _typeGroup] call A3A_fnc_spawnGroup;
{ [_x, "", false, "legacy"] call A3A_fnc_NATOinit } forEach units _patrolGroup;
_patrolGroup deleteGroupWhenEmpty true;

// Basic behaviour for patrol
[_patrolGroup, _truck] spawn
{
    params ["_group", "_truck"];
    private _truckSpawn = getPosATL _truck;
    private _soldiers = units _group;
    while { _truck distance2d _truckSpawn < 200 } do
    {
        sleep 10;
        if (currentWaypoint _group < count waypoints _group) then {continue};
        private _wpPos = _truck getPos [random 100, random 360];
        _group addWaypoint [_wpPos, 0];
    };
    [_group] spawn A3A_fnc_enemyReturnToBase;
};

// Support vehicle
private _suppType = selectRandomWeighted ([_side, tierWar, false] call A3A_fnc_getVehiclesGroundTransport);
//params ["_vehicleType", "_troopType", "_resPool", "_landPosBlacklist", "_side", "_markerOrigin", "_posDestination", ["_seaPath", []]];
private _suppData = [_suppType, "Normal", "legacy", [], _side, _destMrk, getPosATL _truck] call A3A_fnc_createAttackVehicle;
_task set ["_suppData", _suppData];

// Needs supportSpends otherwise it'll send QRFs on top
private _resources = (A3A_vehicleResourceCosts getOrDefault [_suppType, 0]) + 10 * count crew (_suppData#0);
A3A_supportStrikes pushBack [_side, "TROOPS", getPosATL _truck, time + 3600, 3600, _resources];
A3A_supportSpends pushBack [_side, getPosATL _truck, getPosATL _truck, _resources, time];

// Basic behaviour for support vehicle group
[_suppData#0, _suppData#1, _suppData#2, _truck] spawn
{
    params ["_vehicle", "_crewGroup", "_cargoGroup", "_truck"];
    private _truckSpawn = getPosATL _truck;
    private _soldiers = units _cargoGroup;			// should always have units
    while { _truck distance2d _truckSpawn < 200 } do
    {
        sleep 10;

        // Too many dead, bail out
        if ({ _x call A3A_fnc_canFight } count _soldiers < 0.33 * count _soldiers) exitWith {}; 

        // Both groups patrol area if they're out of waypoints
        {
            if (isNull _x) then {continue};
            if (currentWaypoint _x < count waypoints _x) then {continue};
            private _wpPos = _truck getPos [random 100, random 360];
            _x addWaypoint [_wpPos, 0];
        } forEach [_crewGroup, _cargoGroup];
    };
    [_vehicle] spawn A3A_fnc_VEHDespawner;
    [_crewGroup] spawn A3A_fnc_enemyReturnToBase;
    [_cargoGroup] spawn A3A_fnc_enemyReturnToBase;
};

// Function for truck crew to board if possible and RTB. spawn with [truck, crewgroup, crewtroops, destmrk] as params.
_task set ["_boardFnc",
{
    params ["_truck", "_group", "_troops", "_destMrk"];

    // Make new group because orderGetIn breaks if you call it after the leader gets killed
    private _group = createGroup [side _group, true];
    _troops select { _x call A3A_fnc_canFight } joinSilent _group;
    {
        _x enableAI "ANIM";
        _x enableAI "PATH";
        _x disableAI "AUTOCOMBAT";
        _x disableAI "TARGET";
        _x setUnitPos "UP";
        _x setVariable ["A3A_forcedStance", "UP"];
        _x setVariable ["retreating", true, true];
    } forEach _troops;
    _group setBehaviourStrong "AWARE";

    // If truck can move, no enemy and not too far then attempt to board
    private _truckDist = _truck distance2d _troops#0;
    if (canMove _truck and !(driver _truck call A3A_fnc_canFight) and _truckDist < 100) then {
        _group addVehicle _truck;
        _troops orderGetIn true;
        sleep (10 + _truckDist/2);
    };

    private _wp = _group addWaypoint [markerPos _destMrk, 50];
    _group setCurrentWaypoint _wp;

    // Whether they're in the vehicle or not, the rest is the same
    [_group] spawn A3A_fnc_groupDespawner;
    [_truck] spawn A3A_fnc_vehDespawner;         // probably already done, but whatever

}];


// Do we attempt to do sim disable?

_task set ["checkpoint", nil];
_task set ["state", "s_waitForRepair"];
_task set ["interval", 1];
_task set ["_hintTitle", localize "STR_A3A_Tasks_LOG_Weapons_title"];


/////////////////////
// State functions //
/////////////////////

_task set ["s_waitForRepair",
{
    private _endTime = _this get "_endTime";
    private _truck = _this get "_truck";

    // Fix the engine based on repair time
    private _damageVal = (_endTime - time) / (20*60);
    _truck setHitPointDamage ["hitEngine", 0 max _damageVal min 1];

    // If truck is fully repaired, get in vehicle and leave
    if (_damageVal <= 0) exitWith {
        _this set ["state", "s_boardTruck"]; false;
    };

    // If one or more of crew group is down then get out of here
    if (_this get "_crewTroops" findIf { !(_x call A3A_fnc_canFight) } != -1) exitWith {
        if (canMove _truck) then {
            [_this get "_hintTitle", localize "STR_A3A_Tasks_LOG_Weapons_escape", getPosATL _truck, 300] call FUNC(hintNear);
        };
        _this set ["state", "s_boardTruck"]; false;
    };

    // Rebel got into the vehicle. Reveal them and give up on repair
    if (side driver _truck == teamPlayer) then {
        (_this get "_crewGroup") reveal driver _truck;
        _this set ["state", "s_boardTruck"]; false;
    };

    // Box isn't in the truck
    private _crate = _this get "_crate";
    if (attachedTo _crate != _truck) then {
        if (!isNull attachedTo _crate) exitWith {
            // players managed to get crate into another vehicle. Abort.
            _this set ["state", "s_boardTruck"]; false;
        };
        if (units teamPlayer inAreaArray [_crate, 100, 100] findIf { _x call A3A_fnc_canFight } == -1) then {
            // If there are no live rebels within 100m, put it back in
            private _nodes = [_truck, _crate] call A3A_Logistics_fnc_canLoad;
            _nodes call A3A_Logistics_fnc_load;			// not instant
        };
    };

    false;
}];

_task set ["s_boardTruck",
{
    // Crew attempt to drive the truck on to the outpost
    [_this get "_truck", _this get "_crewGroup", _this get "_crewTroops", _this get "_destMrk"] spawn (_this get "_boardFnc");

    // move straight to termination conditions
    _this set ["state", "s_crateWatch"];
    false;
}];

_task set ["s_crateWatch",
{
    // crate was despawned by truck despawn
    private _crate = _this get "_crate";
    if (isNull _crate) exitWith {
        _this set ["state", "s_failed"]; false;
    };

    if (_crate distance2d markerPos "Synd_HQ" < 100) exitWith {
        _this set ["state", "s_succeeded"]; false;
    };

    // Prevent the crate despawning if it's been in recent rebel possession
    private _rebelsNear = units teamPlayer inAreaArray [_crate, 200, 200] isNotEqualTo [];      // shouldn't include corpses?
    if (_rebelsNear) then { _this set ["_crateTimeout", time + 10*60] };

    if (isNull attachedTo _crate and _this getOrDefault ["_crateTimeout", 0] < time) exitWith {
        deleteVehicle _crate;
        _this set ["state", "s_failed"]; false;
    };

    false;
}];

_task set ["s_succeeded", {
    // find closest player to the crate (driver? who knows)
    private _crate = _this get "_crate";
    private _players = (allPlayers - entities "HeadlessClient_F") inAreaArray [_crate, 100, 100];
    _distances = _players apply { _x distance2d _crate };
    private _nearPlayer = _players select (_distances find selectMin _distances);

    if (!isNil "_nearPlayer") then {
        private _count = count units group _nearPlayer;
        { [20 / _count, _x] call A3A_fnc_playerScoreAdd } forEach units group _nearPlayer;
    };
    [5, theBoss] call A3A_fnc_playerScoreAdd;
    [0, 200] remoteExec ["A3A_fnc_resourcesFIA", 2];

    [_this get "_taskId", "SUCCEEDED"] call BIS_fnc_taskSetState;
    _this set ["state", "s_cleanup"]; false;
}];

_task set ["s_failed", {
    // Just set the task state
    [_this get "_taskId", "FAILED"] call BIS_fnc_taskSetState;
    _this set ["state", "s_cleanup"]; false;
}];

_task set ["s_cleanup", {
    (_this get "_taskId") spawn {
        sleep 120;
        [_this, true, true] call BIS_fnc_deleteTask;
        A3A_activeTasks deleteAt (A3A_activeTasks find "LOG");
        publicVariable "A3A_activeTasks";
    };
    true;		// delete the task
}];

// Return the task hashmap
_task;
