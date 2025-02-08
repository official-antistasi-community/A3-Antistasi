/*
Maintainer: Caleb Serafin, DoomMetal
    Handles the initialization and updating of the Recruit Units dialog.
    This function should only be called from RecruitDialog onLoad and control activation EHs.

Arguments:
    <STRING> Mode, only possible value for this dialog is "onLoad"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for onLoad mode / Unscheduled for everything else unless specified
Public: No
Dependencies:
    None

Example:
    ["onLoad"] spawn FUNC(recruitDialog); // initialization

License: APL-ND

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[["_mode","onLoad"], ["_params",[]]];

switch (_mode) do
{
    case ("onLoad"):
    {
        Debug("RecruitDialog onLoad starting...");

        private _display = findDisplay A3A_IDD_RECRUITDIALOG;

        // Get controls
        private _militiamanIcon = _display displayCtrl A3A_IDC_RECRUITMILITIAMANICON;
        private _militiamanPriceText = _display displayCtrl  A3A_IDC_RECRUITMILITIAMANPRICE;
        private _militiamanButton = _display displayCtrl  A3A_IDC_RECRUITMILITIAMANBUTTON;
        private _autoriflemanIcon = _display displayCtrl  A3A_IDC_RECRUITAUTORIFLEMANICON;
        private _autoriflemanPriceText = _display displayCtrl  A3A_IDC_RECRUITAUTORIFLEMANPRICE;
        private _autoriflemanButton = _display displayCtrl  A3A_IDC_RECRUITAUTORIFLEMANBUTTON;
        private _grenadierIcon = _display displayCtrl  A3A_IDC_RECRUITGRENADIERICON;
        private _grenadierPriceText = _display displayCtrl  A3A_IDC_RECRUITGRENADIERPRICE;
        private _grenadierButton = _display displayCtrl  A3A_IDC_RECRUITGRENADIERBUTTON;
        private _antitankIcon = _display displayCtrl  A3A_IDC_RECRUITANTITANKICON;
        private _antitankPriceText = _display displayCtrl  A3A_IDC_RECRUITANTITANKPRICE;
        private _antitankButton = _display displayCtrl  A3A_IDC_RECRUITANTITANKBUTTON;
        private _medicIcon = _display displayCtrl  A3A_IDC_RECRUITMEDICICON;
        private _medicPriceText = _display displayCtrl  A3A_IDC_RECRUITMEDICPRICE;
        private _medicButton = _display displayCtrl  A3A_IDC_RECRUITMEDICBUTTON;
        private _marksmanIcon = _display displayCtrl  A3A_IDC_RECRUITMARKSMANICON;
        private _marksmanPriceText = _display displayCtrl  A3A_IDC_RECRUITMARKSMANPRICE;
        private _marksmanButton = _display displayCtrl  A3A_IDC_RECRUITMARKSMANBUTTON;
        private _engineerIcon = _display displayCtrl  A3A_IDC_RECRUITENGINEERICON;
        private _engineerPriceText = _display displayCtrl  A3A_IDC_RECRUITENGINEERPRICE;
        private _engineerButton = _display displayCtrl  A3A_IDC_RECRUITENGINEERBUTTON;
        private _bombSpecialistIcon = _display displayCtrl  A3A_IDC_RECRUITBOMBSPECIALISTICON;
        private _bombSpecialistPriceText = _display displayCtrl  A3A_IDC_RECRUITBOMBSPECIALISTPRICE;
        private _bombSpecialistButton = _display displayCtrl  A3A_IDC_RECRUITBOMBSPECIALISTBUTTON;

        // Get unit prices
        private _militiamanPrice = server getVariable FactionGet(reb,"unitRifle");
        private _autoriflemanPrice = server getVariable FactionGet(reb,"unitMG");
        private _grenadierPrice = server getVariable FactionGet(reb,"unitGL");
        private _antitankPrice = server getVariable FactionGet(reb,"unitLAT");
        private _medicPrice = server getVariable FactionGet(reb,"unitMedic");
        private _marksmanPrice = server getVariable FactionGet(reb,"unitSniper");
        private _engineerPrice = server getVariable FactionGet(reb,"unitEng");
        private _bombSpecialistPrice = server getVariable FactionGet(reb,"unitExp");

        // Update price labels
        _militiamanPriceText ctrlSetText ((str _militiamanPrice) + "€");
        _autoriflemanPriceText ctrlSetText ((str _autoriflemanPrice) + "€");
        _grenadierPriceText ctrlSetText ((str _grenadierPrice) + "€");
        _antitankPriceText ctrlSetText ((str _antitankPrice) + "€");
        _medicPriceText ctrlSetText ((str _medicPrice) + "€");
        _marksmanPriceText ctrlSetText ((str _marksmanPrice) + "€");
        _engineerPriceText ctrlSetText ((str _engineerPrice) + "€");
        _bombSpecialistPriceText ctrlSetText ((str _bombSpecialistPrice) + "€");

        // Disable buttons and darken icon if not enough money or HR for the unit
        private _money = player getVariable "moneyX";
        private _hr = server getVariable "hr";
        if (_money < _militiamanPrice || _hr < 1) then {
            _militiamanButton ctrlEnable false;
            _militiamanButton ctrlSetTooltip "You do not have enough money or HR for this unit type"; // TODO UI-update: stringtable
            _militiamanIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _autoriflemanPrice || _hr < 1) then {
            _autoriflemanButton ctrlEnable false;
            _autoriflemanButton ctrlSetTooltip "You do not have enough money or HR for this unit type"; // TODO UI-update: stringtable
            _autoriflemanIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _grenadierPrice || _hr < 1) then {
            _grenadierButton ctrlEnable false;
            _grenadierButton ctrlSetTooltip "You do not have enough money or HR for this unit type"; // TODO UI-update: stringtable
            _grenadierIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _antitankPrice || _hr < 1) then {
            _antitankButton ctrlEnable false;
            _antitankButton ctrlSetTooltip "You do not have enough money or HR for this unit type"; // TODO UI-update: stringtable
            _antitankIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _medicPrice || _hr < 1) then {
            _medicButton ctrlEnable false;
            _medicButton ctrlSetTooltip "You do not have enough money or HR for this unit type"; // TODO UI-update: stringtable
            _medicIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _marksmanPrice || _hr < 1) then {
            _marksmanButton ctrlEnable false;
            _marksmanButton ctrlSetTooltip "You do not have enough money or HR for this unit type"; // TODO UI-update: stringtable
            _marksmanIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _engineerPrice || _hr < 1) then {
            _engineerButton ctrlEnable false;
            _engineerButton ctrlSetTooltip "You do not have enough money or HR for this unit type"; // TODO UI-update: stringtable
            _engineerIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _bombSpecialistPrice || _hr < 1) then {
            _bombSpecialistButton ctrlEnable false;
            _bombSpecialistButton ctrlSetTooltip "You do not have enough money or HR for this unit type"; // TODO UI-update: stringtable
            _bombSpecialistIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };

        Debug("RecruitDialog onLoad complete.");
    };

    default {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("RecruitDialog mode does not exist: %1", _mode);
    };
};
