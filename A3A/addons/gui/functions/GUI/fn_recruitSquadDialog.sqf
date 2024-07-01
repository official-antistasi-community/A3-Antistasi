/*
Maintainer: Caleb Serafin, DoomMetal
    Handles the initialization and updating of the Recruit Squad dialog.
    This function should only be called from RecruitSquadDialog onLoad and control activation EHs.

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
    ["update"] spawn FUNC(recruitDialog); // update

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
        Debug("RecruitSquadDialog onLoad starting...");

        // TODO UI-update: part of a temporary fix, to be removed
        vehQuery = nil;

        // Separated because initial "onLoad" needs scheduled env while other updates needs unscheduled
        ["update"] call FUNC(recruitSquadDialog);

        Debug("RecruitSquadDialog onLoad complete.");
    };

    case ("update"):
    {
        private _display = findDisplay A3A_IDD_RECRUITSQUADDIALOG;

        // Get controls
        private _infSquadIcon = _display displayCtrl A3A_IDC_RECRUITINFSQUADICON;
        private _infSquadPriceText = _display displayCtrl A3A_IDC_RECRUITINFSQUADPRICE;
        private _infSquadButton = _display displayCtrl A3A_IDC_RECRUITINFSQUADBUTTON;
        // TODO UI-update: add engineer squad back in
        // private _engSquadIcon = _display displayCtrl A3A_IDC_RECRUITENGSQUADICON;
        // private _engSquadPriceText = _display displayCtrl A3A_IDC_RECRUITENGSQUADPRICE;
        // private _engSquadButton = _display displayCtrl A3A_IDC_RECRUITENGSQUADBUTTON;
        private _infTeamIcon = _display displayCtrl A3A_IDC_RECRUITINFTEAMICON;
        private _infTeamPriceText = _display displayCtrl A3A_IDC_RECRUITINFTEAMPRICE;
        private _infTeamButton = _display displayCtrl A3A_IDC_RECRUITINFTEAMBUTTON;
        private _mgTeamIcon = _display displayCtrl A3A_IDC_RECRUITMGTEAMICON;
        private _mgTeamPriceText = _display displayCtrl A3A_IDC_RECRUITMGTEAMPRICE;
        private _mgTeamButton = _display displayCtrl A3A_IDC_RECRUITMGTEAMBUTTON;
        private _atTeamIcon = _display displayCtrl A3A_IDC_RECRUITATTEAMICON;
        private _atTeamPriceText = _display displayCtrl A3A_IDC_RECRUITATTEAMPRICE;
        private _atTeamButton = _display displayCtrl A3A_IDC_RECRUITATTEAMBUTTON;
        private _mortarTeamIcon = _display displayCtrl A3A_IDC_RECRUITMORTARTEAMICON;
        private _mortarTeamPriceText = _display displayCtrl A3A_IDC_RECRUITMORTARTEAMPRICE;
        private _mortarTeamButton = _display displayCtrl A3A_IDC_RECRUITMORTARTEAMBUTTON;
        private _sniperTeamIcon = _display displayCtrl A3A_IDC_RECRUITSNIPERTEAMICON;
        private _sniperTeamPriceText = _display displayCtrl A3A_IDC_RECRUITSNIPERTEAMPRICE;
        private _sniperTeamButton = _display displayCtrl A3A_IDC_RECRUITSNIPERTEAMBUTTON;
        private _atCarIcon = _display displayCtrl A3A_IDC_RECRUITATCARICON;
        private _atCarPriceText = _display displayCtrl A3A_IDC_RECRUITATCARPRICE;
        private _atCarButton = _display displayCtrl A3A_IDC_RECRUITATCARBUTTON;
        private _aaTruckIcon = _display displayCtrl A3A_IDC_RECRUITAATRUCKICON;
        private _aaTruckPriceText = _display displayCtrl A3A_IDC_RECRUITAATRUCKPRICE;
        private _aaTruckButton = _display displayCtrl A3A_IDC_RECRUITAATRUCKBUTTON;

        private _includeVehicleCheckbox = _display displayCtrl A3A_IDC_SQUADINCLUDEVEHICLECHECKBOX;

        // Get vehicle CB state
        private _includeVehicle = cbChecked _includeVehicleCheckbox;

        // Classnames for vehicles
        private _infSquadVehicle = "";
        // private _engSquadVehicle = "";
        private _infTeamVehicle = "";
        private _mgTeamVehicle = "";
        private _atTeamVehicle = "";
        private _mortarTeamVehicle = "";
        private _sniperTeamVehicle = "";
        // AT cars and AA trucks obviously already have vehicles by default

        if (_includeVehicle) then {
            _infSquadVehicle = [groupsSDKSquad] call A3A_fnc_getHCSquadVehicleType;
            // _engSquadVehicle = [groupsSDKSquadEng] call A3A_fnc_getHCSquadVehicleType;
            _infTeamVehicle = [groupsSDKmid] call A3A_fnc_getHCSquadVehicleType;
            _mgTeamVehicle = [SDKMGStatic] call A3A_fnc_getHCSquadVehicleType;
            _atTeamVehicle = [groupsSDKAT] call A3A_fnc_getHCSquadVehicleType;
            _mortarTeamVehicle = [SDKMortar] call A3A_fnc_getHCSquadVehicleType;
            _sniperTeamVehicle = [groupsSDKSniper] call A3A_fnc_getHCSquadVehicleType;
        };

        // Set variables for squad and vehicle types on the button
        _infSquadButton setVariable ["squadType", groupsSDKSquad];
        _infSquadButton setVariable ["vehicle", _infSquadVehicle];
        _infTeamButton setVariable ["squadType", groupsSDKmid];
        _infTeamButton setVariable ["vehicle", _infTeamVehicle];
        _mgTeamButton setVariable ["squadType", SDKMGStatic];
        _mgTeamButton setVariable ["vehicle", _mgTeamVehicle];
        _atTeamButton setVariable ["squadType", groupsSDKAT];
        _atTeamButton setVariable ["vehicle", _atTeamVehicle];
        _mortarTeamButton setVariable ["squadType", SDKMortar];
        _mortarTeamButton setVariable ["vehicle", _mortarTeamVehicle];
        _sniperTeamButton setVariable ["squadType", groupsSDKSniper];
        _sniperTeamButton setVariable ["vehicle", _sniperTeamVehicle];
        _atCarButton setVariable ["squadType", vehSDKAT];
        _atCarButton setVariable ["vehicle", ""];
        _aaTruckButton setVariable ["squadType", staticAAteamPlayer];
        _aaTruckButton setVariable ["vehicle", ""];

        // Get prices
        private _infSquadPrice = [groupsSDKSquad, _infSquadVehicle] call A3A_fnc_getHCSquadPrice;
        // private _engSquadPrice = [groupsSDKSquadEng, _engSquadVehicle] call A3A_fnc_getHCSquadPrice;
        private _infTeamPrice = [groupsSDKmid, _infTeamVehicle] call A3A_fnc_getHCSquadPrice;
        private _mgTeamPrice = [SDKMGStatic, _mgTeamVehicle] call A3A_fnc_getHCSquadPrice;
        private _atTeamPrice = [groupsSDKAT, _atTeamVehicle] call A3A_fnc_getHCSquadPrice;
        private _mortarTeamPrice = [SDKMortar, _mortarTeamVehicle] call A3A_fnc_getHCSquadPrice;
        private _sniperTeamPrice = [groupsSDKSniper, _sniperTeamVehicle] call A3A_fnc_getHCSquadPrice;
        private _atCarPrice = [vehSDKAT] call A3A_fnc_getHCSquadPrice;
        private _aaTruckPrice = [staticAAteamPlayer] call A3A_fnc_getHCSquadPrice;

        // Split money and HR from price array
        _infSquadPrice params ["_infSquadMoney", "_infSquadHr"];
        // _engSquadPrice params ["_engSquadMoney", "_engSquadHr"];
        _infTeamPrice params ["_infTeamMoney", "_infTeamHr"];
        _mgTeamPrice params ["_mgTeamMoney", "_mgTeamHr"];
        _atTeamPrice params ["_atTeamMoney", "_atTeamHr"];
        _mortarTeamPrice params ["_mortarTeamMoney", "_mortarTeamHr"];
        _sniperTeamPrice params ["_sniperTeamMoney", "_sniperTeamHr"];
        _atCarPrice params ["_atCarMoney", "_atCarHr"];
        _aaTruckPrice params ["_aaTruckMoney", "_aaTruckHr"];

        // Update price labels
        _infSquadPriceText ctrlSetText (format ["%1 € %2 HR", _infSquadMoney, _infSquadHr]);
        // _engSquadPriceText ctrlSetText (format ["%1 €, %2 HR", _engSquadPrice, _engSquadHr]);
        _infTeamPriceText ctrlSetText (format ["%1 € %2 HR", _infTeamMoney, _infTeamHr]);
        _mgTeamPriceText ctrlSetText (format ["%1 € %2 HR", _mgTeamMoney, _mgTeamHr]);
        _atTeamPriceText ctrlSetText (format ["%1 € %2 HR", _atTeamMoney, _atTeamHr]);
        _mortarTeamPriceText ctrlSetText (format ["%1 € %2 HR", _mortarTeamMoney, _mortarTeamHr]);
        _sniperTeamPriceText ctrlSetText (format ["%1 € %2 HR", _sniperTeamMoney, _sniperTeamHr]);
        _atCarPriceText ctrlSetText (format ["%1 € %2 HR", _atCarMoney, _atCarHr]);
        _aaTruckPriceText ctrlSetText (format ["%1 € %2 HR", _aaTruckMoney, _aaTruckHr]);

        // Disable buttons and darken icon if not enough money or HR for the squad
        private _money = server getVariable "resourcesFIA";
        private _hr = server getVariable "hr";
        if (_money < _infSquadMoney || _hr < _infSquadHr) then {
            _infSquadButton ctrlEnable false;
            _infSquadButton ctrlSetTooltip "You do not have enough money or HR for this group type"; // TODO UI-update: stringtable
            _infSquadIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        // TODO UI-update: reenable this when eng squad button is back in
        /* if (_money < _engSquadMoney || _hr < _engSquadHr) then {
            _engSquadButton ctrlEnable false;
            _engSquadButton ctrlSetTooltip "You do not have enough money or HR for this group type"; // TODO UI-update: stringtable
            _engSquadIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        }; */
        if (_money < _infTeamMoney || _hr < _infTeamHr) then {
            _infTeamButton ctrlEnable false;
            _infTeamButton ctrlSetTooltip "You do not have enough money or HR for this group type"; // TODO UI-update: stringtable
            _infTeamIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _mgTeamMoney || _hr < _mgTeamHr) then {
            _mgTeamButton ctrlEnable false;
            _mgTeamButton ctrlSetTooltip "You do not have enough money or HR for this group type"; // TODO UI-update: stringtable
            _mgTeamIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _atTeamMoney || _hr < _atTeamHr) then {
            _atTeamButton ctrlEnable false;
            _atTeamButton ctrlSetTooltip "You do not have enough money or HR for this group type"; // TODO UI-update: stringtable
            _atTeamIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _mortarTeamMoney || _hr < _mortarTeamHr) then {
            _mortarTeamButton ctrlEnable false;
            _mortarTeamButton ctrlSetTooltip "You do not have enough money or HR for this group type"; // TODO UI-update: stringtable
            _mortarTeamIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _sniperTeamMoney || _hr < _sniperTeamHr) then {
            _sniperTeamButton ctrlEnable false;
            _sniperTeamButton ctrlSetTooltip "You do not have enough money or HR for this group type"; // TODO UI-update: stringtable
            _sniperTeamIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _atCarMoney || _hr < _atCarHr) then {
            _atCarButton ctrlEnable false;
            _atCarButton ctrlSetTooltip "You do not have enough money or HR for this group type"; // TODO UI-update: stringtable
            _atCarIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _aaTruckMoney || _hr < _aaTruckHr) then {
            _aaTruckButton ctrlEnable false;
            _aaTruckButton ctrlSetTooltip "You do not have enough money or HR for this group type"; // TODO UI-update: stringtable
            _aaTruckIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
    };

    case ("buySquad"):
    {
        private _button = (_params # 0) # 0;
        private _squadType = _button getVariable ["squadType", []];
        private _vehicle = _button getVariable ["vehicle", ""];
        // TODO UI-update: Temporary fix so this just works, to be replaced with something more sensible
        if (_vehicle isNotEqualTo "") then {vehQuery = true};
        closeDialog 1;
        // Previous format, to be changed back to this
        // [_squadType, _vehicle] spawn A3A_fnc_addFIAsquadHC;
        [_squadType] spawn A3A_fnc_addFIAsquadHC;
    };

    default {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("RecruitSquadDialog mode does not exist: %1", _mode);
    };
};
