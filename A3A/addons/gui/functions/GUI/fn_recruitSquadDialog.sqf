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
        private _engSquadIcon = _display displayCtrl A3A_IDC_RECRUITENGSQUADICON;
        private _engSquadPriceText = _display displayCtrl A3A_IDC_RECRUITENGSQUADPRICE;
        private _engSquadButton = _display displayCtrl A3A_IDC_RECRUITENGSQUADBUTTON;
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
        private _mgCarIcon = _display displayCtrl A3A_IDC_RECRUITMGCARICON;
        private _mgCarPriceText = _display displayCtrl A3A_IDC_RECRUITMGCARPRICE;
        private _mgCarButton = _display displayCtrl A3A_IDC_RECRUITMGCARBUTTON;
        private _atCarIcon = _display displayCtrl A3A_IDC_RECRUITATCARICON;
        private _atCarPriceText = _display displayCtrl A3A_IDC_RECRUITATCARPRICE;
        private _atCarButton = _display displayCtrl A3A_IDC_RECRUITATCARBUTTON;
        private _aaTruckIcon = _display displayCtrl A3A_IDC_RECRUITAATRUCKICON;
        private _aaTruckPriceText = _display displayCtrl A3A_IDC_RECRUITAATRUCKPRICE;
        private _aaTruckButton = _display displayCtrl A3A_IDC_RECRUITAATRUCKBUTTON;

        private _includeVehicleCheckbox = _display displayCtrl A3A_IDC_SQUADINCLUDEVEHICLECHECKBOX;

        // Get vehicle CB state
        private _includeVehicle = cbChecked _includeVehicleCheckbox;

        // Define groups
        private _groupsSDKSquad =FactionGet(reb,"groupSquad");
        private _groupsSDKSquadEng = FactionGet(reb,"groupSquadEng");
        private _groupsSDKMid = FactionGet(reb,"groupMedium");
        private _SDKMGStatic = FactionGet(reb,"staticMGs")#0;
        private _groupsSDKAT = FactionGet(reb,"groupAT");
        private _SDKMortar = FactionGet(reb,"staticMortars")#0;
        private _groupsSDKSniper = FactionGet(reb,"groupSniper");
        private _vehSDKMG = FactionGet(reb,"vehiclesLightArmed")#0;
        private _vehSDKAT = FactionGet(reb,"vehiclesAT")#0;

        // Special case for AA: Specify static AA if there are no AA vehicles
        private _rebAACars = FactionGet(reb,"vehiclesAA");
        private _vehSDKAA = if (_rebAACars isEqualTo []) then { FactionGet(reb,"staticAA")#0 } else { _rebAACars#0 };
        
        // Classnames for vehicles
        private _infSquadVehicle = "";
        private _engSquadVehicle = "";
        private _infTeamVehicle = "";
        private _mgTeamVehicle = "";
        private _atTeamVehicle = "";
        private _mortarTeamVehicle = "";
        private _sniperTeamVehicle = "";
        // AT cars and AA trucks obviously already have vehicles by default

        if (_includeVehicle) then {
            _infSquadVehicle = [_groupsSDKSquad] call A3A_fnc_getHCSquadVehicleType;
            _engSquadVehicle = [_groupsSDKSquadEng] call A3A_fnc_getHCSquadVehicleType;
            _infTeamVehicle = [_groupsSDKmid] call A3A_fnc_getHCSquadVehicleType;
            _mgTeamVehicle = [_SDKMGStatic] call A3A_fnc_getHCSquadVehicleType;
            _atTeamVehicle = [_groupsSDKAT] call A3A_fnc_getHCSquadVehicleType;
            _mortarTeamVehicle = [_SDKMortar] call A3A_fnc_getHCSquadVehicleType;
            _sniperTeamVehicle = [_groupsSDKSniper] call A3A_fnc_getHCSquadVehicleType;
        };

        // Set variables for squad and vehicle types on the button
        _infSquadButton setVariable ["squadType", _groupsSDKSquad];
        _infSquadButton setVariable ["vehicle", _infSquadVehicle];
        _engSquadButton setVariable ["squadType", _groupsSDKSquadEng];
        _engSquadButton setVariable ["vehicle", _engSquadVehicle];
        _infTeamButton setVariable ["squadType", _groupsSDKmid];
        _infTeamButton setVariable ["vehicle", _infTeamVehicle];
        _mgTeamButton setVariable ["squadType", _SDKMGStatic];
        _mgTeamButton setVariable ["vehicle", _mgTeamVehicle];
        _atTeamButton setVariable ["squadType", _groupsSDKAT];
        _atTeamButton setVariable ["vehicle", _atTeamVehicle];
        _mortarTeamButton setVariable ["squadType", _SDKMortar];
        _mortarTeamButton setVariable ["vehicle", _mortarTeamVehicle];
        _sniperTeamButton setVariable ["squadType", _groupsSDKSniper];
        _sniperTeamButton setVariable ["vehicle", _sniperTeamVehicle];
        _mgCarButton setVariable ["squadType", _vehSDKMG];
        _mgCarButton setVariable ["vehicle", ""];
        _atCarButton setVariable ["squadType", _vehSDKAT];
        _atCarButton setVariable ["vehicle", ""];
        _aaTruckButton setVariable ["squadType", _vehSDKAA];
        _aaTruckButton setVariable ["vehicle", ""];

        // Get prices
        private _infSquadPrice = [_groupsSDKSquad, _infSquadVehicle] call A3A_fnc_getHCSquadPrice;
        private _engSquadPrice = [_groupsSDKSquadEng, _engSquadVehicle] call A3A_fnc_getHCSquadPrice;
        private _infTeamPrice = [_groupsSDKmid, _infTeamVehicle] call A3A_fnc_getHCSquadPrice;
        private _mgTeamPrice = [_SDKMGStatic, _mgTeamVehicle] call A3A_fnc_getHCSquadPrice;
        private _atTeamPrice = [_groupsSDKAT, _atTeamVehicle] call A3A_fnc_getHCSquadPrice;
        private _mortarTeamPrice = [_SDKMortar, _mortarTeamVehicle] call A3A_fnc_getHCSquadPrice;
        private _sniperTeamPrice = [_groupsSDKSniper, _sniperTeamVehicle] call A3A_fnc_getHCSquadPrice;
        private _mgCarPrice = [_vehSDKMG] call A3A_fnc_getHCSquadPrice;
        private _atCarPrice = [_vehSDKAT] call A3A_fnc_getHCSquadPrice;
        private _aaTruckPrice = [_vehSDKAA] call A3A_fnc_getHCSquadPrice;

        // Split money and HR from price array
        _infSquadPrice params ["_infSquadMoney", "_infSquadHr"];
        _engSquadPrice params ["_engSquadMoney", "_engSquadHr"];
        _infTeamPrice params ["_infTeamMoney", "_infTeamHr"];
        _mgTeamPrice params ["_mgTeamMoney", "_mgTeamHr"];
        _atTeamPrice params ["_atTeamMoney", "_atTeamHr"];
        _mortarTeamPrice params ["_mortarTeamMoney", "_mortarTeamHr"];
        _sniperTeamPrice params ["_sniperTeamMoney", "_sniperTeamHr"];
        _mgCarPrice params ["_mgCarMoney", "_mgCarHr"];
        _atCarPrice params ["_atCarMoney", "_atCarHr"];
        _aaTruckPrice params ["_aaTruckMoney", "_aaTruckHr"];

        // Update price labels
        _infSquadPriceText ctrlSetText (format ["%1 € %2 HR", _infSquadMoney, _infSquadHr]);
        _engSquadPriceText ctrlSetText (format ["%1 €, %2 HR", _engSquadMoney, _engSquadHr]);
        _infTeamPriceText ctrlSetText (format ["%1 € %2 HR", _infTeamMoney, _infTeamHr]);
        _mgTeamPriceText ctrlSetText (format ["%1 € %2 HR", _mgTeamMoney, _mgTeamHr]);
        _atTeamPriceText ctrlSetText (format ["%1 € %2 HR", _atTeamMoney, _atTeamHr]);
        _mortarTeamPriceText ctrlSetText (format ["%1 € %2 HR", _mortarTeamMoney, _mortarTeamHr]);
        _sniperTeamPriceText ctrlSetText (format ["%1 € %2 HR", _sniperTeamMoney, _sniperTeamHr]);
        _mgCarPriceText ctrlSetText (format ["%1 € %2 HR", _mgCarMoney, _mgCarHr]);
        _atCarPriceText ctrlSetText (format ["%1 € %2 HR", _atCarMoney, _atCarHr]);
        _aaTruckPriceText ctrlSetText (format ["%1 € %2 HR", _aaTruckMoney, _aaTruckHr]);

        // Disable buttons and darken icon if not enough money or HR for the squad
        private _money = server getVariable "resourcesFIA";
        private _hr = server getVariable "hr";
        if (_money < _infSquadMoney || _hr < _infSquadHr) then {
            _infSquadButton ctrlEnable false;
            _infSquadButton ctrlSetTooltip localize "STR_antistasi_recruit_squad_error";
            _infSquadIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        // TODO UI-update: reenable this when eng squad button is back in
        if (_money < _engSquadMoney || _hr < _engSquadHr) then {
            _engSquadButton ctrlEnable false;
            _engSquadButton ctrlSetTooltip localize "STR_antistasi_recruit_squad_error";
            _engSquadIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _infTeamMoney || _hr < _infTeamHr) then {
            _infTeamButton ctrlEnable false;
            _infTeamButton ctrlSetTooltip localize "STR_antistasi_recruit_squad_error";
            _infTeamIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _mgTeamMoney || _hr < _mgTeamHr) then {
            _mgTeamButton ctrlEnable false;
            _mgTeamButton ctrlSetTooltip localize "STR_antistasi_recruit_squad_error";
            _mgTeamIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _atTeamMoney || _hr < _atTeamHr) then {
            _atTeamButton ctrlEnable false;
            _atTeamButton ctrlSetTooltip localize "STR_antistasi_recruit_squad_error";
            _atTeamIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _mortarTeamMoney || _hr < _mortarTeamHr) then {
            _mortarTeamButton ctrlEnable false;
            _mortarTeamButton ctrlSetTooltip localize "STR_antistasi_recruit_squad_error";
            _mortarTeamIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _sniperTeamMoney || _hr < _sniperTeamHr) then {
            _sniperTeamButton ctrlEnable false;
            _sniperTeamButton ctrlSetTooltip localize "STR_antistasi_recruit_squad_error";
            _sniperTeamIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _mgCarMoney || _hr < _mgCarHr) then {
            _atCarButton ctrlEnable false;
            _atCarButton ctrlSetTooltip localize "STR_antistasi_recruit_squad_error";
            _atCarIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _atCarMoney || _hr < _atCarHr) then {
            _atCarButton ctrlEnable false;
            _atCarButton ctrlSetTooltip localize "STR_antistasi_recruit_squad_error";
            _atCarIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
        if (_money < _aaTruckMoney || _hr < _aaTruckHr) then {
            _aaTruckButton ctrlEnable false;
            _aaTruckButton ctrlSetTooltip localize "STR_antistasi_recruit_squad_error";
            _aaTruckIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };
    };

    case ("buySquad"):
    {
        private _button = (_params # 0) # 0;
        private _squadType = _button getVariable ["squadType", []];
        private _vehicle = _button getVariable ["vehicle", ""];
        // Get vehicle CB state
        private _display = findDisplay A3A_IDD_RECRUITSQUADDIALOG;
        private _includeVehicleCheckbox = _display displayCtrl A3A_IDC_SQUADINCLUDEVEHICLECHECKBOX;
        private _includeVehicle = cbChecked _includeVehicleCheckbox;

        closeDialog 1;
        // Previous format, to be changed back to this
        // [_squadType, _vehicle] spawn A3A_fnc_addFIAsquadHC;
        [_squadType, "", _includeVehicle] spawn A3A_fnc_addFIAsquadHC;
    };

    default {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("RecruitSquadDialog mode does not exist: %1", _mode);
    };
};
