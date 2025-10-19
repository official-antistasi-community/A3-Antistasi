
// ok fuck it

// Battle of XXX mission

// Triggered immediately when town reaches 100% rebel support (or something like that)

// Immediate spawn:
// - QRF troop vehicle(s)? Land, preferably
// - Undercover local commander

// This would actually benefit a lot from simulated enemy groups
// Can fudge: If QRF reaches target and the town isn't spawned, disable sim & hide.
// Potential mid stage, reverting to stage 1?

// Stage 1:
// - fail if undercover commander dies or timeout is reached (how long?)
// - progress to stage 2 if any enemy unit dies in the vicinity? mission event handler?
//      Maybe any town garrison unit + anyone in that QRF. Tricky though.
// - Create units here directly and then it kinda works

// Stage 2:
// - Spawn rebel groups in town buildings. Send them to engage.
// - Quite a lot like a punishment mission
// - evaluation kicks in after 10min or so, stage 3?


#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _fnc_createTask = {
	private _nameDest = [_this get "_marker"] call A3A_fnc_localizar;
	private _displayTime = [((_this get "_endTime") - time) / 60] call FUNC(minutesFromNow);
    _this set ["_nameDest", _nameDest];

	private _taskName = format [localize "STR_A3A_Tasks_cityBattle_title", _nameDest];
	private _taskDesc = format [localize "STR_A3A_Tasks_cityBattle_description", _nameDest, _displayTime];
	private _taskPos = getPosATL (_this get "_leader");
	private _notify = isNil {_this get "checkpoint"};
	private _taskId = call FUNC(genTaskUID);
	[true, _taskId, [_taskDesc,_taskName], _taskPos, false, -1, _notify, "Defend", true] call BIS_fnc_taskCreate;
	_this set ["_taskId", _taskId];
};

private _fnc_spawnCivAtPos = {
    params ["_group", "_pos", "_dir"];
    private _unitType = A3A_faction_reb get "unitUnarmed";
    private _identity = [A3A_faction_civ, _unitType] call A3A_fnc_createRandomIdentity;
    private _unit = [_group, _unitType, _pos, [], 0, "NONE", _identity] call A3A_fnc_createUnit;
    _unit setDir _dir;
    _unit forceAddUniform selectRandom (A3A_faction_civ get "uniforms");
    _unit addHeadgear selectRandom (A3A_faction_civ get "headgear");
    private _priWeapon = "Rifles" call A3A_fnc_randomRifle;
    [_unit, _priWeapon, "OpticsClose", 50] call A3A_fnc_addPrimaryAndMags;
    _unit setSkill 0.5;
    _unit;
};

private _fnc_spawnLeader = {
    // select random house, place inside like a garrison.
    private _marker = _this get "_marker";
    private _buildingPlaces = [_marker, 200, 1] call A3A_fnc_patrolGetBuildingPlaces;
    private _place = if (_buildingPlaces isEqualTo []) then { [markerPos _marker, 0] } else { _buildingPlaces # 0 };

    // Create the leader
    private _group = createGroup [teamPlayer, true];
    private _leader = [_group, _place#0, _place#1] call _fnc_spawnCivAtPos;
    _leader setCaptive true;		// don't let him get shot for now
    _leader disableAI "ALL";
    _this set ["_leader", _leader];

    // Add global start battle action to the leader
    private _addActionCode = {
        params ["_leader"];
        private _condition = toString { (isPlayer _this) and (lifeState _target == "HEALTHY") and (_target isNil "A3A_cityBattleTrigger") };
        _leader addAction [localize "STR_A3A_Tasks_cityBattle_start", {
            params ["_target", "_caller"];
            _target setVariable ["A3A_cityBattleTrigger", true, true];
        },nil,0,false,true,"",_condition, 4];
    };
    [_leader, _addActionCode] remoteExec ["call", 0, _leader];
};

private _fnc_spawnRebels = {
    private _numCiv = _this get "_numCiv";
    private _marker = _this get "_marker";
    private _leader = _this get "_leader";
    private _fnc_spawnCivAtPos = _this get "_fnc_spawnCivAtPos";

    private _buildingPlaces = [_marker, 200, _numCiv, 4] call A3A_fnc_patrolGetBuildingPlaces;
    private _civilians = [_leader];
    private _civGroups = [group _leader];
    private _curGroup = group _leader;
    while {count _civilians < _numCiv} do
    {
        private _place = _buildingPlaces deleteAt 0;
        if (isNil "_place") then { _place = [markerPos _marker getPos [200 * sqrt random 1, random 360], random 360] };      // fallback
        if (leader _curGroup distance2d _place#0 > 20) then {
            _curGroup = createGroup [teamPlayer, true];
            _civGroups pushBack _curGroup;
        };
        _civilians pushBack ([_curGroup, _place#0, _place#1] call _fnc_spawnCivAtPos);
        sleep 0.1;
    };
    _this set ["_civilians", _civilians];
    _this set ["_civGroups", _civGroups];

    _leader setCaptive false;
    _leader enableAI "ALL";
    {
        [_x, "Patrol_Defend", 0, 100, -1, true, markerPos _marker, false] call A3A_fnc_patrolLoop
    } forEach _civGroups;
};


params ["_params", "_checkpoint"];

private _task = createHashMap;

if (isNil "_checkpoint") then {
	_params params ["_marker"];

	_task set ["_marker", _marker];
	_task set ["_endTime", time + 1800];

    private _numCiv = (A3A_cityData getVariable _marker) select 0;
    _numCiv = 30 min (4 + round sqrt _numCiv);
    _task set ["_numCiv", _numCiv];

    _task call _fnc_spawnLeader;
    //_task call _fnc_spawnEnemies;

    // Spawn on leader position
	_task call _fnc_createTask;
}
else {
	_params params ["_marker", "_remTime"];

    // Probably don't use checkpoints for this mission?
};

_task set ["checkpoint", ""];
_task set ["state", "s_spawnEnemies"];
_task set ["interval", 0.1];

_task set ["_hintTitle", format [localize "STR_A3A_Tasks_cityBattle_title", _task get "_marker"]];

// Need these because local vars aren't accessible from state code
_task set ["_fnc_spawnRebels", _fnc_spawnRebels];
_task set ["_fnc_spawnCivAtPos", _fnc_spawnCivAtPos];

/*_task set ["c_started", {
	[_this get "_marker", getPosATL (_this get "_box"), (_this get "_endTime") - time, _this get "_difficulty"];
}];*/


/////////////////////
// State functions //
/////////////////////

_task set ["s_spawnEnemies", 
{
    // Create the enemy force
    // Not executed at init because it's fairly slow
    private _marker = _this get "_marker";
    private _vehCount = round (1 + random 1 + 0.13 * sqrt (A3A_cityPop get _marker) + 1.2 * A3A_balancePlayerScale);

    private _airbase = [Occupants, markerPos _marker] call A3A_fnc_availableBasesAir;

    //params ["_side", "_airbase", "_target", "_resPool", "_vehCount", "_delay", "_modifiers", "_attackType", "_reveal"];
    private _data = [Occupants, _airbase, _marker, "defence", _vehCount, -1, ["lowair"]] call A3A_fnc_createAttackForceMixed;
    _data params ["_resources", "_vehicles", "_crewGroups", "_cargoGroups"];
    _this set ["_vehicles", _vehicles];
    _this set ["_crewGroups", _crewGroups];
    _this set ["_cargoGroups", _cargoGroups];
    _this set ["_troops", flatten (_cargoGroups apply { units _x })];

    // May as well do it properly here. Unlike actual attacks, needs supportSpends otherwise it'll send QRFs on top
    A3A_supportStrikes pushBack [Occupants, "TROOPS", markerPos _marker, time + 3600, 3600, _resources];
    A3A_supportSpends pushBack [Occupants, markerPos _marker, markerPos _marker, _resources, time];

    _task set ["state", "s_waitForStart"];
    _task set ["interval", 10];
    false;
}];

_task set ["s_waitForStart",
{
    private _marker = _this get "_marker";
    private _troops = _this get "_troops";
    private _leader = _this get "_leader";
    private _pos = markerPos _marker;

    Debug_3("%1 troops : %2 live troops : %3 time left", count _troops, {_x call A3A_fnc_canFight} count _troops, (_this get "_endTime") - time);

    // Different message to battle fail but same outcome
	if (_this get "_endTime" < time) exitWith {
        private _taskDesc = format [localize "STR_A3A_Tasks_cityBattle_timeout", _marker];
        [_this get "_taskId", [_taskDesc, _this get "_hintTitle", ""]] call BIS_fnc_taskSetDescription;
        _this set ["state", "s_defeat"]; false;
    };

    // Battle start conditions: QRF took casualties or player used the action on the leader
    if ({_x call A3A_fnc_canFight} count _troops < count _troops or !(_leader isNil "A3A_cityBattleTrigger")) exitWith
    {
         // Set timers
        _this set ["_endTime", time + 1200];        // 20 minutes maximum to take the city
        _this set ["_minLossTime", time + 300];     // 5 minutes minimum before checking for loss condition

        // Set mission description to current state
        private _nameDest = [_marker] call A3A_fnc_localizar;
        private _displayTime = [20] call FUNC(minutesFromNow);
        private _taskDesc = format [localize "STR_A3A_Tasks_cityBattle_description2", _nameDest, _displayTime];
        [_this get "_taskId", [_taskDesc, _this get "_hintTitle", ""]] call BIS_fnc_taskSetDescription;
        [_this get "_taskId", _marker] call BIS_fnc_taskSetDestination;         // reposition to city marker

        // Notify nearby rebels that battle has started
        private _startHint = format [localize "STR_A3A_Tasks_cityBattle_started", _nameDest];
    	[_this get "_hintTitle", _startHint, _pos, 1000] call FUNC(hintNear);

       // Spawn rebels
        call (_this get "_fnc_spawnRebels");

        // Give enemy groups an extra S&D waypoint in case they expired
        private _armedGroups = _this get "_vehicles" select { !isNull gunner _x } apply { group gunner _x };
        _armedGroups append (_this get "_cargoGroups");
        {
            private _wp = _x addWaypoint [_pos, 0];
            _wp setWaypointType "SAD";
        } forEach _armedGroups;

        // Switch to long interval here
        _this set ["interval", 5];
        _this set ["state", "s_battleStarted"]; false;
    };

    // Perf saving condition: If all troops reached the city but it's not spawned then disable sim
    if (spawner getVariable _marker != 0 and {count (_troops inAreaArray [_pos, 500, 500]) == count _troops}) exitWith {
        { _x enableSimulationGlobal false; _x hideObjectGlobal true } forEach (_this get "_vehicles" select { _x isKindOf "Land" });
        { _x enableSimulationGlobal false; _x hideObjectGlobal true } forEach _troops;
        _this set ["state", "s_troopsPaused"]; false;
    };
    false;
}];

_task set ["s_troopsPaused",
{    
    private _marker = _this get "_marker";

	if (time > _this get "_endTime") exitWith {
        private _taskDesc = format [localize "STR_A3A_Tasks_cityBattle_timeout", _marker];
        [_this get "_taskId", [_taskDesc, _this get "_hintTitle", ""]] call BIS_fnc_taskSetDescription;
        _this set ["state", "s_defeat"]; false;
    };

    if (spawner getVariable _marker == 0) exitWith {
        { _x enableSimulationGlobal true; _x hideObjectGlobal false } forEach (_this get "_vehicles" select { _x isKindOf "Land" });
        { _x enableSimulationGlobal true; _x hideObjectGlobal false } forEach (_this get "_troops");
        _this set ["state", "s_waitForStart"]; false;
    };
    false;
}];

_task set ["s_battleStarted",
{
    private _marker = _this get "_marker";
    private _troops = _this get "_troops";
    private _civilians = _this get "_civilians";

    if (time > _this get "_endTime" or {_x call A3A_fnc_canFight} count _troops < count _troops / 3) exitWith {
        private _taskDesc = format [localize "STR_A3A_Tasks_cityBattle_victoryDesc", _marker];
        [_this get "_taskId", [_taskDesc, _this get "_hintTitle", ""]] call BIS_fnc_taskSetDescription;
        _this set ["state", "s_victory"]; false;
    };

    if (time > _this get "_minLossTime" and {{alive _x} count _civilians < count _civilians / 4}) exitWith {
        private _taskDesc = format [localize "STR_A3A_Tasks_cityBattle_defeatDesc", _marker];
        [_this get "_taskId", [_taskDesc, _this get "_hintTitle", ""]] call BIS_fnc_taskSetDescription;
        _this set ["state", "s_defeat"]; false;
    };
    false;
}];

// Then just success/failure cleanup logic

_task set ["s_victory",
{
    // flip the town
    private _marker = _this get "_marker";
    [_marker, true, 80] remoteExecCall ["A3A_fnc_citySideChange", 2];

    // TODO: scale with city size
	private _playersInRange = (allPlayers - entities "HeadlessClient_F") inAreaArray [markerPos _marker, 500, 500];
	{[10, _x] call A3A_fnc_playerScoreAdd} forEach _playersInRange;
	[10, theBoss] call A3A_fnc_playerScoreAdd;

	[_this get "_taskId", "SUCCEEDED"] call BIS_fnc_taskSetState;
    _this set ["state", "s_cleanup"]; false;
}];

_task set ["s_defeat",
{
    // Reduce city supply by a chunk (unscaled)
    private _marker = _this get "_marker";
    [-50, _marker, false] remoteExecCall ["A3A_fnc_citySupportChange", 2];

	[-10, theBoss] call A3A_fnc_playerScoreAdd;

	[_this get "_taskId", "FAILED"] call BIS_fnc_taskSetState;
    _this set ["state", "s_cleanup"]; false;
}];

_task set ["s_cleanup",
{
    // Order remaining aggressor units back to base, hand them to the group despawner
    { [_x] spawn A3A_fnc_VEHDespawner } forEach (_this get "_vehicles");
    { [_x] spawn A3A_fnc_enemyReturnToBase } forEach ((_this get "_crewGroups") + (_this get "_cargoGroups"));

    // When the city marker is despawned, get rid of the civilians
    [_this get "_marker", _this get "_civilians", _this get "_civGroups"] spawn {
        params ["_marker", "_civilians", "_civGroups"];
        waitUntil {sleep 5; (spawner getVariable _marker != 0)};
        {deleteVehicle _x} forEach _civilians;
        {deleteGroup _x} forEach _civGroups;
    };

    // Remove from active city battles (added on call)
    A3A_activeCityBattles deleteAt (_this get "_marker");

	(_this get "_taskId") spawn {
		sleep 1200;
		[_this, true, true] call BIS_fnc_deleteTask;
	};
	true;		// delete the damned task
}];

_task;
