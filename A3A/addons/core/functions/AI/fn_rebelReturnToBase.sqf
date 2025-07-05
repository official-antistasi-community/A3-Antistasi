/*
    Evacuate a rebel infantry group towards the nearest rebel marker
    Despawn with partial refund after two minutes

    Parameters:
    1. <GROUP> Group to order

    Environment: Any
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group"];

// should probably put all the leftovers into one group... but it's a pain so nope

// Calling functions aren't too picky about lists of groups
if (isNull _group) exitWith {};
if (units _group isEqualTo []) exitWith { deleteGroup _group };

// Remove any other AI scripts (eg. attackDrillAI, patcom)
private _AIScriptHandle = _group getVariable "A3A_AIScriptHandle";
if (!isNil "_AIScriptHandle") then { terminate _AIScriptHandle; };   // _group setVariable ["A3A_AIScriptHandle", nil] };

// Remove any current waypoints
{ deleteWaypoint _x } forEachReversed (waypoints _group);


// Retreat towards nearest friendly location (always exists, because HQ)
private _potentials = outposts + airportsX + resourcesX + factories + seaports;
_potentials = _potentials select { sidesX getVariable [_x, sideUnknown] == side _group };
[_potentials + ["Synd_HQ"], leader _group] call BIS_fnc_nearestPosition;

{
    _x disableAI "AUTOCOMBAT";
    _x disableAI "TARGET";
    _x setUnitPos "UP";
    _x doFollow leader _group;
} forEach units _group;

_group setBehaviourStrong "AWARE";
private _wp = _group addWaypoint [markerPos _marker, 50];
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
        _refundCash = _refundCash + (server getVariable [_x getVariable "unitType", 0] / 2);
        deleteVehicle _x;

    } forEach units _group;

    deleteGroup _group;
    [_refundHR, _refundCash] remoteExec ["A3A_fnc_resourcesFIA", 2];
};
