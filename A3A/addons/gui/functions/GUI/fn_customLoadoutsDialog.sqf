/*
Maintainer: John Jordan
    Handles the initialization and updating of the custom AI loadouts dialog.

Arguments:
    0. <STRING> Mode, currently "init", "selectRole", "saveRole", "resetRoleButton" and "resetAllButton"
    1. <ARRAY<ANY>> Optional: Array of params for the mode as applicable.

Returns:
    Nothing

Environment:
    Should not be called by onLoad because findDisplay and ctrlParent do not work in that context.

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mode", ["_params", []]];

Trace_2("Called with mode %1 and params %2", _mode, _params);

private _display = findDisplay A3A_IDD_CUSTOMLOADOUTSDIALOG;
private _listBox = _display displayCtrl A3A_IDC_CUSLOAD_LISTBOX;

private _unitTypesData = [
    //["typetag", "name", "pritype", "sectype"],
    ["Rifleman", "Rifleman", "", ""],
    ["Medic", "Medic", "", ""],
    ["Sniper", "Sniper", "SniperRifles", ""],
    ["Marksman", "Marksman", "SniperRifles", ""],
    ["LAT", "Light AT", "", "RocketLaunchers"],
    ["MachineGunner", "Machine gunner", "MachineGuns", ""],
    ["ExplosivesExpert", "Explosives expert", "", ""],
    ["Grenadier", "Grenadier", "GrenadeLaunchers", ""],
    ["SquadLeader", "Squad leader", "", ""],
    ["Engineer", "Engineer", "", ""],
    ["AT", "Missile AT", "", "MissileLaunchersAT"],
    ["AA", "Missile AA", "", "MissileLaunchersAA"]
];

switch (_mode) do
{
    case ("init"):
    {
        // sync data from server
        call A3A_fnc_fetchRebelGear;

        // Fill out the listbox
        { _listBox lbAdd (_x#1) } forEach _unitTypesData;

        _listBox lbSetCurSel 0;         // triggers selectRole
        _listBox ctrlEnable true;
    };

    case ("selectRole"):
    {
        _params params ["_roleIndex", ["_saveCurrent", true]];

        // save previous role, if it exists. Set the new one
        if (_saveCurrent) then { ["saveRole"] call A3A_GUI_fnc_customLoadoutsDialog };
        _display setVariable ["currentRole", _roleIndex];

        private _roleData = _unitTypesData # _roleIndex;
        private _roleGear = A3A_rebelLoadouts getOrDefaultCall [_roleData#0, {createHashMap}, true];

        private _fnc_addItems = {
            params ["_control", "_itemType", "_selClass"];
            private _itemList = A3A_rebelGear get _itemType;
            private _cfgBranch = configFile >> ["CfgWeapons", "CfgVehicles"] select ("Backpacks" in _itemType);

            for "_i" from 0 to (count _itemList - 2) step 2 do {
                if (_itemList#(_i+1) < 0.5 or _itemList#_i == "") then { continue };          // only include when the item count is reasonably large
                private _class = _itemList#_i;
                private _name = getText (_cfgBranch >> _class >> "displayName");
                private _ctrlIdx = _control lbAdd _name;
                _control lbSetData [_ctrlIdx, _class];
                if (_class == _selClass) then { _control lbSetCurSel _ctrlIdx };
            };
        };

        private _fnc_addItemsPlain = {
            params ["_control", "_itemList", "_selClass"];
            {
                private _name = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
                private _ctrlIdx = _control lbAdd _name;
                _control lbSetData [_ctrlIdx, _x];
                if (_x == _selClass) then { _control lbSetCurSel _ctrlIdx };
            } forEach _itemList;
        };


        // Fill out the combo boxes
        private _priWeapon = _display displayCtrl A3A_IDC_CUSLOAD_PRIWEAPON;
        lbClear _priWeapon;
        _priWeapon lbAdd "Random";
        _priWeapon lbSetCurSel 0;
        private _curClass = _roleGear getOrDefault ["PriWeapon", "Random"];
        if (_roleData#2 != "") then { [_priWeapon, _roleData#2, _curClass] call _fnc_addItems } else {
            [_priWeapon, "Rifles", _curClass] call _fnc_addItems;
            [_priWeapon, "SMGs", _curClass] call _fnc_addItems;
            [_priWeapon, "Shotguns", _curClass] call _fnc_addItems;
        };

        private _secWeapon = _display displayCtrl A3A_IDC_CUSLOAD_SECWEAPON;
        lbClear _secWeapon;
        _secWeapon lbAdd "Random";
        _secWeapon lbSetCurSel 0;
        _curClass = _roleGear getOrDefault ["SecWeapon", "Random"];
        if (_roleData#3 != "") then { [_secWeapon, _roleData#3, _curClass] call _fnc_addItems };
        // disable if not valid?

        private _ammoQuant = _display displayCtrl A3A_IDC_CUSLOAD_AMMOQUANT;
        lbClear _ammoQuant;
        _ammoQuant lbAdd "Normal"; _ammoQuant lbSetData [0, "Normal"];
        _ammoQuant lbAdd "High"; _ammoQuant lbSetData [1, "High"];
        _ammoQuant lbSetCurSel 0;
        if (_roleGear getOrDefault ["AmmoQuant", "Normal"] == "High") then { _ammoQuant lbSetCurSel 1 };

        private _uniform = _display displayCtrl A3A_IDC_CUSLOAD_UNIFORM;
        lbClear _uniform;
        _uniform lbAdd "Random";
        _uniform lbSetCurSel 0;
        _curClass = _roleGear getOrDefault ["Uniform", "Random"];
        [_uniform, A3A_faction_reb get "uniforms", _curClass] call _fnc_addItemsPlain;

        private _vest = _display displayCtrl A3A_IDC_CUSLOAD_VEST;
        lbClear _vest;
        _vest lbAdd "Random";
        _vest lbSetCurSel 0;
        _curClass = _roleGear getOrDefault ["Vest", "Random"];
        [_vest, "ArmoredVests", _curClass] call _fnc_addItems;
        [_vest, "CivilianVests", _curClass] call _fnc_addItems;

        private _backpack = _display displayCtrl A3A_IDC_CUSLOAD_BACKPACK;
        lbClear _backpack;
        _backpack lbAdd "Random";
        _backpack lbSetCurSel 0;
        _curClass = _roleGear getOrDefault ["Backpack", "Random"];
        [_backpack, "BackpacksCargo", _curClass] call _fnc_addItems;

        private _headgear = _display displayCtrl A3A_IDC_CUSLOAD_HEADGEAR;
        lbClear _headgear;
        _headgear lbAdd "Random";
        _headgear lbSetCurSel 0;
        _curClass = _roleGear getOrDefault ["Headgear", "Random"];
        [_headgear, "ArmoredHeadgear", _curClass] call _fnc_addItems;
        [_headgear, A3A_faction_reb get "headgear", _curClass] call _fnc_addItemsPlain;
    };
};

// Block the other controls until initialized
private _roleIndex = _display getVariable "currentRole";
if (isNil "_roleIndex") exitWith { Error_1("Control %1 blocked", _mode) };

private _gearControls = [
    ["Headgear", _display displayCtrl A3A_IDC_CUSLOAD_HEADGEAR],
    ["Backpack", _display displayCtrl A3A_IDC_CUSLOAD_BACKPACK],
    ["Vest", _display displayCtrl A3A_IDC_CUSLOAD_VEST],
    ["Uniform", _display displayCtrl A3A_IDC_CUSLOAD_UNIFORM],
    ["AmmoQuant", _display displayCtrl A3A_IDC_CUSLOAD_AMMOQUANT],
    ["PriWeapon", _display displayCtrl A3A_IDC_CUSLOAD_PRIWEAPON],
    ["SecWeapon", _display displayCtrl A3A_IDC_CUSLOAD_SECWEAPON]
];

switch (_mode) do
{
    case ("close"):
    {
        ["saveRole"] call A3A_GUI_fnc_customLoadoutsDialog;
        A3A_rebelLoadouts remoteExecCall ["A3A_fnc_setRebelLoadouts", 2];
    };

    case ("saveRole"):
    {
        private _roleData = _unitTypesData # _roleIndex;
        private _roleGear = A3A_rebelLoadouts getOrDefaultCall [_roleData#0, {createHashMap}, true];
        {
            _x params ["_tag", "_ctrl"];
            if (lbCurSel _ctrl == 0) then { _roleGear deleteAt _tag; continue };
            _roleGear set [_tag, _ctrl lbData lbCurSel _ctrl];
        } forEach _gearControls;
    };

    case ("copyToAllButton"):
    {
        // Only copy primary weapon between types with standard primary
        private _copyPrimary = _unitTypesData#_roleIndex#2 == "";
        {
            private _roleData = _x;
            private _roleGear = A3A_rebelLoadouts getOrDefaultCall [_roleData#0, {createHashMap}, true];
            {
                _x params ["_tag", "_ctrl"];
                if (_tag == "SecWeapon" or (_tag == "PriWeapon" and _roleData#2 != "")) then { continue };
                if (lbCurSel _ctrl == 0) then { _roleGear deleteAt _tag; continue };
                _roleGear set [_tag, _ctrl lbData lbCurSel _ctrl];
            } forEach _gearControls;
        } forEach _unitTypesData;
    };

    case ("resetRoleButton"):
    {
        private _roleData = _unitTypesData # _roleIndex;
        A3A_rebelLoadouts set [_roleData#0, createHashMap];
        ["selectRole", [_roleIndex, false]] call A3A_GUI_fnc_customLoadoutsDialog;
    };

    case ("resetAllButton"):
    {
        A3A_rebelLoadouts = createHashMap;
        ["selectRole", [_roleIndex, false]] call A3A_GUI_fnc_customLoadoutsDialog;
    };
};
