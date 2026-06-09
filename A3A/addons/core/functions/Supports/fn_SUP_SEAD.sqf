/*  Sets up a SEAD support to destroy enemy radars

Environment: Server, scheduled, internal

Arguments:
    <STRING> The (unique) name of the support, mostly for logging
    <SIDE> The side from which the support should be sent (occupants or invaders)
    <STRING> Resource pool used for this support. Should be "attack" or "defence"
    <SCALAR> Maximum resources to spend. Not used here
    <OBJECT> Target of the support
    <POSITION> Position of radar
    <SCALAR> Reveal value 0-1, higher values mean more information provided about support
    <SCALAR> Setup delay time in seconds, if negative will calculate based on war tier

Returns:
    <SCALAR> Resource cost of support call, or -1 for failure
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_supportName", "_side", "_resPool", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];

// the target will be whatever fired the missile, we may need to keep that target or switch to the emitting radar vic
private _finalTarget = objNull;
if (!isVehicleRadarOn _target) then { // early exit for AA tanks with their radars on
    private _radarEmitters = (8 allObjects 1) select {isVehicleRadarOn _x && {vehicleReportRemoteTargets _x && (side _x != _side)}};
    if (_radarEmitters isEqualTo []) exitWith {-1};
    private _distanceList = _radarEmitters apply {[_target distance _x, _x]};
    _distanceList sort true;
    _finalTarget = _distanceList#0#1;
};

if (isNull _finalTarget) then {_finalTarget = _target};

_targPos = getPosATL _finalTarget;

private _airports = [_side, _targPos, true] call A3A_fnc_availableBasesAir;
if(isNil "_airports") exitWith { Debug_1("No airport found for %1 support", _supportName); -1; };
private _distanceList = (_airports#0) apply {[(markerPos _x) distance2D _targPos, _x]};
_distanceList sort false;
private _airport = _distanceList#0#1;

private _aggro = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
if (_delay < 0) then { _delay = (0.5 + random 1) * (120 - _aggro + 18*A3A_enemyResponseTime) };

private _planeType = selectRandom (Faction(_side) get "vehiclesPlanesAA");

// ["_side", "_basetype", "_target", "_endtime", "_duration", "_power"]

A3A_supportStrikes pushBack [_side, "TARGET", _finalTarget, time + 1200, 1200, 200];

[_supportName, _side, _delay, _finalTarget, _airport, _resPool, _planeType, _reveal] spawn A3A_fnc_SUP_SEADRoutine;

[_reveal, _side, "SEAD", _targPos, _delay] spawn A3A_fnc_showInterceptedSetupCall;

// Return resource cost of support (planecost + 0)
A3A_vehicleResourceCosts get _planeType;