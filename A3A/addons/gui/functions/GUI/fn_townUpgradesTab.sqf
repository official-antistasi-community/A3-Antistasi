/*
Maintainer: Shoter
    Handles the Town upgrades tab of the Buy Vehicle dialog: a town selector and one card per upgrade type.
    Cards are built once on load, changing the town only refreshes prices, tooltips and the enabled state.

Arguments:
    <STRING> Mode: "onLoad", "townSelected" or "buyClicked"
    <ARRAY<ANY>> Params, "buyClicked" takes the clicked button control

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for onLoad (called from the dialog onLoad), Unscheduled otherwise
Public: No
Dependencies:
    A3A_townUpgradeHM, A3A_townUpgradeOrder, A3A_cityInvest, A3A_fnc_townUpgradePrice, A3A_fnc_townUpgradeHas, A3A_fnc_townKitBuy

Example:
    ["onLoad"] call A3A_GUI_fnc_townUpgradesTab;

License: APL-ND
*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_mode", "onLoad"], ["_params", []]];

private _display = findDisplay A3A_IDD_BUYVEHICLEDIALOG;
private _tab = _display displayCtrl A3A_IDC_BUYTOWNUPGRADESMAIN;
private _combo = _display displayCtrl A3A_IDC_TOWNUPGRADESTOWNCOMBO;
private _infoText = _display displayCtrl A3A_IDC_TOWNUPGRADESINFO;

// Card geometry in grid units, same as the Junkyard dialog
#define CARD_W 44
#define CARD_H 46
#define CARD_GAP_X 7
#define CARD_GAP_Y 3
#define PICTURE_H 22

switch (_mode) do
{
    case ("onLoad"):
    {
        if (isNil "A3A_townUpgradeHM") exitWith { Error("Town upgrade data has not arrived on this client") };
        private _cardsGroup = _display displayCtrl A3A_IDC_TOWNUPGRADESGROUP;
        private _cards = [];

        {
            private _id = _x;
            (A3A_townUpgradeHM get _id) params ["_className", "", "", "", "_bonus", ["_bonus2", 0]];
            private _editorPreview = getText (configFile >> "CfgVehicles" >> _className >> "editorPreview");
            if (!fileExists _editorPreview) then { _editorPreview = A3A_PlaceHolder_NoVehiclePreview };
            private _name = localize format ["STR_A3A_fn_townUpgrades_name_%1", _id];
            private _description = format [localize format ["STR_A3A_fn_townUpgrades_desc_%1", _id], _bonus, _bonus2];

            private _itemXpos = CARD_GAP_X * GRID_W + ((CARD_GAP_X + CARD_W) * GRID_W) * (_forEachIndex mod 3);
            private _itemYpos = CARD_GAP_Y * GRID_H + (floor (_forEachIndex / 3)) * ((CARD_H + CARD_GAP_Y) * GRID_H);

            private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -1, _cardsGroup];
            _itemControlsGroup ctrlSetPosition [_itemXpos, _itemYpos, CARD_W * GRID_W, CARD_H * GRID_H];
            _itemControlsGroup ctrlCommit 0;

            private _previewPicture = _display ctrlCreate ["A3A_Picture", -1, _itemControlsGroup];
            _previewPicture ctrlSetPosition [0, 0, CARD_W * GRID_W, PICTURE_H * GRID_H];
            _previewPicture ctrlSetText _editorPreview;
            _previewPicture ctrlCommit 0;

            private _priceText = _display ctrlCreate ["A3A_InfoTextRight", -1, _itemControlsGroup];
            _priceText ctrlSetPosition [23 * GRID_W, (PICTURE_H - 4) * GRID_H, 20 * GRID_W, 3 * GRID_H];
            _priceText ctrlCommit 0;

            private _descText = _display ctrlCreate ["A3A_StructuredText", -1, _itemControlsGroup];
            _descText ctrlSetPosition [1 * GRID_W, (PICTURE_H + 0.5) * GRID_H, (CARD_W - 2) * GRID_W, 12 * GRID_H];
            _descText ctrlSetStructuredText parseText format ["<t size='0.7'>%1</t>", _description];
            _descText ctrlCommit 0;

            private _button = _display ctrlCreate ["A3A_ShortcutButton", -1, _itemControlsGroup];
            _button ctrlSetPosition [0, (CARD_H - 10) * GRID_H, CARD_W * GRID_W, 10 * GRID_H];
            _button ctrlSetText _name;
            _button setVariable ["id", _id];
            _button ctrlAddEventHandler ["ButtonClick", { ["buyClicked", [_this # 0]] call A3A_GUI_fnc_townUpgradesTab }];
            _button ctrlCommit 0;

            _cards pushBack [_id, _button, _priceText];
        } forEach A3A_townUpgradeOrder;
        _tab setVariable ["cards", _cards];

        // Rebel-held towns, alphabetical
        private _towns = citiesX select { sidesX getVariable [_x, sideUnknown] == teamPlayer and {!(_x in destroyedSites)} };
        _towns sort true;
        lbClear _combo;
        {
            private _index = _combo lbAdd _x;
            _combo lbSetData [_index, _x];
        } forEach _towns;

        if (_towns isNotEqualTo []) then { _combo lbSetCurSel 0 };
        ["townSelected"] call A3A_GUI_fnc_townUpgradesTab;
    };

    case ("townSelected"):
    {
        private _index = lbCurSel _combo;
        private _city = if (_index < 0) then { "" } else { _combo lbData _index };
        private _isBoss = player == theBoss;
        private _funds = server getVariable ["resourcesFIA", 0];

        if (_city == "") then {
            _infoText ctrlSetText (localize "STR_antistasi_dialogs_buy_town_upgrades_no_towns");
        } else {
            _infoText ctrlSetText format [localize "STR_antistasi_dialogs_buy_town_upgrades_info", _funds, (A3A_cityData getVariable [_city, [0]]) # 0];
        };

        {
            _x params ["_id", "_button", "_priceText"];
            if (_city == "") then {
                _priceText ctrlSetText "";
                _button ctrlEnable false;
                _button ctrlSetTooltip (localize "STR_antistasi_dialogs_buy_town_upgrades_no_towns");
                continue;
            };

            private _name = localize format ["STR_A3A_fn_townUpgrades_name_%1", _id];
            private _price = [_id, _city] call A3A_fnc_townUpgradePrice;
            _priceText ctrlSetText format ["%1 €", _price];

            // Empty reason means the card can be bought
            private _blocker = call {
                if (!_isBoss) exitWith { localize "STR_A3A_fn_townUpgrades_commanderOnly" };
                if ([_city, _id] call A3A_fnc_townUpgradeHas) exitWith { format [localize "STR_A3A_fn_townUpgrades_alreadyInstalled", _city, _name] };
                if (_funds < _price) exitWith { format [localize "STR_A3A_fn_townUpgrades_noMoney", _price] };
                "";
            };
            _button ctrlEnable (_blocker == "");
            if (_blocker == "") then { _blocker = format [localize "STR_antistasi_dialogs_buy_town_upgrades_button_tooltip", _name, _city, _price] };
            _button ctrlSetTooltip _blocker;
        } forEach (_tab getVariable ["cards", []]);
    };

    case ("buyClicked"):
    {
        _params params [["_control", controlNull, [controlNull]]];
        private _id = _control getVariable ["id", ""];
        private _index = lbCurSel _combo;
        if (_id == "" or _index < 0) exitWith {};
        private _city = _combo lbData _index;
        closeDialog 2;
        [_id, _city] spawn A3A_fnc_townKitBuy;
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("Town upgrades tab mode does not exist: %1", _mode);
    };
};
