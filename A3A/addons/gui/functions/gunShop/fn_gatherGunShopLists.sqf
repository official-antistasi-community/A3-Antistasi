#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_minCount", 2]];


private _fnc_roundPrice = {
    params ["_price"];
    if (_minCount < 100) then { _price = _price * (0.8 + random 0.4) };
    _price = call {
        if (_price > 2000) exitWith { ceil (_price / 100) * 100 };
        if (_price > 200) exitWith { ceil (_price / 10) * 10 };
        ceil (_price);
    };
    _price max 5;
};

private _fnc_generateList = {
    params ["_cfgType", "_minCount", "_maxStock", "_allItems"];

    private _itemPriceList = createHashMap;
    private _itemCount = _minCount + round (random 0.2 * count _allItems);
    while {_itemCount > 0 and _allItems isNotEqualTo []} do {
        private _item = _allItems deleteAt floor random count _allItems;
        private _price = [_item, _cfgType] call A3A_GUI_fnc_calculateItemPrice;
        private _stockGS = ceil (_maxStock * (0.3 + random 0.7));
        private _stockArsenal = _arsenalCountHM getOrDefault [_item, 0];
        _itemPriceList set [_item, [_price call _fnc_roundPrice, _stockGS, _stockArsenal]];
        _itemCount = _itemCount - 1;
    };
    _itemPriceList;
};

// Clear the data, so other functions know it's in progress
A3A_gunShopData = createHashMap;

// Set up the item price cache
if (isNil "A3A_itemPriceCache") then { A3A_itemPriceCache = createHashMap };

// Build arsenal item quantity lookup table
private _arsenalCountHM = createHashMap;
{ _arsenalCountHM insert _x } forEach ((jna_dataList select [0,3]) + (jna_dataList select [18,9]));

private _gunShopData = createHashMap;

private _glOnly = allGrenadeLaunchers select { (_x call A3A_fnc_equipmentClassToCategories) # 0 != "Rifles" };
_gunShopData set [A3A_IDC_GUN_SHOP_PRIMARY_TAB, ["weapon", _minCount*3, 15, (allRifles + allSniperRifles + allMachineGuns + allSMGs + allShotguns + _glOnly) - unlockedWeapons] call _fnc_generateList];
_gunShopData set [A3A_IDC_GUN_SHOP_HANDGUN_TAB, ["weapon", _minCount, 15, +allHandguns - unlockedHandguns] call _fnc_generateList];
_gunShopData set [A3A_IDC_GUN_SHOP_SECONDARY_TAB, ["weapon", _minCount, 8, (allMissileLaunchers + allRocketLaunchers) - unlockedWeapons] call _fnc_generateList];

_gunShopData set [A3A_IDC_GUN_SHOP_GRENADES_TAB, ["mag", _minCount, 30, +allGrenades - unlockedGrenades] call _fnc_generateList];      // check smoke etc
_gunShopData set [A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB, ["mag", _minCount, 20, (allMine + allMineDirectional + allMineBounding) - unlockedMine] call _fnc_generateList];

_gunShopData set [A3A_IDC_GUN_SHOP_OPTICS_TAB, ["item", _minCount, 8, +allOptics - unlockedOptics] call _fnc_generateList];
_gunShopData set [A3A_IDC_GUN_SHOP_RAILS_TAB, ["item", _minCount, 8, +allPointerAttachments - unlockedPointerAttachments] call _fnc_generateList];
_gunShopData set [A3A_IDC_GUN_SHOP_MUZZLES_TAB, ["item", _minCount, 8, +allMuzzleAttachments - unlockedMuzzleAttachments] call _fnc_generateList];
_gunShopData set [A3A_IDC_GUN_SHOP_BIPODS_TAB, ["item", _minCount, 8, +allBipods - unlockedBipods] call _fnc_generateList];

if (_minCount >= 100) then {
    private _allMags = allMagBullet + allMagShotgun + allMagMissile + allMagRocket + allMagShell + allMagSmokeShell + allMagFlare;
    _gunShopData set [A3A_IDC_GUN_SHOP_MAGAZINES_TAB, ["mag", _minCount, 30, _allMags - unlockedMagazines] call _fnc_generateList];
} else {
    // Special case for magazines, base on previous weapons
    private _weapons = keys (_gunShopData get A3A_IDC_GUN_SHOP_PRIMARY_TAB);
    _weapons append keys (_gunShopData get A3A_IDC_GUN_SHOP_HANDGUN_TAB);
    _weapons append keys (_gunShopData get A3A_IDC_GUN_SHOP_SECONDARY_TAB);

    private _magsPrices = createHashMap;
    {
        private _allMags = compatibleMagazines _x;
        if (_allMags isEqualTo []) then {continue};
        private _mag = if (random 1 < 0.5) then {_allMags#0} else {selectRandom _allMags};      // first-mag bias
        if !(_mag in allMagazines) then {continue};     // use Antistasi blacklisting? kinda expensive but whatever

        private _price = [_mag, "mag"] call A3A_GUI_fnc_calculateItemPrice;
        private _stockGS = ceil (15 + random 15);
        private _stockArsenal = _arsenalCountHM getOrDefault [_mag, 0];
        private _capacity = getNumber (configFile >> "CfgMagazines" >> _mag >> "count") max 1;
        if (_stockArsenal isNotEqualTo -1) then { _stockArsenal = _stockArsenal / _capacity };
        _magsPrices set [_mag, [_price call _fnc_roundPrice, _stockGS, _stockArsenal]];
    } forEach _weapons;

    _gunShopData set [A3A_IDC_GUN_SHOP_MAGAZINES_TAB, _magsPrices];
};

A3A_GunShopData = _gunShopData;
