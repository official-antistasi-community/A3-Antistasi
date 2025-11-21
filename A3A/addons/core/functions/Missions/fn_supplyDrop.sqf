/*  "Mission" that uses an occupant plane to airdrop supplies 

Scope: Server or HC
Environment: Spawned

Arguments:
    <POSITION> Attempted drop position
    <ARRAY> Contains [classname, amount] pairs of items to put in crate
    <GROUP> Patrol group to move towards the drop after the chute deploys
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_targPos", "_gear", "_patrolGroup"];

// Not a real mission but we should have a task so everyone knows about it
private _taskText = localize "STR_A3A_fn_mission_supplydrop_text";
private _taskTitle = localize "STR_A3A_fn_mission_supplydrop_title";
private _taskIcon = "container";

private _taskId = "SupplyDrop" + str floor random 1000;
while { [_taskId] call BIS_fnc_taskExists } do { _taskId = "SupplyDrop" + str floor random 1000 };

[[teamPlayer,civilian],_taskId,[_taskText,_taskTitle,""],_targPos,false,0,true,_taskIcon,true] call BIS_fnc_taskCreate;

private _plane = [_targPos] call A3A_fnc_createAirdropPlane;
_group = group _plane;

waitUntil {sleep 1; (currentWaypoint _group > 0) || (!alive _plane) || (!canMove _plane)};

if (currentWaypoint _group > 0) then
{
    _crate = [_plane, A3A_faction_occ get "ammobox", _gear] call A3A_fnc_airdropCargo;
    sleep 3;
    // Now the patrol can see the parachute, send them in the right direction
    [_patrolGroup, "Patrol_Area", 0, 200, 200, true, _targPos] call A3A_fnc_patrolLoop;

    // Now wait for the crate to hit the ground

    // Get rid of the task and smoke if the box is deleted or loaded into a vehicle
    private _fnc_cleanup = {
        [(_this#0) getVariable "A3A_taskId", true, true] call BIS_fnc_deleteTask;
        deleteVehicle ((_this#0) getVariable "A3A_smoke");
    };
    _crate setVariable ["A3A_taskId", _taskId];
    _crate addEventHandler ["Attached", _fnc_cleanup];
    _crate addEventHandler ["Deleted", _fnc_cleanup];

    // Get rid of the task and smoke if items are removed from the box
    [_crate, load _crate, _fnc_cleanup] spawn {
        params ["_crate", "_initLoad", "_fnc_cleanup"];
        while {!isNull _crate} do {
            sleep 10;
            if (load _crate != _initLoad) then {
                [_crate] call _fnc_cleanup;
                break;
            };
        };
    };

	// Otherwise when destroyed, ammoboxes sink 100m underground and are never cleared up
	_crate addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];
    _crate allowDamage true;
    _crate enableRopeAttach true;
    [_crate] call A3A_Logistics_fnc_addLoadAction;

    // Adjust patrol for landing position. Patrol heads home once the crate is gone
    [_patrolGroup, "Patrol_Area", 0, 100, 100, true, getPosATL _crate] call A3A_fnc_patrolLoop;
    [_patrolGroup, _crate] spawn {
        params ["_patrolGroup", "_crate"];
        private _initPos = getPosATL _crate;
        waitUntil {sleep 30; _crate distance2d _initPos > 300};
       	[_patrolGroup] spawn A3A_fnc_enemyReturnToBase;
    };

} else {
    // Notify that the drop was shot down. Whoops.
    [_taskId, "FAILED", true] call BIS_fnc_taskSetState;
    _taskId spawn { sleep 30; [_this, true, true] call BIS_fnc_deleteTask };
	[_patrolGroup] spawn A3A_fnc_enemyReturnToBase;
};

// Somewhat lazy plane cleanup
[_group] spawn A3A_fnc_groupDespawner;
[_plane] spawn A3A_fnc_vehDespawner;
