/*
    Initialize data for buyable items
    Sets global vars A3A_utilityItemList and A3A_utilityItemHM

Arguments: none
Returns: none

Environment: Server, must be called after faction loading
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _fuelDrum = FactionGet(reb,"vehicleFuelDrum");
private _fuelTank = FactionGet(reb,"vehicleFuelTank");
private _medCrate = FactionGet(reb,"vehicleMedicalBox");
private _medTent = FactionGet(reb,"vehicleHealthStation");
private _ammoStation = FactionGet(reb,"vehicleAmmoStation");
private _repairStation = FactionGet(reb,"vehicleRepairStation");

// TODO: Name should be stringtabled somewhere

private _items = [
    [FactionGet(reb,"surrenderCrate"), 10, "lootbox", "gear", ["move", "loot"]],
    [_fuelDrum#0, _fuelDrum#1, "fueldrum", "refuel", ["fuel", "move", "save"]],
    [_fuelTank#0, _fuelTank#1, "fueltank", "refuel", ["cmmdr", "fuel", "place", "move", "rotate", "save"]],
    [_medTent#0, _medTent#1, "medicaltent", "heal", ["place", "move", "rotate", "pack"]],
    [_ammoStation#0, _ammoStation#1, "ammostation", "rearm", ["cmmdr", "place", "move", "rotate", "save"]],
    [_repairStation#0, _repairStation#1, "repairstation", "repair", ["cmmdr", "place", "move", "rotate", "pack", "save"]],
    [FactionGet(reb,"vehicleLightSource"), 25, "light", "", ["move"]],           // note: If we do want this saved, need to switch saveLoop to nearObjects
    ["Land_PlasticCase_01_medium_F", 100, "buildboxsmall", "", ["place", "move", "build"]],
    ["Land_PlasticCase_01_large_F", 500, "buildboxmedium", "", ["place", "move", "build"]],
    ["Land_WoodenCrate_01_F", 1500, "buildboxlarge", "", ["place", "move", "build"]]
//    ["Land_WoodenCrate_01_stack_x5_F", 5000, "buildboxcolossal", "", ["place", "build", "hugebuild"]],
//    ["Land_Cargo10_cyan_F", 10000, "buildboxenormous", "", ["place", "build", "hugebuild"]]
    
];

if (LootToCrateRadius == 0) then { _items deleteAt 0 };

if(A3A_hasACE) then {
    _items pushBack [_medCrate#0, _medCrate#1, "medicalbox", "heal", ["noclear", "move"]];
    _items pushBack ["ACE_Wheel", 5, "", "", []];
    _items pushBack ["ACE_Track", 5, "", "", []];       // check names
};

// Apply item name localization
{
    if (_x#2 == "") then { continue };
    _x set [2, localize ("STR_A3A_Utility_Items_Name_" + _x#2)];
} forEach _items;

// Add packed variants so that they can be initialized properly
{
    private _packClass = getText (configFile >> "A3A" >> "A3A_Logistics_Packable" >> _x#0 >> "packObject");
    if (_packClass == "") then { Error_1("Packable item %1 has no packed object", _x#0); continue };
    _items pushBack [_packClass, -1, "", "", ["move", "unpack"]];
} forEach (_items select { "pack" in _x#4 });

A3A_utilityItemList = _items select { _x#1 >= 0 } apply { _x#0 };
A3A_utilityItemHM = (_items apply { _x#0 }) createHashMapFromArray _items;
