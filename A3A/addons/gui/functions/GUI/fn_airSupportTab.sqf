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
        private _airSupportPoints = floor bombRuns;
        private _strikeCap = (4 + tierWar*2);
        private _airStrikeCapInfo = format ["%1/%2",str _airSupportPoints,str _strikeCap];
        private _airSupportPointsText = _display displayCtrl A3A_IDC_AIRSUPPORTPOINTSTEXT;
        _airSupportPointsText ctrlSetText _airStrikeCapInfo;

        // Display name of aircraft used
        private _aircraftName = getText (configFile >> "CfgVehicles" >> ((FactionGet(reb,"vehiclesPlane")) # 0) >> "displayName");
        private _airSupportAircraftText = _display displayCtrl A3A_IDC_AIRSUPPORTAIRCRAFTTEXT;
        _airSupportAircraftText ctrlSetText _aircraftName;

        // If there are 0 air support points, disable buttons and set tooltip
        private _heIcon = _display displayCtrl A3A_IDC_AIRSUPPORTHEICON;
        private _heButton = _display displayCtrl A3A_IDC_AIRSUPPORTHEBUTTON;
        private _carpetIcon = _display displayCtrl A3A_IDC_AIRSUPPORTCARPETICON;
        private _carpetButton = _display displayCtrl A3A_IDC_AIRSUPPORTCARPETBUTTON;
        private _napalmIcon = _display displayCtrl A3A_IDC_AIRSUPPORTNAPALMICON;
        private _napalmButton = _display displayCtrl A3A_IDC_AIRSUPPORTNAPALMBUTTON;
        _heButton ctrlSetStructuredText parseText localize "STR_antistasi_dialogs_main_air_support_he_bombs";
        _carpetButton ctrlSetStructuredText parseText localize "STR_antistasi_dialogs_main_air_support_carpet_bombing";
        _napalmButton ctrlSetStructuredText parseText localize "STR_antistasi_dialogs_main_air_support_napalm";

        private _bombRunCosts = createHashMapFromArray [
            ["HE",1],
            ["CARPET",1],
            ["NAPALM",3]
        ];
        private _hasNoAirport = ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX == 0);
        private _colorDisabled = ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        {
            _x params ["_type","_button","_icon"];
            private _cost = _bombRunCosts get _type;
            private _cannotAfford = (_cost > _airSupportPoints);
            if (_cannotAfford || _hasNoAirport) then
            {
                private _failMessage = "";
                if (_cannotAfford) then
                {
                    Trace_1("No air support points, disabling button %1",_type);
                    _failMessage = localize "STR_antistasi_dialogs_main_air_support_no_points_tooltip";
                } else {
                    Trace_1("No airports, disabling button %1",_type);
                    _failMessage = localize "STR_antistasi_dialogs_main_air_support_no_base_tooltip";
                };
                _icon ctrlSetTextColor _colorDisabled;
                _icon ctrlSetTooltip _failMessage;
                _button ctrlEnable false;
                _button ctrlSetTooltip _failMessage;
            };
        } forEach [["HE",_heButton,_heIcon],["CARPET",_carpetButton,_carpetIcon],["NAPALM",_napalmButton,_napalmIcon]];
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("Air Support tab mode does not exist: %1", _mode);
    };
};
