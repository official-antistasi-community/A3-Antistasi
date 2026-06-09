#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_className", "_itemCfgCat"];

private _cacheVal = A3A_itemPriceCache get (_itemCfgCat + ":" + _classname);
if (!isNil "_cacheVal") exitWith { _cacheVal };

// _simType and _subVelocity also passed in
private _fnc_payloadValue = {
    params ["_cfgAmmo", "_isHEAT", "_log"];

    if !(_simType in _utilSims) exitWith {
        private _hit = getNumber (_cfgAmmo >> "hit");
        private _indirHit = getNumber (_cfgAmmo >> "indirectHit");
        private _indirRange = getNumber (_cfgAmmo >> "indirectHitRange");
        if (_simType in _mineSims and getNumber (_cfgAmmo >> "directionalExplosion") != 0) then {
            _indirHit = _indirHit * getNumber (_cfgAmmo >> "explosionAngle") / 180;
        };
        private _caliber = getNumber(_cfgAmmo >> "caliber");
        private _penetration = (15/1000) * _caliber * _subVelocity;		// should be mm of RHS steel
        _hit = _hit min _penetration*1.5;  // hack to workaround RHS AT weirdness

		private _indirPayload = 0.8*_indirHit^0.75*_indirRange^1.2;
        private _fuseCost = 2.4*_indirPayload^0.4;		// use to buff cost of small HE rounds
        if (_isHEAT or getNumber (_cfgAmmo >> "explosive") > 0) then { _fuseCost = _fuseCost + _penetration^0.6 };		// add on HEAT rounds

        private _guidanceMod = [0, 50] select (getNumber (_cfgAmmo >> "weaponLockSystem") != 0);
        //if (_log) then {diag_log format ["Hit %1, indir %2, indirRange %3, caliber %4, pen %5, guidance %6", _hit, _indirHit, _indirRange, _caliber, _penetration, _guidanceMod]};

        private _payloadVal = 0.1*(_hit + _penetration)^1.2 + _indirPayload + _fuseCost/2 + _guidanceMod/2;
        [_payloadVal, _fuseCost + _guidanceMod];
    };
    /*if (_simType == "shotilluminating") exitWith {
        private _intensity = getNumber (_cfgAmmo >> "intensity");
        private _brightness = 2500 * getNumber (_cfgAmmo >> "brightness") ^ 2;
        private _timeToLive = getNumber (_cfgAmmo >> "timeToLive");
        //if (_log) then {diag_log format ["Intensity %1, brightness %2, ttl %3", _intensity, _brightness, _timeToLive]};
        [_timeToLive * (_intensity max _brightness) / 80000, 0];
    };*/
    if (_simType == "shotcm") exitWith { [100, 0] };
    [120, 0];		// Smokes are all the same?
};

// Normalized for 50cal at approx 4
private _fnc_ammoPriceCalculator = {
    params ["_className", ["_log", false]];

    // No way to get reasonable initSpeed from CfgAmmo, need to read from CfgMagazines
    if (isNil "A3A_ammoInitSpeed") then {
        A3A_ammoInitSpeed = createHashMap;
        {
            private _ammo = getText (_x >> "ammo");
            A3A_ammoInitSpeed set [_ammo, getNumber (_x >> "initSpeed")];
        } forEach ("true" configClasses (configFile >> "CfgMagazines"));
    };

    private _cfgAmmo = configFile >> "CfgAmmo" >> _className;
    //if (!isClass _cfgAmmo) exitWith { Error_1("Ammo %1 does not exist", _className); 10000 };
    if (isNumber (_cfgAmmo >> "A3A_price")) exitWith { getNumber (_cfgAmmo >> "A3A_price") };

    private _rocketSims = ["shotrocket", "shotmissile"];
    private _utilSims = ["shotsmoke", "shotsmokex", "shotilluminating", "shotnvgmarker", "shotcm"];
    private _mineSims = ["shotmine", "shotdirectionalbomb", "shotboundingmine", "shotgrenade"];

    private _simType = tolower getText(_cfgAmmo >> "simulation");
    //if (_log) then {diag_log format ["Data for ammo %1:", _className]};

    private _guidanceMod = call {
        if (getNumber (_cfgAmmo >> "weaponLockSystem") != 0) exitWith { getNumber (_cfgAmmo >> "missileLockMaxDistance") / 30 };
        if (getNumber (_cfgAmmo >> "manualControl") != 0) exitWith { getNumber (_cfgAmmo >> "maxControlRange") / 30 };
        0;
    };

    // Add in thrust for rockets and maneuvrability for guided missiles (iron bombs are missile sim, so need to check guidance)
    private _muzzVelocity = A3A_ammoInitSpeed getOrDefault [_className, 0];
    private _subVelocity = _muzzVelocity;
    private _totThrust = 0;
    if (_simType in _rocketSims) then {
        _totThrust = getNumber (_cfgAmmo >> "thrust") * getNumber (_cfgAmmo >> "thrustTime");
        _subVelocity = _subVelocity + _totThrust;           // need this for some retarded KEP ammo
        if (_guidanceMod > 0) then {
            private _manHigh = getNumber (_cfgAmmo >> "maxSpeed")^1.8 * getNumber (_cfgAmmo >> "maneuvrability") / 175;
            private _manLow = getNumber (_cfgAmmo >> "maxSpeed") * getNumber (_cfgAmmo >> "maneuvrability") / 2;
            //if (_log) then {diag_log format ["thrust %1, maxSpeed %2, manuver %3, manHigh %4, manLow %5, guidanceMod %6", _totThrust, getNumber (_cfgAmmo >> "maxSpeed"), getNumber (_cfgAmmo >> "maneuvrability"), _manHigh, _manLow, _guidanceMod]};
            _totThrust = _totThrust + (_manHigh max _manLow);
        };
    };
    //if (_log) then {diag_log format ["Sim %1, velocity %2, thrust %3, guidanceMod %4", _simType, _muzzVelocity, _totThrust, _guidanceMod]};

    // submunitionAmmo can be either [type, prob, type2, prob2] array or just type string
    private _subAmmoType = getText (_cfgAmmo >> "submunitionAmmo");
    if (isArray (_cfgAmmo >> "submunitionAmmo")) then { _subAmmoType = getArray (_cfgAmmo >> "submunitionAmmo") # 0 };

    private _subCount = 1;
    private _probablyHEAT = false;
    while {_subAmmoType != ""} do
    {
        private _subConeType = getArray (_cfgAmmo >> "submunitionConeType");
        if (count _subConeType >= 2) then {
            private _thisSubCount = if (_subConeType#1 isEqualType 0) then { _subConeType#1 } else { count (_subConeType#1) };
            _subCount = _subCount * _thisSubCount;
        };
        _probablyHEAT = count _subConeType < 2;										// single projectile so treat as HEAT warhead later
        private _subVelDiff = 0 max (getNumber (_cfgAmmo >> "submunitionInitSpeed") - _subVelocity);
        _subVelocity = _subVelocity + _subVelDiff;                      // Tested with CUP CRV7 and Rocket_04_AP
        _totThrust = _totThrust + _subVelDiff;

        // Submunitions can have thrust/guidance/maneuver too. Add that in.
        _cfgAmmo = configFile >> "CfgAmmo" >> _subAmmoType;			// replace main ammo
        _simType = tolower getText (_cfgAmmo >> "simulation");
        if (_simType in _rocketSims) then {
            _subVelocity = _subVelocity + getNumber (_cfgAmmo >> "thrust") * getNumber (_cfgAmmo >> "thrustTime");
            if (getNumber (_cfgAmmo >> "weaponLockSystem") != 0) then {
                private _maneuvrability = getNumber (_cfgAmmo >> "maxSpeed")^1.8 * getNumber (_cfgAmmo >> "maneuvrability") / 175;
                //if (_log) then {diag_log format ["thrust %1, maxSpeed %2, maneuvrability %3", _totThrust, getNumber (_cfgAmmo >> "maxSpeed"), getNumber (_cfgAmmo >> "maneuvrability")]};
                _totThrust = _totThrust + _maneuvrability;
            };
        };
        //if (_log) then {diag_log format ["SubammoType %1, subVelocity %2, subCount %3", _subAmmoType, _subVelocity, _subCount]};

        // iteration, in case of chained submunitions
        _subAmmoType = getText (_cfgAmmo >> "submunitionAmmo");
        if (isArray (_cfgAmmo >> "submunitionAmmo")) then { _subAmmoType = getArray (_cfgAmmo >> "submunitionAmmo") # 0 };
        if (_subAmmoType == "rhs_ammo_spall") then {break};			// fake shit
    };

    // hit & indirHit for final projectile (assuming original doesn't matter for subProjectile)
    [_cfgAmmo, _probablyHEAT, _log] call _fnc_payloadValue params ["_varPayload", "_fixedPayload"];
    private _varTotal = _varPayload * _subCount^0.8 + _guidanceMod;
    private _varCost = 0.000175 * (600 + _muzzVelocity + _totThrust) * _varTotal;

    // guidance applies twice, once as payload weight and then as direct expense
    private _price = _varCost + (_fixedPayload * _subCount^0.8) + _guidanceMod;
    //if (_log) then {diag_log format ["VCost %1, FCost %2, Vmul %3, Price %4, end", _varCost, _fixedPayload*_subCount^0.8, 1 + (_muzzVelocity + _totThrust) / 600, _price]};
    _price;
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
        private _dispersion = 0.0001 max getNumber (_modeCfg >> "dispersion");
        _dispMul =  (0.001 / _dispersion) ^ 0.5;
    };

    // extra for attachment slots? Or not?

    // fire mode availability? maybe unnecessary with type mod

    0.5 * ((_basePrice * _dispMul) + _glMod);
};

private _fnc_itemPriceCalculator = {
    params ["_className"];

    private _config = (configFile >> "CfgWeapons" >> _className);
    if (isNumber (_config >> "A3A_price")) exitWith { getNumber (_config >> "A3A_price") };

    private _cats = _className call A3A_fnc_equipmentClassToCategories;
    private _itemPrice = switch (_cats#0) do {
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
    0.5 * _itemPrice;
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
