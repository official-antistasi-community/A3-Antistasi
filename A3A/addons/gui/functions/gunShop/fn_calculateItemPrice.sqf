#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"

params ["_className"];


_fnc_weaponPriceCalculator = {
    params ["_className", "_type", "_basePrice"];

    switch (_type) do {
        case "AssaultRifle": {
            private _cost = _basePrice * 4.0;
            private _config = (configFile >> "CfgWeapons" >> _className);
            private _modes = getArray(_config >> "modes");
            private _muzzle = getArray(_config >> "muzzles");

            // check if single fire only, or one fire mode
            if(_modes isEqualTo [] or (count _modes isEqualTo 1)) then 
            {
                _cost = _cost / 2;
            };

            // check if this has a gl
            if(count _muzzle >= 2 && {"gl" == getText (_config >> (_muzzle select 1) >> "cursorAim")}) then 
            {
                _cost = _cost + 400;
            };

            _cost
        };
        case "Handgun": {_basePrice * 0.5};
        case "Launcher": {_basePrice * 8.0};
        case "MissileLauncher": {_basePrice * 20.0 * (allowGuidedLaunchers + 1)}; // double the price if they can unlock it
        case "RocketLauncher": {_basePrice * 6.0};
        case "MachineGun": {_basePrice * 10.0};
        case "Shotgun": {_basePrice * 2.0};
        case "Rifle": {_basePrice * 2.0};
        case "SubmachineGun": {_basePrice * 2.0};
        case "SniperRifle": {_basePrice * 12.0};
        default {
            //diag_log format["None supported type: %1 of weapon: %2,",_type,_className];
        };
    };
};

_fnc_itemPriceCalculator = {
    params ["_className", "_type", "_basePrice"];

    switch (_type) do {
        case "AccessoryMuzzle": {_basePrice * 4.0};
        case "AccessoryPointer": {_basePrice * 2.0};
        case "AccessorySights": {
            // shamelessly stolen from ace.
            private _config = (configFile >> "CfgWeapons" >> _className);
            private _minZoom = 999; // FOV, so smaller is more zoomed in
            {
                _minZoom = _minZoom min (getNumber (_x >> "opticsZoomMin"));
            } forEach configProperties [_config >> "ItemInfo" >> "OpticsModes"];

            if (_minZoom in [0, 999]) exitWith {_basePrice};
            
            round(_basePrice * (0.25/_minZoom));

        };
        case "AccessoryBipod": {_basePrice * 0.75};
        default {
            //diag_log format ["None supported type: %1 of item: %2", _type, _className];
            _basePrice
        };
    };
};

_fnc_magazinePriceCalculator = {
    params ["_className", "_type", "_basePrice"];

    switch (_type) do {
        case "Bullet": {
            private _cfgMagazines = configFile >> "CfgMagazines" >> _className;
            private _count = getNumber(_cfgMagazines >> "count");
            private _velocity = getNumber(_cfgMagazines >> "count");
            private _ammo = getText(_cfgMagazines >> "ammo");

            private _cfgAmmo = configFile >> "CfgAmmo" >> _ammo;
            private _hit = getNumber(_cfgAmmo >> "hit");
            private _indirHit = getNumber(_cfgAmmo >> "indirectHit");
            private _caliber = getNumber(_cfgAmmo >> "caliber");
            private _velocity = getNumber(_cfgAmmo >> "typicalSpeed");
            private _explosive = getNumber(_cfgAmmo >> "explosive");

            private _penetrability = (15/10000) * _caliber  * _velocity;

            private _costPerRound = if (_explosive isEqualTo 1) then {_penetrability * (_indirHit + _hit)} else {_penetrability * ((_indirHit + _hit)/2)};

            private _cost = (_costPerRound * _count) * _basePrice;

            round (sqrt _cost)
        };
        case "Flare": {
            private _cfgMagazines = configFile >> "CfgMagazines" >> _className;
            private _count = getNumber(_cfgMagazines >> "count");
            _count * _basePrice * 0.15
        };
        case "Grenade": {_basePrice * 0.25};
        case "Missile": {
            private _cfgMagazines = configFile >> "CfgMagazines" >> _className;
            private _count = getNumber(_cfgMagazines >> "count");
            private _ammo = getText(_cfgMagazines >> "ammo");

            private _cfgAmmo = configFile >> "CfgAmmo" >> _ammo;
            private _hit = getNumber(_cfgAmmo >> "hit");
            private _indirHit = getNumber(_cfgAmmo >> "indirectHit");
            private _caliber = getNumber(_cfgAmmo >> "caliber");
            private _velocity = getNumber(_cfgAmmo >> "typicalSpeed");
            private _explosive = getNumber(_cfgAmmo >> "explosive");

            private _penetrability = (15/10000) * _caliber  * _velocity;

            private _costPerRound = if (_explosive isEqualTo 1) then {_penetrability * (_indirHit + _hit)} else {_penetrability * ((_indirHit + _hit)/2)};

            // this is a AA missle
            if (getNumber(_cfgAmmo >> "aiAmmoUsageFlags") isEqualTo 256) then 
            {
                // AA missiles are insanely fast, so we need to at least divid the price in half or no one will be able to afford it
                _costPerRound = _costPerRound / 2;
            };

            // check if the missile has a subammo 
            private _subAmmo = getText(_cfgAmmo >> "submunitionAmmo");
            if(_subAmmo isNotEqualTo "") then 
            {
                // recal the damage 
                _cfgAmmo = configFile >> "CfgAmmo" >> _subAmmo;
                _hit = getNumber(_cfgAmmo >> "hit");
                _indirHit = getNumber(_cfgAmmo >> "indirectHit");
                _caliber = getNumber(_cfgAmmo >> "caliber");
                _velocity = getNumber(_cfgAmmo >> "typicalSpeed");
                _explosive = getNumber(_cfgAmmo >> "explosive");

                _penetrability = (15/100000) * _caliber  * _velocity;

                //add the "damage" to the other cost.
                private _costPerRoundSubAmmo = if (_explosive isEqualTo 1) then {_penetrability * (_indirHit + _hit)} else {_penetrability * ((_indirHit + _hit)/2)};
                _costPerRoundSubAmmo = sqrt _costPerRoundSubAmmo;
                _costPerRound = (_costPerRound + _costPerRoundSubAmmo) / 2;
            };

            //I will be evil here. If they can unlock missle lanuchers then charge more, this can be very expensive.
            round (_costPerRound * _count * _basePrice * (allowGuidedLaunchers + 1))
        };
        case "Rocket": {
            _basePrice = _basePrice * 3;

            private _cfgMagazines = configFile >> "CfgMagazines" >> _className;
            private _count = getNumber(_cfgMagazines >> "count");
            private _velocity = getNumber(_cfgMagazines >> "count");
            private _ammo = getText(_cfgMagazines >> "ammo");

            private _cfgAmmo = configFile >> "CfgAmmo" >> _ammo;
            private _hit = getNumber(_cfgAmmo >> "hit");
            private _indirHit = getNumber(_cfgAmmo >> "indirectHit");
            private _caliber = getNumber(_cfgAmmo >> "caliber");
            private _velocity = getNumber(_cfgAmmo >> "typicalSpeed");
            private _explosive = getNumber(_cfgAmmo >> "explosive");

            private _penetrability = (15/10000) * _caliber  * _velocity;

            private _costPerRound = if (_explosive isEqualTo 1) then {_penetrability * (_indirHit + _hit)} else {_penetrability * ((_indirHit + _hit)/2)};

            private _cost = (_costPerRound * _count) * _basePrice;

            round (sqrt _cost)
        };
        case "Shell": {
            private _cfgMagazines = configFile >> "CfgMagazines" >> _className;
            private _count = getNumber(_cfgMagazines >> "count");
            round (_count * _basePrice * 0.4)
        };
        case "ShotgunShell": {
            private _cfgMagazines = configFile >> "CfgMagazines" >> _className;
            private _count = getNumber(_cfgMagazines >> "count");
            round (_count * _basePrice * 0.5)
        };
        case "SmokeShell": {
            private _cfgMagazines = configFile >> "CfgMagazines" >> _className;
            private _count = getNumber(_cfgMagazines >> "count");
            round (_count * _basePrice * 0.15)
        };
        case "UnknownMagazine": {
            _basePrice *.2
        };

        default {
            //diag_log format ["None supported type: %1 of magazine: %2", _type, _className];
            private _cfgMagazines = configFile >> "CfgMagazines" >> _className;
            private _count = getNumber(_cfgMagazines >> "count");
            round (_count * _basePrice * 0.4)
        };
    };
};

_fnc_minePriceCalculator = {
    params ["_className", "_type", "_basePrice"];

    switch (_type) do {
        case "Mine": {_basePrice * 4.0};
        case "MineBounding": {_basePrice * 5.0};
        case "MineDirectional": {_basePrice * 5.0};
        default {
            // this should not be reached unless something has gone horribly wrong
            //diag_log format ["None supported type: %1 of mine: %2,", _type, _className];
            _basePrice
        };
    };
};

//diag_log format ["Creating price for %1", _className];

private _price = 0;
private _cfg = configFile >> "A3A" >> "GunShop";

if (isClass (_cfg >> _className)) then 
{
    _price = getNumber(_cfg >> _className >> "price");
} else {
    //diag_log format ["No price for %1 in config", _className];
    // calculate price now. 
    (_className call BIS_fnc_itemType) params ["_category", "_type"];
    
    // 15: 167, 25: 100, 40: 63, -1: 50 
    private _base = if(minWeaps isNotEqualTo -1) then {100 * (25 / minWeaps)} else {50};

    switch (_category) do {
        case "Weapon": {_price = ([_className, _type, _base * 2] call _fnc_weaponPriceCalculator() * (unlockedUnlimitedAmmo + 1)}; // unlockedUnlimitedAmmo once bought, double price
        case "Item": {_price = [_className, _type, _base] call _fnc_itemPriceCalculator};
        case "Magazine": {_price = [_className, _type, _base] call _fnc_magazinePriceCalculator};
        case "Mine": {_price = ([_className, _type, _base] call _fnc_minePriceCalculator) * (allowUnlockedExplosives + 1)}; // double the price, since they can unlock explosives
        default {
            //diag_log format ["None supported category: %1 of weapon: %2,", _category, _className];
        };
    };
};

_price