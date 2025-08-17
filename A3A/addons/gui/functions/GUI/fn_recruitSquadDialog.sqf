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

        private _includeVehicleCheckbox = _display displayCtrl A3A_IDC_SQUADINCLUDEVEHICLECHECKBOX;

        // Get vehicle CB state
        private _includeVehicle = cbChecked _includeVehicleCheckbox;

        private _money = server getVariable "resourcesFIA";
        private _hr = server getVariable "hr";

        {
            private _icon = _display displayCtrl _x#0;
            private _priceText = _display displayCtrl _x#1;
            private _button = _display displayCtrl _x#2;
            private _group = if (_x#3 isEqualTo "vehiclesAA" && {(FactionGet(reb,_x#3)) isEqualTo []}) then {FactionGet(reb,"staticAA")#0} else {_x#3};
            if
            private _hasVehicle = (_icon in [A3A_IDC_RECRUITMGCARICON, A3A_IDC_RECRUITATCARICON, A3A_IDC_RECRUITAATRUCKICON]);
            if (_includeVehicle && {!_hasVehicle}) then {
                _vehicle = [_group] call A3A_fnc_getHCSquadVehicleType;
            };
            if (isNull _group) exitWith {
                _button ctrlEnable false;
                _button ctrlSetTooltip localize "STR_antistasi_recruit_squad_notCompatible";
                _icon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            };
            _button setVariable ["squadType", _group];
            _button setVariable ["vehicle", if (_hasVehicle) then {""} else {_vehicle}];
            private _price = [_group, _vehicle] call A3A_fnc_getHCSquadPrice;
            _price params ["_reqMoney", "_reqHR"];
            _priveText ctrlSetText (format ["%1 € %2 HR", _reqMoney, _reqHR]);
            if (_money < _reqMoney || _hr < _reqHR) then {
                _button ctrlEnable false;
                _button ctrlSetTooltip localize "STR_antistasi_recruit_squad_error";
                _icon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            };
        } forEach [
            // Icon IDC, Price IDC, Button IDC, Group
            [A3A_IDC_RECRUITINFSQUADICON, A3A_IDC_RECRUITINFSQUADPRICE, A3A_IDC_RECRUITINFSQUADBUTTON, FactionGet(reb,"groupSquad")],
            [A3A_IDC_RECRUITENGSQUADICON, A3A_IDC_RECRUITENGSQUADPRICE, A3A_IDC_RECRUITENGSQUADBUTTON, FactionGet(reb,"groupSquadEng")],
            [A3A_IDC_RECRUITINFTEAMICON, A3A_IDC_RECRUITINFTEAMPRICE, A3A_IDC_RECRUITINFTEAMBUTTON, FactionGet(reb,"groupMedium")],
            [A3A_IDC_RECRUITMGTEAMICON, A3A_IDC_RECRUITMGTEAMPRICE, A3A_IDC_RECRUITMGTEAMBUTTON, FactionGet(reb,"staticMGs")#0],
            [A3A_IDC_RECRUITATTEAMICON, A3A_IDC_RECRUITATTEAMPRICE, A3A_IDC_RECRUITATTEAMBUTTON, FactionGet(reb,"groupAT")],
            [A3A_IDC_RECRUITMORTARTEAMICON, A3A_IDC_RECRUITMORTARTEAMPRICE, A3A_IDC_RECRUITMORTARTEAMBUTTON, FactionGet(reb,"staticMortars")#0],
            [A3A_IDC_RECRUITSNIPERTEAMICON, A3A_IDC_RECRUITSNIPERTEAMPRICE, A3A_IDC_RECRUITSNIPERTEAMBUTTON, FactionGet(reb,"groupSniper")],
            [A3A_IDC_RECRUITMGCARICON, A3A_IDC_RECRUITMGCARPRICE, A3A_IDC_RECRUITMGCARBUTTON, FactionGet(reb,"vehiclesLightArmed")#0],
            [A3A_IDC_RECRUITATCARICON, A3A_IDC_RECRUITATCARPRICE, A3A_IDC_RECRUITATCARBUTTON, FactionGet(reb,"vehiclesAT")#0],
            [A3A_IDC_RECRUITAATRUCKICON, A3A_IDC_RECRUITAATRUCKPRICE, A3A_IDC_RECRUITAATRUCKBUTTON, "vehiclesAA"]
        ];
        // Readability improvement? Yeah, probably...
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
