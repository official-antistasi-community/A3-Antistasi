class A3A
{
    class init
    {
        //Main initialisation functions.
        class initServer {};
        class initClient {};

        //Other initialisation functions (generally called by the above)
        class cityinfo {};
        class credits {};
        class initACEUnconsciousHandler {};
        class initFuncs {};
        class initGarrisons {};
        class initSpawnPlaces {};

        class initVar {};
        class initVarClient {};
        class initVarCommon {};
        class initVarServer {};

        class initZones {};
        class modBlacklist {};
        class playerMarkers {};
        class prepareMarkerArrays {};
        class reinitY {};
        class resourcecheck {};
        class tags {};
    };

    class Base
    {
        class addActionBreachVehicle {};
        class addHC {};
        class addTimeForIdle {};
        class aggressionUpdateLoop {};
		class AILoadInfo {};
        class airspaceControl {};
		class rebelAttack {};
		class blackout {};
		class buildHQ {};
        class calculateAggression {};
        class chooseAttackType {};
		class citiesToCivPatrol {};
		class citySupportChange {};
		class commsMP {};
        class createBreachChargeText {};
		class createControls {};
		class createOutpostsFIA {};
		class createPetros {};
		class deleteControls {};
		class destroyCity {};
		class distance {};
		class distanceUnits {};
		class economicsAI {};
		class ejectPvPPlayerIfInvalidVehicle {};
		class FIAradio {};
        class findBaseForQRF {};
		class findBasesForConvoy {};
		class findNearestGoodRoad {};
		class flagaction {};
		class fogCheck {};
		class garbageCleaner {};
		class garrisonInfo {};
        class getAggroLevelString {};
        class getVehiclePoolForAttacks {};
        class getVehiclePoolForQRFs {};
		class healAndRepair {};
		class initPetros {};
		class isFrontline {};
		class isTheSameIsland {};
		class joinMultipleGroups {};
		class keys {};
		class localizar {};
		class location {};
		class logPerformance {};
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
		class placementSelection {};
		class playableUnits {};
		class getSideRadioTowerInfluence {};
		class powerReorg {};
		class prestige {};
		class radioCheck {};
		class rebuildAssets {};
		class rebuildRadioTower {};
		class relocateHQObjects {};
		class remUnitCount {};
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
        class unlockVehicle {};
        class zoneCheck {};
    };

    class AI
    {
        class airbomb {};
        class airdrop {};
        class AIreactOnKill {};
        class artillery {};
        class artySupport {};
        class askHelp {};
        class assaultBuilding {};
        class attackDrillAI {};
        class autoHealFnc {};
        class autoLoot {};
        class autoRearm {};
        class callForSupport {};
        class canConquer {};
        class canFight {};
        class captureX {};
        class chargeWithSmoke {};
        class chooseSupport {};
        class combatLanding {};
        class coverage {};
        class destroyBuilding {};
        class doFlank {};
        class enemyList {};
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
        class landThreatEval {};
        class liberaterefugee {};
        class liberatePOW {};
        class mineSweep {};
        class mortarDrill {};
        class mortyAI {};
        class napalm {};
        class napalmDamage {};
        class napalmParticles {};
        class nearEnemy {};
        class occupantInvaderUnitKilledEH {};
        class rearmCall {};
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
        class vehicleMarkers {};
    };

	class Collections
	{
		class getNestedObject {};
		class remNestedObject {};
		class setNestedObject {};
	};

	class Convoy
	{
        class cleanConvoyMarker {};
        class convoyDebug {};
        class convoyMovement {};
        class createAIAction {};
        class createConvoy {};
        class despawnConvoy {};
        class findAirportForAirstrike {};
        class followVehicle {};
        class onConvoyArrival {};
        class roadblockFight {};
        class selectAndCreateVehicle {};
        class spawnConvoy {};
        class spawnConvoyLine {};
    };

	class CREATE
	{
		class AAFroadPatrol {};
		class airportCanAttack {};
		class AIVEHinit {};
		class ambientCivs {};
		class calculateMarkerArea {};
		class cargoSeats {};
		class CIVinit {};
		class civVEHinit {};
		class cleanserVeh {};
		class createAIAirplane {};
		class createAICities {};
		class createAIcontrols {};
		class createAIOutposts {};
		class createAIResources {};
		class createAISite {};
        class createAttackVehicle {};
		class createCIV {};
		class createFIAOutposts2 {};
		class createQRF {};
		class createSDKGarrisons {};
		class createSDKgarrisonsTemp {};
		class createUnit {};
        class createVehicleQRFBehaviour {};
		class cycleSpawn {};
		class FIAinitBases {};
		class findSpawnPosition {};
		class freeSpawnPositions {};
		class garrisonReorg {};
		class garrisonSize {};
		class garrisonUpdate {};
		class groupDespawner {};
		class invaderPunish {};
		class milBuildings {};
		class minefieldAAF {};
		class mortarPos {};
		class NATOinit {};
		class patrolReinf {};
		class reinforcementsAI {};
		class remoteBattle {};
		class removeVehFromPool {};
		class safeVehicleSpawn {};
        class singleAttack {};
		class spawnGroup {};
        class spawnVehicleAtMarker {};
		class updateCAMark {};
		class vehAvailable {};
		class VEHdespawner {};
		class vehKilledOrCaptured {};
		class wavedCA {};
		class WPCreate {};
	};

    class Debugging
    {
        class deleteEmptyGroupsOnSide {};
        class installSchrodingersBuildingFix {};
        class spawnDebuggingLoop {};
    };

    class Dialogs
    {
        class buyVehicle {};
        class buyVehicleCiv {};
        class clearForest {};
        class createDialog_setParams {};
        class createDialog_shouldLoadPersonalSave {};
        class dialogHQ {};
        class fastTravelRadio {};
        class loadPreviousSession {};
        class mineDialog {};
        class moveHQObject {};
        class persistentSave {};
        class skiptime {};
        class squadOptions {};
        class squadRecruit {};
        class unit_recruit {};
    };

    class Garage
    {
        class addToPersonalGarage {};
        class addToPersonalGarageLocal {};
        class attemptPlaceVehicle {};
        class displayVehiclePlacementMessage {};
        class garage {};
        class garageVehicle {};
        class getPersonalGarage {};
        class getPersonalGarageLocal {};
        class handleVehPlacementCancelled {};
        class placeEmptyVehicle {};
        class setPersonalGarage {};
        class setPersonalGarageLocal {};
        class vehPlacementBegin {};
        class vehPlacementCallbacks {};
        class vehPlacementCancel {};
        class vehPlacementChangeVehicle {};
        class vehPlacementCleanup {};
    };

    class Garrison
    {
        class addGarrison {};
        class addRequested {};
        class checkGroupType {};
        class checkVehicleType {};
        class countGarrison {};
        class createGarrison {};
        class createGarrisonLine {};
        class getGarrison {};
        class getGarrisonRatio {};
        class getGarrisonStatus {};
        class getRequested {};
        class getVehicleCrew {};
        class initPreference {};
        class logArray {};
        class replenishGarrison {};
        class selectGroupType {};
        class selectReinfUnits {};
        class selectVehicleType {};
        class shouldReinforce {};
        class updateGarrison {};
        class updatePreference {};
        class updateReinfState {};
        class updateVehicles {};
    };

    class Intel
    {
        class getVehicleIntel {};
        class placeIntel {};
        class searchIntelOnDocument {};
        class searchIntelOnLaptop {};
        class searchIntelOnLeader {};
        class selectIntel {};
        class showIntel {};
    };

    class Logistics
    {
        class logistics_addLoadAction {};
        class logistics_getVehCapacity {};
        class logistics_initNodes {};
    };

    class LogisticsFunctions
    {
        file = "functions\Logistics\functions";
        class logistics_addAction {};
        class logistics_addOrRemoveObjectMass {};
        class logistics_addWeaponAction {};
        class logistics_canLoad {};
        class logistics_generateHardPoints {};
        class logistics_getCargoNodeType {};
        class logistics_getCargoOffsetAndDir {};
        class logistics_getVehicleNodes {};
        class logistics_initMountedWeapon {};
        class logistics_load {};
        class logistics_refreshVehicleLoad {};
        class logistics_removeWeaponAction {};
        class logistics_toggleAceActions {};
        class logistics_toggleLock {};
        class logistics_tryLoad {};
        class logistics_unload {};
    };

    class LTC
    {
        class canLoot {};
        class canTransfer {};
        class carryCrate {};
        class initLootToCrate {};
        class lootFromContainer {};
        class lootToCrate {};
        class spawnCrate {};
    };

    class Missions
    {
        class AS_Official {};
        class AS_specOP {};
        class AS_Traitor {};
        class attackHQ {};
        class CON_Outpost {};
        class convoy {};
        class deleteTask {};
        class DES_Antenna {};
        class DES_Heli {};
        class DES_Vehicle {};
        class LOG_Ammo {};
        class LOG_Bank {};
        class LOG_Supplies {};
        class LOG_Salvage {};
        class missionRequest {};
        class REP_Antenna {};
        class RES_Prisoners {};
        class RES_Refugees {};
        class taskUpdate {};
        class underAttack {};
    };

    class ModsAndDLC {
        class getModOfConfigClass {};
        class initDisabledMods {};
        class isModNameVanilla {};
    };

    class Ammunition
    {
        class ACEpvpReDress {};
        class ammunitionTransfer {};
        class arsenalManage {};
        class categoryOverrides {};
        class checkRadiosUnlocked {};
        class configSort {};
        class crateLootParams {};
        class dress {};
        class empty {};
        class equipmentClassToCategories {};
        class equipmentIsValidForCurrentModset {};
        class equipmentSort {};
        class fillLootCrate {};
        class getRadio {};
        class itemSort {};
        class itemType {};
        class launcherInfo {};
        class loot {};
        class randomRifle {};
        class transfer {};
        class unlockEquipment {};
        class vehicleSort {};
    };

    class OrgPlayers
    {
        class donateMoney {};
        class isMember {};
        class makePlayerBossIfEligible {};
        class memberAdd {};
        class membersList {};
        class playerScoreAdd {};
        class promotePlayer {};
        class ranksMP {};
        class resourcesPlayer {};
        class theBossToggleEligibility {};
        class theBossTransfer {};
        class theBossSteal {};
        class assignBossIfNone {};
        class tierCheck {};
    };

    class Pathfinding
    {
        //Public API - Call these from anywhere
        class findPath {};
        class loadNavGrid {};


        //Private API - Do NOT call these elsewhere
        class calculateH {};
        class findNearestNavPoint {};
        class getClosestMainMarker {};
        class getMainMarkers {};
        class getNavConnections {};
        class getNavPos {};
        class setNavOnMarker {};
    };

    class Punishment
    {
        class outOfBounds {};
        class punishment {};
        class punishment_addActionForgive {};
        class punishment_checkStatus {};
        class punishment_dataGet {};
        class punishment_dataRem {};
        class punishment_dataSet {};
        class punishment_dataNamespace {};
        class punishment_FF {};
        class punishment_FF_checkNearHQ {};
        class punishment_FF_addEH {};
        class punishment_notifyAdmin {};
        class punishment_oceanGulag {};
        class punishment_release {};
        class punishment_removeActionForgive {};
        class punishment_sentence_client {};
        class punishment_sentence_server {};
        class punishment_notPlayer {};
    };

    class pvp
    {
        class pvpCheck {};
        class playerHasBeenPvPCheck {};
    };

    class REINF
    {
        class addBombRun {};
        class addFIAsquadHC {};
        class addFIAveh {};
        class addSquadVeh {};
        class autoGarrison {};
        class build {};
        class buildCreateVehicleCallback {};
        class buildMinefield {};
        class enemyNearCheck {};
        class equipRebel {};
        class FIAinit {};
        class FIAskillAdd {};
        class garrisonAdd {};
        class garrisonDialog {};
        class NATObomb {};
        class NATOQuadbike {};
        class postmortem {};
        class reDress {};
        class reinfPlayer {};
        class stealStatic {};
        class vehiclePrice {};
        class vehStats {};
    };

    class Revive
    {

        class actionRevive {};
        class carry {};
        class fatalWound {};
        class handleDamage {};
        class handleDamageAAF {};
        class initRevive {};
        class isMedic {};
        class respawn {};
        class unconscious {};
        class unconsciousAAF {};
    };

    class Runways
    {
        class getRunwayTakeoffForAirportMarker {};
        class runwayInfo {};
    };

    class Supports
    {
        class addSupportTarget {};
        class calculateSupportCallReveal {};
        class clearTargetArea {};
        class createSupport {};
        class endSupport {};
        class initSupportCooldowns {};
        class sendSupport {};
        class showInterceptedSetupCall {};
        class showInterceptedSupportCall {};
        class SUP_airstrike {};
        class SUP_airstrikeAvailable {};
        class SUP_airstrikeRoutine {};
        class SUP_ASF {};
        class SUP_ASFAvailable {};
        class SUP_ASFRoutine {};
        class SUP_carpetBombs {};
        class SUP_carpetBombsAvailable {};
        class SUP_carpetBombsRoutine {};
        class SUP_CAS {};
        class SUP_CASAvailable {};
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
        class SUP_QRF {};
        class SUP_QRFAvailable {};
        class SUP_QRFRoutine {};
        class SUP_SAM {};
        class SUP_SAMAvailable {};
        class SUP_SAMRoutine {};
        class supportAvailable {};
    };

    class SalvageRope
    {
        class SalvageRope {};
    };

    class Save
    {
        class deleteSave {};
        class loadPlayer {};
        class loadServer {};
        class playerHasSave {};
        class savePlayer {};
        class getStatVariable {};
        class loadStat {};
        class resetPlayer {};
        class retrievePlayerStat {};
        class returnSavedStat {};
        class savePlayerStat {};
        class setStatVariable {};
        class varNameToSaveName {};
        class saveLoop {};
    };

    class Templates
    {
        class aceModCompat {};
        class getLoadout {};
        class ifaModCompat {};
        class rhsModCompat {};
    };

    class UI
    {
        class customHint {};
        class customHintDismiss {};
        class customHintInit {};
        class customHintRender {};
        class shader_ratioToHex {};
    };

    class Undercover
    {
        class initUndercover {};
        class goUndercover {};
    };

    class Utility
    {
        class basicBackpack {};
        class classNameToModel {};
        class createDataObject {};
        class createNamespace {};
        class dateToTimeString {};
        class generateRoadsDB {};
        class log {};
        class vehicleWillCollideAtPosition {};
        class getRoadDirection {};
    };
};
