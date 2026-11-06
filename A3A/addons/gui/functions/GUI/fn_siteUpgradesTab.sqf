/*
Maintainer: Shoter
    Handles the Site upgrades tab of the Buy Vehicle dialog: a map on the right to pick a resource, factory or seaport,
    and a panel on the left with its level, the next level's price and the buy button.

    Panel states: no site selected; rebel site below the level cap; site at the cap; kit already in transit for the site;
    enemy-held site; destroyed site; player not allowed to buy; not enough faction money.
    Only the button's text, tooltip and enabled state change between them, no control is shown or hidden.

Arguments:
    <STRING> Mode: "onLoad", "update", "mapClicked" or "buyClicked"
    <ARRAY<ANY>> Params, "mapClicked" takes [[screenX, screenY]]

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for onLoad (called from the dialog onLoad), Unscheduled otherwise
Public: No
Dependencies:
    A3A_siteLevels, A3A_siteUpgradeLevelCap, A3A_siteUpgradeBonusesActive, A3A_fnc_siteType, A3A_fnc_siteLevel, A3A_fnc_siteName, A3A_fnc_siteUpgradePrice,
    A3A_fnc_siteUpgradeRefusal, A3A_fnc_upgradeKitAllowed, A3A_fnc_upgradeKitBuy

Example:
    ["onLoad"] call A3A_GUI_fnc_siteUpgradesTab;

License: APL-ND
*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_mode", "onLoad"], ["_params", []]];

private _display = findDisplay A3A_IDD_BUYVEHICLEDIALOG;
private _map = _display displayCtrl A3A_IDC_SITEUPGRADESMAP;
private _title = _display displayCtrl A3A_IDC_SITEUPGRADESTITLE;
private _info = _display displayCtrl A3A_IDC_SITEUPGRADESINFO;
private _buyButton = _display displayCtrl A3A_IDC_SITEUPGRADESBUY;

switch (_mode) do
{
    case ("onLoad"):
    {
        // Hidden until its tab is shown, the dialog opens on a vehicle tab
        _map ctrlShow false;
        _map setVariable ["selectedMarker", ""];
        _map setVariable ["selectMarkerData", []];
        _map ctrlAddEventHandler ["Draw", "_this call A3A_GUI_fnc_mapDrawSelectEH"];
        _map ctrlMapAnimAdd [0, 0.3, markerPos "Synd_HQ"];
        ctrlMapAnimCommit _map;
        ["update"] call A3A_GUI_fnc_siteUpgradesTab;
    };

    case ("mapClicked"):
    {
        _params params [["_clickedPosition", [0, 0]]];
        private _sites = resourcesX + factories + seaports;
        if (_sites isEqualTo []) exitWith {};
        private _clickedWorldPosition = _map ctrlMapScreenToWorld _clickedPosition;
        private _marker = [_sites, _clickedWorldPosition] call BIS_fnc_nearestPosition;

        // A click away from every site clears the selection
        private _markerScreenPosition = _map ctrlMapWorldToScreen (markerPos _marker);
        if (_clickedPosition distance _markerScreenPosition > 8 * GRID_W) then {
            _map setVariable ["selectedMarker", ""];
            _map setVariable ["selectMarkerData", []];
        } else {
            _map setVariable ["selectedMarker", _marker];
            _map setVariable ["selectMarkerData", [markerPos _marker]];
        };
        ["update"] call A3A_GUI_fnc_siteUpgradesTab;
    };

    case ("update"):
    {
        private _marker = _map getVariable ["selectedMarker", ""];
        private _type = [_marker] call A3A_fnc_siteType;
        _buyButton setVariable ["level", 0];

        if (_type == "") exitWith {
            _title ctrlSetText (localize "STR_antistasi_dialogs_buy_site_upgrades_no_site");
            _info ctrlSetStructuredText parseText format ["<t size='0.8'>%1</t>", localize "STR_antistasi_dialogs_buy_site_upgrades_help"];
            _buyButton ctrlSetText (localize "STR_antistasi_dialogs_buy_site_upgrades_buy_none");
            _buyButton ctrlEnable false;
            _buyButton ctrlSetTooltip (localize "STR_antistasi_dialogs_buy_site_upgrades_no_site");
        };

        private _stored = [_marker, false] call A3A_fnc_siteLevel;
        private _cap = A3A_siteUpgradeLevelCap getOrDefault [_type, 0];
        private _funds = server getVariable ["resourcesFIA", 0];
        private _side = sidesX getVariable [_marker, sideUnknown];

        private _lines = [];
        _lines pushBack format [localize "STR_antistasi_dialogs_buy_site_upgrades_level", _stored, A3A_siteUpgradeMaxLevel];
        _lines pushBack format [localize "STR_antistasi_dialogs_buy_site_upgrades_bonus", 10 * _stored, 20 * _stored];
        if (_side != teamPlayer) then { _lines pushBack localize "STR_antistasi_dialogs_buy_site_upgrades_enemy" };
        if (_marker in destroyedSites) then { _lines pushBack localize "STR_antistasi_dialogs_buy_site_upgrades_destroyed" };

        // Bonuses of levels 3, 5 and 7: active ones in green, ones not shipped yet in grey
        private _effective = [_marker] call A3A_fnc_siteLevel;
        private _bonusLines = [localize "STR_antistasi_dialogs_buy_site_upgrades_bonuses"];
        {
            private _text = format [localize "STR_antistasi_dialogs_buy_site_upgrades_bonus_line", _x, localize format ["STR_A3A_fn_siteUpgrades_bonus_%1_%2", _type, _x]];
            private _later = !([_type, _x] in A3A_siteUpgradeBonusesActive);
            _text = switch (true) do {
                case (_later): { format ["<t color='#9a9a9a'>%1 %2</t>", _text, localize "STR_antistasi_dialogs_buy_site_upgrades_bonus_later"] };
                case (_effective >= _x): { format ["<t color='#7fd27f'>%1 %2</t>", _text, localize "STR_antistasi_dialogs_buy_site_upgrades_bonus_active"] };
                default { _text };
            };
            _bonusLines pushBack _text;
        } forEach [3, 5, 7];
        // Smaller than the rest of the panel so the list fits above the buy button
        _lines pushBack format ["<t size='0.7'>%1</t>", _bonusLines joinString "<br/>"];

        _lines pushBack format [localize "STR_antistasi_dialogs_buy_site_upgrades_funds", _funds];
        if (_cap < A3A_siteUpgradeMaxLevel) then { _lines pushBack format [localize "STR_antistasi_dialogs_buy_site_upgrades_cap", _cap] };
        _lines pushBack localize "STR_antistasi_dialogs_buy_site_upgrades_haul";

        _title ctrlSetText ([_marker] call A3A_fnc_siteName);
        _info ctrlSetStructuredText parseText format ["<t size='0.8'>%1</t>", _lines joinString "<br/><br/>"];

        private _level = _stored + 1;
        private _price = [_marker, _level] call A3A_fnc_siteUpgradePrice;
        // Empty reason means the level can be bought
        private _blocker = call {
            if (_stored >= A3A_siteUpgradeMaxLevel) exitWith { localize "STR_antistasi_dialogs_buy_site_upgrades_max" };
            if !([player] call A3A_fnc_upgradeKitAllowed) exitWith { localize "STR_A3A_fn_upgradeKits_membersOnly" };
            private _refusal = [_marker, _level] call A3A_fnc_siteUpgradeRefusal;
            if (_refusal != "") exitWith { _refusal };
            if (_funds < _price) exitWith { format [localize "STR_A3A_fn_upgradeKits_noMoney", _price] };
            "";
        };

        if (_stored >= _cap) then {
            _buyButton ctrlSetText (localize "STR_antistasi_dialogs_buy_site_upgrades_buy_none");
        } else {
            _buyButton ctrlSetText format [localize "STR_antistasi_dialogs_buy_site_upgrades_buy", _level, _price];
            _buyButton setVariable ["level", _level];
        };
        _buyButton ctrlEnable (_blocker == "");
        if (_blocker == "") then { _blocker = format [localize "STR_antistasi_dialogs_buy_site_upgrades_buy_tooltip", _level, _price, A3A_siteUpgradeRadius] };
        _buyButton ctrlSetTooltip _blocker;
    };

    case ("buyClicked"):
    {
        private _marker = _map getVariable ["selectedMarker", ""];
        private _level = _buyButton getVariable ["level", 0];
        if (_marker == "" or _level < 1) exitWith {};
        closeDialog 2;
        ["site", _level, _marker] spawn A3A_fnc_upgradeKitBuy;
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("Site upgrades tab mode does not exist: %1", _mode);
    };
};
