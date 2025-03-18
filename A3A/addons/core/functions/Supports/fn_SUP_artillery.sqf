/*  Sets up an artillery support

Environment: Server, scheduled, internal

Arguments:
    <STRING> The (unique) name of the support, mostly for logging
    <SIDE> The side from which the support should be sent
    <STRING> Resource pool used for this support. Should be "attack" or "defence"
    <SCALAR> Maximum resources to spend. Not used here.
    <OBJECT|BOOL> Target of the support, or objNull for position strike. "false" creates with no initial target
    <POS2D> Target position for initial artillery strike
    <SCALAR> 0-1, higher values more information provided about support
    <SCALAR> Setup delay time in seconds, if negative will calculate based on war tier

Returns:
    <SCALAR> Resource cost of support call, -1 for failed
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_supportName", "_side", "_resPool", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];

private _faction = Faction(_side);
private _vehType = selectRandom (_faction get "vehiclesArtillery");
private _shellType = ((_faction get "magazines") get _vehType)#0;
([_vehType, _shellType] call A3A_fnc_getArtilleryRanges) params ["_minRange", "_maxRange"];

Info_6("Artillery support %1 against %2 will be carried out by a %3 with %4 mags, min range %5 max %6", _supportName, _targPos, _vehType, _shellType, _minRange, _maxRange);

private _possibleBases = airportsX select
{
    (sidesX getVariable [_x, sideUnknown] == _side) &&
    {(markerPos _x distance2D _targPos <= _maxRange) &&
    {(markerPos _X distance2D _targPos > _minRange) &&
    {spawner getVariable _x == 2}}}
};
if(count _possibleBases == 0) exitWith { Debug("Couldn't find a suitable base for artillery"); -1 };
private _base = selectRandom _possibleBases;

// Spawn in artillery
private _vehicle = [_vehType, markerPos _base, 50, 5, true] call A3A_fnc_safeVehicleSpawn;
_vehicle setVariable ["shellType", _shellType];
[_vehicle, _side, _resPool] call A3A_fnc_AIVehInit;

// Spawn in crew
private _group = [_side, _vehicle] call A3A_fnc_createVehicleCrew;
{ [_x, nil, false, _resPool] call A3A_fnc_NATOinit } forEach units _group;
_group deleteGroupWhenEmpty true;

private _aggro = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
if (_delay < 0) then { _delay = (0.5 + random 1) * (300 - 15*tierWar - 1*_aggro) };

private _targArray = [];
if (_target isEqualType objNull) then {
    A3A_supportStrikes pushBack [_side, "AREA", _targPos, time + 20*60, 20*60, 200];
    _targArray = [_target, _targPos];
};

// name, side, suppType, pos, radius, remTargets, targets
private _suppData = [_supportName, _side, "ARTILLERY", markerPos _base, _maxRange, _targArray, _minRange];
A3A_activeSupports pushBack _suppData;
[_suppData, _vehicle, _group, _delay, _reveal, true] spawn A3A_fnc_SUP_mortarRoutine;

[_reveal, _side, "ARTILLERY", _targPos, _delay] spawn A3A_fnc_showInterceptedSetupCall;

// Vehicle cost + extra support cost for balance
(A3A_vehicleResourceCosts get _vehType) + (10 * count units _group) + 200;
