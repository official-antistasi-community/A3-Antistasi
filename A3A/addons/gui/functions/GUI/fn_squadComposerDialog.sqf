/*
Maintainer: Shoter
    Handles the squad composer: command staff choose the soldiers of custom squads 1 and 2 of the Recruit Squad
    dialog and their abbreviation in the high command bar. Every custom squad has exactly one squad leader, the other
    soldiers come from the unit types that can be garrisoned, up to A3A_customSquadMaxSize soldiers in total.
    Changes stay in the dialog until saved. The server (A3A_fnc_customSquadSet) stores the squad and answers with the
    "saved" mode, which does nothing while the dialog is closed.

Arguments:
    <STRING> Mode: "onLoad", "select", "change", "abbreviationChanged", "update", "revert", "save" or "saved"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for onLoad mode / Unscheduled for everything else
Public: No
Dependencies:
    A3A_customSquads, A3A_customSquadKeys, A3A_customSquadMaxSize, A3A_fnc_customSquadSet,
    A3A_fnc_customSquadSanitize, A3A_fnc_customSquadUnits, A3A_fnc_getHCSquadPrice, A3A_fnc_getHCSquadVehicleType

Example:
    ["onLoad"] spawn A3A_GUI_fnc_squadComposerDialog;
    ["change", ["unitRifle", 1]] call A3A_GUI_fnc_squadComposerDialog;

License: APL-ND
*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define ROW_HEIGHT (5 * GRID_H)

params [["_mode", "onLoad"], ["_params", []]];

private _display = findDisplay A3A_IDD_SQUADCOMPOSERDIALOG;
if (isNull _display) exitWith {};

// Unit counts of the edited squad as [[unit key, count], ...] in A3A_customSquadKeys order, empty types left out
private _fnc_pairs = {
    private _counts = _display getVariable ["A3A_counts", createHashMap];
    (A3A_customSquadKeys apply { [_x, _counts getOrDefault [_x, 0]] }) select { _x # 1 > 0 }
};

switch (_mode) do
{
    case ("onLoad"):
    {
        private _list = _display displayCtrl A3A_IDC_SQUADCOMPOSER_LIST;
        private _names = createHashMapFromArray A3A_CUSTOM_SQUAD_UNIT_NAMES;

        // One line per unit type: name, price of one soldier, -5, -, count, +, +5. Positions are relative to the list group
        private _rows = createHashMap;
        {
            private _key = _x;
            private _y = _forEachIndex * ROW_HEIGHT;
            private _isLeader = _key == "unitSL";
            private _price = [FactionGet(reb,_key)] call A3A_fnc_rebelUnitPrice;

            private _nameCtrl = _display ctrlCreate ["A3A_Text", -1, _list];
            _nameCtrl ctrlSetPosition [1 * GRID_W, _y, 44 * GRID_W, ROW_HEIGHT];
            _nameCtrl ctrlCommit 0;
            _nameCtrl ctrlSetText localize (_names getOrDefault [_key, ""]);

            private _priceCtrl = _display ctrlCreate ["A3A_TextRight", -1, _list];
            _priceCtrl ctrlSetPosition [46 * GRID_W, _y, 16 * GRID_W, ROW_HEIGHT];
            _priceCtrl ctrlCommit 0;
            _priceCtrl ctrlSetText format ["%1 €", _price];

            private _countCtrl = _display ctrlCreate ["A3A_TextRight", -1, _list];
            _countCtrl ctrlSetPosition [79 * GRID_W, _y, 9 * GRID_W, ROW_HEIGHT];
            _countCtrl ctrlCommit 0;
            _countCtrl ctrlSetText "1";

            if (_isLeader) then {
                _nameCtrl ctrlSetTooltip localize "STR_antistasi_dialogs_squad_composer_leader_tooltip";
                _countCtrl ctrlSetTooltip localize "STR_antistasi_dialogs_squad_composer_leader_tooltip";
                continue;
            };

            private _buttons = [];
            {
                _x params ["_xPos", "_width", "_delta"];
                private _button = _display ctrlCreate ["A3A_Button_Small", -1, _list];
                _button ctrlSetPosition [_xPos * GRID_W, _y + 0.5 * GRID_H, _width * GRID_W, ROW_HEIGHT - 1 * GRID_H];
                _button ctrlCommit 0;
                _button ctrlSetText (if (_delta > 0) then { format ["+%1", _delta] } else { str _delta });
                _button setVariable ["A3A_params", [_key, _delta]];
                _button ctrlAddEventHandler ["ButtonClick", {
                    params ["_control"];
                    ["change", _control getVariable "A3A_params"] call A3A_GUI_fnc_squadComposerDialog;
                }];
                _buttons pushBack _button;
            } forEach [[64, 7, -5], [72, 6, -1], [90, 6, 1], [97, 7, 5]];

            _rows set [_key, [_countCtrl, _buttons]];
        } forEach (["unitSL"] + A3A_customSquadKeys);
        _display setVariable ["A3A_rows", _rows];

        ["select", [0]] call FUNC(squadComposerDialog);
    };

    case ("select"):
    {
        // Takes 1 parameter: <NUMBER> custom squad index, 0 or 1. Unsaved changes of the other squad are dropped
        _params params [["_index", 0, [0]]];
        (A3A_customSquads param [_index, ["", []]]) params ["_abbreviation", "_counts"];
        _display setVariable ["A3A_index", _index];
        _display setVariable ["A3A_counts", createHashMapFromArray _counts];
        _display setVariable ["A3A_dirty", false];
        (_display displayCtrl A3A_IDC_SQUADCOMPOSER_ABBREDIT) ctrlSetText _abbreviation;
        (_display displayCtrl A3A_IDC_SQUADCOMPOSER_STATUSTEXT) ctrlSetText "";
        ["update"] call FUNC(squadComposerDialog);
    };

    case ("change"):
    {
        // Takes 2 parameters: <STRING> unit key, <NUMBER> soldiers to add, negative to remove
        _params params [["_key", "", [""]], ["_delta", 0, [0]]];
        if !(_key in A3A_customSquadKeys) exitWith {};
        private _counts = _display getVariable ["A3A_counts", createHashMap];
        private _size = 1;
        { _size = _size + _y } forEach _counts;
        private _count = _counts getOrDefault [_key, 0];
        _counts set [_key, 0 max (_count + (_delta min (A3A_customSquadMaxSize - _size)))];
        _display setVariable ["A3A_dirty", true];
        ["update"] call FUNC(squadComposerDialog);
    };

    case ("abbreviationChanged"):
    {
        _display setVariable ["A3A_dirty", true];
        ["update"] call FUNC(squadComposerDialog);
    };

    case ("update"):
    {
        private _index = _display getVariable ["A3A_index", 0];
        private _counts = _display getVariable ["A3A_counts", createHashMap];
        private _dirty = _display getVariable ["A3A_dirty", false];
        private _units = [_index, call _fnc_pairs] call A3A_fnc_customSquadUnits;
        private _size = count _units;
        private _isFull = _size >= A3A_customSquadMaxSize;

        (_display displayCtrl A3A_IDC_SQUADCOMPOSER_CUSTOM1BUTTON) ctrlEnable (_index != 0);
        (_display displayCtrl A3A_IDC_SQUADCOMPOSER_CUSTOM2BUTTON) ctrlEnable (_index != 1);

        {
            _y params ["_countCtrl", "_buttons"];
            private _count = _counts getOrDefault [_x, 0];
            _countCtrl ctrlSetText str _count;
            { _x ctrlEnable ([_count > 0, !_isFull] select (_forEachIndex > 1)) } forEach _buttons;
        } forEach (_display getVariable ["A3A_rows", createHashMap]);

        // Abbreviation as the server will store it
        private _abbreviation = ([ctrlText (_display displayCtrl A3A_IDC_SQUADCOMPOSER_ABBREDIT)] call A3A_fnc_customSquadSanitize) # 0;
        (_display displayCtrl A3A_IDC_SQUADCOMPOSER_ABBRPREVIEW) ctrlSetText (if (_abbreviation == "") then {
            localize "STR_antistasi_dialogs_squad_composer_abbreviation_empty"
        } else {
            format [localize "STR_antistasi_dialogs_squad_composer_abbreviation_preview", _abbreviation]
        });

        (_display displayCtrl A3A_IDC_SQUADCOMPOSER_SIZETEXT) ctrlSetText format [localize "STR_antistasi_dialogs_squad_composer_size", _size, A3A_customSquadMaxSize];
        ([_units] call A3A_fnc_getHCSquadPrice) params ["_money", "_hr"];
        (_display displayCtrl A3A_IDC_SQUADCOMPOSER_COSTTEXT) ctrlSetText format [localize "STR_antistasi_dialogs_squad_composer_cost", _money, _hr];

        // The transport the Recruit Squad dialog would add, custom squads go on foot when it cannot seat them all
        private _vehType = [_units] call A3A_fnc_getHCSquadVehicleType;
        private _vehicleText = "";
        if (!isNil "_vehType" && {_vehType isEqualType ""} && {_vehType != ""}) then {
            private _seats = [_vehType, true] call BIS_fnc_crewCount;
            _vehicleText = if (_size <= _seats) then {
                format [localize "STR_antistasi_dialogs_squad_composer_vehicle", getText (configFile >> "CfgVehicles" >> _vehType >> "displayName"), [_vehType] call A3A_fnc_vehiclePrice]
            } else {
                format [localize "STR_antistasi_dialogs_squad_composer_no_vehicle", _seats]
            };
        };
        (_display displayCtrl A3A_IDC_SQUADCOMPOSER_VEHICLETEXT) ctrlSetText _vehicleText;

        (_display displayCtrl A3A_IDC_SQUADCOMPOSER_SAVEBUTTON) ctrlEnable (_dirty && {_abbreviation != ""});
        (_display displayCtrl A3A_IDC_SQUADCOMPOSER_REVERTBUTTON) ctrlEnable _dirty;
        if (_dirty) then {
            (_display displayCtrl A3A_IDC_SQUADCOMPOSER_STATUSTEXT) ctrlSetText localize "STR_antistasi_dialogs_squad_composer_unsaved";
        };
    };

    case ("revert"):
    {
        ["select", [_display getVariable ["A3A_index", 0]]] call FUNC(squadComposerDialog);
    };

    case ("save"):
    {
        if !([player] call A3A_fnc_isCommandStaff) exitWith {
            [localize "STR_antistasi_dialogs_squad_composer_titlebar", localize "STR_antistasi_dialogs_squad_composer_staff_only"] call A3A_fnc_customHint;
        };
        private _abbreviation = ctrlText (_display displayCtrl A3A_IDC_SQUADCOMPOSER_ABBREDIT);
        // Answered by the "saved" mode
        (_display displayCtrl A3A_IDC_SQUADCOMPOSER_SAVEBUTTON) ctrlEnable false;
        [player, _display getVariable ["A3A_index", 0], _abbreviation, call _fnc_pairs] remoteExecCall ["A3A_fnc_customSquadSet", 2];
    };

    case ("saved"):
    {
        // Takes 2 parameters: <NUMBER> custom squad index, <ARRAY> the squad as stored, [abbreviation, [[unit key, count], ...]]
        _params params [["_index", 0, [0]], ["_squad", ["", []], [[]]]];
        if (_index != _display getVariable ["A3A_index", 0]) exitWith {};
        _squad params ["_abbreviation", "_counts"];
        _display setVariable ["A3A_counts", createHashMapFromArray _counts];
        _display setVariable ["A3A_dirty", false];
        (_display displayCtrl A3A_IDC_SQUADCOMPOSER_ABBREDIT) ctrlSetText _abbreviation;
        (_display displayCtrl A3A_IDC_SQUADCOMPOSER_STATUSTEXT) ctrlSetText localize "STR_antistasi_dialogs_squad_composer_saved";
        ["update"] call FUNC(squadComposerDialog);
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("Squad composer dialog mode does not exist: %1", _mode);
    };
};
