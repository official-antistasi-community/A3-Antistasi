/*
Maintainer: John Jordan
    Decide whether to launch a counterattack against a location that an enemy just lost to rebels

Arguments:
    <STRING> Target marker
    <SIDE> Source side for attack

*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_enemySide"];

// okay. So sleep for some random time first... Balance dependent?
sleep (random 120);

private _targetsAndWeights = [teamPlayer, _enemySide, [_target]] call A3A_fnc_findAttackTargets;
_targetsAndWeights params ["_targets", "_weights"];
private _total = 0; _weights apply { _total = _total + _x };
private _valueProb = linearConversion [0.2, 0.7, _total, 0, 1, true];

private _attackResources = [A3A_resourcesAttackOcc, A3A_resourcesAttackInv] select (_enemySide == Invaders);
private _resourceProb = linearConversion [-1000, -200, _attackResources, 0, 1, true];

Debug_3("Checking counterAttack against %1 with %2 valueProb and %3 resourceProb", _target, _valueProb, _resourceProb);
if (_attackResources > -200) exitWith { Debug_1("Aborted counterattack vs %1 because attack is nearly ready", _target) };
if (_valueProb * _resourceProb < 0.3 + random 0.4) exitWith {
    Debug_1("Aborted counterattack vs %1 due to low value", _target);
};

isNil {
    if (!isNil "A3A_choosingAttack") exitWith { Debug_1("Aborted counterattack vs %1 due to choosing attack", _target) };
    if (sidesX getVariable _target != teamPlayer) exitWith { Debug_1("Aborted counterattack vs %1 due to side switch", _target) };
    if (bigAttackInProgress) exitWith { Debug_1("Aborted counterattack vs %1 due to attack in progress", _target) };

    private _targetData = _targets selectRandomWeighted _weights;
    _targetData params ["_targetMrk", "_originMrk", "_targetValue", "_localThreat", "_flyoverThreat", "_countLandAttackBases"];
    Debug_1("Selected attack is %1", _targetData);

    // Sending real attack, execute the fight
    Info_2("Starting counterattack from %1 to %2", _originMrk, _targetMrk);
    [-250, _enemySide, "attack"] call A3A_fnc_addEnemyResources;             // more expensive than usual, rushed
    bigAttackInProgress = true; publicVariable "bigAttackInProgress";
    [_targetMrk, _originMrk, 1, true] spawn A3A_fnc_wavedAttack;
};
