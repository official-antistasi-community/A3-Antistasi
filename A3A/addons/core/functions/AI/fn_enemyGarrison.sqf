/*  
    Garrison enemy group at marker and patrol or despawn

Scope: Server or HC
Environment: Scheduled, should be spawned

Parameters:
    <GROUP> Group to order
    <STRING> Nearby friendly marker to garrison
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group", "_marker"];

if (!local _group) exitWith {
    Error("Called with non-local group");
    _this remoteExec ["A3A_fnc_enemyGarrison", leader _group];
};
if (sidesX getVariable _marker != side _group) exitWith {
    Error("Target marker changed side, switching to RTB");
    [_group] spawn A3A_fnc_enemyReturnToBase;
};
if (leader _group distance2d markerPos _marker > 500) then {
    ServerInfo_1("Warning: Garrisoning group %1m from marker", leader _group distance2d markerPos _marker);
};

// Remove from other AI script
private _AIScriptHandle = _group getVariable "A3A_AIScriptHandle";
if (!isNil "_AIScriptHandle") then { terminate _AIScriptHandle; _group setVariable ["A3A_AIScriptHandle", nil]; };

// Remove from despawner. Probably shouldn't be in there?
private _despawnerHandle = _group getVariable "A3A_despawnerHandle";
if (!isNil "_despawnerHandle") then { terminate _despawnerHandle; _group setVariable ["A3A_despawnerHandle", nil]; };

ServerDebug_2("Adding group %1 to garrison at %2", _group, _marker);

// Add units to the garrison. Should handle everything else
[_marker, _group] remoteExecCall ["A3A_fnc_garrisonServer_addGroup", 2];


// Pay resource cost now if units were from the legacy/ambient pool
// Probably shouldn't happen, but whatever
/*
if (leader _group getVariable ["A3A_resPool", "legacy"] == "legacy") then {
    [count units _group * -10, side _group, "legacy"] remoteExec ["A3A_fnc_addEnemyResources", 2];
};

// Mark units as garrison
{
    _x setVariable ["A3A_resPool", "garrison", true];
    _x setVariable ["markerX", _marker, true];
    _x setVariable ["spawner", nil, true];
} forEach units _group;
*/

// Shitty but functional patrol routine
/*
[_group, _marker] spawn {
    params ["_group", "_marker"];

    _group setVariable ["A3A_AIScriptHandle", _thisScript];

    private _mrkSize = (markerSize _marker # 0 + markerSize _marker # 1) / 2;
    private _wp = _group addWaypoint [markerPos _marker, 0];
    _wp setWaypointCompletionRadius 20;
    _group setCurrentWaypoint _wp;

    while {!isNull leader _group} do {
        if (unitReady leader _group) then {
            _wp setWaypointPosition [markerPos _marker, _mrkSize];
            _group setCurrentWaypoint _wp;
        };
        sleep 30;
    };
};
*/

/*
// Delete these troops when the garrison despawns
[_group, _marker] spawn {
    params ["_group", "_marker"];
    _group deleteGroupWhenEmpty true; 
    _group setVariable ["A3A_despawnerHandle", _thisScript];
    while {spawner getVariable _marker != 2} do { sleep 10 };
    { deleteVehicle _x } forEach units _group;
};
*/