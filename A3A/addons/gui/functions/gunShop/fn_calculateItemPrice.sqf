#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_className", "_itemCfgCat"];

private _cacheVal = A3A_itemPriceCache get (_itemCfgCat + ":" + _classname);
if (!isNil "_cacheVal") exitWith { _cacheVal };


// still need old-style shotgun adjustment

private _fnc_ammoPriceCalculator = {
    params ["_className"];

    private _cfgAmmo = configFile >> "CfgAmmo" >> _className;
    if (!isClass _cfgAmmo) exitWith { Error_1("Ammo %1 does not exist", _className); 10000 };
    if (isNumber (_cfgAmmo >> "A3A_price")) exitWith { getNumber (_cfgAmmo >> "A3A_price") };

    private _rocketSims = ["shotrocket", "shotmissile"];
    private _utilSims = ["shotsmoke", "shotsmokex", "shotilluminating", "shotnvgmarker"];
    private _mineSims = ["shotmine", "shotdirectionalbomb", "shotboundingmine", "shotgrenade"];

    private _simType = tolower getText(_cfgAmmo >> "simulation");
    if (_simType in _utilSims) exitWith { 40 };

    // maxSpeed better for rockets, usually zero elsewhere. Mines have random crap.
    private _velocity = getNumber (_cfgAmmo >> (["typicalSpeed", "maxSpeed"] select (_simType in _rocketSims)));
    if (_simType in _mineSims) then { _velocity = 0 };
    private _maxRange = getNumber (_cfgAmmo >> "missileLockMaxDistance") max getNumber (_cfgAmmo >> "maxControlRange");
    private _rangeMod = _velocity max _maxRange;

    // any non-zero gets a multiplicative bump? airLock double+?
    private _guidance = getNumber (_cfgAmmo >> "irLock") + 2*getNumber (_cfgAmmo >> "manualControl") + getNumber (_cfgAmmo >> "laserLock");
    private _airLock = getNumber (_cfgAmmo >> "airLock");
    if (_airLock == 1) then { _airLock = 0 };

    // hit & indirHit for original projectile
    private _hit = getNumber(_cfgAmmo >> "hit");
    private _indirHit = getNumber(_cfgAmmo >> "indirectHit") * getNumber(_cfgAmmo >> "indirectHitRange");
    if (_simType in _mineSims and getNumber (_cfgAmmo >> "directionalExplosion") != 0) then {
        _indirHit = _indirHit * getNumber (_cfgAmmo >> "explosionAngle") / 180;
    };
    
    // submunitionAmmo can be either [type, prob, type2, prob2] array or just type string
    private _subAmmoType = getText (_cfgAmmo >> "submunitionAmmo");
    if (isArray (_cfgAmmo >> "submunitionAmmo")) then { _subAmmoType = getArray (_cfgAmmo >> "submunitionAmmo") # 0 };

    private _subVelocity = _velocity;
    if (_subAmmoType != "") then {
        _subVelocity = getNumber (_cfgAmmo >> "initSpeed");
        _cfgAmmo = configFile >> "CfgAmmo" >> _subAmmoType;
        if (_subVelocity == 0) then { _subVelocity = getNumber (_cfgAmmo >> "typicalSpeed") };

        // If there's a submunition cone type then get the submunition count from that
        private _subCount = 1;
        private _subConeType = getArray (_cfgAmmo >> "submunitionConeType");
        if (_subConeType isNotEqualTo []) then {
            _subCount = if (_subConeType#1 isEqualType 0) then { _subConeType#1 } else { count (_subConeType#1) };
        };

        _hit = _hit + _subCount * getNumber(_cfgAmmo >> "hit");
        _indirHit = _indirHit + (_subCount * getNumber(_cfgAmmo >> "indirectHit") * getNumber(_cfgAmmo >> "indirectHitRange"));
    };

    // Penetration comes from subammo config, if it exists.
    private _caliber = getNumber(_cfgAmmo >> "caliber");
    //private _explosive = getNumber(_cfgAmmo >> "explosive");		// 1 to 0 range for proportion of kinetic vs explosive damage
    private _penetration = (15/1000) * _caliber  * _subVelocity;		// should be mm of RHS steel

    _hit = _hit min _penetration*1.5;        // hack to workaround RHS AT weirdness
    private _payload = 0.5*_hit + 0.5*_penetration + _indirHit;
    private _costPerRound = if (_simType in _mineSims) then {
        0.5 * _payload^0.7;
    } else {
        0.02 * (1 + _rangeMod / 600) * _payload^1.4 * (1 + _guidance * _airLock);
    };

    A3A_itemPriceCache set ["ammo:" + _classname, _costPerRound];
    _costPerRound;
};

private _fnc_ammoPriceCalculatorCache = {
    params ["_className"];

    private _cacheVal = A3A_itemPriceCache get ("ammo:" + _classname);
    if (!isNil "_cacheVal") exitWith { _cacheVal };

    private _costPerRound = _className call _fnc_ammoPriceCalculator;

    A3A_itemPriceCache set ["ammo:" + _classname, _costPerRound];
    _costPerRound;
};

private _fnc_magPriceCalculator = {
    params ["_className"];

    private _cfgMag = configFile >> "CfgMagazines" >> _className;
    if (!isClass _cfgMag) exitWith { Error_1("Magazine %1 does not exist", _className); 10000 };
    if (isNumber (_cfgMag >> "A3A_price")) exitWith { getNumber (_cfgMag >> "A3A_price") };

    private _ammoVal = getText (_cfgMag >> "ammo") call _fnc_ammoPriceCalculatorCache;
    _ammoVal * getNumber (_cfgMag >> "count");
};

private _fnc_weaponPriceCalculator = {
    params ["_className"];

    private _weaponCfg = configFile >> "CfgWeapons" >> _className;
    if (isNumber (_weaponCfg >> "A3A_price")) exitWith { getNumber (_weaponCfg >> "A3A_price") };

    // Base price should be based on default ammo
    // TODO: check what this does with the RHS(?) SMAW

    private _defaultMag = compatibleMagazines _className select 0;
    if (isNil "_defaultMag") exitWith { Error_1("Weapon %1 has no magazines", _className); 10000 };
    if (_defaultMag == "CBA_fakeLauncherMagazine") then {
        if (isNil "cba_disposable_normalLaunchers") exitWith { Error("CBA fake mag without CBA loaded") };
        private _realLauncherData = cba_disposable_normalLaunchers get _className;
        _defaultMag = _realLauncherData # 1;     // format is [realLauncher, magazine]
    };

    private _ammoType = getText (configFile >> "CfgMagazines" >> _defaultMag >> "ammo");
    private _ammoPrice = _ammoType call _fnc_ammoPriceCalculatorCache;
    private _magSize = 20 min getNumber (configFile >> "CfgMagazines" >> _defaultMag >> "count");
    
    // then type mod on top?
    private _cats = _className call A3A_fnc_equipmentClassToCategories;
    private _glMod = 0;
    private _basePrice = switch (_cats#0) do {
        case "Rifles": {
            if ("GrenadeLaunchers" in _cats) then { _glMod = 200 };
            160 + _ammoPrice*160*_magSize/20;
        };
        case "MachineGuns": { 300 + _ammoPrice*300 };
        case "SniperRifles": { 240 + _ammoPrice*80*_magSize/5 };            // dispersion adjustment makes these expensive later
        case "SMGs": { 120 + _ammoPrice*160 };

        case "Handguns": { 70 + _ammoPrice*160*_magSize/10 };
        case "Shotguns": { 100 + 70*_magSize/5 };				// TODO: sort out shotgun ammo

        case "GrenadeLaunchers": { 120 + 120*_magSize };			// this is GL without rifle
        case "RocketLaunchers": { 400 + _ammoPrice*3 };
        case "MissileLaunchers": { 2000 + _ammoPrice*3 };
        default { 1000 };
    };
    if ("Disposable" in _cats) then { _basePrice = _basePrice / 2 };

    // "Accurate" weapons get adjusted by dispersion
    private _dispMul = 1;
    if (_cats#0 in ["Rifles", "MachineGuns", "SniperRifles"]) then {
        private _modeCfg = _weaponCfg >> "Single";
        if (!isClass _modeCfg) then { 
            private _firstMode = getArray (_weaponCfg >> "modes") # 0;
            if (_firstMode == "this") exitWith { _modeCfg = _weaponCfg };
            _modeCfg = _weaponCfg >> _firstMode;
        };
        private _dispersion = getNumber (_modeCfg >> "dispersion");
        _dispMul =  (0.001 / _dispersion) ^ 0.5;
    };

    // extra for attachment slots? Or not?

    // fire mode availability? maybe unnecessary with type mod

    (_basePrice * _dispMul) + _glMod;
};

private _fnc_itemPriceCalculator = {
    params ["_className"];

    private _config = (configFile >> "CfgWeapons" >> _className);
    if (isNumber (_config >> "A3A_price")) exitWith { getNumber (_config >> "A3A_price") };

    private _cats = _className call A3A_fnc_equipmentClassToCategories;
    switch (_cats#0) do {
        case "MuzzleAttachments": {
            private _cost = 100;
            private _isMuzzle = isNumber (_config >> "ItemInfo" >> "AmmoCoef" >> "audibleFire");
            if(_isMuzzle) then 
            {
                private _audible = getNumber (_config >> "ItemInfo" >> "AmmoCoef" >> "audibleFire");
                _cost = 150 * (3 min (0.5 / (0.05+_audible)));       // scale a bit by suppression level

                // Higher cost for heavier suppressors. Difficult to get caliber.
                // CUP suppressors mostly have bad (low) weights, so cap the minimum
                private _weightMod = 1 max (getNumber (_config >> "ItemInfo" >> "mass") / 6);
                _cost = _cost * _weightMod;
            };
            _cost;
        };
        case "PointerAttachments": {100};
        case "Optics": {
            // shamelessly stolen from ace.
            private _minZoom = 999; // FOV, so smaller is more zoomed in
            {
                _minZoom = _minZoom min (getNumber (_x >> "opticsZoomMin"));
            } forEach configProperties [_config >> "ItemInfo" >> "OpticsModes"];

            if (_minZoom in [0, 0.25, 999]) exitWith {150};
            private _cost = 100 + round(100 * (0.25/_minZoom)^0.7);

            // Cost multiplier for NV/Ti optics modes
            private _visionMult = 1;
            {
                private _mult = 0;
                {
                    if (_x == "Normal") then { _mult = _mult + 1; continue };           // If we have normal & NVG, that's better
                    if (_x == "NVG") then { _mult = _mult + 3; continue };
                    if (_x == "Ti") then { _mult = _mult + 5; continue };
                } forEach getArray (_x >> "VisionMode");
                _visionMult = _visionMult max _mult;
            } forEach ("true" configClasses (_config >> "ItemInfo" >> "OpticsModes"));

            _cost * _visionMult;
        };
        case "Bipods": {200};
        default {
            Error_1("Item %1 not a valid type", _className);
            1000;
        };
    };
};

private _price = call {
    if (_itemCfgCat == "weapon") exitWith { _classname call _fnc_weaponPriceCalculator };
    if (_itemCfgCat == "mag") exitWith { _classname call _fnc_magPriceCalculator };
    if (_itemCfgCat == "ammo") exitWith { _classname call _fnc_ammoPriceCalculator };			// just for debug
    _classname call _fnc_itemPriceCalculator;
};

A3A_itemPriceCache set [_itemCfgCat + ":" + _classname, _price];
_price;

/*
private _price = 0;
private _cfg = configFile >> "A3A" >> "GunShop";

if (isClass (_cfg >> _className)) then 
{
    _price = getNumber(_cfg >> _className >> "price");
} else {
    //diag_log format ["No price for %1 in config", _className];
    // calculate price now. 
    (_className call A3A_fnc_itemType) params ["_category", "_type"];
    
    // 15: 167, 25: 100, 40: 63, -1: 50 
    private _base = if(minWeaps isNotEqualTo -1) then {400 * (25 / minWeaps)} else {50};

    switch (_category) do {
        case "Weapon": {_price = ([_className, _type, _base * 2] call _fnc_weaponPriceCalculator) * (unlockedUnlimitedAmmo + 1)}; // unlockedUnlimitedAmmo once bought, double price
        case "Item": {_price = [_className, _type, _base] call _fnc_itemPriceCalculator};
        case "Magazine": {_price = [_className, _type, _base] call _fnc_magazinePriceCalculator};
        case "Mine": {_price = ([_className, _type, _base] call _fnc_minePriceCalculator) * (allowUnlockedExplosives + 1)}; // double the price, since they can unlock explosives
        default {
            //diag_log format ["None supported category: %1 of weapon: %2,", _category, _className];
        };
    };
};
*/
