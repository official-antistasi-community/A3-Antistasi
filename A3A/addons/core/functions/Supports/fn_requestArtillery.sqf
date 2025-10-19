/*
Maintainer: John Jordan
    Chooses and creates an area-effect support to attack a target position

Scope: Server
Environment: Scheduled

Arguments:
    <SIDE> Side (occupants or invaders) which should send the support.
    <POS2D> or <OBJECT> Target position or object to be attacked.
    <STRING> Resource pool to be used for the support (probably "attack").
    <NUMBER> Precision of support, should be based on knowledge of target (0 min, 4 max).
    <NUMBER> How much information to reveal about support, 0 low 1 high.
    <NUMBER> Optional, minimum delay in seconds before setup (Default: Calculated based on tier/aggro).

Examples:
    [Occupants, getposATL _rebelUnit, "attack", 1, 0, 300] remoteExec ["A3A_fnc_requestArtillery", 2];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side", "_target", "_resPool", "_precision", "_reveal", "_delay"];        // might not be a unit, so we can't just use caller

waitUntil { isNil "A3A_supportCallInProgress" };
A3A_supportCallInProgress = true;

Info_3("Requested artillery against %1 from %2 pool by side %3", _target, _resPool, _side);

// Sort out target info
private _deprecisionRange = random (150 - ((_precision/4) * (_precision/4) * 125));
private _targPos = _target getPos [_deprecisionRange, random 360];

if (_target isEqualType objNull) then {
    // Find the first parent object. If we're using a static attached to a vehicle then the static is more important.
    if (_target isKindOf "Man" and !(isNull objectParent _target)) then { _target = objectParent _target };
} else {
    _target = objNull;
};
Debug_2("Final target %1 at position %2", _target, _targPos);


// Build hashmap of active supports with spare targets capable of hitting the area
private _actSuppHM = createHashMap;
{
    _x params ["_suppName", "_suppSide", "_suppType", "_center", "_radius", "_suppTarg", ["_minRadius", 0]];
    if (_suppSide != _side or _suppType in _actSuppHM) then { continue };         // only use first one found
    private _dist = _targpos distance2d _center;
    if (_suppTarg isNotEqualTo [] or _dist > _radius or _dist < _minRadius) then { continue };        // ready for new target + in range
    _actSuppHM set [_suppType, _x];
} forEach A3A_activeSupports;
Debug_1("Relevant active supports found: %1", _actSuppHM);


// Now determine the weight of each support type
private _weightedSupports = [];            // [type, weight, type, weight, ...]
private _supportTypesHM = [A3A_supportTypesOcc, A3A_supportTypesInv] select (_side == Invaders);
private _availParams = [_target, _side, 200, keys _supportTypesHM];
{
    _y params ["_class", "_typeWeight", "_effRadius"];
    if (_class != "AREA") then { continue };            // only care about area-effect for requestArtillery
    if (_typeWeight == 0) then { continue };            // special cases (eg. UAV) not used here

    // call the availability function for each support type
    private _availFunc = missionNamespace getVariable format ["A3A_fnc_SUP_%1Available", _x];
    private _targWeight = _availParams call _availFunc;
    if (_targWeight <= 0) then { continue };         // support type unavailable

    private _finalWeight = _typeWeight * _targWeight;
    if (_x in _actSuppHM) then { _finalWeight = _finalWeight * 3 };         // increase chance of re-using active supports
    _weightedSupports append [_x, _finalWeight];

} forEach _supportTypesHM;           // Hashmap of support type to [baseClass, typeWeight, effectRadius]
Debug_1("Weighted supports: %1", _weightedSupports);

A3A_supportCallInProgress = nil;


private _supportCreated = "";
while {_supportCreated == "" and _weightedSupports isNotEqualTo []} do
{
    private _supportChoice = selectRandomWeighted _weightedSupports;
    private _index = _weightedSupports find _supportChoice;
    _weightedSupports deleteAt _index;
    _weightedSupports deleteAt _index;            // delete both type and weight
  
    // params ["_type", "_side", "_caller", "_maxSpend", "_target", "_targPos", "_reveal", ["_delay", -1]];
    _supportCreated = [_supportChoice, _side, _resPool, 200, _target, _targPos, _reveal, _delay] call A3A_fnc_createSupport;
};

if (_supportCreated == "") then {
    Info("No support sent because none available");
};
