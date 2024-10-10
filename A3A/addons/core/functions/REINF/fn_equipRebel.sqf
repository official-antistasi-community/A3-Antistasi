/*
    Fully equips a rebel infantry unit based on their class and unlocked gear

Parameters:
    0. <OBJECT> Unit to equip
    1. <NUMBER> Recruit type: 0 recruit, 1 HC squad, 2 garrison. Doesn't currently have any effect

Returns:
    Nothing

Environment:
    Scheduled, any machine
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit", "_recruitType"];

call A3A_fnc_fetchRebelGear;        // Send current version of rebelGear from server if we're out of date

private _fnc_addSecondaryAndMags = {
    params ["_unit", "_weapon", "_totalMagWeight"];

    _unit addWeapon _weapon;
    private _magazine = compatibleMagazines _weapon select 0;
    _unit addSecondaryWeaponItem _magazine;

    if ("Disposable" in (_weapon call A3A_fnc_equipmentClassToCategories)) exitWith {};
    private _magWeight = 20 max getNumber (configFile / "CfgMagazines" / _magazine / "mass");
    _unit addMagazines [_magazine, round (random 0.5 + _totalMagWeight / _magWeight)];

    private _compatOptics = A3A_rebelOpticsCache get _weapon;
    if (isNil "_compatOptics") then {
        private _compatItems = compatibleItems _weapon;		// cached, should be fast
        _compatOptics = _compatItems arrayIntersect (A3A_rebelGear get "OpticsAll");
        A3A_rebelOpticsCache set [_weapon, _compatOptics];
    };
    if (_compatOptics isNotEqualTo []) then { _unit addSecondaryWeaponItem (selectRandom _compatOptics) };
};

private _fnc_addCharges = {
    params ["_unit", "_totalWeight"];

    private _charges = A3A_rebelGear get "ExplosiveCharges";
    if (_charges isEqualTo []) exitWith {};

    private _weight = 0;
    while { _weight < _totalWeight } do {
        private _charge = selectRandomWeighted _charges;
        _weight = _weight + getNumber (configFile / "CfgMagazines" / _charge / "mass");
        _unit addItemToBackpack _charge;
    };
};

private _unitType = _unit getVariable "unitType";
private _typeTag = _unitType splitString "_" select 3;
private _customLoadout = A3A_rebelLoadouts getOrDefaultCall [_typeTag, {createHashMap}];

private _radio = selectRandomWeighted (A3A_rebelGear get "Radios");
if (!isNil "_radio") then {_unit linkItem _radio};

if ("Uniform" in _customLoadout) then {
    _unit forceAddUniform (_customLoadout get "Uniform");
};

if ("Headgear" in _customLoadout) then {
    _unit addHeadgear (_customLoadout get "Headgear");
} else {
    private _helmet = selectRandomWeighted (A3A_rebelGear get "ArmoredHeadgear");
    if (_helmet == "") then { _helmet = selectRandom (A3A_faction_reb get "headgear") };
    _unit addHeadgear _helmet;
};

if ("Vest" in _customLoadout) then {
    _unit addVest (_customLoadout get "Vest");
} else {
    private _vest = selectRandomWeighted (A3A_rebelGear get "ArmoredVests");
    if (_vest == "") then { _vest = selectRandomWeighted (A3A_rebelGear get "CivilianVests") };
    _unit addVest _vest;
};

if ("Backpack" in _customLoadout) then {
    _unit addBackpack (_customLoadout get "Backpack");
} else {
    private _backpack = selectRandomWeighted (A3A_rebelGear get "BackpacksCargo");
    if !(isNil "_backpack") then { _unit addBackpack _backpack };
};

private _smokes = A3A_rebelGear get "SmokeGrenades";
if (_smokes isNotEqualTo []) then { _unit addMagazines [selectRandomWeighted _smokes, 1] };
private _grenades = A3A_rebelGear get "Grenades";
if (_grenades isNotEqualTo []) then { _unit addMagazines [selectRandomWeighted _grenades, 1] };


private _ammoMod = if (_customLoadout getOrDefault ["AmmoQuant", "Normal"] == "Normal") then {1} else {1.5};

private _priWeapon = _customLoadout get "PriWeapon";
if (isNil "_priWeapon") then {
    private _weaponType = switch (_typeTag) do {
        case ("Sniper"); case ("Marksman"): { "SniperRifles" };
        case ("MachineGunner"): { "MachineGuns" };
        case ("Grenadier"): { "GrenadeLaunchers" };
        case ("Medic"): { "SMGs" };
        default { "Rifles" };
    };
    if (!isNil "_weaponType") then { _priWeapon = _weaponType call A3A_fnc_randomRifle };
};

private _launcher = _customLoadout get "SecWeapon";
if (isNil "_launcher") then {
    private _weaponType = switch (_typetag) do
    {
        case ("LAT"): { "RocketLaunchers" };
        case ("AT"): { "MissileLaunchersAT" };
        case ("AA"): { "MissileLaunchersAA" };
    };
    if (!isNil "_weaponType") then { _launcher = selectRandomWeighted (A3A_rebelGear get _weaponType) };
};

switch (_typeTag) do
{
    case ("Sniper"); case ("Marksman"): {
        [_unit, _priWeapon, "OpticsLong", 50*_ammoMod] call A3A_fnc_addPrimaryAndMags;
    };
    case ("Rifleman"): {
        [_unit, _priWeapon, "OpticsMid", 70*_ammoMod] call A3A_fnc_addPrimaryAndMags;
        if (_grenades isNotEqualTo []) then { _unit addMagazines [selectRandomWeighted _grenades, 2] };
        if (_smokes isNotEqualTo []) then { _unit addMagazines [selectRandomWeighted _smokes, 1] };

        // could throw in some disposable launchers here...
    };
    case ("MachineGunner"): {
        [_unit, _priWeapon, "OpticsMid", 150*_ammoMod] call A3A_fnc_addPrimaryAndMags;
    };
    case ("Grenadier"): {
        [_unit, _priWeapon, "OpticsClose", 50*_ammoMod, round(5*_ammoMod)] call A3A_fnc_addPrimaryAndMags;
    };
    case ("ExplosivesExpert"): {
        [_unit, _priWeapon, "OpticsClose", 50*_ammoMod] call A3A_fnc_addPrimaryAndMags;

        _unit enableAIFeature ["MINEDETECTION", true]; //This should prevent them from Stepping on the Mines as an "Expert" (It helps, they still step on them)

        private _mineDetector = selectRandomWeighted (A3A_rebelGear get "MineDetectors");
        if !(isNil "_mineDetector") then { _unit addItem _mineDetector };

        private _toolkit = selectRandomWeighted (A3A_rebelGear get "Toolkits");
        if !(isNil "_toolkit") then { _unit addItem _toolkit };

        [_unit, 50] call _fnc_addCharges;
    };
    case ("Engineer"): {
        [_unit, _priWeapon, "OpticsClose", 50*_ammoMod] call A3A_fnc_addPrimaryAndMags;

        private _toolkit = selectRandomWeighted (A3A_rebelGear get "Toolkits");
        if !(isNil "_toolkit") then { _unit addItem _toolkit };

        [_unit, 50] call _fnc_addCharges;
    };
    case ("Medic"): {
        [_unit, _priWeapon, "OpticsClose", 40*_ammoMod] call A3A_fnc_addPrimaryAndMags;
        if (_smokes isNotEqualTo []) then { _unit addMagazines [selectRandomWeighted _smokes, 2] };

        // not-so-temporary hack
        private _medItems = [];
        {
            for "_i" from 1 to (_x#1) do { _medItems pushBack (_x#0) };
        } forEach (["MEDIC",independent] call A3A_fnc_itemset_medicalSupplies);
        {
            _medItems deleteAt (_medItems find _x);
        } forEach items _unit;
        {
            _unit addItemToBackpack _x;
        } forEach _medItems;
    };
    case ("LAT"); case ("AT"); case ("AA"): {
        [_unit, _priWeapon, "OpticsClose", 40*_ammoMod] call A3A_fnc_addPrimaryAndMags;
        if !(isNil "_launcher") then { [_unit, _launcher, 100*_ammoMod] call _fnc_addSecondaryAndMags };
    };
    case ("SquadLeader"): {
        [_unit, _priWeapon, "OpticsMid", 50*_ammoMod] call A3A_fnc_addPrimaryAndMags;
        if (_smokes isNotEqualTo []) then { _unit addMagazines [selectRandomWeighted _smokes, 2] };
    };
    default {
        [_unit, _priWeapon, "OpticClose", 50*_ammoMod] call A3A_fnc_addPrimaryAndMags;
        Error_1("Unknown unit class: %1", _typeTag);
    };
};

private _nvg = selectRandomWeighted (A3A_rebelGear get "NVGs");
if (_nvg != "") then { _unit linkItem _nvg }
else {
    private _weapon = primaryWeapon _unit;
    private _compatLights = A3A_rebelFlashlightsCache get _weapon;
    if (isNil "_compatLights") then {
        private _compatItems = compatibleItems _weapon;		// cached, should be fast
        _compatLights = _compatItems arrayIntersect (A3A_rebelGear get "LightAttachments");
        A3A_rebelFlashlightsCache set [_weapon, _compatLights];
    };
    if (_compatLights isNotEqualTo []) then {
        private _flashlight = selectRandom _compatLights;
        _unit addPrimaryWeaponItem _flashlight;		// should be used automatically by AI as necessary
    };
};


// remove backpack if empty, otherwise squad troops will throw it on the ground
if (backpackItems _unit isEqualTo []) then { removeBackpack _unit };

Verbose_3("Class %1, type %2, loadout %3", _typeTag, _recruitType, str (getUnitLoadout _unit));
