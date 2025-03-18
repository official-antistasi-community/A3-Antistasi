/*
Maintainer: John Jordan
    Requests a suitable support against a target if resources permit

Scope: Server
Environment: Scheduled

Arguments:
    <SIDE> The side (occupants or invaders) which should send the support.
    <OBJECT> The target object to be attacked.
    <POS> Position of caller (used for defence resource allocation).
    <NUMBER> Precision of support, should be based on knowledge of target (0 min, 4 max).
    <NUMBER> How much information to reveal about support, 0 low 1 high.

Examples:
    [Occupants, _enemyUnit, getposATL _injured, 4, 0.75] call A3A_fnc_requestSupport;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side", "_target", "_caller", "_precision", "_reveal"];        // might not be a unit, so we can't just use caller

waitUntil { isNil "A3A_supportCallInProgress" };
A3A_supportCallInProgress = true;

Info_3("Requested support against %1 from %2 by side %3", _target, _caller, _side);

// Cleanup old supports
A3A_supportSpends = A3A_supportSpends select { _x#4 + 3600 > time };        // remove one hour after start time
A3A_supportStrikes = A3A_supportStrikes select { _x#3 > time };             // remove after end time
A3A_activeSupports = A3A_activeSupports select { _x#4 > 0 };                // remove if support radius set to 0

// HQ knowledge update
call {
    private _hqDist = _target distance2d markerPos "Synd_HQ";
    private _bunker = markerPos "Synd_HQ" nearObjects ["Land_Bunker_01_tall_F", 50] isNotEqualTo [];
    private _maxSpot = (500 + random 1000) * ([0.5, 1] select _bunker);
    _hqSpot = (1 + random 1) * linearConversion [0, _maxSpot, _hqDist, 1, 0, true]; 
    if (_hqSpot <= 0) exitWith {};

    if (_side == Invaders) then {
        A3A_curHQInfoInv = A3A_curHQInfoInv + _hqSpot * (100 + aggressionInvaders) / 400;       // avg +0.75 for point-blank call at max aggro
    } else {
        A3A_curHQInfoOcc = A3A_curHQInfoOcc + _hqSpot * (100 + aggressionOccupants) / 400;
    };
};


// Sort out target info
if (_target isEqualType objNull and {!alive _target}) exitWith {
    Info("No support sent because target already destroyed");
    A3A_supportCallInProgress = nil;
};
// Find the first parent object. If we're using a static attached to a vehicle then the static is more important.
if (_target isKindOf "Man" and !(isNull objectParent _target)) then { _target = objectParent _target };

private _deprecisionRange = random (100 - (_precision/4) * 80);
private _targPos = _target getPos [_deprecisionRange, random 360];
Debug_2("Final target %1 at position %2", _target, _targPos);


// Determine maximum resource spend with this target & caller
private _maxSpend = [_side, _target, _caller] call A3A_fnc_maxDefenceSpend;
Debug_1("Resource max spend %1", _maxSpend);


// Calculate support type weighting factors based on other recent strikes near target
private _classWeightsHM = call {
    // Shortcut this for air targets
    if (_target isKindOf "Air") exitWith { createHashMapFromArray [["AREA", 0], ["TROOPS", 0], ["TARGET", 1]] };

    // Some general aggro weighting for area supports
    private _aggro = [aggressionInvaders, aggressionOccupants] select (_side == Occupants);
    private _weightArea = 0.5 + (_aggro/200);
    private _weightTarget = 1;
    private _weightTroops = 1;

    // AREA has stronger reduction than TROOPS but over a smaller area
    {
        _x params ["_sside", "_btype", "_starg", "_endtime", "_dur", "_pow"];
        if (_sside != _side or time >= _endtime) then { continue };
        switch (_btype) do {
            case "AREA": {
                private _dist = _starg distance2d _targpos;
                if (_dist > _pow) exitWith {};
                private _reduce = (_pow/100) * (1 - _dist/_pow) * ((_endtime - time)/_dur);
                _weightArea = _weightArea / (1 + _reduce);
            };
            case "TROOPS": {
                private _dist = _starg distance2d _targpos;
                if (_dist > 600) exitWith {};
                private _reduce = (_pow/200) * (1 - _dist/600) * ((_endtime - time)/_dur);
                _weightTroops = _weightTroops / (1 + _reduce);
            };
            case "TARGET": {
                if (_starg == _target) then { _weightTarget = 0 };
            };
        };
    } forEach A3A_supportStrikes;
    createHashMapFromArray [["AREA", _weightArea], ["TROOPS", _weightTroops], ["TARGET", _weightTarget]]
};
Debug_1("Base support type weights: %1", _classWeightsHM);


// Avoid making area attacks against friendlies, although "mistakes" can be made
private _nearfriendlies = units _side inAreaArray [_targPos, 200, 200];
if (_side == Occupants) then { _nearFriendlies append (units civilian inAreaArray [_targPos, 200, 200]) };
private _maxFriendlies = if (_side == Invaders) then { random [2, 4, 10] } else { random [0, 2, 5] };

// Occupants avoid making area attacks against groups of houses within towns
// many buildings within military facilities also count as HOUSE, so first check if we're inside a town radius
private _nearHouses = call {
    if (_side == Invaders || { -1 == citiesX findIf { _targPos inArea _x }}) exitWith { [] };
    nearestTerrainObjects [_targPos, ["HOUSE"], 100, false];
};
private _maxHouses = (1 + random 5) ^ 2;
Debug_4("Total friendlies %1, max friendlies %2, total houses %3, max houses %4", count _nearFriendlies, _maxFriendlies, count _nearHouses, _maxHouses);


// Build hashmap of active supports with spare targets capable of hitting the area
private _actSuppHM = createHashMap;
{
    _x params ["_suppName", "_suppSide", "_suppType", "_center", "_radius", "_suppTarg", ["_minRadius", 0]];
    if (_suppSide != _side or _suppType in _actSuppHM) then { continue };         // only use first one found
    private _dist = _targpos distance2d _center;
    if (_suppTarg isNotEqualTo [] or _dist > _radius or _dist < _minRadius) then { continue };
    _actSuppHM set [_suppType, _x];
} forEach A3A_activeSupports;
Debug_1("Relevant active supports found: %1", _actSuppHM);


// Now determine the weight of each support type
private _weightedSupports = [];            // [type, weight, type, weight, ...]
private _supportTypesHM = [A3A_supportTypesOcc, A3A_supportTypesInv] select (_side == Invaders);
private _availParams = [_target, _side, _maxSpend, keys _supportTypesHM];
{
    if (_maxSpend <= 0 and !(_x in _actSuppHM)) then { continue };          // Skip if we have no money and support type isn't active
    _y params ["_class", "_typeWeight", "_effRadius"];

    // First fetch the weight factor derived from other recent strikes near target
    private _proxWeight = _classWeightsHM get _class;
    if (_proxWeight <= 0) then { continue };                // support class overused or useless against target

    // call the availability function for each support type
    private _availFunc = missionNamespace getVariable format ["A3A_fnc_SUP_%1Available", _x];
    private _targWeight = _availParams call _availFunc;
    if (_targWeight <= 0) then { continue };         // support type unavailable

    // Check for friendlies and civilian houses within blast radius
    if (_effRadius > 0) then {
        private _friendlyCount = count (_nearfriendlies inAreaArray [_targpos, _effRadius, _effRadius]);
        if (_friendlyCount > _maxFriendlies) then { continue };
        private _houseCount = count (_nearHouses inAreaArray [_targpos, _effRadius/2, _effRadius/2]);
        if (_houseCount > _maxHouses) then { continue };
    };

    private _finalWeight = _proxWeight * _typeWeight * _targWeight;
    if (_x in _actSuppHM) then { _finalWeight = 1 max _finalWeight * 3 };         // increase chance of re-using active supports
    _weightedSupports append [_x, _finalWeight];

} forEach _supportTypesHM;           // Hashmap of support type to [base class, weight, effradius]
Debug_1("Weighted supports: %1", _weightedSupports);

// drop the lock now, createSupport doesn't rely on data consistency
A3A_supportCallInProgress = nil;


private _supportCreated = "";
while {_supportCreated == "" and _weightedSupports isNotEqualTo []} do
{
    private _supportChoice = selectRandomWeighted _weightedSupports;
    private _index = _weightedSupports find _supportChoice;
    _weightedSupports deleteAt _index;
    _weightedSupports deleteAt _index;            // delete both type and weight

    _supportCreated = [_supportChoice, _side, _caller, _maxSpend, _target, _targPos, _reveal, nil] call A3A_fnc_createSupport;
};

if (_supportCreated == "") then {
    Info("No support sent because none available");
};
