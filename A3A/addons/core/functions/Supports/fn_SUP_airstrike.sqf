/*  Sets up an airstrike support

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

private _aggroValue = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
private _weightHE = if (_side == Occupants) then {2} else {1};             // occupants less likely to use the wide-area stuff
private _weightCluster = 0 max ((tierWar - 5) / 10 + _aggroValue / 200);           // 1 at max warlevel and aggro
private _weightNapalm = if (napalmEnabled) then {_weightCluster} else {0};
private _bombType = selectRandomWeighted ["HE", _weightHE, "CLUSTER", _weightCluster, "NAPALM", _weightNapalm];

private _planeType = selectRandom (Faction(_side) get "vehiclesPlanesCAS");
if (_delay < 0) then { _delay = (0.5 + random 1) * (240 - 10*tierWar - 1*_aggroValue) };

Debug_3("Airstrike will be carried out with aircraft type %1, bombType %2 and setup time %3", _planeType, _bombType, _delay);

// ["_side", "_basetype", "_target", "_endtime", "_duration", "_power"]
A3A_supportStrikes pushBack [_side, "AREA", _targPos, time + 1200, 1200, 200];

[_supportName, _side, _delay, _targPos, _airport, _resPool, _planeType, _bombType, _reveal] spawn A3A_fnc_SUP_airstrikeRoutine;

[_reveal, _side, "AIRSTRIKE", _targPos, _delay] spawn A3A_fnc_showInterceptedSetupCall;

// Return resource cost of support (planecost + 0)
A3A_vehicleResourceCosts get _planeType;
