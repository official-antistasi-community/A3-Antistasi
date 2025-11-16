// note use of preInit & postInit will run for EVERY mission, use sparingly or with non a3a mission aborts in place, example check if the class (missionConfigFile >> "A3A") exists
class CfgFunctions
{
    class A3A
    {
        class AI {
            file = QPATHTOFOLDER(functions\AI);
            class AIdrag {};
            class AIfollow {};
            class airbomb {};
            class AIreactOnKill {};
            class artySupport {};
            class artySupportFire {};
            class artySupportFireOld {};
            class artySupportMarkers {};
            class askHelp {};
            class assaultBuilding {};
            class attackDrillAI {};
            class attackHeli {};
            class autoHealFnc {};
            class autoLoot {};
            class autoRearm {};
            class callForSupport {};
            class canConquer {};
            class canFight {};
            class captureX {};
            class chargeWithSmoke {};
            class combatLanding {};
            class coverage {};
            class destroyBuilding {};
            class doFlank {};
            class duckMortar {};
            class enemyList {};
            class enemyGarrison {};
            class enemyReturnToBase {};
            class entriesLand {};
            class fastrope {};
            class findSafeRoadToUnload {};
            class fleeToSide {};
            class guardDog {};
            class hasRadio {};
            class help {};
            class hideInBuilding {};
            class inmuneConvoy {};
            class interrogate {};
            class isBuildingPosition {};
            class liberaterefugee {};
            class liberatePOW {};
            class mineSweep {};
            class mortarDrill {};
            class mortyAI {};
            class napalm {};
            class napalmDamage {};
            class napalmParticles {};
            class nearEnemy {};
            class paradrop {};
            class rearmCall {};
            class rebelReactOnKill {};
            class rebelReturnToBase {};
            class recallGroup {};
            class smokeCoverAuto {};
            class staticAutoT {};
            class staticMGDrill {};
            class suppressingFire {};
            class surrenderAction {};
            class typeOfSoldier {};
            class undercoverAI {};
            class unitGetToCover {};
            class useFlares {};
            class VANTinfo {};
            class vehicleConvoyHeliTravel{};
            class vehicleConvoyTravel {};
            class vehicleMarkers {};
        };

        class Ammunition {
            file = QPATHTOFOLDER(functions\Ammunition);
            class ACEpvpReDress {};
            class addPrimaryAndMags {};
            class allMagazines {};
            class ammunitionTransfer {};
            class arsenalManage {};
            class categoryOverrides {};
            class checkRadiosUnlocked {};
            class configSort {};
            class dress {};
            class empty {};
            class equipmentClassToCategories {};
            class equipmentIsValidForCurrentModset {};
            class equipmentSort {};
            class fetchRebelGear {};
            class fillLootCrate {};
            class generateRebelGear {};
            class getRadio {};
            class hasARadio {};
            class itemConfig {};
            class itemConfigMass {};
            class itemSort {};
            class itemType {};
            class launcherInfo {};
            class loot {};
            class randomRifle {};
            class setCargoItems {};
            class setRebelLoadouts {};
            class transfer {};
            class unlockEquipment {};
            class vehicleSort {};
        };

        class Base {
            file = QPATHTOFOLDER(functions\Base);
            class actionGarrisonVehicle {};
            class addActionBreachVehicle {};
            class addAggression {};
            class addEnemyResources {};
            class addHC {};
            class addRecentDamage {};
            class addTimeForIdle {};
            class aggressionUpdateLoop {};
            class AILoadInfo {};
            class airspaceControl {};
            class blackout {};
            class buildHQ {};
            class calculateAggression {};
            class canManageAI {};
            class canMoveHQ {};
            class chooseAttack {};
            class chooseMachineForGarrison {};
            class citiesToCivPatrol {};
            class citySideChange {};
            class citySupportChange {};
            class commsMP {};
            class createBreachChargeText {};
            class createOutpostsFIA {};
            class createPetros {};
            class destroyCity {};
            class distance {};
            class distanceUnits {};
            class fastTravelMove {};
            class FIAradio {};
            class findAttackTargets {};
            class findBasesForConvoy {};
            class findNearestGoodRoad {};
            class flagaction {};
            class fogCheck {};
            class garbageCleaner {};
            class garbageCleanerTracker {};
            class getAggroLevelString {};
            class getMarkerForPos {};
            class getRecentDamage {};
            class getRoleCap {};
            class getVehiclesAirSupport {};
            class getVehicleSellPrice {};
            class getVehiclesGroundSupport {};
            class getVehiclesGroundTransport {};
            class hasWeapons {};
            class hideCorpses {};
            class HQGarbageClean {};
            class vehicleBoxRestore {};
            class initPetros {};
            class isFrontline {};
            class arePositionsConnected {};
            class joinMultipleGroups {};
            class localizar {};
            class lockStatic {};
            class logPerformance {};
            class manageFlagAccess {};
            class markerChange {};
            class moveHQ {};
            class mrkUpdate {};
            class mrkWIN {};
            class NATOFT {};
            class numericRank {};
            class onHeadlessClientDisconnect {};
            class onPlayerDisconnect {};
            class outpostDialog {};
            class patrolDestinations {};
            class petrosDeathMonitor {};
            class placementSelection {};
            class playableUnits {};
            class postmortem {};
            class postmortemLoop {};
            class rebuildAssets {};
            class rebuildRadioTower {};
            class relocateHQObjects {};
            class repairRuinedBuilding {};
            class resourceCheckSkipTime {};
            class resourcesFIA {};
            class returnMuzzle {};
            class revealToPlayer {};
            class scheduler {};
            class sellVehicle {};
            class setMarkerAlphaForSide {};
            class setPlaneLoadout {};
            class singlePlayerBlackScreenWarning {};
            class sizeMarker {};
            class splitVehicleCrewIntoOwnGroups {};
            class startBreachVehicle {};
            class startTestingTimer {};
            class statistics {};
            class stripGearFromLoadout {};
            class teleportVehicleToBase {};
            class timingCA {};
            class translateVariable {};
            class unlockStatic {};
            class unlockVehicle {};
        };

        class Builder {
            file = QPATHTOFOLDER(functions\Builder);
            class addBuildingActions {};
            class buildingComplete {};
            class buildingPlacer {};
            class buildingPlacerStart {};
            class calcBuildingCosts {};
            class calcBuildingReveal {};
            class initBuildableObjects {};
            class initBuilderMonitors {};
            class initPlacerDB {};
            class lockBuilderBox {};
            class placeBuilderObjects {};
            class processBuildingTimeouts {};
        };

        class Collections {
            file = QPATHTOFOLDER(functions\Collections);
            class getNestedObject {};
            class remNestedObject {};
            class setNestedObject {};
        };

        class CREATE {
            file = QPATHTOFOLDER(functions\CREATE);
            class AAFroadPatrol {};
            class airportCanAttack {};
            class AIVEHinit {};
            class attackHQ {};
            class availableBasesAir {};
            class availableBasesLand {};
            class calculateMarkerArea {};
            class cargoSeats {};
            class cleanserVeh {};
            class createAttackForceAir {};
            class createAttackForceLand {};
            class createAttackForceMixed {};
            class createAttackForceSea {};
            class createAttackVehicle {};
            class createUnit {};
            class createVehicleCrew {};
            class createVehicleQRFBehaviour {};
            class crewTypeForVehicle {};
            class FIAinitBases {};
            class fillVehicleCrewCargo {};
            class garrisonSize {};
            class groupDespawner {};
            class invaderPunish {};
            class milBuildings {};
            class minefieldAAF {};
            class mortarPos {};
            class NATOinit {};
            class patrolReinf {};
            class registerUnitType {};
            class reinforcementsAI {};
            class reinforceVehicle {};
            class reinforceSide {};
            class remoteBattle {};
            class safeVehicleSpawn {};
            class singleAttack {};
            class spawnGroup {};
            class spawnVehicle {};
            class spawnVehicleAtMarker {};
            class spawnVehiclePrecise {};
            class vehAvailable {};
            class VEHdespawner {};
            class vehKilledOrCaptured {};
            class wavedAttack {};
            class WPCreate {};
        };

        class debug {
            file = QPATHTOFOLDER(functions\debug);
            class deleteEmptyGroupsOnSide {};
            class installSchrodingersBuildingFix {};
            class prepFunctions {};
            class spawnDebuggingLoop {};
            class spawnSelectedTemplateAI {};
            class debugSpawnVics {};
        };

        class Dialogs {
            file = QPATHTOFOLDER(functions\Dialogs);
            class canFastTravel {};
            class canSkipTime {};
            class calculateFastTravelCost {};
            class clearForest {};
            class createDialog_shouldLoadPersonalSave {};
            class dialogHQ {};
            class fastTravelRadio {};
            class HQGameOptions {};
            class loadPreviousSession {};
            class mapInfoDialog {};
            class mineDialog {};
            class skiptime {};
            class squadOptions {};
            class squadRecruit {};
            class unit_recruit {};
        };

        class EventHandler {
            file = QPATHTOFOLDER(functions\EventHandler);
            class addArtilleryFiredEH {};
            class addVehAttachDetachEH {};
            class addVehGetInOutEH {};
            class buildingChangedEH {};
            class combatModeChangedEH {};
            class enemyUnitDeletedEH {};
            class enemyUnitKilledEH {};
            class rebelUnitKilledEH {};
            class vehicleDeletedEH {};
        };

        class GarrisonLocal {
            file = QPATHTOFOLDER(functions\GarrisonLocal);
            class findPatrolPos {};
            class garrisonLocal_addGroup {};
            class garrisonLocal_addVehicle {};
            class garrisonLocal_addVehicleType {};
            class garrisonLocal_cityReinf {};
            class garrisonLocal_changeSide {};
            class garrisonLocal_clear {};
            class garrisonLocal_despawn {};
            class garrisonLocal_despawnCiv {};
            class garrisonLocal_enemyInfo {};
            class garrisonLocal_pause {};
            class garrisonLocal_remUnitType {};
            class garrisonLocal_remVehicle {};
            class garrisonLocal_spawn {};
            class garrisonLocal_spawnCiv {};
            class garrisonLocal_spawnUnit {};
            class garrisonLocal_spawnUnitCount {};
            class garrisonLocal_unpause {};
            class garrisonLocal_updateStatics {};
            class garrisonLocal_zoneCheck {};
            class garrisonOpLoop {};
            class getGarrisonLimit {};
            class setupLootCrate {};
            class spawnGarrisonPatrols {};
            class spawnGarrisonSquads {};
            class spawnGarrisonVehicles {};
            class spawnPoliceStation {};
        };

        class GarrisonServer {
            file = QPATHTOFOLDER(functions\GarrisonServer);
            class buildCity {};
            class buildEnemyGarrison {};
            class garrisonInfo {};
            class garrisonOp {};
            class garrisonServer_addGroup {};
            class garrisonServer_addUnitCount {};
            class garrisonServer_addUnitType {};
            class garrisonServer_addVehicle {};
            class garrisonServer_addVehicleType {};
            class garrisonServer_cityReinf {};
            class garrisonServer_changeSide {};
            class garrisonServer_cleanup {};
            class garrisonServer_clear {};
            class garrisonServer_delete {};
            class garrisonServer_despawn {};
            class garrisonServer_looted {};
            class garrisonServer_remUnit {};
            class garrisonServer_remUnitType {};
            class garrisonServer_remVehicle {};
            class garrisonServer_sendData {};
            class garrisonServer_spawn {};
            class garrisonServer_updateVehData {};
            class getSiteTroopQuality {};
            class rebelVehPlacedWorker {};
            class selectGarrisonVehicleType {};
            class showSiteInfo {};
        };

        class init {
            file = QPATHTOFOLDER(functions\init);
            //Main initialisation functions.
            class initServer {};
            class initClient {};
            class setupMonitor {};
            class startGame {};

            //Other initialisation functions (generally called by the above)
            class briefing {};
            class checkCampaignEnd {};
            class clientIdleChecker {};
            class credits {};
            class getMarkerPrefix {};
            class initACE {};
            class initACEUnconsciousHandler {};
            class initBases {};
            class initCivSpawnPlaces {};
            class initGarrisons {};
            class initMarkerTypes {};
            class initPoliceStations {};
            class initPreJIP { preInit = 1; };
            class initSpawnPlaces {};
            class initSpawnPlaceStats {};
            class initStaticPlaces {};
            class initUtilityItems {};
            class initVarCommon {};
            class initVarServer {};
            class initVehClassToCrew {};
            class initZones {};
            class initZeusLogging {};
            class installClientEH {};
            class modBlacklist {};
            class playerMarkers {};
            class prepareMarkerArrays {};
            class resourcecheck {};
            class tags {};
            class uniqueID {};
        };

        class Intel {
            file = QPATHTOFOLDER(functions\Intel);
            class getVehicleIntel {};
            class placeIntel {};
            class searchEncryptedIntel {};
            class searchIntelOnDocument {};
            class searchIntelOnLaptop {};
            class searchIntelOnLeader {};
            class selectIntel {};
            class showIntel {};
            class updateIntelFeed {};
        };

        class keybinds {
            file = QPATHTOFOLDER(keybinds);
            class keyActions {};
        };

        class LTC {
            file = QPATHTOFOLDER(functions\LTC);
            class canLoot {};
            class canTransfer {};
            class initLootToCrate {};
            class lootFromContainer {};
            class lootToCrate {};
        };

        class MinorSites {
            file = QPATHTOFOLDER(functions\MinorSites);
            class addMinorSite {};
            class buildCamp {};
            class buildRoadblock {};
            class createRebelControl {};
            class deleteMinorSite {};
            class deleteNearSites {};
            class deleteRebelControl {};
            class generateCamps {};
            class generateRoadblockPairs {};
            class generateRoadblocks {};
            class initMinorSites {};
            class renderRoadblocks {};
            class selectRoadBetweenMarkersNav {};
            class selectRoadBetweenMarkersRand {};
            class updateMinorSites {};
        };

        class Missions {
            file = QPATHTOFOLDER(functions\Missions);
            class AS_Official {};
            class AS_specOP {};
            class AS_Traitor {};
            class CON_Outpost {};
            class CON_PoliceStation {};
            class convoy {};
            class DES_Antenna {};
            class DES_Heli {};
            class DES_Vehicle {};
            class GSMission {};
            class LOG_Ammo {};
            class LOG_Bank {};
            class LOG_Supplies {};
            class LOG_Salvage {};
            class missionRequest {};
            class REP_Antenna {};
            class RES_Prisoners {};
            class RES_Refugees {};
            class supplyDrop {};
            class taskDelete {};
            class taskSetState {};
            class taskUpdate {};
            class underAttack {};
        };

        class ModsAndDLC {
            file = QPATHTOFOLDER(functions\ModsAndDLC);
            class darkMapFix {};
            class getModOfConfigClass {};
        };

        class OrgPlayers {
            file = QPATHTOFOLDER(functions\OrgPlayers);
            class donateMoney {};
            class sendMoney {};
            class isClientAdmin {};
            class isLocalAdmin {};
            class isLocalAdminOrServer {};
            class isMember {};
            class makePlayerBossIfEligible {};
            class memberAdd {};
            class membersList {};
            class musica {};
            class playerLeash {};
            class playerLeashRefresh {};
            class playerLeashCheckPosition {};
            class playerScoreAdd {};
            class promotePlayer {};
            class radioJam {};
            class ranksMP {};
            class resourcesPlayer {};
            class theBossToggleEligibility {};
            class theBossTransfer {};
            class theBossSteal {};
            class assignBossIfNone {};
            class tierCheck {};
            class unitTraits {};
        };

        class Pathfinding {
            file = QPATHTOFOLDER(functions\Pathfinding);
            class addToNavCells {};
            class addNodesNearMarkers {};
            class areNodesConnected {};
            class calculateH {};
            class convoyTest {};
            class drawGrid {};
            class drawLine {};
            class drawPath {};
            class findLandSupportMarkers {};
            class findNavDistance {};
            class findNodesInDistance {};
            class findPath {};
            class findPathPrecheck {};
            class findPathSimple {};
            class findPosOnRoute {};
            class findSeaPath {};
            class getMarkerNavPoint {};
            class getNearestNavPoint {};
            class listInsert {};
            class loadNavGrid {};
            class markNode {};
            class roadAStar {};
            class roadConnPoint {};
            class trimPath {};
        };

        class proxy {
            file = QPATHTOFOLDER(functions\proxy);
            class onPlayerRespawn {};
        };

        class Punishment {
            file = QPATHTOFOLDER(functions\Punishment);
            class outOfBounds {};
            class punishment {};
            class punishment_addActionForgive {};
            class punishment_checkStatus {};
            class punishment_evaluateEvent {};
            class punishment_FF_checkNearHQ {};
            class punishment_FF_addEH {};
            class punishment_oceanGulag {};
            class punishment_release {};
            class punishment_removeActionForgive {};
            class punishment_sentence_client {};
            class punishment_sentence_server {};
        };

        class pvp {
            file = QPATHTOFOLDER(functions\pvp);
            class pvpCheck {};
            class playerHasBeenPvPCheck {};
        };

        class REINF {
            file = QPATHTOFOLDER(functions\REINF);
            class addBombRun {};
            class addFIAsquadHC {};
            class addFIAveh {};
            class addSquadVeh {};
            class addToGarrison {};
            class addToGarrisonServer {};
            class build {};
            class buildCreateVehicleCallback {};
            class buildMinefield {};
            class canEditGarrison {};
            class canReinfPlayer {};
            class controlHCsquad {};
            class controlunit {};
            class convertToSquad {};
            class dismissPlayerGroup {};
            class dismissSquad {};
            class enemyNearCheck {};
            class equipRebel {};
            class FIAinit {};
            class FIAskillAdd {};
            class garrisonAdd {};
            class garrisonDialog {};
            class getHCSquadPrice {};
            class getHCSquadVehicleType {};
            class NATObomb {};
            class reDress {};
            class reinfPlayer {};
            class spawnHCGroup {};
            class spawnHCVeh {};
            class vehiclePrice {};
            class vehStats {};
        };

        class Revive {
            file = QPATHTOFOLDER(functions\Revive);
            class actionRevive {};
            class carry {};
            class calcVestDamageAdj {};
            class fatalWound {};
            class handleDamage {};
            class handleDamageAAF {};
            class initRevive {};
            class isMedic {};
            class selfRevive {};
            class selfReviveReset {};
            class respawn {};
            class unconscious {};
            class unconsciousAAF {};
        };

        class Runways {
            file = QPATHTOFOLDER(functions\Runways);
            class getRunwayTakeoffForAirportMarker {};
            class runwayInfo {};
        };

        class SalvageRope {
            file = QPATHTOFOLDER(functions\SalvageRope);
            class SalvageRope {};
        };

        class Save {
            file = QPATHTOFOLDER(functions\Save);
            class collectSaveData {};
            class convertSavedGarrisons {};
            class convertSavedStatics {};
            class deleteSave {};
            class exportSave {};
            class finalizeSave {};
            class importSave {};
            class loadPlayer {};
            class loadServer {};
            class savePlayer {};
            class getStatVariable {};
            class loadStat {};
            class resetPlayer {};
            class retrievePlayerStat {};
            class returnSavedStat {};
            class setStatVariable {};
            class saveLoop {};
            class writebackSaveVar {};
        };

        class String {
            file = QPATHTOFOLDER(functions\String);
            class pad_2Digits {};
            class pad_3Digits {};
        };

        class ShortID {
        file = QPATHTOFOLDER(functions\Utility\ShortID);
        class shortID_create {};
        class shortID_format {};
        class shortID_init {};
        };

        class Supports {
            file = QPATHTOFOLDER(functions\Supports);
            class addSupportTarget {};
            class calculateSupportCallReveal {};
            class clearTargetArea {};
            class createSupport {};
            class findArtilleryPos {};
            class getArtilleryRanges {};
            class getMortarMags {};
            class initSupports {};
            class maxDefenceSpend {};
            class requestArtillery {};
            class requestSupport {};
            class showInterceptedSetupCall {};
            class showInterceptedSupportCall {};
            class useRadioKey {};
            class SUP_airstrike {};
            class SUP_airstrikeAvailable {};
            class SUP_airstrikeRoutine {};
            class SUP_artillery {};
            class SUP_artilleryAvailable {};
            class SUP_ASF {};
            class SUP_ASFAvailable {};
            class SUP_ASFRoutine {};
            class SUP_carpetBombs {};
            class SUP_carpetBombsAvailable {};
            class SUP_carpetBombsRoutine {};
            class SUP_CAS {};
            class SUP_CASAvailable {};
            class SUP_CASApproach {};
            class SUP_CASDiveBomb {};
            class SUP_CASDiveBombRun {};
            class SUP_CASRoutine {};
            class SUP_CASRun {};
            class SUP_cruiseMissile {};
            class SUP_cruiseMissileAvailable {};
            class SUP_cruiseMissileRoutine {};
            class SUP_gunship {};
            class SUP_gunshipAvailable {};
            class SUP_gunshipRoutineCSAT {};
            class SUP_gunshipRoutineNATO {};
            class SUP_gunshipSpawn {};
            class SUP_mortar {};
            class SUP_mortarAvailable {};
            class SUP_mortarRoutine {};
            class SUP_orbitalStrike {};
            class SUP_orbitalStrikeAvailable {};
            class SUP_orbitalStrikeImpactEffects {};
            class SUP_orbitalStrikeBeamEffects {};
            class SUP_orbitalStrikeRoutine {};
            class SUP_QRFAir {};
            class SUP_QRFAirAvailable {};
            class SUP_QRFLand {};
            class SUP_QRFLandAvailable {};
            class SUP_QRFRoutine {};
            class SUP_SAM {};
            class SUP_SAMAvailable {};
            class SUP_SAMRoutine {};
            class SUP_tank {};
            class SUP_tankAvailable {};
            class SUP_tankRoutine {};
            class SUP_UAV {};
            class SUP_UAVRoutine {};
        };

        class FunctionsTemplates {
            file = QPATHTOFOLDER(functions\Templates);
            class aceModCompat {};
            class compatibilityLoadFaction {};
            class compileGroups {};
            class compileMissionAssets {};
            class getLoadout {};
            class loadFaction {};
            class ifaModCompat {};
            class loadAddon {};
            class rhsModCompat {};
        };

        class InitTemplates {
            file = QPATHTOFOLDER(Templates);
        };

        class ItemSets {
            file = QPATHTOFOLDER(functions\Templates\Itemsets);
            class itemset_medicalSupplies {};
            class itemset_miscEssentials {};
        };

        class Loadouts {
            file = QPATHTOFOLDER(functions\Templates\Loadouts);
            class loadout_setBackpack {};
            class loadout_addEquipment {};
            class loadout_setHelmet {};
            class loadout_setFacewear {};
            class loadout_addItems {};
            class loadout_additionalMuzzleMags {};
            class loadout_setUniform {};
            class loadout_setVest {};
            class loadout_setWeapon {};
            class loadout_builder {};
            class loadout_createBase {};
            class loadout_defaultWeaponMag {};
            class loadout_itemLoad {};
        };

        class TemplateVerification {
            file = QPATHTOFOLDER(functions\Templates\Verification);
            class TV_verifyLoadout {};
            class TV_verifyLoadoutsData {};
            class TV_verifyAssets {};
        };

        class Time {
            file = QPATHTOFOLDER(functions\Time);
            class dateToTimeString {};
            class secondsToTimeSpan {};
            class systemTime_format_S {};
            class timeSpan_format {};
            class systemTimeDurationToTimeSpan {};
        };

        class UI {
            file = QPATHTOFOLDER(functions\UI);
            class customHint {};
            class customHintCountdown {};
            class customHintDismiss {};
            class customHintInit {};
            class customHintRender {};
            class shader_ratioToHex {};
            class updateInfoBarShown {};
            class disableInfoBar {};
        };

        class uintToHex {
            file = QPATHTOFOLDER(functions\Utility\uintToHex);
            class uint12ToHex {};
            class uint16ToHex {};
            class uint20ToHex {};
            class uint24ToHex {};
            class uintToHexGenTables {};
        };

        class Undercover {
            file = QPATHTOFOLDER(functions\Undercover);
            class canGoUndercover {};
            class goUndercover {};
            class initUndercover {};
        };

        class Utility {
            file = QPATHTOFOLDER(functions\Utility);
            class adminData {};
            class basicBackpack {};
            class boxCollisionCheck {};
            class classNameToModel {};
            class countAttachedObjects {};
            class createDataObject {};
            class createNamespace {};
            class deleteNamespace {};
            class filterAndWeightArray {};
            class findEmptyPos {};
            class findPosNearHouse {};
            class getAdmin {};
            class isEngineer {};
            class localLog {};
            class log {};
            class setIdentity {};
            class setIdentityLocal {};
            class setPos {};
            class createRandomIdentity {};
            class vehicleTextureSync {};
            class vehicleWillCollideAtPosition {};
            class getRoadDirection {};
            class getItemListFromDLC {};
        };

        class UtilityItems {
            file = QPATHTOFOLDER(functions\UtilityItems);
            class attachedObjects {};
            class buyItem {};
            class carryItem {};
            class dropItem {};
            class initObject {};
            class initObjectRemote {};
            class isCarrying {};
            class remainingAmmo {};
            class remainingFuel {};
            class rotateItem {};
        };
    };
};
