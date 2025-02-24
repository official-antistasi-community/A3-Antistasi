#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"

private _types = [];
_types set [0,["AssaultRifle","MachineGun","SniperRifle","Shotgun","Rifle","SubmachineGun","Shotgun"]];
_types set [1,["Launcher","MissileLauncher","RocketLauncher"]];
_types set [2,["Handgun"]];
_types set [3,["AccessorySights"]]; // Optics
_types set [4,["AccessoryPointer"]]; // Rails
_types set [5,["AccessoryMuzzle"]]; // Muzzles
_types set [6,["AccessoryBipod"]]; // Bipods

// create this array to hold the classnames. We want to use a hashmap later.
private _gunShopArray = [];
_gunShopArray set [0, []];
_gunShopArray set [1, []];
_gunShopArray set [2, []];
_gunShopArray set [3, []];
_gunShopArray set [4, []];
_gunShopArray set [5, []];
_gunShopArray set [6, []];


private _gunShopData = createHashMap;





_gunShopData set [A3A_IDC_GUN_SHOP_PRIMARY_TAB, (allRifles + allSniperRifles + allMachineGuns  + allSMGs + allShotguns)];
_gunShopData set [A3A_IDC_GUN_SHOP_HANDGUN_TAB, (allHandguns)];

_gunShopData set [A3A_IDC_GUN_SHOP_SECONDARY_TAB, (allMissileLaunchers + allRocketLaunchers)];
_gunShopData set [A3A_IDC_GUN_SHOP_GRENADES_TAB, (allGrenades)];
_gunShopData set [A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB, (allMine + allMineDirectional + allMineBounding)];
_gunShopData set [A3A_IDC_GUN_SHOP_MAGAZINES_TAB, (allMagBullet + allMagShotgun + allMagMissile + allMagRocket + allMagShell + allMagSmokeShell + allMagFlare)];

_gunShopData set [A3A_IDC_GUN_SHOP_OPTICS_TAB, (allOptics)];
_gunShopData set [A3A_IDC_GUN_SHOP_RAILS_TAB, (allPointerAttachments)];
_gunShopData set [A3A_IDC_GUN_SHOP_MUZZLES_TAB, (allMuzzleAttachments)];
_gunShopData set [A3A_IDC_GUN_SHOP_BIPODS_TAB, (allBipods)];

A3A_GunShopData = _gunShopData;
_gunShopData;