/*  Sets up a carpet bombing support

Environment: Server, scheduled, internal

Arguments:
    <STRING> The (unique) name of the support, mostly for logging
    <SIDE> The side from which the support should be sent (occupants or invaders)
    <STRING> Resource pool used for this support. Should be "attack" or "defence"
    <SCALAR> Maximum resources to spend. Not used here
    <OBJECT|BOOL> Target of the support. False for none
    <POSITION> Target position for airstrike
    <SCALAR> Reveal value 0-1, higher values mean more information provided about support
    <SCALAR> Setup delay time in seconds, if negative will calculate based on war tier

Returns:
    <SCALAR> Resource cost of support call, or -1 for failure
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_supportName", "_side", "_resPool", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];

private _airport = [_side, _targPos] call A3A_fnc_availableBasesAir;
if(isNil "_airport") exitWith { Debug_1("No airport found for %1 support", _supportName); -1; };

private _dir = (_targPos getDir markerPos _airport) + random 10;
private _offset = 25 + (random 20);
private _planeType = selectRandom (Faction(_side) get "vehiclesPlanesCAS");
private _aggroValue = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
if (_delay < 0) then { _delay = (0.5 + random 1) * (350 - 15*tierWar - 1*_aggroValue) };

// ["_side", "_basetype", "_target", "_endtime", "_duration", "_power"]
A3A_supportStrikes pushBack [_side, "AREA", _targPos, time + 1200, 1200, 300];

[_supportName, _side, _delay, _targPos getPos [_offset + random 2, _dir+90], _airport, _resPool, _planeType, "CARPET", 0] spawn A3A_fnc_SUP_airstrikeRoutine;
[_supportName, _side, _delay +1, _targPos, _airport, _resPool, _planeType, "CARPET", 0] spawn A3A_fnc_SUP_airstrikeRoutine;
[_supportName, _side, _delay +2, _targPos getPos [_offset + random 2, _dir-90], _airport, _resPool, _planeType, "CARPET", 0] spawn A3A_fnc_SUP_airstrikeRoutine;

[_reveal, _side, "CARPETBOMBS", _targPos, _delay] spawn A3A_fnc_showInterceptedSetupCall;
[_reveal, _targPos, _side, "CarpetBombs", 200, 120] spawn A3A_fnc_showInterceptedSupportCall;

// Return resource cost of support
200;
