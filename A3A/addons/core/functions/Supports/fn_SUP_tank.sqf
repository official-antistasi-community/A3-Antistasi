/*  Sets up a land QRF support

Environment: Server, scheduled, internal

Arguments:
    <STRING> The (unique) name of the support, mostly for logging
    <SIDE> The side from which the support should be sent (occupants or invaders)
    <STRING> Resource pool used for this support. Should be "attack" or "defence"
    <SCALAR> Maximum resources to spend on this support. Must be greater than zero
    <OBJECT|BOOL> Initial target, or "false" for none.
    <POSITION> Estimated position of target, or center of target zone
    <SCALAR> Reveal value 0-1, higher values mean more information provided about support
    <SCALAR> Setup delay time in seconds, if negative will calculate based on war tier

Returns:
    <SCALAR> Resource cost of support call, or -1 for failure
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_suppName", "_side", "_resPool", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];

private _base = [_side, _targPos] call A3A_fnc_availableBasesLand;
if (isNil "_base") exitWith { Info("Tanks cancelled because no land bases available"); -1 };

// Prevent ground QRFs spawning on top of each other. Should be gone after a minute.
[_base, 1] call A3A_fnc_addTimeForIdle;

private _vehCount = 2 min ceil (_maxSpend / 200);
private _estResources = _vehCount * 200;

// Land QRF delay is purely dependent on travel as they're slow enough already
if (_delay < 0) then { _delay = 0 };            // land QRFs slow enough already

private _targArray = [];
if (_target isEqualType objNull and {!isNull _target}) then {
    // Should probably put a partial "troops" entry in here too?
    A3A_supportStrikes pushBack [_side, "TARGET", _target, time + 1800, 1800, 150*_vehCount];
    _targArray = [_target, _targPos];
};

// name, side, suppType, center, radius, [target, targpos]
private _suppData = [_supportName, _side, "TANK", _targPos, 1000, _targArray];
A3A_activeSupports pushBack _suppData;
[_suppData, _resPool, _base, _vehCount, _delay, _estResources] spawn A3A_fnc_SUP_tankRoutine;

private _approxTime = _delay + (markerPos _base distance2D _targPos) / (30 / 3.6);      // (badly) estimated travel time
[_reveal, _side, "TANK", _targPos, _approxTime] spawn A3A_fnc_showInterceptedSetupCall;

_estResources;            // *estimated* resource cost of vehicles
