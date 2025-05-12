/*  Worker function for creating supports

    Environment: Server, scheduled

    Parameters:
        _supportType: STRING: The type of support to send
        _side: SIDE: The side of the support
        _caller: POS2D or STRING: Position of caller if it's a defence response, or resource pool to override ("attack")
        _maxSpend: NUMBER: Maximum resources to spend, mostly used for sizing QRFs
        _target: OBJECT: The target object of the support. objNull valid for AREA. false creates with no target (for TARGET)
        _targPos: POS2D: Target position of the support.
        _reveal: NUMBER: Amount of info to reveal to rebels, 0 low, 1 high
        _delay: NUMBER: Optional, setup delay time in seconds, otherwise will calculate based on war tier

    Returns:
        Name of support created, or empty string if failed
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_type", "_side", "_caller", "_maxSpend", "_target", "_targPos", "_reveal", ["_delay", -1]];
private _resPool = ["defence", _caller] select (_caller isEqualType "");

// Check if the support type exists for this faction. Ok to fail silently, just asking the question
private _suppTypeHM = [A3A_supportTypesOcc, A3A_supportTypesInv] select (_side == Invaders);
if !(_type in _suppTypeHM) exitWith { "" };

waitUntil { isNil "A3A_supportCallInProgress" };
A3A_supportCallInProgress = true;

// Attempt to use active support if there's a valid one
private _supportIndex = A3A_activeSupports findIf {
    _x params ["_suppName", "_suppSide", "_suppType", "_center", "_radius", "_suppTarg", ["_minRadius", 0]];
    private _dist = _targpos distance2d _center;
    _suppSide == _side and _suppType == _type and _suppTarg isEqualTo [] and _dist < _radius and _dist > _minRadius;
};
if (_target isEqualType objNull and _supportIndex != -1) exitWith {
    private _activeSupport = A3A_activeSupports # _supportIndex;
    [_activeSupport, _target, _targPos] call A3A_fnc_addSupportTarget;
    A3A_supportCallInProgress = nil;
    _activeSupport # 0;             // return support name
};

// Use global increment to make logging easier to track.
A3A_supportCount = A3A_supportCount + 1;
private _supportName = format ["%1%2", _type, A3A_supportCount];

Info_5("Creating support %1 with side %2, pool %3, target %4 and delay %5", _supportName, _side, _resPool, _target, _delay);

// Spend radio key to boost support's reveal value if available
_reveal = [_side, _targPos, _reveal] call A3A_fnc_useRadioKey;

// create function returns <0 if it couldn't do anything
private _createFunc = missionNamespace getVariable ("A3A_fnc_SUP_" + _type);
private _resourceCost = [_supportName, _side, _resPool, _maxSpend, _target, _targPos, _reveal, _delay] call _createFunc;
if (_resourceCost < 0) exitWith { A3A_supportCallInProgress = nil; "" };

[-_resourceCost, _side, _resPool] call A3A_fnc_addEnemyResources;

// This (and whole callpos business) can be cleaned up a lot with the commander system
if (_caller isEqualType []) then {
    // support spends should only care about defence pool?
    // because that's what it's being used to manage
    // [side, callpos, targpos, resources, starttime]
    private _spendTarg = [_targPos, _target] select (_target isEqualType objNull and {_target isKindOf "Air"});
    A3A_supportSpends pushBack [_side, _caller, _spendTarg, _resourceCost, time];
};

A3A_supportCallInProgress = nil;
_supportName;
