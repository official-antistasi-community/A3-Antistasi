/*
    Evacuate a rebel infantry group towards the nearest rebel marker
    Despawn with partial refund after two minutes
    Assumes that spawner and markerX vars are already cleared, and units are on foot

    Parameters:
    1. <GROUP> Group to order
    2. <BOOL> True if retreating from an HQ that was lost or moved under fire

    Environment: Any
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group", "_wasHQ"];

// should probably put all the leftovers into one group... but it's a pain so nope

// Calling functions aren't too picky about lists of groups
if (isNull _group) exitWith {};
if (units _group isEqualTo []) exitWith { deleteGroup _group };

// Remove any other AI scripts (eg. attackDrillAI, patcom)
private _AIScriptHandle = _group getVariable "A3A_AIScriptHandle";
if (!isNil "_AIScriptHandle") then { terminate _AIScriptHandle; };   // _group setVariable ["A3A_AIScriptHandle", nil] };

// Remove any current waypoints
{ deleteWaypoint _x } forEachReversed (waypoints _group);


// Retreat towards nearest friendly location
private _potentials = outposts + airportsX + resourcesX + factories + seaports;
_potentials = _potentials select { sidesX getVariable [_x, sideUnknown] == side _group };
if (!_wasHQ) then { _potentials pushBack "Synd_HQ" };

private _retreatPos = if (_potentials isEqualTo []) then {
    // If we're running from HQ and there are no other markers, just run in random direction
    getPosATL leader _group getPos [1000, random 360]
} else {
    markerPos ([_potentials, leader _group] call BIS_fnc_nearestPosition);
};

{
    _x disableAI "AUTOCOMBAT";
    _x disableAI "TARGET";
    _x setUnitPos "UP";
    _x doFollow leader _group;
} forEach units _group;

_group setBehaviourStrong "AWARE";
private _wp = _group addWaypoint [_retreatPos, 50];
_group setCurrentWaypoint _wp;
ServerDebug_1("Group %1 escaping to rebel territory", _group);


[_group] spawn {
    params ["_group"];

    sleep 120;          // give them a couple of minutes to run

    // Some slightly generous refunding. Probably shouldn't bother
    private _refundHR = 0;
    private _refundCash = 0;
    {
        if (!alive _x) then { continue };
        if (_x getVariable ["incapacitated", false]) then { _x setDamage 1; continue };

        _refundHR = _refundHR + 1;
        _refundCash = _refundCash + 0.5 * (server getVariable [_x getVariable "unitType", 0]);
        deleteVehicle _x;

    } forEach units _group;

    deleteGroup _group;
    [_refundHR, _refundCash] remoteExec ["A3A_fnc_resourcesFIA", 2];
};
