/*
Author: Barbolani
Maintainer: Tiny
    Sets the units traits (camouflage, medic, engineer) for the selected role of the player

Arguments:
    Role name

Return Value:
    <NULL>

Scope: Local
Environment: Any
Public: Yes
Dependencies:
    A3A_roleTraitHM

Example:
    ["medic"] spawn A3A_fnc_unitTraits;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_roleName", ["_silent",false]];
private _isCommander = (_roleName == "commander");

if !(_isCommander) then {
    player setVariable ["A3A_Role", _roleName, true];
};

// Set the unit traits
private _traitHM = A3A_roleTraitHM get _roleName;
{
    _name = _x;
    _value = _y;
    if (_name == "engineer" && (missionNamespace getVariable ["ace_repair_enabled", false])) exitWith {
        player setVariable ["ace_isEngineer", _value, true];
    };
    if (_name == "code") exitWith {
        [player] call _value;
    };
    player setUnitTrait [_name, _value];
} forEach _traitHM;

if (_silent) exitWith {};

_text = (localize format ["STR_A3A_fn_orgp_unitTraits_%1_1", _roleName]) + "<br/>" + (localize format ["STR_A3A_fn_orgp_unitTraits_%1_2", _roleName]);
[localize "STR_A3A_fn_orgp_unitTraits_title", format [localize "STR_A3A_fn_orgp_unitTraits_you",_text]] spawn A3A_fnc_customHint;
