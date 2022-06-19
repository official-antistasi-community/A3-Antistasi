/*

Parameters:
    <GROUP> Group to order
    <STRING> Nearby friendly marker to garrison

Environment: Any
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

// Remove from despawner
private _despawnerHandle = _group getVariable "A3A_despawnerHandle";
if (!isNil "_despawnerHandle") then { terminate _despawnerHandle; _group setVariable ["A3A_despawnerHandle", nil]; };

// Add units to the garrison list
private _unitTypes = units _group apply { _x getVariable "unitType" };
[_unitTypes, side _group, _marker, 0] remoteExec ["A3A_fnc_garrisonUpdate", 2];

// Pay resource cost now if units were from the legacy/ambient pool
// Probably shouldn't happen, but whatever
if (leader _group getVariable ["A3A_resPool", "legacy"] == "legacy") then {
    [count units _group * -10, side _group, "legacy"] remoteExec ["A3A_fnc_addEnemyResources", 2];
};

// Mark units as garrison
{
    _x setVariable ["A3A_resPool", "garrison", true];
    _x setVariable ["markerX", _marker, true];
    _x setVariable ["spawner", nil, true];
} forEach units _group;

// Fire off UPSMON patrol, "ORIGINAL" shouldn't change position
[leader _group, _marker, "AWARE", "SPAWNED", "ORIGINAL", "NOVEH2", "NOFOLLOW"] execVM QPATHTOFOLDER(scripts\UPSMON.sqf);


// Delete these troops when the garrison despawns
[_group, _marker] spawn {
    params ["_group", "_marker"];
    _group setVariable ["A3A_despawnerHandle", _thisScript];
    while {spawner getVariable _marker != 2} do { sleep 10 };
    { deleteVehicle _x } forEach units _group;
    deleteGroup _group;
};