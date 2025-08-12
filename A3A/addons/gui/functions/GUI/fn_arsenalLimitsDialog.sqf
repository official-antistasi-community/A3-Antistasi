/*
Maintainer: John Jordan
    Handles the initialization and updating of the arsenal guest limits dialog.

Arguments:
    0. <STRING> Mode, currently "typeSelect", "listButton", "resetButton" and "stepButton"
    1. <ARRAY<ANY>> Array of params for the mode when applicable.

Returns:
    Nothing

Environment:
    Should not be called by onLoad because findDisplay and ctrlParent do not work in that context.

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mode", "_params"];

private _fnc_defaultLimit = { jna_minItemMember select _this;};

private _display = findDisplay A3A_IDD_ARSENALLIMITSDIALOG;
private _listBox = _display displayCtrl A3A_IDC_ARSLIMLISTBOX;


switch (_mode) do
{
    case ("init"):
    {
        if (!isServer) then {
            // Go fetch a fresh copy of the arsenal data
            jna_datalist = nil;
            [clientOwner, "jna_datalist"] remoteExecCall ["publicVariableClient", 2];
            private _timeout = time + 10;
            waitUntil { sleep 0.1; !isNil "jna_datalist" or time > _timeout };
        };
        if (isNil "jna_datalist") exitWith { closeDialog 0 };

        if !(player call A3A_fnc_isMember) then {
            [localize "STR_antistasi_arsenal_limits_dialog_hint_title", localize "STR_antistasi_arsenal_limits_dialog_guest_warning"] call A3A_fnc_customHint;
            (_display displayctrl A3A_IDC_ARSLIMRESETBUTTON) ctrlEnable false;
        };
        ["typeSelect", [A3A_IDC_ARSLIMTYPESBASE]] call A3A_GUI_fnc_arsenalLimitsDialog;
    };

    case ("typeSelect"):
    {
        private _typeIndex = (_params#0) - A3A_IDC_ARSLIMTYPESBASE;
        _display setVariable ["typeIndex", _typeIndex];
        private _defLimit = _typeIndex call _fnc_defaultLimit;

        private _cfgCat = switch (_typeIndex) do {
            case 5: { configFile / "cfgVehicles" };
            case 22; case 23; case 26: { configFile / "cfgMagazines" };
            default { configFile / "cfgWeapons" };
        };

        { ctrlDelete _x } forEach allControls _listBox;
        {
            _x params ["_class", "_count"];
            private _itemName = getText (_cfgCat / _class / "displayName");
            private _limit = A3A_arsenalLimits getOrDefault [_class, [_defLimit]] select 0;
            if (_typeIndex == 26) then {
                private _capacity = 1 max getNumber (_cfgCat / _class / "count");
                _count = round (_count / _capacity);
            };
            private _index = _forEachIndex;

            private _nameCtrl = _display ctrlCreate ["A3A_Text", -1, _listBox];
            _nameCtrl ctrlSetPosition [0, _index*GRID_H*4, 54*GRID_W, 4*GRID_H];
            _nameCtrl ctrlCommit 0;
            _nameCtrl ctrlSetText _itemName;

            private _numCtrl = _display ctrlCreate ["A3A_TextRight", -1, _listBox];
            _numCtrl ctrlSetPosition [54*GRID_W, _index*GRID_H*4, 6*GRID_W, 4*GRID_H];
            _numCtrl ctrlCommit 0;
            _numCtrl ctrlSetText str _count;

            private _valCtrl = _display ctrlCreate ["A3A_TextRight", -1, _listBox];
            _valCtrl ctrlSetPosition [75*GRID_W, _index*GRID_H*4, 6*GRID_W, 4*GRID_H];
            _valCtrl ctrlCommit 0;
            _valCtrl ctrlSetText str _limit;
            _valCtrl setVariable ["A3A_class", _class];

            {
                _x params ["_text", "_adjust", "_xpos"];
                private _button = _display ctrlCreate ["A3A_Button", -1, _listBox];
                _button ctrlSetPosition [_xpos*GRID_W, _index*4*GRID_H, 4*GRID_W, 4*GRID_H];
                _button ctrlCommit 0;
                _button ctrlSetText _text;
                _button setVariable ["A3A_params", [_valCtrl, _adjust]];
                _button ctrlAddEventHandler ["ButtonClick", { ["listButton", _this] call A3A_GUI_fnc_arsenalLimitsDialog }];
            } forEach [["R", "R", 66], ["-", -5, 70], ["+", 5, 82], ["U", "U", 86]];

        } forEach (jna_datalist#_typeIndex select {_x#1>0});        // only show non-unlocked items

        // color-invert the selected button, restore the others
        {
            private _ctrl = _display displayctrl (A3A_IDC_ARSLIMTYPESBASE + _x);
            _ctrl ctrlEnable ([true, false] select (_x == _typeIndex));
        } forEach [0,1,2,3,4,5,6,8,9,11,12,18,19,20,22,23,24,25,26];
    };

    case ("listButton"):
    {
        private _ctrl = _params#0;
        _ctrl getVariable "A3A_params" params ["_valCtrl", "_adjust"];

        private _defLimit = (_display getVariable "typeIndex") call _fnc_defaultLimit;
        private _class = _valCtrl getVariable "A3A_class";
        A3A_arsenalLimits getOrDefault [_class, [_defLimit, _defLimit]] params ["_curVal", "_memberVal"];

        private _newVal = call {
            if (_adjust isEqualTo "R") exitWith { _defLimit };
            if (_adjust isEqualTo "U") exitWith { [minWeaps, 100] select (minWeaps < 0) };
            (_curVal + _adjust) max 0 min 100;
        };
        // If we're not a member, then cap to member limit.
        if !(player call A3A_fnc_isMember) then {
            _newVal = _newVal max _memberVal;
        } else {
            _memberVal = _newVal;
        };

        _valCtrl ctrlSetText str _newVal;
        if (_newVal == _defaultLimit) exitWith { A3A_arsenalLimits deleteAt _class };
        A3A_arsenalLimits set [_class, [_newVal, _memberVal]];
    };

    case ("resetButton"):
    {
        if (isNil {_display getVariable "typeIndex"}) exitWith {};
        private _typeIndex = _display getVariable "typeIndex";

        {
            A3A_arsenalLimits deleteAt (_x#0);
        } forEach (jna_datalist#_typeIndex);

        ["typeSelect", [_typeIndex + A3A_IDC_ARSLIMTYPESBASE]] call A3A_GUI_fnc_arsenalLimitsDialog;          // refresh the display
    };

/*    case ("stepButton"):
    {
        private _stepSize = _display getVariable ["stepSize", 1];
        private _newstepSize = [1, 5] select (_stepSize == 1);
        _display setVariable ["stepSize", _newstepSize];
        private _newText = localize "STR_antistasi_arsenal_limits_dialog_step" + " ±" + str _newStepSize;
        ctrlSetText [A3A_IDC_ARSLIMSTEPBUTTON, _newText];
    };
*/
};
