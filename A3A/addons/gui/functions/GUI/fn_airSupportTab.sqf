/*
Maintainer: Caleb Serafin, DoomMetal
    Handles updating and controls on the Air Support tab of the Main dialog.

Arguments:
    <STRING> Mode
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Unscheduled
Public: No
Dependencies:
    None

Example:
    ["update"] call FUNC(airSupportTab);

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
        Trace("Updating Air Support tab");
        // Show back button
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _backButton = _display displayCtrl A3A_IDC_MAINDIALOGBACKBUTTON;
        _backButton ctrlRemoveAllEventHandlers "MouseButtonClick";
        _backButton ctrlAddEventHandler ["MouseButtonClick", {
            ["switchTab", ["commander"]] call FUNC(mainDialog);
        }];
        _backButton ctrlShow true;

        // Display remaining air support points
        private _airSupportPoints = bombRuns;
        private _airSupportPointsText = _display displayCtrl A3A_IDC_AIRSUPPORTPOINTSTEXT;
        _airSupportPointsText ctrlSetText str _airSupportPoints;

        // Display name of aircraft used
        private _aircraftName = getText (configFile >> "CfgVehicles" >> vehSDKPlane >> "displayName");
        private _airSupportAircraftText = _display displayCtrl A3A_IDC_AIRSUPPORTAIRCRAFTTEXT;
        _airSupportAircraftText ctrlSetText _aircraftName;

        // If there are 0 air support points, disable buttons and set tooltip
        private _heIcon = _display displayCtrl A3A_IDC_AIRSUPPORTHEICON;
        private _heButton = _display displayCtrl A3A_IDC_AIRSUPPORTHEBUTTON;
        private _carpetIcon = _display displayCtrl A3A_IDC_AIRSUPPORTCARPETICON;
        private _carpetButton = _display displayCtrl A3A_IDC_AIRSUPPORTCARPETBUTTON;
        private _napalmIcon = _display displayCtrl A3A_IDC_AIRSUPPORTNAPALMICON;
        private _napalmButton = _display displayCtrl A3A_IDC_AIRSUPPORTNAPALMBUTTON;

        // Check if there are enough air support points
        if (_airSupportPoints < 1) then
        {
            Trace("No air support points, disabling buttons");
            _heIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            _heIcon ctrlSetTooltip localize "STR_antistasi_dialogs_main_air_support_no_points_tooltip";
            _heButton ctrlEnable false;
            _heButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_air_support_no_points_tooltip";
            _carpetIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            _carpetIcon ctrlSetTooltip localize "STR_antistasi_dialogs_main_air_support_no_points_tooltip";
            _carpetButton ctrlEnable false;
            _carpetButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_air_support_no_points_tooltip";
            _napalmIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            _napalmIcon ctrlSetTooltip localize "STR_antistasi_dialogs_main_air_support_no_points_tooltip";
            _napalmButton ctrlEnable false;
            _napalmButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_air_support_no_points_tooltip";
        };

        // TODO UI-update: Check for controlled airbases
        // {sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX == 0
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("Air Support tab mode does not exist: %1", _mode);
    };
};
