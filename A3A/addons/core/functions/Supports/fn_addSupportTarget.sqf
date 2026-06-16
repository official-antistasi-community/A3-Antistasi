/*
Maintainer: John Jordan
    Adds a given target to the given support

Scope: Server
Environment: Scheduled

Arguments:
    <ARRAY|STRING> The active support array (from A3A_activeSupports) or name
    <OBJECT> The target object
    <POS2D> Target position

Return Value:
    <NIL>
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_activeSupport", "_target", "_targPos"];

if (_activeSupport isEqualType "") then { 
    private _index = A3A_activeSupports findIf { _activeSupport == _suppName };
    if (_index != -1) then { _activeSupport = A3A_activeSupports select _index };
};
if (_activeSupport isEqualType "") exitWith { Error_1("Support name %1 not in active list", _activeSupport); false; };

_activeSupport params ["_suppName", "_suppSide", "_suppType", "_center", "_radius", "_suppTarget"];
// Shouldn't really need these checks but whatever
if (_radius == 0 or _suppTarget isNotEqualTo []) exitWith { Error_1("No remaining targets for support %1", _suppName) };

_suppTarget append [_target, _targPos];              // target list may need both
Info_3("Added target %1 (position %2) to support %3", _target, _targPos, _suppName);

// Add the strike call here so that we don't repeat it
private _suppTypeHM = [A3A_supportTypesOcc, A3A_supportTypesInv] select (_side == Invaders);
(_suppTypeHM get _suppType) params ["_baseType", "", "", "_strikePower"];
private _strikeTarg = if (_baseType == "TARGET") then { _target } else { _targPos };
A3A_supportStrikes pushBack [_suppSide, _baseType, _strikeTarg, time + 20*60, 20*60, _strikePower];

true;
