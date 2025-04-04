/*  Sets up a UAV support

Environment: Server, scheduled, internal

Arguments:
    <STRING> The (unique) name of the support, mostly for logging
    <SIDE> The side from which the support should be sent (occupants or invaders)
    <STRING> Resource pool used for this support. Should be "attack" or "defence"
    <SCALAR> Maximum resources to spend. Not used here.
    <OBJECT> or <BOOL> Target of the support. Not used here.
    <POSITION> Target position for support.
    <SCALAR> Reveal value 0-1, higher values mean more information provided about support
    <SCALAR> Setup delay time in seconds, if negative will calculate based on war tier

Returns:
    <SCALAR> Resource cost of support call, or -1 for failure
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_supportName", "_side", "_resPool", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];

private _airport = [_side, _targPos] call A3A_fnc_availableBasesAir;
if (isNil "_airport") exitWith { Debug_1("No airport found for %1 support", _supportName); -1; };

private _planeType = selectRandom (Faction(_side) get "uavsAttack");

private _aggro = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
if (_delay < 0) then { _delay = (0.5 + random 1) * (300 - 15*tierWar - 1*_aggro) };

// Well, it does actually hit
private _targArray = [];
if (_target isEqualType objNull and {!isNull _target}) then {
    A3A_supportStrikes pushBack [_side, "TARGET", _target, time + 1200, 1200, 200];
    _targArray = [_target, _targPos];
};

// name, side, suppType, center, radius, targets
private _suppData = [_supportName, _side, "UAVAttack", _targPos, 1000, [objNull, _targPos]];
A3A_activeSupports pushBack _suppData;
[_suppData, _resPool, _airport, _planeType, _delay, _reveal] spawn A3A_fnc_SUP_UAVRoutine;

[_reveal, _side, "UAVAttack", _targPos, _delay] spawn A3A_fnc_showInterceptedSetupCall;

(A3A_vehicleResourceCosts get _planeType) + 100;
