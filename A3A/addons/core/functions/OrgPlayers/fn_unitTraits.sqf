/*
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
#define CUSTOMTRAITLIST [] // shouldnt need any of these but they're here if needed
private _hintTitle = localize "STR_A3A_fn_orgp_unitTraits_title";
params [["_roleName", player getVariable ["A3A_Role", "rifleman"]], ["_silent",false]];

private _isCommander = (player isEqualTo theBoss);

private _preferredRole = _roleName;

if (_roleName != "commander") then {
    player setVariable ["A3A_Role", _roleName, true];
};

if (_isCommander) then {
    _roleName = "commander";
};

// Set the unit traits
private _traitHM = A3A_roleTraitHM get _roleName;
{
    _name = _x;
    _value = _y;
    if (_name == "engineer") then {
        A3A_drawBuilderIcons = _value;
        A3A_showBuilderActions = _value;
        if (missionNamespace getVariable ["ace_repair_enabled", false]) then {
            // ACE engineer magic
            player setVariable ["ace_isEngineer", _value, true];
        };
    };
    if (_name == "code") exitWith {
        [player] call _value;
    };
    player setUnitTrait [_name, _value, (_name in CUSTOMTRAITLIST)];
} forEach _traitHM;

// Quit if silent (commander moves around)
if (_silent) exitWith {};
_textArr = [format [localize "STR_A3A_fn_orgp_unitTraits_you",localize format ["STR_A3A_fn_orgp_unitTraits_%1_1", _preferredRole]], localize format ["STR_A3A_fn_orgp_unitTraits_%1_2", _preferredRole]];
if (_isCommander) then {
    // append extra text letting player know the role doesnt take effect until they lose command
    _textArr pushBack (localize "STR_antistasi_dialogs_roleselect_isCommander");
};
_text = _textArr joinString "<br/><br/>"; // assemble all info and add spacers
[_hintTitle, _text] spawn A3A_fnc_customHint;
