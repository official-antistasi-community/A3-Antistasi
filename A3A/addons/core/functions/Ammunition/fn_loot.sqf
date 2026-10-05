#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
//////////////////
// Basic Items ///
//////////////////
lootBasicItem append allMaps + AllToolkits + allWatches + allCompasses + allMedikits + allFirstAidKits;

/////////////////
//    NVG'S   ///
/////////////////
lootNVG append allNVGs;

/////////////////////
// Assigned Items ///
/////////////////////

// Only the trash in here now, GPS/NVG/Terminal handled separately
lootItem append allMineDetectors + allRadios + allLaserDesignators + allBinoculars + allLaserBatteries + allGadgets;

////////////////////
//    Weapons    ///
////////////////////
lootWeapon append allRifles + allSniperRifles + allHandguns + allMachineGuns + allMissileLaunchers + allRocketLaunchers + allSMGs + allShotguns;

/////////////////////////////
//   Weapon Attachments   ///
/////////////////////////////
lootAttachment append allBipods + allOptics + allMuzzleAttachments + allPointerAttachments;

////////////////////
//    Grenades   ///
////////////////////
lootGrenade append allGrenades + allMagShell + allIRGrenades + allMagSmokeShell + allMagFlare;

////////////////////
//   Magazines   ///
////////////////////
lootMagazine append allMagBullet + allMagShotgun + allMagMissile + allMagRocket + lootGrenade;

// Disposable launchers can't be reloaded, so rockets that only fit them are useless as loot.
// CBA disposables fire from a hidden "loaded" class, so check those too.
private _disposableMags = createHashMap;
{
    { _disposableMags set [_x, true] } forEach compatibleMagazines _x;
} forEach (allDisposable + ((configProperties [configFile >> "CBA_DisposableLaunchers", "isArray _x"]) apply {configName _x}));

// Reusable launcher -> loot magazines it can fire. Used to swap in useful ammo when crates roll a disposable
A3A_launcherLootAmmo = createHashMap;
{
    private _mags = compatibleMagazines _x arrayIntersect lootMagazine;
    { _disposableMags deleteAt _x } forEach _mags;
    if (_mags isNotEqualTo []) then { A3A_launcherLootAmmo set [_x, _mags] };
} forEach (allRocketLaunchers + allMissileLaunchers - allDisposable);

lootMagazine = lootMagazine - keys _disposableMags;

///////////////////
//  Explosives  ///
///////////////////
lootExplosive append allMine + allMineDirectional + allMineBounding;

lootExplosive deleteAt (lootExplosive find "APERSMineDispenser_Mag");
lootExplosive deleteAt (lootExplosive find "TrainingMine_Mag");
lootExplosive deleteAt (lootExplosive find "IEDLandSmall_Remote_Mag");
lootExplosive deleteAt (lootExplosive find "IEDUrbanSmall_Remote_Mag");
lootExplosive deleteAt (lootExplosive find "IEDLandBig_Remote_Mag");
lootExplosive deleteAt (lootExplosive find "IEDUrbanBig_Remote_Mag");

///////////////////
//   Backpacks  ///
///////////////////
lootBackpack append allBackpacksEmpty;

/////////////////
//   Helmets  ///
/////////////////
lootHelmet append allArmoredHeadgear;

///////////////
//   Vests  ///
///////////////
lootVest append allArmoredVests + allCivilianVests;

/////////////////////
//   Device Bags  ///
/////////////////////
lootDevice = allBackpacksRadio;
private _quantity = ceil (count allBackpacksRadio / (count rebelBackpackDevice max 1));
for "_i" from 1 to _quantity do {
     lootDevice append rebelBackpackDevice;
};

////////////////////////////////////
//      REBEL STARTING ITEMS     ///
////////////////////////////////////
//KEEP AT BOTTOM!!!
private _initialEquipment = FactionGet(reb,"initialRebelEquipment");
_initialEquipment append lootBasicItem;
_initialEquipment append (A3A_faction_reb get "uniforms");
_initialEquipment append (A3A_faction_civ get "uniforms");
_initialEquipment append allCosmeticHeadgear;
_initialEquipment append allCosmeticGlasses;
