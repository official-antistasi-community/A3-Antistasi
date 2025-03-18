/*
Maintainer: Caleb Serafin, DoomMetal
    Handles updating and controls on the Player Management tab of the Main dialog.

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
    ["update"] call FUNC(playerManagementTab);

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
        Trace("Updating Player Management tab");
        // Show back button
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _backButton = _display displayCtrl A3A_IDC_MAINDIALOGBACKBUTTON;
        _backButton ctrlRemoveAllEventHandlers "MouseButtonClick";
        _backButton ctrlAddEventHandler ["MouseButtonClick", {
            ["switchTab", ["admin"]] call FUNC(mainDialog);
        }];
        _backButton ctrlShow true;

        private _listBox = _display displayCtrl A3A_IDC_ADMINPLAYERLIST;
        lbClear _listBox;
        {
            private _name = name _x;
            private _isMember = [_x] call A3A_fnc_isMember;
            private _playerUID = getPlayerUID _x;
            private _distance = format["%1 m", floor (player distance _x)];

            private _index = _listBox lnbAddRow [_name, _distance, _playerUID];
            if (_isMember) then {
                _listBox lnbSetColor [[_index,0], [0.2,0.6,0.2,1]]; // TODO UI-update: use defined color
            } else {
                _listBox lnbSetColor [[_index,0], [0.7,0.7,0.7,1]]; // TODO UI-update: use defined color
            };
        } forEach allPlayers;

        _listBox lnbSetCurSelRow 0;
        ["playerLbSelectionChanged"] spawn FUNC(playerManagementTab);
    };

    // Player Management
    case ("playerLbSelectionChanged"):
    {
        // Needs scheduled environment

        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _listBox = _display displayCtrl A3A_IDC_ADMINPLAYERLIST;
        private _index = lnbCurSelRow _listBox;
        private _playerUID = _listBox lnbText [_index, 2];
        Debug_1("_playerUID: %1", _playerUID);
        private _addButton = _display displayCtrl A3A_IDC_ADDMEMBERBUTTON;
        private _removeButton = _display displayCtrl A3A_IDC_REMOVEMEMBERBUTTON;

        // TODO UI-update: this probably needs some changes to work properly
        // private _player = allPlayers select _index;
        private _player = (str _playerUID) call BIS_fnc_getUnitByUID;
        Debug_1("_player: %1", _player);
        if ([_player] call A3A_fnc_isMember) then {
            _addButton ctrlShow false;
            _removeButton ctrlShow true;
        } else {
            _addButton ctrlShow true;
            _removeButton ctrlShow false;
        };
    };

    // Debug cases, to be removed/changed when merging
    case ("adminAddMember"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _listBox = _display displayCtrl A3A_IDC_ADMINPLAYERLIST;
        private _index = lbCurSel _listBox;
        _listBox lnbSetColor [[_index,0], [0.2,0.6,0.2,1]];
        // fakePlayers select _index setVariable ["isMember", true]; // TODO UI-update: use A3A_fnc_memberAdd
        ["playerLbSelectionChanged"] spawn FUNC(playerManagementTab);
    };

    case ("adminRemoveMember"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _listBox = _display displayCtrl A3A_IDC_ADMINPLAYERLIST;
        private _index = lbCurSel _listBox;
        _listBox lnbSetColor [[_index,0], [0.7,0.7,0.7,1]];
        // fakePlayers select _index setVariable ["isMember", false]; // TODO UI-update: use A3A_fnc_memberAdd
        ["playerLbSelectionChanged"] spawn FUNC(playerManagementTab);
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("Player management tab mode does not exist: %1", _mode);
    };
};
