/*
Maintainer: John Jordan
    Return free defence resources to spend against given position & target

Environment: Server, scheduled

Arguments:
    <SIDE> Side using the resources, must be occupants or invaders
    <OBJECT> or <SIDE> Target object or side to target
    <POSITION> or <STRING> Position of support caller, or a marker to defend/retake
    <SCALAR> Optional, additional cap relative to max location spend (Default: 1.0)

Return Value:
    <NUMBER> Free defence resources to spend. 

Examples:
    [Occupants, teamPlayer, "outpost_3"] call A3A_fnc_maxDefenceSpend;
    [Invaders, _enemyTank, getPosATL _spottingUnit] call A3A_fnc_maxDefenceSpend;
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side", "_target", "_callPos", ["_maxResMod", 1]];
private _targetSide = if (_target isEqualType objNull) then { side group _target } else { _target };

private _curResources = [A3A_resourcesDefenceInv, A3A_resourcesDefenceOcc] select (_side == Occupants);
private _maxResources = A3A_balanceResourceRate * 10 * ([1, A3A_invaderBalanceMul / 10] select (_side == Invaders));
if (gameMode == 1) then {
    // Other enemy can use 30-55% of max, rebels 60-85%, depending on aggro. Resource rate/max are also increased by aggro in initSupports
    private _aggro = [aggressionInvaders, aggressionOccupants] select (_side == Occupants);
    if (_targetSide != teamPlayer) exitWith { _maxResources = _maxResources * (0.3 + (100-_aggro)/400) };
    _maxResources = _maxResources * (0.6 + _aggro/400);
};
Debug_2("Current resources %1, max resources %2", _curResources, _maxResources);
if (_curResources < 0) exitWith { 0 };


// If target is air, use global anti-air and target threat specific spend limits
if (_target isEqualType objNull and {_target isKindOf "Air"}) exitWith
{
    private _targThreat = A3A_vehicleResourceCosts getOrDefault [typeOf _target, 0];
    _targThreat = _targThreat + (_target getVariable ["A3A_airKills", 0]);

    private _targSpend = 0;
    {
        _x params ["_sside", "_btype", "_starg", "_endtime", "_dur", "_pow"];
        if (_sside == _side && _starg isEqualTo _target) then { _targSpend = _targSpend + _pow };
    } forEach A3A_supportStrikes;

    private _threshold = [A3A_airThresholdOcc, A3A_airThresholdInv] select (_side == Invaders);
    private _threshold = _threshold * 0.6 * (4 min _maxResources / _curResources);
    private _maxSpendTarg = _targThreat - _targSpend - _threshold;

    private _maxAASpend = _maxResources * 0.3;
    private _curAASpend = 0;
    {
        _x params ["_spSide", "_spCallPos", "_spTargPos", "_spRes", "_spTime"];
        if (_spSide != _side) then { continue };
        if (_spTargPos isEqualType []) then { continue };       // non-position targpos means called against aircraft

        // Falloff resource spend over one hour
        private _res = linearConversion [_spTime, (_spTime)+3600, time, _spRes, 0, true];
        _curAASpend = _curAASpend + _res;

    } forEach A3A_supportSpends;

    Debug_5("Cur AA spend %1, max AA spend %2, targ threat %3, targ spend %4, threshold %5", _curAASpend, _maxAASpend, _targThreat, _targSpend, _threshold);
    _curResources min _maxSpendTarg min (_maxAASpend - _curAASpend);
};


// For ground targets, spend limit depends on markers near caller
private _maxSpendLoc = _maxResources;
private _threatBalance = 1;
if (_callPos isEqualType "") then
{
    // If target is a marker, just return the location's maximum
    private _mrkIndex = A3A_supportMarkerTypes findif { _callPos == _x#0 };     // lookup marker name
    _callPos = markerPos _callPos;
    if (_mrkIndex == -1) exitWith {
        Error_1("Unknown support marker: %1", _target);
        _maxSpendLoc = _maxSpendLoc * 0.15;
    };
    private _mrkType = A3A_supportMarkerTypes select _mrkIndex;
    _maxSpendLoc = _maxSpendLoc * (_mrkType#3);     // * _mrkType#4;            // location type multiplier * time-based random
    Debug_1("Marker max spend %1", _maxSpendLoc);
}
else 
{
    // Target is position
    // Friendly markers near caller increase max resource spend
    // Enemy markers near target reduce max spend
    private _targPos = [getPosATL _target, _callPos] select (_target isEqualType west);
    private _closeMrk = A3A_supportMarkersXYI inAreaArray [_callPos, 1000, 1000];
    private _defMul = 0.15;
    private _defSub = 0;
    {
        private _mrkType = A3A_supportMarkerTypes select (_x#2);
        if (sidesX getVariable (_mrkType#0) != _side) then {        // enemy marker
            private _dist = _x distance2d _targPos;
            _defSub = _defSub max (_mrkType#3 * (1 - _dist / 500));
        } else {                                                      // friendly marker
            private _dist = _x distance2d _callPos;
            _defMul = _defMul max (_mrkType#3 * (1 - _dist / 1000));
        };
    } forEach _closeMrk;
    _maxSpendLoc = _maxSpendLoc * (_defMul - _defSub);
    Debug_3("Max location spend %1 from defmul %2 and defsub %3", _maxSpendLoc, _defMul, _defSub);

    // Accumulate base strength of nearby enemies
    private _enemyStr = 0;
    private _nearEnemies = units _targetSide inAreaArray [_callPos, 500, 500];
    if (_target isEqualType objNull and { _target distance2d _callPos > 400 }) then {
        // Include enemies near the target
        _nearEnemies = _nearEnemies arrayIntersect (units _targetSide inAreaArray [getPosATL _target, 100, 100]);
    };
    {
        if !(_x call A3A_fnc_canFight) then { continue };
        if (vehicle _x isKindOf "Air") then { continue };
        _enemyStr = _enemyStr + ([10, 30] select isPlayer _x);          // TODO: parameterize player multiplier
        if (vehicle _x != _x and {_x == gunner vehicle _x}) then {
            _enemyStr = _enemyStr + (A3A_groundVehicleThreat getOrDefault [typeOf vehicle _x, 0]);
        };
    } forEach _nearEnemies;

    // Cap max location spend when enemies are a small proportion of total rebel firepower
    if (_targetSide == teamPlayer) then {
        private _maxSpendProp = 0.1 + (_enemyStr / (30 * A3A_activePlayerCount)) ^ 0.6;
        Debug_1("Max spend by rebel threat proportion: %1", _maxSpendProp);
        _maxSpendLoc = _maxSpendLoc min _maxSpendProp;
    };

    // Prevent overreacting to threats: recentDamage + enemyStr - friendlyStr
    // Recent damage, generated by AIReactOnKill & AIVehInit stuff?
    private _recentDamage = [_side, _callPos, 300] call A3A_fnc_getRecentDamage;        // should this be related to marker size? hmm

    // counter with friendly unit strength
    private _friendStr = 0;
    private _nearFriends = units _side inAreaArray [_callPos, 500, 500];
    {
        if !(_x call A3A_fnc_canFight) then { continue };
        if (vehicle _x isKindOf "Air") then { continue };
        if (_x getVariable ["A3A_resPool", ""] isEqualTo "defence") then { continue };      // accounted for in supportSpends
        _friendStr = _friendStr + 10;
        // Don't include friendly statics atm because they're not remanned and not registered in recentDamage if gunner killed 
        //if (vehicle _x != _x and {_x == gunner vehicle _x}) then {
        //    _friendStr = _friendStr + (A3A_groundVehicleThreat getOrDefault [typeOf vehicle _x, 0]);
        //};
    } forEach _nearFriends;

    _threatBalance = (2.6*_recentDamage + _enemyStr) / (1 + _friendStr + _recentDamage);
    _threatBalance = 1 min (_threatBalance - 1);
    Debug_4("Threat balance %1 from: Recent damage %2 enemy strength %3 friend strength %4", _threatBalance, _recentDamage, _enemyStr, _friendStr);
};
if (_maxSpendLoc <= 0 or _threatBalance <= 0) exitWith { 0 };                  // possible if near enemy markers


// Determine how much we've already spent to support the target & caller positions
private _callPosSpend = 0;
private _targPosSpend = 0;
{
    // [side, type, callpos, targpos, resources, start time]
    _x params ["_spSide", "_spCallPos", "_spTargPos", "_spRes", "_spTime"];
    if (_spSide != _side) then { continue };
    if !(_spTargPos isEqualType []) then { continue };                // anti-air spend

    // Falloff resource spend over one hour
    private _res = linearConversion [_spTime, (_spTime)+3600, time, _spRes, 0, true];

    // Falloff resource spend to 0 at 500m distance
    private _callDist = _spCallPos distance2d _callPos;
    _callPosSpend = _callPosSpend + linearConversion [0, 500, _callDist, _res, 0, true];

    if (_target isEqualType west) then { continue };
    private _targDist = _spTargPos distance2d _target;
    _targPosSpend = _targPosSpend + linearConversion [0, 500, _targDist, _res, 0, true];

} forEach A3A_supportSpends;

Debug_2("Callpos spend %1, targpos spend %2", _callPosSpend, _targPosSpend);

private _maxSpend = _threatBalance*_maxSpendLoc - (_callPosSpend max _targPosSpend);      // reduce by what's already been spent
_maxSpend = _maxSpend min _curResources min (_maxResMod*_maxSpendLoc);

// If result is low then there's an increasing chance of not sending anything for now
// Does this adequately replace the counterAttack size check? Probably...
private _minThreshold = (2.1 * A3A_balanceVehicleCost) min (0.5 * _maxSpendLoc);
private _minResponse = round (time / 120) random _minThreshold;
Debug_3("Max spend %1 with minThreshold %2 and minResponse %3", _maxSpend, _minThreshold, _minResponse);
if (_maxSpend < _minResponse) then { _maxSpend = 0 };
_maxSpend;
