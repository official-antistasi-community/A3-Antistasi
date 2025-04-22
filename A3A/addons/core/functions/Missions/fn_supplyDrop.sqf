
// Laziest supply drop mission code ever

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_targPos", "_gear"];

// Try to find a position that isn't on water or near houses
private _dropPos = _targPos;
for "_i" from 1 to 10 do {
    private _testPos = _targPos getPos [random 500 + 500, random 360];
    if (surfaceIsWater _testPos) then { continue };
    private _nearHouses = _testPos nearObjects ["House", 50];
    if (_nearHouses isEqualTo []) exitWith { _dropPos = _testPos };
};

// Not a real mission but we should have a task so everyone knows about it
private _taskText = localize "STR_A3A_fn_mission_supplydrop_text";
private _taskTitle = localize "STR_A3A_fn_mission_supplydrop_title";
private _taskIcon = "meet";         // TODO: find a better one

private _taskId = "SupplyDrop" + str floor random 1000;
while { [_taskId] call BIS_fnc_taskExists } do { _taskId = "SupplyDrop" + str floor random 1000 };

[[teamPlayer,civilian],_taskId,[_taskText,_taskTitle,""],_dropPos,false,0,true,_taskIcon,true] call BIS_fnc_taskCreate;

// Spawn transport plane or heli at airfield with usual crew (but no cargo)
private _airport = [Occupants, _dropPos] call A3A_fnc_availableBasesAir;
private _spawnPos = if (isNil "_airport") then { 
    Error("No airport found for supply drop");
    _dropPos getPos [5000, random 360];
} else {
    markerPos _airport;
};

private _planeType = selectRandom (A3A_faction_occ get "vehiclesPlanesTransport");
if (isNil "_planeType") then { _planeType = selectRandom (A3A_faction_occ get "vehiclesHelisTransport") };
private _isHeli = _planeType isKindOf "Helicopter";
private _flightAlt = [1000, 500] select _isHeli;
_spawnPos set [2, _flightAlt];

private _plane = createVehicle [_planeType, _spawnPos, [], 0, "FLY"];     // FLY forces 100m alt
private _targDir = _spawnPos getDir _dropPos;
_plane setDir _targDir;
_plane setPosATL _spawnPos;                                           // setPosATL kills velocity
_plane setVelocityModelSpace [0, [100, 50] select _isHeli, 0];
_plane flyInHeight _flightAlt;
[_plane, Occupants, "legacy"] call A3A_fnc_AIVEHInit;

private _group = [Occupants, _plane] call A3A_fnc_createVehicleCrew;
_group deleteGroupWhenEmpty true;
{
    [_x, nil, false, "legacy"] call A3A_fnc_NATOinit; 
    _x disableAI "TARGET";
    _x disableAI "AUTOTARGET";
    _x setBehaviour "CARELESS";
} forEach units _group;

private _entryPos = _dropPos getPos [-100, _targDir];
private _exitPos = _dropPos getPos [300, _targDir];
{ _x set [2, _flightAlt] } forEach [_entryPos, _exitPos];

{ deleteWaypoint _x } forEachReversed waypoints _group;

private _wp = _group addWaypoint [_entryPos, 0];
_wp setWaypointSpeed "NORMAL";          // Blackfish cannot turn at limited?
private _wp1 = _group addWaypoint [_exitPos, 0];
_wp1 setWaypointSpeed "NORMAL";
private _wp2 = _group addWaypoint [_spawnPos, 0];
_wp2 setWaypointSpeed "FULL";
_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];


waitUntil {sleep 1; (currentWaypoint _group > 0) || (!alive _plane) || (!canMove _plane)};

if (currentWaypoint _group > 0) then
{
    // drop the fucking box
	private _crate = createVehicle [A3A_faction_occ get "ammobox", _plane modelToWorld [0,-10,10], [], 0, "CAN_COLLIDE"];
    _crate setVelocity (velocity _plane vectorMultiply 0.5);
    _crate allowDamage false;

    // Get rid of the task if the box is deleted or loaded into a vehicle
    private _fnc_cleanup = { [(_this#0) getVariable "A3A_taskId", true, true] call BIS_fnc_deleteTask };
    _crate setVariable ["A3A_taskId", _taskId];
    _crate addEventHandler ["Attached", _fnc_cleanup];
    _crate addEventHandler ["Deleted", _fnc_cleanup];

    // add items.
    clearMagazineCargoGlobal _crate;
    clearWeaponCargoGlobal _crate;
    clearItemCargoGlobal _crate;
    clearBackpackCargoGlobal _crate;
    {
        _crate addItemCargoGlobal [_x#0, _x#1];
        sleep 0.01;                 // sleep here in case someone buys 1000 of something.
    } forEach _gear;

    sleep 3;

    // parachute deploy
    private _parachute = createVehicle ["B_Parachute_02_F", getPosATL _crate, [], 0, "CAN_COLLIDE"];
    _crate attachTo [_parachute, [0, 0, 1.5]];

    waitUntil {sleep 1; getPosATL _crate#2 < 1};
    sleep 3;
    detach _parachute;
    deleteVehicle _parachute;
    // Could fire off a smoke at this point? Maybe even infinite?

	// Otherwise when destroyed, ammoboxes sink 100m underground and are never cleared up
	_crate addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];
    _crate allowDamage true;
    _crate enableRopeAttach true;
    [_crate] call A3A_Logistics_fnc_addLoadAction;

} else {
    // Notify that the drop was shot down. Whoops.
    [_taskId, "FAILED", true] call BIS_fnc_taskSetState;
    _taskId spawn { sleep 30; [_this, true, true] call BIS_fnc_deleteTask };
};

// Somewhat lazy plane cleanup
[_group] spawn A3A_fnc_groupDespawner;
[_plane] spawn A3A_fnc_vehDespawner;
