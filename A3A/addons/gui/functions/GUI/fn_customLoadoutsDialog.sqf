/*
Maintainer: John Jordan
    Handles the initialization and updating of the custom AI loadouts dialog.

Arguments:
    0. <STRING> Mode, currently "init", "selectRole", "saveRole", "toggleVariants", "resetRoleButton" and "resetAllButton"
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

// Should be ready for all commands except init
private _loadouts = _display getVariable "loadouts";

switch (_mode) do
{
    case ("init"):
    {
        // sync data from server
        call A3A_fnc_fetchRebelGear;
        _display setVariable ["loadouts", +A3A_rebelLoadouts];      // work with temporary copy

        (_display displayCtrl A3A_IDC_CUSLOAD_SHOWVARIANTS) cbSetChecked (profileNamespace getVariable ["A3A_customLoadoutsShowVariants", false]);

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
        private _roleGear = _loadouts getOrDefaultCall [_roleData#0, {createHashMap}, true];

        // Rebel gear holds one class per group of functional variants (colours, camo etc.)
        // Groups get an "any variant" entry (lbValue 1, random per unit), followed by each exact variant
        // if "show variants" is ticked. Otherwise only an exact variant that is already selected is listed.
        private _showVariants = cbChecked (_display displayCtrl A3A_IDC_CUSLOAD_SHOWVARIANTS);
        private _fnc_addItems = {
            params ["_control", "_itemType", "_selClass", "_selAnyVariant"];
            private _itemList = A3A_rebelGear get _itemType;
            private _cfgBranch = configFile >> ["CfgWeapons", "CfgVehicles"] select ("Backpacks" in _itemType);

            for "_i" from 0 to (count _itemList - 2) step 2 do {
                if (_itemList#(_i+1) < 0.5 or _itemList#_i == "") then { continue };          // only include when the item count is reasonably large
                private _variants = [_itemList#_i] call A3A_fnc_itemVariants;
                private _distinct = [_itemList#_i, [_selClass, ""] select _selAnyVariant] call A3A_fnc_itemVariantsDistinct;
                if (count _distinct > 1) then {
                    private _ctrlIdx = _control lbAdd format [localize "STR_antistasi_dialogs_custom_loadouts_anyVariant", [_variants#0] call A3A_fnc_itemVariantName];
                    _control lbSetData [_ctrlIdx, _variants#0];
                    _control lbSetValue [_ctrlIdx, 1];
                    if (_selAnyVariant and { _selClass in _variants }) then { _control lbSetCurSel _ctrlIdx };
                };
                {
                    if (count _distinct > 1 and !_showVariants and { _selAnyVariant or _x != _selClass }) then { continue };
                    private _name = getText (_cfgBranch >> _x >> "displayName");
                    private _ctrlIdx = _control lbAdd ([_name, "    " + _name] select (count _distinct > 1));
                    _control lbSetData [_ctrlIdx, _x];
                    if (!_selAnyVariant and { _x == _selClass }) then { _control lbSetCurSel _ctrlIdx };
                } forEach _distinct;
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
        private _curAny = _roleGear getOrDefault ["PriWeaponAnyVariant", false];
        if (_roleData#2 != "") then { [_priWeapon, _roleData#2, _curClass, _curAny] call _fnc_addItems } else {
            [_priWeapon, "Rifles", _curClass, _curAny] call _fnc_addItems;
            [_priWeapon, "SMGs", _curClass, _curAny] call _fnc_addItems;
            [_priWeapon, "Shotguns", _curClass, _curAny] call _fnc_addItems;
        };

        private _secWeapon = _display displayCtrl A3A_IDC_CUSLOAD_SECWEAPON;
        lbClear _secWeapon;
        _secWeapon lbAdd "Random";
        _secWeapon lbSetCurSel 0;
        _curClass = _roleGear getOrDefault ["SecWeapon", "Random"];
        _curAny = _roleGear getOrDefault ["SecWeaponAnyVariant", false];
        if (_roleData#3 != "") then { [_secWeapon, _roleData#3, _curClass, _curAny] call _fnc_addItems };
        // disable if not valid?

        private _priOptic = _display displayCtrl A3A_IDC_CUSLOAD_PRIOPTIC;
        _priOptic ctrlEnable false;                  // disabled for now

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
        _curAny = _roleGear getOrDefault ["VestAnyVariant", false];
        [_vest, "ArmoredVests", _curClass, _curAny] call _fnc_addItems;
        [_vest, "CivilianVests", _curClass, _curAny] call _fnc_addItems;

        private _backpack = _display displayCtrl A3A_IDC_CUSLOAD_BACKPACK;
        lbClear _backpack;
        _backpack lbAdd "Random";
        _backpack lbSetCurSel 0;
        _curClass = _roleGear getOrDefault ["Backpack", "Random"];
        _curAny = _roleGear getOrDefault ["BackpackAnyVariant", false];
        [_backpack, "BackpacksCargo", _curClass, _curAny] call _fnc_addItems;

        private _headgear = _display displayCtrl A3A_IDC_CUSLOAD_HEADGEAR;
        lbClear _headgear;
        _headgear lbAdd "Random";
        _headgear lbSetCurSel 0;
        _curClass = _roleGear getOrDefault ["Headgear", "Random"];
        _curAny = _roleGear getOrDefault ["HeadgearAnyVariant", false];
        [_headgear, "ArmoredHeadgear", _curClass, _curAny] call _fnc_addItems;
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

// Stores the selected class, plus "<tag>AnyVariant" when any variant of it may be used
private _fnc_saveGear = {
    params ["_roleGear", "_tag", "_ctrl"];
    private _index = lbCurSel _ctrl;
    _roleGear deleteAt (_tag + "AnyVariant");
    if (_index <= 0) exitWith { _roleGear deleteAt _tag };
    _roleGear set [_tag, _ctrl lbData _index];
    if (_ctrl lbValue _index == 1) then { _roleGear set [_tag + "AnyVariant", true] };
};

switch (_mode) do
{
    case ("close"):
    {
        ["saveRole"] call A3A_GUI_fnc_customLoadoutsDialog;
        _loadouts remoteExecCall ["A3A_fnc_setRebelLoadouts", 2];
    };

    case ("saveRole"):
    {
        private _roleData = _unitTypesData # _roleIndex;
        private _roleGear = _loadouts getOrDefaultCall [_roleData#0, {createHashMap}, true];
        { [_roleGear, _x#0, _x#1] call _fnc_saveGear } forEach _gearControls;
    };

    case ("copyToAllButton"):
    {
        // Only copy primary weapon between types with standard primary
        private _copyPrimary = _unitTypesData#_roleIndex#2 == "";
        {
            private _roleData = _x;
            private _roleGear = _loadouts getOrDefaultCall [_roleData#0, {createHashMap}, true];
            {
                _x params ["_tag", "_ctrl"];
                if (_tag == "SecWeapon" or (_tag == "PriWeapon" and _roleData#2 != "")) then { continue };
                [_roleGear, _tag, _ctrl] call _fnc_saveGear;
            } forEach _gearControls;
        } forEach _unitTypesData;
    };

    case ("toggleVariants"):
    {
        _params params ["_showVariants"];
        profileNamespace setVariable ["A3A_customLoadoutsShowVariants", _showVariants];
        ["selectRole", [_roleIndex, true]] call A3A_GUI_fnc_customLoadoutsDialog;      // keeps the current selections
    };

    case ("resetRoleButton"):
    {
        private _roleData = _unitTypesData # _roleIndex;
        _loadouts set [_roleData#0, createHashMap];
        ["selectRole", [_roleIndex, false]] call A3A_GUI_fnc_customLoadoutsDialog;
    };

    case ("resetAllButton"):
    {
        _display setVariable ["loadouts", createHashMap];
        ["selectRole", [_roleIndex, false]] call A3A_GUI_fnc_customLoadoutsDialog;
    };
};
