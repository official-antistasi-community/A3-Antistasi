/*
Maintainer: Caleb Serafin, DoomMetal
    Handles updating and controls on the Construct tab of the Main dialog.

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
    ["update"] call FUNC(constructTab);

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
        Trace("Updating Construct tab");
        // Show back button
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _backButton = _display displayCtrl A3A_IDC_MAINDIALOGBACKBUTTON;
        _backButton ctrlRemoveAllEventHandlers "MouseButtonClick";
        _backButton ctrlAddEventHandler ["MouseButtonClick", {
            ["switchTab", ["player"]] call FUNC(mainDialog);
        }];
        _backButton ctrlShow true;

        // Add contents to controlsGroup
        private _constructControlsGroup = _display displayCtrl A3A_IDC_CONSTRUCTGROUP;

        // Clear controlsgroup first
        {
            ctrlDelete _x;
        } forEach allControls _constructControlsGroup;

        // Get list of buildings along with construction times and costs
        private _constructionsList = [] call A3A_fnc_initBuildableObjects;

        private _added = 0;
        {
            private _className = _x select 0;
            private _buildTime = _x select 1;
            private _price = _x select 2;
            private _configClass = configFile >> "CfgVehicles" >> _className;
            private _displayName = getText (_configClass >> "displayName");
            private _editorPreview = getText (_configClass >> "editorPreview");

            // Add some extra padding to the top if there are 2 rows or less
            private _topPadding = if (count _constructionsList < 7) then {5 * GRID_H} else {0};
            private _itemXpos = 7 * GRID_W + ((7 * GRID_W + 44 * GRID_W) * (_added mod 3));
            private _itemYpos = (floor (_added / 3)) * (44 * GRID_H) + _topPadding;

            private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -1, _constructControlsGroup];
            _itemControlsGroup ctrlSetPosition [_itemXpos, _itemYpos, 44 * GRID_W, 37 * GRID_H];

            // Hide the group initially to hide flickering when creating stuff in them
            _itemControlsGroup ctrlSetFade 1;
            _itemControlsGroup ctrlCommit 0;

            private _previewPicture = _display ctrlCreate ["A3A_Picture", -1, _itemControlsGroup];
            _previewPicture ctrlSetPosition [0, 0, 44 * GRID_W, 25 * GRID_H];
            _previewPicture ctrlSetText _editorPreview;
            _previewPicture ctrlCommit 0;
            private _button = _display ctrlCreate ["A3A_ShortcutButton", -1, _itemControlsGroup];
            _button ctrlSetPosition [0, 25 * GRID_H, 44 * GRID_W, 12 * GRID_H];
            _button ctrlSetText _displayName;
            _button setVariable ["className", _className];
            _button ctrlAddEventHandler ["ButtonClick", {
                private _className = (_this # 0) getVariable "className";
                closeDialog 1;
                [_className] call A3A_fnc_build;
            }];
            _button ctrlCommit 0;
            // Only show price when applicable
            if (_price > 0) then
            {
                private _priceText = _display ctrlCreate ["A3A_InfoTextRight", -1, _itemControlsGroup];
                _priceText ctrlSetPosition[23 * GRID_W, 18 * GRID_H, 20 * GRID_W, 3 * GRID_H];
                _priceText ctrlSetText format ["%1 €",_price];
                _priceText ctrlCommit 0;
            };
            private _timeText = _display ctrlCreate ["A3A_InfoTextRight", -1, _itemControlsGroup]; // TODO UI-update: Add icon
            _timeText ctrlSetPosition[23 * GRID_W, 21 * GRID_H, 20 * GRID_W, 3 * GRID_H];
            _timeText ctrlSetText format ["%1 s",_buildTime];
            _timeText ctrlCommit 0;
            _itemControlsGroup ctrlSetFade 0;
            _itemControlsGroup ctrlCommit 0.1;

            _added = _added + 1;
        } forEach _constructionsList;
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("Construct tab mode does not exist: %1", _mode);
    };
};
