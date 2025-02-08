/*
Maintainer: Caleb Serafin, DoomMetal
    Handles updating and controls on the AI Management tab of the Main dialog.

Arguments:
    <STRING> Mode
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for control changes / Unscheduled for update
Public: No
Dependencies:
    None

Example:
    ["update"] call FUNC(aiManagementTab);

License: APL-ND

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[["_mode","onLoad"], ["_params",[]]];

switch (_mode) do
{
    case ("update"):
    {
        Trace("Updating AI Management Tab");
        // Show back button
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _backButton = _display displayCtrl A3A_IDC_MAINDIALOGBACKBUTTON;
        _backButton ctrlRemoveAllEventHandlers "MouseButtonClick";
        _backButton ctrlAddEventHandler ["MouseButtonClick", {
            ["switchTab", ["player"]] call FUNC(mainDialog);
        }];
        _backButton ctrlShow true;

        // Get list of AI group members
        _aisInGroup = [];
        {
            if (!isPlayer _x) then {_aisInGroup pushBackUnique _x};
        } forEach units group player;

        // Update AI listBox
        private _aiListBox = _display displayCtrl A3A_IDC_AILISTBOX;
        lbClear _aiListBox;

        // If there are no AI just add a message and disable the listBox
        if (count _aisInGroup < 1) then {
            // This should not happen, the button on the playertab is disabled if you have no AI
            _aiListBox ctrlEnable false;
            _aiListBox lbAdd localize "STR_A3A_fn_GUI_aiManaagement_noAI";
        } else {
            // Else add units to the listbox
            _aiListBox ctrlEnable true;
            {
                _index = _aiListBox lbAdd name _x;
                _netId = _x call BIS_fnc_netId; // TODO UI-update: can be only netId command instead of function in MP-only
                Trace_1("Adding unit: %1", _netId);
                _aiListBox lbSetData [_index, _netId];
            } forEach _aisInGroup;
        };

        // If any units are selected on the command bar select those in the list
        {
            _netId = _x call BIS_fnc_netId; // TODO UI-update: can be only netId command instead of function in MP-only
            Trace_1("Selecting unit: %1", _netId);
            _lbSize = lbSize _aiListBox;
            for "_i" from 0 to (_lbSize - 1) do
            {
                _listNetId = _aiListBox lbData _i;
                Trace_2("LB netID: %1, Sel netId: %2", _listNetId, _netId);
                if (_listNetId isEqualTo _netId) then
                {
                    _aiListBox lbSetSelected [_i, true];
                };
            };
        } forEach groupSelectedUnits player;

        ["aiListBoxSelectionChanged"] call FUNC(aiManagementTab);
    };

    case ("clearAIListboxSelection"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _aiListBox = _display displayCtrl A3A_IDC_AILISTBOX;
        _lbSize = lbSize _aiListBox;
        for "_i" from 0 to _lbSize - 1 do
        {
            _aiListBox lbSetSelected [_i, false];
        };

        // Update Selection
        ["aiListBoxSelectionChanged"] spawn FUNC(aiManagementTab);
    };

    case ("aiListBoxSelectionChanged"):
    {
        // Needs scheduled environment

        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _aiListBox = _display displayCtrl A3A_IDC_AILISTBOX;

        // Disable remote control button if more than 1 AI is selected
        private _aiControlButton = _display displayCtrl A3A_IDC_AICONTROLBUTTON;
        private _aiControlIcon = _display displayCtrl A3A_IDC_AICONTROLICON;
        _lbSelection = lbSelection _aiListBox;
        Trace_1("AI LB selection changed: %1", _lbSelection);
        // TODO UI-update: disable AI control button when petros is selected
        if (count _lbSelection == 1) then
        {
            _aiControlButton ctrlEnable true;
            _aiControlButton ctrlSetTooltip "";
            _aiControlIcon ctrlSetTextColor ([A3A_COLOR_WHITE] call FUNC(configColorToArray));
        } else {
            _aiControlButton ctrlEnable false;
            _aiControlButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_ai_management_no_ai_control_tooltip";
            _aiControlIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };

        // If none are selected, disable all the other buttons
        private _aiDismissButton = _display displayCtrl A3A_IDC_AIDISMISSBUTTON;
        private _aiDismissIcon = _display displayCtrl A3A_IDC_AIDISMISSICON;
        private _aiAutoLootButton = _display displayCtrl A3A_IDC_AIAUTOLOOTBUTTON;
        private _aiAutoLootIcon = _display displayCtrl A3A_IDC_AIAUTOLOOTICON;
        private _aiAutoHealButton = _display displayCtrl A3A_IDC_AIAUTOHEALBUTTON;
        private _aiAutoHealIcon = _display displayCtrl A3A_IDC_AIAUTOHEALICON;
        if (count _lbSelection > 0) then {
            _aiDismissButton ctrlEnable true;
            _aiDismissButton ctrlSetTooltip "";
            _aiDismissIcon ctrlSetTextColor ([A3A_COLOR_WHITE] call FUNC(configColorToArray));
            _aiAutoLootButton ctrlEnable true;
            _aiAutoLootButton ctrlSetTooltip "";
            _aiAutoLootIcon ctrlSetTextColor ([A3A_COLOR_WHITE] call FUNC(configColorToArray));
            _aiAutoHealButton ctrlEnable true;
            _aiAutoHealButton ctrlSetTooltip "";
            _aiAutoHealIcon ctrlSetTextColor ([A3A_COLOR_WHITE] call FUNC(configColorToArray));
        } else {
            _aiDismissButton ctrlEnable false;
            _aiDismissButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_ai_management_select_ai_tooltip";
            _aiDismissIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            _aiAutoLootButton ctrlEnable false;
            _aiAutoLootButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_ai_management_select_ai_tooltip";
            _aiAutoLootIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            _aiAutoHealButton ctrlEnable false;
            _aiAutoHealButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_ai_management_select_ai_tooltip";
            _aiAutoHealIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
    };

    case ("aiControlButtonClicked"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _aiListBox = _display displayCtrl A3A_IDC_AILISTBOX;
        private _unit = objectFromNetId (_aiListBox lbData ((lbSelection _aiListBox) # 0));

        closeDialog 1;
        [[_unit]] spawn A3A_fnc_controlUnit;
    };

    case ("dismissButtonClicked"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _aiListBox = _display displayCtrl A3A_IDC_AILISTBOX;
        private _units = [];
        {
            _units pushBack (objectFromNetId (_aiListBox lbData _x));
        } forEach lbSelection _aiListBox;
        [_units] spawn A3A_fnc_dismissPlayerGroup;
    };

    case ("autoLootButtonClicked"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _aiListBox = _display displayCtrl A3A_IDC_AILISTBOX;
        private _units = [];
        {
            _units pushBack (objectFromNetId (_aiListBox lbData _x));
        } forEach lbSelection _aiListBox;
        _units spawn A3A_fnc_rearmCall;
    };

    case ("autoHealButtonClicked"):
    {
        // This one needs some more shit to work, see unstable branch
        /* private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _aiListBox = _display displayCtrl A3A_IDC_AILISTBOX;
        private _units = [];
        {
            _units pushBack (objectFromNetId (_aiListBox lbData _x));
        } forEach lbSelection _aiListBox;
        [_units] call A3A_fnc_autoHealFnc; */
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("AI Management tab mode does not exist: %1", _mode);
    };
};
