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
private _lootDeviceBag = [];

switch (teamPlayer) do {
     case independent: {_lootDeviceBag append rebelBackpackDevice};
     default {_lootDeviceBag append occupantBackpackDevice};
};
// balance radio packs and drone bag weighting
private _countRadios = count allBackpacksRadio;
private _countDevice = count _lootDeviceBag;
if (_countRadios > _countDevice) then {
     _droneList = _lootDeviceBag;
     _quantity = ceil (_countRadios / _countDevice);
     for "_i" from 1 to _quantity do {
          _lootDeviceBag append _droneList;
     };
};
lootDevice append _lootDeviceBag + allBackpacksRadio;

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
