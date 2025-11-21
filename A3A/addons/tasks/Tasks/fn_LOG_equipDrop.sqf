#include "..\script_component.hpp"
FIX_LINE_NUMBERS()


private _fnc_createTask = {
    private _side = (_this get "_side");
    private _faction = Faction(_side);
    private _nameSide = _faction get "name";
	private _displayTime = [(_this get "_pickupTime") - time] call FUNC(minutesFromNow);

	private _taskName = "Equipment Drop";
	private _taskDesc = format ["%1 logistics forces are running a resupply paradrop for the special forces units on the frontline. If we're able to intercept the drop, it could garner us some valuable resources. We've seen standard units in position to secure the drop. Get to the drop zone, kill the escort, and get the supply drop before the %1 SF show up. The drop is expected to come over at around %2.", _nameSide, _displayTime];
    private _dropPos = (_this get "_dropPos");
	private _taskPos = [_dropPos, random 250 + 20, random 360] call BIS_fnc_relPos;
	private _taskId = call FUNC(genTaskUID);
	[true, _taskId, [_taskDesc,_taskName], _taskPos, false, -1, true, "Airdrop", true] call BIS_fnc_taskCreate;
	_this set ["_taskId", _taskId];
};


params ["_params", "_checkpoint"];

private _task = createHashMap;

_params params ["_dropPos", "_side"];
diag_log format ["params %1", _params];
if (_side isEqualTo teamPlayer) then {_side = Occupants};

// Determine end time and description
private _difficulty = [1, 2] select (random 10 < tierWar);

_task set ["_side", _side];
_task set ["_dropPos", _dropPos];
_task set ["_difficulty", _difficulty];
_task set ["_pickupTime", time + 60 * (6 + random 6)];
_task set ["_endTime", time + 60 * 60];
diag_log (_task get "_dropPos");
_task call _fnc_createTask;

_task set ["state", "s_waitForPlaneSpawn"];
_task set ["interval", 1];

_task set ["_hintTitle", "Equipment Drop"];
private _faction = Faction(_side);
private _vehPool = _faction get "vehiclesLightArmed";
private _fallback = _faction get "vehiclesLightUnarmed";
if (_vehPool isEqualTo []) then {_vehPool append _fallback};
private _vehClass = if !(_vehPool isEqualTo []) then {
    _vehPool#0; // TODO: replace with vehiclesAirborneLight
} else { "" };
_task set ["_vehClass", _vehClass];
_task set ["_crateClass", _faction get "ammobox"];

//spawning guard inf
_guard = [[_dropPos,50,random 360] call BIS_fnc_relPos, _side, selectRandom (_faction get "groupsSquads")] call A3A_fnc_spawnGroup;
{[_x] call A3A_fnc_NATOinit} forEach units _guard;
_task set ["_guard",_guard];
// spawning sf
_sf = [[_dropPos,300,random 360] call BIS_fnc_relPos, _side, _faction get "groupSpecOps"] call A3A_fnc_spawnGroup;
{[_x] call A3A_fnc_NATOinit} forEach units _sf;
_task set ["_sf", _sf];
_task set ["_holdUntilPlayers", random 1 < 0.5];

/////////////////////
// State functions //
/////////////////////

_task set ["s_waitForPlaneSpawn",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };

	if (_this get "_pickupTime" > time) exitWith {false};

	// Condition fulfilled, run any extra code
	_this set ["state", "s_waitForDrop"];

    _plane = [_this get "_dropPos", _this get "_side"] call A3A_fnc_createAirdropPlane;
    _this set ["_plane", _plane];

	false;
}];

_task set ["s_waitForDrop",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };
    private _plane = _this get "_plane";
    if ((!alive _plane) || (!canMove _plane)) exitWith { _this set ["state", "s_failed"]; false };
    if (currentWaypoint (group driver _plane) isEqualTo 0) exitWith {false};
    _this set ["state", "s_waitForLanding"];
    _this spawn {
        _plane = _this get "_plane";
        _vehClass = _this get "_vehClass";
        _crateType = _this get "_crateClass";
        {
            private _lastDroppedPos = getPosATL _plane;
    
           [_plane,_x#0,_x#1, _x#2, _this] spawn {
                private _fnc_cleanup = {
                    deleteVehicle ((_obj) getVariable ["A3A_smoke", objNull]);
                };
                params ["_plane","_class","_varName", "_type", "_hm"];
                _obj = [_plane, _class] call A3A_fnc_airdropCargo;
                _hm set [_varName, _obj];
                
                _obj addEventHandler ["Deleted", _fnc_cleanup];
                switch (_type) do {
                    case ("veh"): {
                        _obj addEventHandler ["GetIn", _fnc_cleanup];
                    };
                    case ("crate"): {
                        _obj addEventHandler ["Attached", _fnc_cleanup];
                        [_obj, load _obj, _fnc_cleanup] spawn {
                            params ["_crate", "_initLoad", "_fnc_cleanup"];
                            while {!isNull _crate} do {
                                sleep 10;
                                if (load _crate != _initLoad) then {
                                    [_crate] call _fnc_cleanup;
                                };
                            };
                        };
                    };
                };
           };
           waitUntil {sleep 0.1; (_plane distance _lastDroppedPos) > 50};
        } forEach [[_vehClass,"_droppedVeh", "veh"],[_crateType,"_droppedCrate1", "crate"],[_crateType,"_droppedCrate2", "crate"]];
    };

	false;
}];

_task set ["s_waitForLanding",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };
    _veh = _this get "_droppedVeh";
    _crate1 = _this get "_droppedCrate1";
    _crate2 = _this get "_droppedCrate2";
    if !(getPosATL _crate2#2 < 1 && {getPosATL _crate1#2 < 1 && {getPosATL _veh#2 < 1}}) exitWith {false};

	// Condition fulfilled, run any extra code
	_this set ["state", "s_waitForPlayers"];
    private _guard = _this get "_guard";
    _guardWP = [_guard, getPosATL _crate1, 50] call BIS_fnc_taskPatrol;
    if !(_this get "_holdForPlayers") then {
        (_this get "_sf") move getPosATL _crate2;
    };

	false;
}];

_task set ["s_waitForPlayers",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };
    _veh = _this get "_droppedVeh";
    _crate1 = _this get "_droppedCrate1";
    _crate2 = _this get "_droppedCrate2";
    if ((allPlayers inAreaArray [_crate1, 200, 200]) isEqualTo []) exitWith {false};

	// Condition fulfilled, run any extra code
	_this set ["state", "s_sfBreakAway"];
    _this set ["_sfCount", count units (_this get "_sf")];
    if (_this get "_holdForPlayers") then {
        (_this get "_sf") move getPosATL _crate2;
    };

	false;
}];

_task set ["s_sfBreakAway",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };
    _veh = _this get "_droppedVeh";
    _crate1 = _this get "_droppedCrate1";
    _crate2 = _this get "_droppedCrate2";
    if ((count units (_this get "_sf")) <= ((_this get "_sfCount")/2)) exitWith {false}; // wait until SF squad is half wiped to disengage
    // Condition fulfilled, run any extra code
	_this set ["state", "s_waitForTaskEnd"];
    private _sfSquad = _this get "_sf";
    // possible the entire squad gets wiped with a mortar or whatever, so gotta be safe here
    if (count ((units _sf) select {_x call A3A_fnc_canFight}) > 0) then {
        private _rtbBase = [airportsX + outposts] call {
            params ["_potentials"];
            _potentials = _potentials select { (spawner getVariable _x == 2) and (sidesX getVariable [_x, sideUnknown] == side _sf) };
            if (count _potentials == 0) exitWith {nil};
            [_potentials, leader _sf] call BIS_fnc_nearestPosition;
        };
        _rtbWP = _sf addWaypoint [getMarkerPos _rtbBase, -1];
        _rtbWP setWaypointType "MOVE";
        if (alive _veh && {canMove _veh}) then {
            private _vehWP = _sf addWaypoint [getPosATL _veh, -1, 0];
            _vehWP waypointAttachVehicle _veh;
            _vehWP setWaypointType "GETIN";
        };
    };
    private _allNearbyPlayers = allPlayers inAreaArray [_crate1, 200, 200];
    if (_allNearbyPlayers isEqualTo []) exitWith {false};
    private _allNearbyEnemies = (units (_this get "_guard") + units (_this get "_sf")) select {_x call A3A_fnc_canFight};
    if (_allNearbyEnemies isEqualTo []) exitWith {false};
    private _maxSpend = [_this get "_side", leader (_allNearbyPlayers#0), leader (_allNearbyEnemies#0)] call A3A_fnc_maxDefenceSpend;
    Debug_1("Resource max spend %1", _maxSpend);
    ["QRFAIR", _this get "_side", leader (_allNearbyEnemies#0), _maxSpend, objNull, getPosATL _crate1, 1, -1] spawn A3A_fnc_createSupport;
	false;
}];

_task set ["s_waitForTaskEnd",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };
    _veh = _this get "_droppedVeh";
    _crate1 = _this get "_droppedCrate1";
    _crate2 = _this get "_droppedCrate2";
    if (([_veh,_crate1,_crate2] select {alive _x}) isEqualTo []) exitWith { _this set ["state", "s_failed"]; false };
    if (count (([_veh,_crate1,_crate2] inAreaArray [getMarkerPos "Synd_HQ",75,75]) select {alive _x}) > 0) exitWith {  _this set ["state", "s_succeeded"]; false };

	false;
}];

_task set ["s_succeeded", {
	private _bonus = _this get "_difficulty";
	private _marker = _this get "_marker";

	private _playersInRange = (allPlayers - (entities "HeadlessClient_F")) inAreaArray [markerPos _marker, 250, 250];
	{[10*_bonus * tierWar, _x] call A3A_fnc_playerScoreAdd} forEach _playersInRange;
	[5*_bonus * tierWar, theBoss] call A3A_fnc_playerScoreAdd;

	[-15 * _bonus, 15 * _bonus, _marker] remoteExec ["A3A_fnc_citySupportChange", 2];
	[0, 200 * _bonus * tierWar] remoteExec ["A3A_fnc_resourcesFIA", 2];

	[_this get "_taskId", "SUCCEEDED"] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
}];
_task set ["s_failed", {
	[5, -5, _this get "_marker"] remoteExec ["A3A_fnc_citySupportChange", 2];
	[-10, theBoss] call A3A_fnc_playerScoreAdd;

	[_this get "_taskId", "FAILED"] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
}];
_task set ["s_cleanup", {
	// just dismantle anything remaining

	// TODO: task deletion, rate throttling?
	// maybe we should restrict tasks based on request time not completion/failure time?
	// so then throttling moves to the request management

	(_this get "taskId") spawn {
		[_this, true, true] call BIS_fnc_deleteTask;
	};
	true;		// delete the damned task
}];

// Return the task hashmap
_task;
