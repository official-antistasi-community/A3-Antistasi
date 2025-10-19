/*
 * This file is called after initVarCommon.sqf, on the server only.
 *
 * We also initialise anything in here that we don't want a client that's joining to overwrite, as JIP happens before initVar.
 */
scriptName "initVarServer.sqf";
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("initVarServer started");

params ["_saveData"];

//Little bit meta.
serverInitialisedVariables = ["serverInitialisedVariables"];

private _declareServerVariable = {
	params ["_varName", "_varValue"];

	serverInitialisedVariables pushBackUnique _varName;

	if (!isNil "_varValue") then {
		missionNamespace setVariable [_varName, _varValue];
	};
};

//Declares a variable that will be synchronised to all clients at the end of initVarServer.
//Only needs using on the first declaration.
#define ONLY_DECLARE_SERVER_VAR(name) [#name] call _declareServerVariable
#define DECLARE_SERVER_VAR(name, value) [#name, value] call _declareServerVariable
#define ONLY_DECLARE_SERVER_VAR_FROM_VARIABLE(name) [name] call _declareServerVariable
#define DECLARE_SERVER_VAR_FROM_VARIABLE(name, value) [name, value] call _declareServerVariable

////////////////////////////////////////
//     GENERAL SERVER VARIABLES      ///
////////////////////////////////////////
Info("initialising general server variables");

//initial spawn distance. Less than 1Km makes parked vehicles spawn in your nose while you approach.
//User-adjustable variables are now declared in initParams
//DECLARE_SERVER_VAR(distanceSPWN, 1000);
DECLARE_SERVER_VAR(distanceSPWN1, distanceSPWN*1.3);
DECLARE_SERVER_VAR(distanceSPWN2, distanceSPWN*0.5);
//Quantity of Civs to spawn in (most likely per client - Bob Murphy 26.01.2020)
//DECLARE_SERVER_VAR(globalCivilianMax, 5);

//Max units we aim to spawn in. Still declared in initParams and modifiable in game options, but unused
//DECLARE_SERVER_VAR(maxUnits, 140);

//Disabled DLC according to server parameters
//DECLARE_SERVER_VAR(disabledMods, call A3A_fnc_initDisabledMods);

// Used by headless clients for crate scaling
DECLARE_SERVER_VAR(A3A_activePlayerCount, 0);

//Legacy tool for scaling AI difficulty. Should die.
DECLARE_SERVER_VAR(difficultyCoef, 0);

//Mostly state variables, used by various parts of Antistasi.
DECLARE_SERVER_VAR(bigAttackInProgress, false);
DECLARE_SERVER_VAR(AAFpatrols,0);

//Vehicles currently in the garage
DECLARE_SERVER_VAR(vehInGarage, []);

//Should vegetation around HQ be cleared
DECLARE_SERVER_VAR(chopForest, false);

// Whether petros is currently being moved
DECLARE_SERVER_VAR(A3A_petrosMoving, false);

DECLARE_SERVER_VAR(skillFIA, 1);																		//Initial skill level for FIA soldiers
//Initial Occupant Aggression
DECLARE_SERVER_VAR(aggressionOccupants, 0);
DECLARE_SERVER_VAR(aggressionStackOccupants, []);
DECLARE_SERVER_VAR(aggressionLevelOccupants, 1);
//Initial Invader Aggression
DECLARE_SERVER_VAR(aggressionInvaders, 0);
DECLARE_SERVER_VAR(aggressionStackInvaders, []);
DECLARE_SERVER_VAR(aggressionLevelInvaders, 1);
//Initial war tier.
DECLARE_SERVER_VAR(tierWar, 1);
DECLARE_SERVER_VAR(bombRuns, 0);
//Should various units, such as patrols and convoys, be revealed.
DECLARE_SERVER_VAR(revealX, false);
//Whether the players have Nightvision unlocked
DECLARE_SERVER_VAR(haveNV, false);
DECLARE_SERVER_VAR(A3A_activeTasks, []);
DECLARE_SERVER_VAR(A3A_taskCount, 0);
//Whether the players have access to radios.
DECLARE_SERVER_VAR(haveRadio, false);
//Currently destroyed buildings.
//DECLARE_SERVER_VAR(destroyedBuildings, []);
//Initial HR
server setVariable ["hr",initialHr,true];
//Initial faction money pool
server setVariable ["resourcesFIA",initialFactionMoney,true];
// Time of last garbage clean. Note: serverTime may not reset to zero if server was not restarted. Therefore, it should capture the time at start of mission.
DECLARE_SERVER_VAR(A3A_lastGarbageCleanTime, serverTime);
// Hash map of custom non-member/AI item thresholds
DECLARE_SERVER_VAR(A3A_arsenalLimits, createHashMap);
//Time of last garbage clean notification
DECLARE_SERVER_VAR(A3A_lastGarbageCleanTimeNote, serverTime);
// Under-construction objects
DECLARE_SERVER_VAR(A3A_unbuiltObjects, []);

////////////////////////////////////
//     SERVER ONLY VARIABLES     ///
////////////////////////////////////
//We shouldn't need to sync these.
Info("Setting server only variables");

// Don't need to be distributed
occRadioKeys = 0;
invRadioKeys = 0;

// New garrison data structure
A3A_garrison = createHashMap;
A3A_activeGarrison = createHashMap;

// Marker string => machine ID (HC/server) mapping
A3A_garrisonMachine = createHashMap;

// Recent casualties/damage taken by enemies, format [X, Y, time * 1000 + value]
A3A_recentDamageOcc = [];
A3A_recentDamageInv = [];

// Balance params updated by aggressionUpdateLoop
A3A_balancePlayerScaleBase = 1;
A3A_balancePlayerScale = 1;					// Important due to load/save scaling to 1 playerScale
A3A_balanceVehicleCost = 110;
A3A_balanceResourceRate = A3A_balancePlayerScale * ([A3A_balanceVehicleCost, 140] select (gameMode == 1));

// Current resources, overwritten by saved game
A3A_resourcesDefenceOcc = A3A_balanceResourceRate * 3;													// 30% of max
A3A_resourcesDefenceInv = A3A_balanceResourceRate * (A3A_invaderBalanceMul / 10) * 6;							// 60% of max
A3A_resourcesAttackOcc = -10 * A3A_balanceResourceRate * (A3A_enemyAttackMul / 10);								// ~100 min to attack
A3A_resourcesAttackInv = -10 * A3A_balanceResourceRate * (A3A_enemyAttackMul / 10) * (A3A_invaderBalanceMul / 10) * 0.5;	// ~50 min to attack

A3A_punishmentDefBuff = 0;

// HQ knowledge values
A3A_curHQInfoOcc = 0;			// 0-1 ranges for current HQ
A3A_curHQInfoInv = 0;
A3A_oldHQInfoOcc = [];			// arrays of [xpos, ypos, knowledge]
A3A_oldHQInfoInv = [];

A3A_markersToDelete = [];		// list of markers to be cleared after despawning

A3A_activeCityBattles = createHashMap;		// list of markers with active city battle missions

A3A_cityTaskTimer = createHashMap;			// maybe temporary. List of times after which a city task can spawn
{ [_x, 0, 900] call A3A_fnc_setCityTaskDelay } forEach citiesX; 			// 0-15min for pop 100 city

// These are silly, should be nil/true and local-defined only
resourcesIsChanging = false;
prestigeIsChanging = false;

playerHasBeenPvP = [];

A3A_playerSaveData = createHashMap;
A3A_destroyedBuildings = [];		// server side only now

testingTimerIsActive = false;

A3A_tasksData = [];

A3A_buildingsToSave = [];

A3A_gcQueue = [];				// List of postmortem objects to clean up
A3A_gcCleanTime = 3600;			// Base time for deleting postmortem objects
A3A_gcMaxBumps = 3;				// Max times to delay cleanup for an object that's near players

hcArray = [];					// array of headless client IDs

membersX = [];					// These two published later by startGame
theBoss = objNull;

createHashMap call A3A_fnc_setRebelLoadouts;		// sets version times, no dependencies

///////////////////////////////////////////
//     INITIALISING ITEM CATEGORIES     ///
///////////////////////////////////////////
Info("Initialising item categories");

//We initialise a LOT of arrays based on the categories. Every category gets a 'allX' variables and an 'unlockedX' variable.

private _unlockableCategories = allCategoriesExceptSpecial + ["AA", "AT", "GrenadeLaunchers", "ArmoredVests", "ArmoredHeadgear"];

//Build list of 'allX' variables, such as 'allWeapons'
DECLARE_SERVER_VAR(allEquipmentArrayNames, allCategories apply {"all" + _x});

//Build list of 'unlockedX' variables, such as 'allWeapons'
DECLARE_SERVER_VAR(unlockedEquipmentArrayNames, _unlockableCategories apply {"unlocked" + _x});

//Various arrays used by the loot system. Could also be done using DECLARE_SERVER_VAR individually.
private _otherEquipmentArrayNames = [
	"initialRebelEquipment",
	"lootBasicItem",
	"lootNVG",
	"lootItem",
	"lootWeapon",
	"lootAttachment",
	"lootMagazine",
	"lootGrenade",
	"lootExplosive",
	"lootBackpack",
	"lootHelmet",
	"lootVest",
	"lootDevice",
	"invaderStaticWeapon",
	"occupantStaticWeapon",
	"rebelStaticWeapon",
	"invaderBackpackDevice",
	"occupantBackpackDevice",
	"rebelBackpackDevice",
	"civilianBackpackDevice"
];

DECLARE_SERVER_VAR(otherEquipmentArrayNames, _otherEquipmentArrayNames);

//We're going to use this to sync the variables later.
everyEquipmentRelatedArrayName = allEquipmentArrayNames + unlockedEquipmentArrayNames + otherEquipmentArrayNames;

//Initialise them all as empty arrays.
{
	DECLARE_SERVER_VAR_FROM_VARIABLE(_x, []);
} forEach everyEquipmentRelatedArrayName;

//Create a global namespace for custom unit types.
DECLARE_SERVER_VAR(A3A_customUnitTypes, [true] call A3A_fnc_createNamespace);

////////////////////////////////////
//          MOD CONFIG           ///
////////////////////////////////////
Info("Setting mod configs");

//TFAR config
if (A3A_hasTFAR) then
{
	if (isServer) then
	{
		[] spawn {
            #include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
			waitUntil {sleep 1; !isNil "TF_server_addon_version"};
            Info("Initializing TFAR settings");
			["TF_no_auto_long_range_radio", true, true,"mission"] call CBA_settings_fnc_set;						//set to false and players will spawn with LR radio.
			if (A3A_hasIFA) then
				{
				["TF_give_personal_radio_to_regular_soldier", false, true,"mission"] call CBA_settings_fnc_set;
				["TF_give_microdagr_to_soldier", false, true,"mission"] call CBA_settings_fnc_set;
				};
			tf_teamPlayer_radio_code = "";publicVariable "tf_teamPlayer_radio_code";								//to make enemy vehicles usable as LR radio
			tf_east_radio_code = tf_teamPlayer_radio_code; publicVariable "tf_east_radio_code";					//to make enemy vehicles usable as LR radio
			tf_guer_radio_code = tf_teamPlayer_radio_code; publicVariable "tf_guer_radio_code";					//to make enemy vehicles usable as LR radio
			["TF_same_sw_frequencies_for_side", true, true,"mission"] call CBA_settings_fnc_set;						//synchronize SR default frequencies
			["TF_same_lr_frequencies_for_side", true, true,"mission"] call CBA_settings_fnc_set;						//synchronize LR default frequencies
		};
	};
};

//////////////////////////////////////
//   SETUP FACTION AND DLC FLAGS   ///
//////////////////////////////////////
Info("Setting up faction and DLC equipment flags");

// Arma bug: Need to hardcode CDLC because arma3.cfg mod loading method doesn't register CDLC as "official"
private _loadedDLC = getLoadedModsInfo select { (_x#2) and !(_x#1 in ["A3","curator","argo","tacops"]) };
_loadedDLC append (getLoadedModsInfo select { tolower (_x#1) in ["ef", "gm", "rf", "spe", "vn", "ws"] });
_loadedDLC = _loadedDLC apply { tolower (_x#1) };

// Set enabled & disabled DLC/CDLC arrays for faction/equipment modification
A3A_enabledDLC = (_saveData get "DLC") apply {tolower _x};                 // should be pre-checked against _loadedDLC
{
	A3A_enabledDLC insert [0, getArray (configFile/"A3A"/"Templates"/_x/"forceDLC"), true];		// add unique elements only
} forEach (_saveData get "factions");
A3A_disabledDLC = _loadedDLC - A3A_enabledDLC;
A3A_disabledMods = A3A_disabledDLC;                 // Split to allow CUP civilians with GM

// Everything that counts as vanilla: Official DLC plus various junk tags
A3A_vanillaMods = (getLoadedModsInfo select {_x#2 and _x#3} apply {tolower (_x#1)}) + ["", "officialmod"];

Debug_4("DLC loaded: %1 Enabled: %2 Disabled: %3 Vanilla: %4", _loadedDLC, A3A_enabledDLC, A3A_disabledDLC, A3A_vanillaMods);

// TODO: fix all allowDLCxxx and A3A_hasxxx references in templates
// for the moment just fudge the ones that we're using
allowDLCWS = "ws" in A3A_enabledDLC;
allowDLCEnoch = "enoch" in A3A_enabledDLC;
allowDLCTanks = "tanks" in A3A_enabledDLC;
allowDLCOrange = "orange" in A3A_enabledDLC;
allowDLCExpansion = "expansion" in A3A_enabledDLC;

// Set faction equipment flags by lowest common denominator
private _factions = _saveData get "factions";
private _occEquipFlags = getArray (configFile/"A3A"/"Templates"/(_factions#0)/"equipFlags");
private _invEquipFlags = getArray (configFile/"A3A"/"Templates"/(_factions#1)/"equipFlags");
A3A_factionEquipFlags = _occEquipFlags arrayIntersect _invEquipFlags;

Debug_1("Faction equip flags: %1", A3A_factionEquipFlags);

// Build list of extra equipment mods so we can filter out the modern stuff as necessary
// Might not work for everything because of configSourceMod inconsistency (eg. "rhs_weap_fnfal50_61_base")
A3A_extraEquipMods = [];
{
    private _modpath = (configFile/"CfgPatches"/_x) call A3A_fnc_getModOfConfigClass;
    if (_modpath != "") then { A3A_extraEquipMods pushBackUnique _modpath };
} forEach ["task_force_radio", "acre_main", "tfar_static_radios", "ace_main"];

Debug_1("Extra equip mod paths: %1", A3A_extraEquipMods);

//////////////////////////////////////
//         TEMPLATE LOADING        ///
//////////////////////////////////////
Info("Reading templates");
{
    private _side = [west, east, resistance, civilian] # _forEachIndex;
    Info_2("Loading template %1 for side %2", _x, _side);

	private _cfg = configFile/"A3A"/"Templates"/_x;
	private _basepath = getText (_cfg/"basepath") + "\";
	private _file = getText (_cfg/"file") + ".sqf";
    [_basepath + _file, _side] call A3A_fnc_compatibilityLoadFaction;

    private _type = ["Occ", "Inv", "Reb", "Civ"] # _forEachIndex;
    missionNamespace setVariable ["A3A_"+_type+"_template", _x];			// don't actually need this atm, but whatever

} forEach (_saveData get "factions");

{
	private _cfg = configFile/"A3A"/"AddonVics"/_x;
	private _basepath = getText (_cfg/"path") + "\";
	{
		Info_2("Loading addon file %1 for side %2", _x#1, _x#0);
		[_x#0, _basepath + _x#1] call A3A_fnc_loadAddon;
	} forEach getArray (_cfg/"files");

} forEach (_saveData get "addonVics");

call A3A_fnc_compileMissionAssets;

{ //broadcast the templates to the clients
    publicVariable ("A3A_faction_"+_x);
} forEach ["occ", "inv", "reb", "civ", "all"]; // ["A3A_faction_occ", "A3A_faction_inv", "A3A_faction_reb", "A3A_faction_civ", "A3A_faction_all"]

// Set template-dependent map stuff

flagX setFlagTexture FactionGet(reb,"flagTexture");                 // HQ flag, should be local here
"NATO_carrier" setMarkerText FactionGet(occ,"spawnMarkerName");
"CSAT_carrier" setMarkerText FactionGet(inv,"spawnMarkerName");
"NATO_carrier" setMarkertype FactionGet(occ,"flagMarkerType");
"CSAT_carrier" setMarkertype FactionGet(inv,"flagMarkerType");

////////////////////////////////////
//      CIVILIAN VEHICLES       ///
////////////////////////////////////
Info("Creating civilian vehicles lists");

private _fnc_vehicleIsValid = {
	params ["_type"];
	private _cfg = configFile >> "CfgVehicles" >> _type;
	if !(isClass _cfg) exitWith { Error_1("Vehicle class %1 not found", _type); false };
	if (_cfg call A3A_fnc_getModOfConfigClass in A3A_disabledDLC) then {false} else {true};
};

private _civVehicles = [];
private _civVehiclesWeighted = [];

_civVehiclesWeighted append ([FactionGet(civ,"vehiclesCivCar"), 4, _fnc_vehicleIsValid] call A3A_fnc_filterAndWeightArray);
_civVehiclesWeighted append ([FactionGet(civ,"vehiclesCivIndustrial"), 1, _fnc_vehicleIsValid] call A3A_fnc_filterAndWeightArray);
_civVehiclesWeighted append ([FactionGet(civ,"vehiclesCivMedical"), 0.1, _fnc_vehicleIsValid] call A3A_fnc_filterAndWeightArray);
_civVehiclesWeighted append ([FactionGet(civ,"vehiclesCivRepair"), 0.1, _fnc_vehicleIsValid] call A3A_fnc_filterAndWeightArray);
_civVehiclesWeighted append ([FactionGet(civ,"vehiclesCivFuel"), 0.1, _fnc_vehicleIsValid] call A3A_fnc_filterAndWeightArray);

for "_i" from 0 to (count _civVehiclesWeighted - 2) step 2 do {
	_civVehicles pushBack (_civVehiclesWeighted select _i);
};

DECLARE_SERVER_VAR(arrayCivVeh, _civVehicles);
DECLARE_SERVER_VAR(civVehiclesWeighted, _civVehiclesWeighted);


private _civBoats = [];
private _civBoatsWeighted = [];

// Boats don't need any re-weighting, so just copy the data
private _civBoatData = FactionGet(civ,"vehiclesCivBoat");
for "_i" from 0 to (count _civBoatData - 2) step 2 do {
	private _boat = _civBoatData select _i;
	if (_boat call _fnc_vehicleIsValid) then {
		_civBoats pushBack _boat;
		_civBoatsWeighted pushBack _boat;
		_civBoatsWeighted pushBack (_civBoatData select (_i+1));
	};
};

DECLARE_SERVER_VAR(civBoats, _civBoats);
DECLARE_SERVER_VAR(civBoatsWeighted, _civBoatsWeighted);

private _undercoverVehicles = (arrayCivVeh - ["C_Quadbike_01_F"]) + FactionGet(reb,"vehiclesCivBoat") + FactionGet(reb,"vehiclesCivHeli") + FactionGet(reb, "vehiclesCivPlane")
	+ FactionGet(reb,"vehiclesCivCar") + FactionGet(reb,"vehiclesCivTruck") + FactionGet(reb,"vehiclesCivSupply");
DECLARE_SERVER_VAR(undercoverVehicles, _undercoverVehicles);


//////////////////////////////////////
//        ITEM INITIALISATION      ///
//////////////////////////////////////
//This is all very tightly coupled.
//Beware when changing these, or doing anything with them, really.

Info("Scanning config entries for items");
[A3A_fnc_equipmentIsValidForCurrentModset] call A3A_fnc_configSort;
Info("Categorizing vehicle classes");
[] call A3A_fnc_vehicleSort;
Info("Categorizing equipment classes");
[] call A3A_fnc_equipmentSort;
Info("Sorting grouped class categories");
[] call A3A_fnc_itemSort;
Info("Building loot lists");
[] call A3A_fnc_loot;

// Build smoke grenade magazine->muzzle hashmap
private _smokeMuzzleHM = createHashMap;
{
	private _muzzle = configName _x;
	{
		if (_x in allSmokeGrenades) then { _smokeMuzzleHM set [_x, _muzzle] };
	} forEach compatibleMagazines ["Throw", _muzzle];			// works around casing & missing elements
} forEach ("true" configClasses (configFile / "CfgWeapons" / "Throw"));

DECLARE_SERVER_VAR(A3A_smokeMuzzleHM, _smokeMuzzleHM);

////////////////////////////////////
//   CLASSING TEMPLATE VEHICLES  ///
////////////////////////////////////

// Utility items data init
call A3A_fnc_initUtilityItems;
ONLY_DECLARE_SERVER_VAR(A3A_utilityItemList);
ONLY_DECLARE_SERVER_VAR(A3A_utilityItemHM);

//fast ropes are hard defined here, because of old fixed offsets.
//fastrope needs to be rewritten and then we can get get ridd of this
private _vehFastRope = FactionGet(all, "vehiclesHelisTransport");
DECLARE_SERVER_VAR(vehFastRope, _vehFastRope);
DECLARE_SERVER_VAR(A3A_vehClassToCrew,call A3A_fnc_initVehClassToCrew);


// Default vehicle resource costs
private _vehicleResourceCosts = createHashMap;

{ _vehicleResourceCosts set [_x, 10] } forEach FactionGet(all, "staticMGs");
{ _vehicleResourceCosts set [_x, 20] } forEach FactionGet(all, "staticAA") + FactionGet(all, "staticAT");
{ _vehicleResourceCosts set [_x, 20] } forEach FactionGet(all, "vehiclesLightUnarmed") + FactionGet(all, "vehiclesTrucks") + FactionGet(all, "vehiclesCargoTrucks") + FactionGet(all, "vehiclesTransportBoats");
{ _vehicleResourceCosts set [_x, 50] } forEach FactionGet(all, "vehiclesLightArmed") + FactionGet(all, "staticMortars") + FactionGet(all, "vehiclesUtilityTrucks");
{ _vehicleResourceCosts set [_x, 60] } forEach FactionGet(all, "vehiclesLightAPCs") + FactionGet(all, "vehiclesGunBoats");
{ _vehicleResourceCosts set [_x, 100] } forEach FactionGet(all, "vehiclesAPCs");
{ _vehicleResourceCosts set [_x, 150] } forEach FactionGet(all, "vehiclesAA") + FactionGet(all, "vehiclesArtillery") + FactionGet(all, "vehiclesIFVs") + FactionGet(all, "vehiclesLightTanks");
{ _vehicleResourceCosts set [_x, 230] } forEach FactionGet(all, "vehiclesTanks");
{ _vehicleResourceCosts set [_x, 300] } forEach FactionGet(all, "vehiclesHeavyTanks");

{ _vehicleResourceCosts set [_x, 70] } forEach FactionGet(all, "vehiclesHelisLight") + FactionGet(all, "vehiclesAirPatrol");
{ _vehicleResourceCosts set [_x, 100] } forEach FactionGet(all, "vehiclesHelisTransport");
{ _vehicleResourceCosts set [_x, 130] } forEach FactionGet(all, "vehiclesHelisLightAttack") + FactionGet(all, "vehiclesPlanesTransport");
{ _vehicleResourceCosts set [_x, 250] } forEach FactionGet(all, "vehiclesPlanesCAS") + FactionGet(all, "vehiclesPlanesAA");
{ _vehicleResourceCosts set [_x, 300] } forEach FactionGet(all, "vehiclesHelisAttack");


// Threat table
private _groundVehicleThreat = createHashMap;

{ _groundVehicleThreat set [_x, 40] } forEach FactionGet(all, "staticMGs");
{ _groundVehicleThreat set [_x, 60] } forEach FactionGet(all, "vehiclesLightArmed") + FactionGet(all, "vehiclesLightAPCs");
{ _groundVehicleThreat set [_x, 80] } forEach FactionGet(all, "staticAA") + FactionGet(all, "staticAT") + FactionGet(all, "staticMortars");
{ _groundVehicleThreat set [_x, 80] } forEach FactionGet(Reb, "vehiclesAA") + FactionGet(Reb, "vehiclesAT") + FactionGet(all, "vehiclesGunBoats");

{ _groundVehicleThreat set [_x, 120] } forEach FactionGet(all, "vehiclesAPCs");
{ _groundVehicleThreat set [_x, 200] } forEach FactionGet(all, "vehiclesAA") + FactionGet(all, "vehiclesArtillery") + FactionGet(all, "vehiclesIFVs") + FactionGet(all, "vehiclesLightTanks");
{ _groundVehicleThreat set [_x, 300] } forEach FactionGet(all, "vehiclesTanks");
{ _groundVehicleThreat set [_x, 500] } forEach FactionGet(all, "vehiclesHeavyTanks"); //Expect these to mostly exist in templates which lack good access of most things to deal with tanks, ie WW2


// Rebel vehicle cost
private _rebelVehicleCosts = createHashMap;

_fnc_setPriceIfValid =
{
	_this params ["_hashMap", "_className", "_price"];
	private _configClass = configFile >> "CfgVehicles" >> _className;
    if (isClass _configClass) then {
		_hashMap set [_className, _price];
	};
};

{ [_rebelVehicleCosts, _x, 50] call _fnc_setPriceIfValid } forEach FactionGet(reb, "vehiclesBasic");
{ [_rebelVehicleCosts, _x, 300] call _fnc_setPriceIfValid } forEach FactionGet(reb, "vehiclesCivCar") + FactionGet(reb, "vehiclesCivBoat");
{ [_rebelVehicleCosts, _x, 600] call _fnc_setPriceIfValid } forEach FactionGet(reb, "vehiclesCivTruck") + FactionGet(reb, "vehiclesMedical");
{ [_rebelVehicleCosts, _x, 300] call _fnc_setPriceIfValid } forEach FactionGet(reb, "vehiclesTruck");
{ [_rebelVehicleCosts, _x, 150] call _fnc_setPriceIfValid } forEach FactionGet(reb, "vehiclesLightUnarmed");
{ [_rebelVehicleCosts, _x, 700] call _fnc_setPriceIfValid } forEach FactionGet(reb, "vehiclesLightArmed");
{ [_rebelVehicleCosts, _x, 150] call _fnc_setPriceIfValid } forEach FactionGet(reb, "vehiclesBoat");
{ [_rebelVehicleCosts, _x, 400] call _fnc_setPriceIfValid } forEach FactionGet(reb, "staticMGs");
{ [_rebelVehicleCosts, _x, 1300] call _fnc_setPriceIfValid } forEach FactionGet(reb, "vehiclesAT");
{ [_rebelVehicleCosts, _x, 1000] call _fnc_setPriceIfValid } forEach FactionGet(reb, "staticAT");
{ [_rebelVehicleCosts, _x, 1600] call _fnc_setPriceIfValid } forEach FactionGet(reb, "staticAA");
{ [_rebelVehicleCosts, _x, 2000] call _fnc_setPriceIfValid } forEach FactionGet(reb, "vehiclesAA");
{ [_rebelVehicleCosts, _x, 1600] call _fnc_setPriceIfValid } forEach FactionGet(reb, "staticMortars");
{ [_rebelVehicleCosts, _x, 5000] call _fnc_setPriceIfValid } forEach FactionGet(reb, "vehiclesCivHeli");
{ [_rebelVehicleCosts, _x, 5000] call _fnc_setPriceIfValid } forEach FactionGet(reb, "vehiclesPlane") + FactionGet(reb, "vehiclesCivPlane");


// Template overrides
private _overrides = FactionGet(Reb, "attributesVehicles") + FactionGet(Occ, "attributesVehicles") + FactionGet(Inv, "attributesVehicles");
{
	private _vehType = _x select 0;
	if !(_vehType in ((keys _vehicleResourceCosts) + (keys _rebelVehicleCosts))) then { continue };
	{
		if !(_x isEqualType []) then { continue };		// first entry is classname
		_x params ["_attr", "_val"];
		call {
			if (_attr == "threat") exitWith { _groundVehicleThreat set [_vehType, _val] };
			if (_attr == "cost") exitWith { _vehicleResourceCosts set [_vehType, _val] };
			if (_attr == "rebCost") exitWith { _rebelVehicleCosts set [_vehType, _val] };
		};
	} forEach _x;
} forEach _overrides;

DECLARE_SERVER_VAR(A3A_vehicleResourceCosts, _vehicleResourceCosts);
DECLARE_SERVER_VAR(A3A_groundVehicleThreat, _groundVehicleThreat);
DECLARE_SERVER_VAR(A3A_rebelVehicleCosts, _rebelVehicleCosts);


// Place type to vehicle validity mapping
// For sanity checking saves & captured garrisons. Only used on server.
A3A_validVehicles = createHashMap;
{
	private _valid = createHashMap;
	_valid set ["staticMG", FactionGet(all, "staticMGs")];			// allow cross-faction use
	_valid set ["staticAA", _x get "staticAA"];
	_valid set ["staticAT", _x get "staticAT"];
	_valid set ["staticMortar", _x get "staticMortar"];

	_valid set ["vehicleAA", _x get "vehiclesAA"];
	_valid set ["vehiclePolice", _x get "vehiclesPolice"];
	_valid set ["vehicleTruck", (_x get "vehiclesTrucks") + (_x get "vehiclesCargoTrucks") + (_x get "vehiclesAmmoTrucks")
		+ (_x get "vehiclesFuelTrucks") + (_x get "vehiclesRepairTrucks")];
	_valid set ["vehicle", (_valid get "vehicleTruck") + (_x get "vehiclesLightUnarmed") + (_x get "vehiclesLightArmed") + (_x get "vehiclesMilitiaCars")
		+ (_x get "vehiclesLightAPCs") + (_x get "vehiclesAPCs") + (_x get "vehiclesAA") + (_x get "vehiclesArtillery") + (_x get "vehiclesIFVs")
		+ (_x get "vehiclesLightTanks") + (_x get "vehiclesTanks") + (_x get "vehiclesHeavyTanks") + (_x get "vehiclesMilitiaLightArmed")];

	_valid set ["plane", (_x get "vehiclesPlanesCAS") + (_x get "vehiclesPlanesAA") + (_x get "vehiclesPlanesTransport")];
	_valid set ["heli", (_x get "vehiclesHelisLight") + (_x get "vehiclesHelisTransport") + (_x get "vehiclesHelisLightAttack") + (_x get "vehiclesHelisAttack")];
	_valid set ["boat", (_x get "vehiclesTransportBoats") + (_x get "vehiclesGunBoats")];

	A3A_validVehicles set [_x get "side", _valid];

} forEach [A3A_faction_occ, A3A_faction_inv];

A3A_validVehicles set [civilian, createHashMapFromArray [["civCar", arrayCivVeh], ["civBoat", civBoats]] ];

///////////////////////////
//     MOD TEMPLATES    ///
///////////////////////////
//Please respect the order in which these are called,
//and add new entries to the bottom of the list.
if (A3A_hasACE) then {
	[] call A3A_fnc_aceModCompat;

	// has an unintended hard dependency on ace. will be fixed with cigs-rewrite 3.0.0.
	if (isClass (configFile >> "CfgPatches" >> "cigs_core")) then {
	    FactionGet(reb,"initialRebelEquipment") append ( [] call cigs_core_fnc_getAllItems );
	};
};


////////////////////////////////////
//     ACRE ITEM MODIFICATIONS   ///
////////////////////////////////////
if (A3A_hasACRE) then {FactionGet(reb,"initialRebelEquipment") append ["ACRE_PRC343","ACRE_PRC148","ACRE_PRC152","ACRE_SEM52SL","ACRE_BF888S"];};
if (A3A_hasACRE && startWithLongRangeRadio) then {FactionGet(reb,"initialRebelEquipment") append ["ACRE_SEM70", "ACRE_PRC117F", "ACRE_PRC77"];};

////////////////////////////////////
//    UNIT AND VEHICLE PRICES    ///
////////////////////////////////////

Info("Creating pricelist");
{server setVariable [_x,50,true]} forEach [FactionGet(reb,"unitRifle"), FactionGet(reb,"unitCrew")];
{server setVariable [_x,75,true]} forEach [FactionGet(reb,"unitMG"), FactionGet(reb,"unitGL"), FactionGet(reb,"unitLAT")];
{server setVariable [_x,100,true]} forEach [FactionGet(reb,"unitMedic"), FactionGet(reb,"unitExp"), FactionGet(reb,"unitEng")];
{server setVariable [_x,150,true]} forEach [FactionGet(reb,"unitSL"), FactionGet(reb,"unitSniper")];
{server setVariable [_x,500,true]} forEach [FactionGet(reb,"unitAT"), FactionGet(reb,"unitAA")];

{
	server setVariable [_x, _y, true];
} forEach A3A_rebelVehicleCosts;


/////////////////////////////////////////
//     SYNCHRONISE SERVER VARIABLES   ///
/////////////////////////////////////////
Info("Sending server variables");

//Declare this last, so it syncs last.
DECLARE_SERVER_VAR(initVarServerCompleted, true);
{
	publicVariable _x;
} forEach serverInitialisedVariables;

Info("initVarServer completed");
