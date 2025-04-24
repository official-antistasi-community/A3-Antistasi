#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_minCount", 2]];


private _fnc_roundPrice = {
    params ["_price"];
    if (_minCount < 100) then { _price = _price * (0.8 + random 0.4) };
    call {
        if (_price > 2000) exitWith { ceil (_price / 100) * 100 };
        if (_price > 200) exitWith { ceil (_price / 10) * 10 };
        ceil (_price);
    };
};

private _fnc_generateList = {
    params ["_cfgType", "_minCount", "_maxStock", "_allItems"];

    private _itemPriceList = createHashMap;
    private _itemCount = _minCount + round (random 0.2 * count _allItems);
    while {_itemCount > 0 and _allItems isNotEqualTo []} do {
        private _item = _allItems deleteAt floor random count _allItems;
        private _price = [_item, _cfgType] call A3A_GUI_fnc_calculateItemPrice;
        private _stock = ceil (_maxStock * (0.3 + random 0.7));
        _itemPriceList set [_item, [_price call _fnc_roundPrice, _stock]];
        _itemCount = _itemCount - 1;
    };
    _itemPriceList;
};

// Clear the data, so other functions know it's in progress
A3A_gunShopData = createHashMap;

// Set up the item price cache
if (isNil "A3A_itemPriceCache") then { A3A_itemPriceCache = createHashMap };

private _gunShopData = createHashMap;

private _glOnly = allGrenadeLaunchers select { (_x call A3A_fnc_equipmentClassToCategories) # 0 != "Rifles" };
_gunShopData set [A3A_IDC_GUN_SHOP_PRIMARY_TAB, ["weapon", _minCount*3, 15, allRifles + allSniperRifles + allMachineGuns + allSMGs + allShotguns + _glOnly] call _fnc_generateList];
_gunShopData set [A3A_IDC_GUN_SHOP_HANDGUN_TAB, ["weapon", _minCount, 15, +allHandguns] call _fnc_generateList];
_gunShopData set [A3A_IDC_GUN_SHOP_SECONDARY_TAB, ["weapon", _minCount, 8, allMissileLaunchers + allRocketLaunchers] call _fnc_generateList];

_gunShopData set [A3A_IDC_GUN_SHOP_GRENADES_TAB, ["mag", _minCount, 30, +allGrenades] call _fnc_generateList];      // check smoke etc
_gunShopData set [A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB, ["mag", _minCount, 20, allMine + allMineDirectional + allMineBounding] call _fnc_generateList];

_gunShopData set [A3A_IDC_GUN_SHOP_OPTICS_TAB, ["item", _minCount, 8, +allOptics] call _fnc_generateList];
_gunShopData set [A3A_IDC_GUN_SHOP_RAILS_TAB, ["item", _minCount, 8, +allPointerAttachments] call _fnc_generateList];
_gunShopData set [A3A_IDC_GUN_SHOP_MUZZLES_TAB, ["item", _minCount, 8, +allMuzzleAttachments] call _fnc_generateList];
_gunShopData set [A3A_IDC_GUN_SHOP_BIPODS_TAB, ["item", _minCount, 8, +allBipods] call _fnc_generateList];

if (_minCount >= 100) then {
    private _allMags = allMagBullet + allMagShotgun + allMagMissile + allMagRocket + allMagShell + allMagSmokeShell + allMagFlare;
    _gunShopData set [A3A_IDC_GUN_SHOP_MAGAZINES_TAB, ["mag", _minCount, 30, _allMags] call _fnc_generateList];
} else {
    // Special case for magazines, base on previous weapons
    private _weapons = keys (_gunShopData get A3A_IDC_GUN_SHOP_PRIMARY_TAB);
    _weapons append keys (_gunShopData get A3A_IDC_GUN_SHOP_HANDGUN_TAB);
    _weapons append keys (_gunShopData get A3A_IDC_GUN_SHOP_SECONDARY_TAB);

    private _magsPrices = createHashMap;
    {
        private _mag = if (random 1 < 0.5) then {_allMags#0} else {selectRandom _allMags};      // first-mag bias
        if !(_mag in allMagazines) then {continue};     // use Antistasi blacklisting? kinda expensive but whatever
        private _price = [_mag, "mag"] call A3A_GUI_fnc_calculateItemPrice;
        private _stock = ceil (15 + random 15);
        _magsPrices set [_mag, [_price call _fnc_roundPrice, _stock]];
    } forEach _weapons;

    _gunShopData set [A3A_IDC_GUN_SHOP_MAGAZINES_TAB, _magsPrices];
};

A3A_GunShopData = _gunShopData;
