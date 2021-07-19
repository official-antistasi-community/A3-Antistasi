/*
    A3A_fnc_updateRebelStatics
    Search rebel marker area for empty statics, move garrison riflemen into them.
    Attempts to find existing local garrison static group, otherwise creates one.

    Arguments:
    0. <Array> or <String>. Position within marker or marker name.

    Scope: Wherever you want to put garrison groups, probably server or HC
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _groupData = FactionGet(reb,"groups");
#define GROUP(VAR) (_groupData get VAR)
params ["_target"];

// If position or object target, identify rebel marker
private _marker = _target;
if !(_target isEqualType "") then
{
    _marker = "";
    private _markers = markersX select { _target inArea _x && {sidesX getVariable [_x, sideUnknown] == teamPlayer} };
    private _mindist = 10000;
    {
        private _dist = (getMarkerPos _x) distance2d _target;
        if (_dist > _mindist) then { continue };
        _marker = _x; _mindist = _dist;
    } forEach _markers;
};
if (_marker isEqualTo "") exitWith {};

// Find all non-mortar statics within marker
private _statics = staticsToSave inAreaArray _marker;
_statics = _statics select { !(_x isKindOf "StaticMortar") };           // don't bother with mortars yet
if (count _statics == 0) exitWith {};

// Find unlocked & unoccupied statics
private _freeStatics = _statics select {
    isNil { _x getVariable "lockedForAI" }
    and isNull (gunner _x)
};
if (count _freeStatics == 0) exitWith {};

// Identify all garrison riflemen in area
private _possibleCrew = allUnits inAreaArray _marker;
_possibleCrew = _possibleCrew select {
    _x getVariable ["markerX", ""] isEqualTo _marker
    and _x getVariable ["UnitType", ""] isEqualTo GROUP("Mil")
    and isNull objectParent _x
    and [_x] call A3A_fnc_canFight
};
if (count _possibleCrew == 0) exitWith {};

// Identify current local static group for marker, if any
private _staticGroup = grpNull;
{
    private _unit = gunner _x;
    if (isNull _unit or !(local _unit)) then { continue };
    if !(_unit getVariable ["markerX", ""] isEqualTo _marker) then { continue };
    _staticGroup = group _unit; break;
} forEach _statics;

if (isNull _staticGroup) then { _staticGroup = createGroup [teamPlayer, true] };

{
    if (count _possibleCrew == 0) exitWith {};
    private _unit = _possibleCrew deleteAt 0;
    [_unit] joinSilent _staticGroup;

    // Wait until the unit is local before we do anything else
    [_unit, _x] spawn {
        params ["_unit", "_static"];
        private _timeout = 10;
        waitUntil { sleep 1; _timeout = _timeout-1; _timeout < 0 or local _unit };
        if (isNull objectParent _unit and isNull gunner _static and isNull objectParent _static and isNull attachedTo _static) then {
            _unit assignAsGunner _static;
            _unit moveInGunner _static;
        };
    };
} forEach _freeStatics;
