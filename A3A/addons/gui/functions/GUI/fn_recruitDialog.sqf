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

        private _money = if (player == theBoss) then { server getVariable "resourcesFIA" } else { player getVariable "moneyX" };
        private _hr = server getVariable "hr";
        call A3A_fnc_fetchRebelGear;

        {
            private _icon = _display displayCtrl _x#0;
            private _priceText = _display displayCtrl _x#1;
            private _button = _display displayCtrl _x#2;
            private _unitType = _x#3;
            private _price = server getVariable FactionGet(reb, _unitType);
            private _updatedPriceText = ((str _price) + "€");
            _priceText ctrlSetText _updatedPriceText;

            // Disable buttons and darken icon if not enough money or HR for the unit
            if (_money < _price || _hr < 1) then {
                _button ctrlEnable false;
                _button ctrlSetTooltip localize "STR_antistasi_dialogs_recruit_units_error";
                _icon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            };
            // Disable buttons and darken icon if not enough weapons
            if !([A3A_faction_reb get _unitType,false] call A3A_fnc_hasWeapons) then {
                _button ctrlEnable false;
                _button ctrlSetTooltip localize "STR_antistasi_dialogs_recruit_units_noWeapons";
                _icon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            };
        } forEach [
            // Icon IDC, Price IDC, Button IDC, Unit Type
            [A3A_IDC_RECRUITMILITIAMANICON, A3A_IDC_RECRUITMILITIAMANPRICE, A3A_IDC_RECRUITMILITIAMANBUTTON, "unitRifle"],
            [A3A_IDC_RECRUITAUTORIFLEMANICON, A3A_IDC_RECRUITAUTORIFLEMANPRICE, A3A_IDC_RECRUITAUTORIFLEMANBUTTON, "unitMG"],
            [A3A_IDC_RECRUITGRENADIERICON, A3A_IDC_RECRUITGRENADIERPRICE, A3A_IDC_RECRUITGRENADIERBUTTON, "unitGL"],
            [A3A_IDC_RECRUITANTITANKICON, A3A_IDC_RECRUITANTITANKPRICE, A3A_IDC_RECRUITANTITANKBUTTON, "unitLAT"],
            [A3A_IDC_RECRUITMEDICICON, A3A_IDC_RECRUITMEDICPRICE, A3A_IDC_RECRUITMEDICBUTTON, "unitMedic"],
            [A3A_IDC_RECRUITMARKSMANICON, A3A_IDC_RECRUITMARKSMANPRICE, A3A_IDC_RECRUITMARKSMANBUTTON, "unitSniper"],
            [A3A_IDC_RECRUITENGINEERICON, A3A_IDC_RECRUITENGINEERPRICE, A3A_IDC_RECRUITENGINEERBUTTON, "unitEng"],
            [A3A_IDC_RECRUITBOMBSPECIALISTICON, A3A_IDC_RECRUITBOMBSPECIALISTPRICE, A3A_IDC_RECRUITBOMBSPECIALISTBUTTON, "unitExp"],
            [A3A_IDC_RECRUITATMISSILEICON, A3A_IDC_RECRUITATMISSILEPRICE, A3A_IDC_RECRUITATMISSILEBUTTON, "unitAT"],
            [A3A_IDC_RECRUITAAMISSILEICON, A3A_IDC_RECRUITAAMISSILEPRICE, A3A_IDC_RECRUITAAMISSILEBUTTON, "unitAA"]
        ];

        Debug("RecruitDialog onLoad complete.");
    };

    default {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("RecruitDialog mode does not exist: %1", _mode);
    };
};
