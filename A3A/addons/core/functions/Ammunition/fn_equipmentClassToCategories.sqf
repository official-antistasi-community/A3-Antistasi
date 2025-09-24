/**
    Maps the class name of an item to the variable name of the category it belongs in.

    Params:
        _className - Class of the equipment to unlock.

    Returns:
        Array of appropriate categories, selected from allCategories.
**/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_className", "_itemType"];

// First check if the item has hardcoded categories
private _categories = A3A_categoryOverrides getVariable [_className, []];
if (count _categories > 0) exitWith { _categories };

if (isNil "_itemType") then { _itemType = _className call A3A_fnc_itemType };

private _baseCategory = switch (_itemType select 1) do
    {
        case "AssaultRifle": {"Rifles"};
        case "BombLauncher": {""}; //Only for vehicles //allBombLaunchers pushBack _nameX};
        case "GrenadeLauncher": {""}; //Only for vehicles //allGrenadeLaunchers pushBack _nameX};
        case "Handgun": {"Handguns"};
        case "MachineGun": {"MachineGuns"};
        case "MissileLauncher": {"MissileLaunchers"};
        case "Mortar": {"Mortars"};
        case "Launcher";                    // SPE panzerfausts
        case "RocketLauncher": {"RocketLaunchers"};
        case "Shotgun": {"Shotguns"};
        case "Throw": {""}; //Unused
        case "Rifle": {"Rifles"};
        case "SubmachineGun": {"SMGs"};
        case "SniperRifle": {"SniperRifles"};

        case "Magazine": {"Magazines"};

        case "AccessoryBipod": {"Bipods"};
        case "AccessoryMuzzle": {"MuzzleAttachments"};
        case "AccessoryPointer": {"PointerAttachments"};
        case "AccessorySights": {"Optics"};
        case "Binocular": {"Binoculars"};
        case "Compass": {"Compasses"};
        case "FirstAidKit": {"FirstAidKits"};
        case "GPS": {"GPS"};
        case "LaserDesignator": {"LaserDesignators"};
        case "Map": {"Maps"};
        case "Medikit": {"Medikits"};
        case "MineDetector": {"MineDetectors"};
        case "NVGoggles": {"NVGs"};
        case "Radio": {"Radios"};
        case "Toolkit": {"Toolkits"};
        case "UAVTerminal": {"UAVTerminals"};
        case "Unknown": {"Unknown"};
        case "UnknownEquipment": {"Unknown"};
        case "UnknownWeapon": {"Unknown"};
        case "Watch": {"Watches"};

        case "Glasses": {"Glasses"};
        case "Headgear": {"Headgear"};
        case "Vest": {"Vests"};
        case "Uniform": {"Uniforms"};
        case "Backpack": {"Backpacks"};

        case "Artillery": {"MagArtillery"};
        case "Bullet": {"MagBullet"};
        case "Flare": {"MagFlare"};
        case "Grenade": {"Grenades"};
        case "Laser": {"MagLaser"};
        case "Missile": {"MagMissile"};
        case "Rocket": {"MagRocket"};
        case "Shell": {"MagShell"};
        case "ShotgunShell": {"MagShotgun"};
        case "SmokeShell": {"MagSmokeShell"};
        case "UnknownMagazine": {"Unknown"};

        case "Mine": {"Mine"};
        case "MineBounding": {"MineBounding"};
        case "MineDirectional": {"MineDirectional"};

        default {"Unknown"};
    };

if (_baseCategory != "") then { _categories pushBack _baseCategory};

private _aggregateCategory = switch (_itemType select 0) do {
    case "Weapon": {"Weapons"};
    case "Item";
    case "Equipment": {"Items"};
    case "Magazine": {"Magazines"};
    case "Mine": {"Explosives"};
    default {""};
};

if (_aggregateCategory != "") then {
    _categories pushBack _aggregateCategory;
};

if (_aggregateCategory == "Explosives") then {
    _categories pushBack "Magazines";         //Every explosive is a magazine.
    // Charge detection. Not great, detects everything with vanilla time/remote trigger placement
    // except the CUP satchel charge which somehow dodges the "Mine" part
    if (_baseCategory == "Mine") then {
        private _magcfg = configFile >> "CfgMagazines" >> _classname;
        private _ammocfg = configFile / "CfgAmmo" / getText (_magcfg / "ammo");
        if (getText (_ammoCfg / "mineTrigger") == "remotetrigger") then { _categories pushBack "ExplosiveCharges" };
    };
};

call {
    if (_baseCategory == "Rifles") exitWith {
        private _config = configfile >> "CfgWeapons" >> _className;
        private _muzzles = getArray (_config >> "muzzles");
        // workaround for RHS having an extra muzzle for "SAFE"
        if (count _muzzles >= 2 && {"gl" == getText (_config >> (_muzzles select 1) >> "cursorAim")}) then {
            _categories pushBack "GrenadeLaunchers";
        };
    };

    if (_basecategory == "Vests") exitWith {
        if (getNumber (configfile >> "CfgWeapons" >> _className >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") > 5) then {
            _categories pushBack "ArmoredVests";
        };
    };

    if (_basecategory == "Headgear") exitWith {
        if (getNumber (configfile >> "CfgWeapons" >> _className >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 0) then {
            _categories pushBack "ArmoredHeadgear";
        };
    };

    if (_basecategory == "Optics") exitWith {
        if (getNumber (configFile >> "CfgWeapons" >> _className >> "ace_scopeAdjust_verticalIncrement") > 0) exitWith { _categories pushBack "OpticsLong" };
        if !(isClass (configFile >> "CfgWeapons" >> _className >> "ItemInfo" >> "OpticsModes")) exitWith {};
        private _configs = "true" configClasses (configFile >> "CfgWeapons" >> _className >> "ItemInfo" >> "OpticsModes");
        private _rangeCat = "OpticsClose";
        {
            // Assume it's a sniper/marksman optic if it has ranging and zoom. Zoom level alone isn't enough because RHS MDO > PSO-1 & DMS/SOS
            if (getNumber (_x >> "opticsZoomMin") < 0.2) exitWith {
                if (count getArray (_x >> "discreteDistance") >= 2) exitWith { _rangeCat = "OpticsLong" };
                _rangeCat = "OpticsMid";
            };
        } forEach _configs;
        _categories pushBack _rangeCat;
    };

    if (_baseCategory == "RocketLaunchers") exitWith {
        _categories pushBack "AT";
        private _config = configFile >> "CfgWeapons" >> _classname; 
        if (getNumber (_config >> "rhs_disposable") == 1 or {getArray (_config >> "magazines") # 0 == "CBA_fakeLauncherMagazine"}) then {
            // Need to consider scope 1 stuff in case it ends up in arsenal, or this function is used on equipped/dropped items
            if (getNumber (_config >> "scope") == 1) then { _categories set [0, "UsedLaunchers"] };
            _categories pushBack "Disposable";
        };
    };

    if (_baseCategory == "MissileLaunchers") exitWith {
        private _config = configFile >> "CfgWeapons" >> _classname; 
        private _mainmag = getArray (_config >> "Magazines") # 0;
        if (getNumber (_config >> "rhs_disposable") == 1 or _mainmag == "CBA_fakeLauncherMagazine") then {
            _categories pushBack "Disposable";
            if (getNumber (_config >> "scope") == 1) exitWith { _categories set [0, "UsedLaunchers"] };
            if (_mainmag == "CBA_fakeLauncherMagazine" and !isNil "cba_disposable_normalLaunchers" and {typeName cba_disposable_normalLaunchers == "HASHMAP"}) then {
                _mainmag = (cba_disposable_normalLaunchers get _classname) # 1;     // format is [realLauncher, magazine]
            };
        };
        if (_categories#0 == "UsedLaunchers") exitWith {};
        // Should now have a real magazine
        private _magcfg = configFile >> "CfgMagazines" >> _mainmag;
        private _ammocfg = configFile >> "CfgAmmo" >> getText (_magcfg >> "ammo");
        _categories pushBack (["AT", "AA"] select (getNumber (_ammocfg >> "airLock") == 2));
    };

    if (_basecategory == "MagSmokeShell") exitWith {
        private _nameSound = getText(configfile >> "CfgMagazines" >> _classname >> "nameSound");
        call {
            if (_nameSound == "smokeshell") exitWith { _categories pushBack "SmokeGrenades" };
            if (_nameSound == "ChemLight") exitWith { _categories pushBack "Chemlights" };
            if (_nameSound == "") exitWith { _categories pushBack "LaunchedSmokeGrenades" };
        };
    };

    if (_baseCategory == "NVGs") exitWith {
        private _thermal = getArray (configFile >> "CfgWeapons" >> _classname >> "thermalMode");
        if (_thermal isNotEqualTo []) then { _categories pushBack "NVGThermal" };
    };

    if (_baseCategory == "PointerAttachments") exitWith {
        private _isLight = isClass(configfile >> "CfgWeapons" >> _classname >> "ItemInfo" >> "FlashLight" >> "Attenuation");
        _categories pushBack (["LaserAttachments", "LightAttachments"] select _isLight);
    };

};

// Add to cache for future use
A3A_categoryOverrides setVariable [_classname, _categories];

_categories;
