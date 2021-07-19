/*
 * This file is called after initVarCommon.sqf, on the server only.
 *
 * We also initialise anything in here that we don't want a client that's joining to overwrite, as JIP happens before initVar.
 */
scriptName "initVarServer.sqf";
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
Info("initVarServer started");


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

//time to delete dead bodies, vehicles etc..
DECLARE_SERVER_VAR(cleantime, 3600);
//initial spawn distance. Less than 1Km makes parked vehicles spawn in your nose while you approach.
//User-adjustable variables are now declared in initParams
//DECLARE_SERVER_VAR(distanceSPWN, 1000);
DECLARE_SERVER_VAR(distanceSPWN1, distanceSPWN*1.3);
DECLARE_SERVER_VAR(distanceSPWN2, distanceSPWN*0.5);
//Quantity of Civs to spawn in (most likely per client - Bob Murphy 26.01.2020)
//DECLARE_SERVER_VAR(civPerc, 5);
//The furthest distance the AI can attack from using helicopters or planes
DECLARE_SERVER_VAR(distanceForAirAttack, 10000);
//The furthest distance the AI can attack from using trucks and armour
DECLARE_SERVER_VAR(distanceForLandAttack, if (A3A_hasIFA) then {5000} else {3000});
//Max units we aim to spawn in. It's not very strictly adhered to.
//DECLARE_SERVER_VAR(maxUnits, 140);

//Disabled DLC according to server parameters
DECLARE_SERVER_VAR(disabledMods, call A3A_fnc_initDisabledMods);

//Legacy tool for scaling AI difficulty. Could use a rewrite.
DECLARE_SERVER_VAR(difficultyCoef, if !(isMultiplayer) then {0} else {floor ((({side group _x == teamPlayer} count (call A3A_fnc_playableUnits)) - ({side group _x != teamPlayer} count (call A3A_fnc_playableUnits))) / 5)});


//Mostly state variables, used by various parts of Antistasi.
DECLARE_SERVER_VAR(bigAttackInProgress, false);
DECLARE_SERVER_VAR(AAFpatrols,0);
DECLARE_SERVER_VAR(smallCAmrk, []);
DECLARE_SERVER_VAR(smallCApos, []);

DECLARE_SERVER_VAR(attackPos, []);
DECLARE_SERVER_VAR(attackMrk, []);
DECLARE_SERVER_VAR(airstrike, []);

//Variables used for the internal support system
DECLARE_SERVER_VAR(occupantsSupports, []);
DECLARE_SERVER_VAR(invadersSupports, []);

DECLARE_SERVER_VAR(supportTargetsChanging, false);

DECLARE_SERVER_VAR(occupantsRadioKeys, 0);
DECLARE_SERVER_VAR(invaderRadioKeys, 0);

//Vehicles currently in the garage
DECLARE_SERVER_VAR(vehInGarage, []);

//Should vegetation around HQ be cleared
DECLARE_SERVER_VAR(chopForest, false);

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
//List of statics (MGs, AA, etc) that will be saved and loaded.
DECLARE_SERVER_VAR(staticsToSave, []);
//Whether the players have access to radios.
DECLARE_SERVER_VAR(haveRadio, call A3A_fnc_checkRadiosUnlocked);
//List of vehicles that are reported (I.e - Players can't go undercover in them)
DECLARE_SERVER_VAR(reportedVehs, []);
//Currently destroyed buildings.
//DECLARE_SERVER_VAR(destroyedBuildings, []);
//Initial HR
server setVariable ["hr",8,true];
//Initial faction money pool
server setVariable ["resourcesFIA",1000,true];

////////////////////////////////////
//     SERVER ONLY VARIABLES     ///
////////////////////////////////////
//We shouldn't need to sync these.
Info("Setting server only variables");

playerStartingMoney = 100;			// should probably be a parameter

prestigeOPFOR = [75, 50] select cadetMode;												//Initial % support for NATO on each city
prestigeBLUFOR = 0;																	//Initial % FIA support on each city
// Indicates time in seconds before next counter attack.
attackCountdownOccupants = 600;
attackCountdownInvaders = 600;

cityIsSupportChanging = false;
resourcesIsChanging = false;
savingServer = false;

prestigeIsChanging = false;

zoneCheckInProgress = false;
garrisonIsChanging = false;
movingMarker = false;
markersChanging = [];

playerHasBeenPvP = [];

savedPlayers = [];
destroyedBuildings = [];		// synced only on join, to avoid spam on change

testingTimerIsActive = false;

A3A_tasksData = [];

///////////////////////////////////////////
//     INITIALISING ITEM CATEGORIES     ///
///////////////////////////////////////////
Info("Initialising item categories");

//We initialise a LOT of arrays based on the categories. Every category gets a 'allX' variables and an 'unlockedX' variable.

private _unlockableCategories = allCategoriesExceptSpecial + ["AA", "AT", "GrenadeLaunchers", "ArmoredVests", "ArmoredHeadgear", "BackpacksCargo"];

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
	"civilianBackpackDevice",
	"diveGear",
	"flyGear"
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
            #include "..\..\Includes\common.inc"
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

////////////////////////////////////
//      CIVILIAN UNITS LIST      ///
////////////////////////////////////
Info("Creating civilians");

//No real reason we initialise this on the server right now...
private _arrayCivs = ["C_man_polo_1_F","C_man_polo_1_F_afro","C_man_polo_1_F_asia","C_man_polo_1_F_euro","C_man_sport_1_F_tanoan"];
DECLARE_SERVER_VAR(arrayCivs, _arrayCivs);


//////////////////////////////////////
//         TEMPLATE SELECTION      ///
//////////////////////////////////////
Info("Reading templates");

call compile preProcessFileLineNumbers "Templates\selector.sqf";
{ //broadcast the templates to the clients
    publicVariable ("A3A_faction_"+_x);
} forEach ["occ", "inv", "reb", "civ", "all"]; // ["A3A_faction_occ", "A3A_faction_inv", "A3A_faction_reb", "A3A_faction_civ", "A3A_faction_all"]

//Set SDKFlagTexture on FlagX
if (local flagX) then { flagX setFlagTexture FactionGet(reb,"flagTexture") } else { [flagX, FactionGet(reb,"flagTexture")] remoteExec ["setFlagTexture", owner flagX] };
"NATO_carrier" setMarkerText FactionGet(occ,"spawnMarkerName");
"CSAT_carrier" setMarkerText FactionGet(inv,"spawnMarkerName");

////////////////////////////////////
//      CIVILIAN VEHICLES       ///
////////////////////////////////////
Info("Creating civilian vehicles lists");

private _fnc_vehicleIsValid = {
	params ["_type"];
	private _configClass = configFile >> "CfgVehicles" >> _type;
	if !(isClass _configClass) exitWith {
        Error_1("Vehicle class %1 not found", _type);
		false;
	};
	if (_configClass call A3A_fnc_getModOfConfigClass in disabledMods) then {false} else {true};
};

private _fnc_filterAndWeightArray = {

	params ["_array", "_targWeight"];
	private _output = [];
	private _curWeight = 0;

	// first pass, filter and find total weight
	for "_i" from 0 to (count _array - 2) step 2 do {
		if ((_array select _i) call _fnc_vehicleIsValid) then {
			_output pushBack (_array select _i);
			_output pushBack (_array select (_i+1));
			_curWeight = _curWeight + (_array select (_i+1));
		};
	};
	if (_curWeight == 0) exitWith {_output};

	// second pass, re-weight
	private _weightMod = _targWeight / _curWeight;
	for "_i" from 0 to (count _output - 2) step 2 do {
		_output set [_i+1, _weightMod * (_output select (_i+1))];
	};
	_output;
};

private _civVehicles = [];
private _civVehiclesWeighted = [];

_civVehiclesWeighted append ([FactionGet(civ,"vehiclesCivCar"), 4] call _fnc_filterAndWeightArray);
_civVehiclesWeighted append ([FactionGet(civ,"vehiclesCivIndustrial"), 1] call _fnc_filterAndWeightArray);
_civVehiclesWeighted append ([FactionGet(civ,"vehiclesCivMedical"), 0.1] call _fnc_filterAndWeightArray);
_civVehiclesWeighted append ([FactionGet(civ,"vehiclesCivRepair"), 0.1] call _fnc_filterAndWeightArray);
_civVehiclesWeighted append ([FactionGet(civ,"vehiclesCivFuel"), 0.1] call _fnc_filterAndWeightArray);

for "_i" from 0 to (count _civVehiclesWeighted - 2) step 2 do {
	_civVehicles pushBack (_civVehiclesWeighted select _i);
};

_civVehicles append [FactionGet(reb,"vehicleCivCar"), FactionGet(reb,"vehicleCivTruck")];			// Civ car/truck from rebel template, in case they're different
_civVehicles pushBackUnique "C_Van_01_box_F";		// Box van from bank mission. TODO: Define in rebel template

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

private _undercoverVehicles = (arrayCivVeh - ["C_Quadbike_01_F"]) + [FactionGet(reb,"vehicleCivBoat"), FactionGet(reb,"vehicleCivHeli")];
DECLARE_SERVER_VAR(undercoverVehicles, _undercoverVehicles);

//////////////////////////////////////
//        ITEM INITIALISATION      ///
//////////////////////////////////////
//This is all very tightly coupled.
//Beware when changing these, or doing anything with them, really.

Info("Initializing hardcoded categories");
[] call A3A_fnc_categoryOverrides;
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

////////////////////////////////////
//   CLASSING TEMPLATE VEHICLES  ///
////////////////////////////////////

//fast ropes are hard defined here, because of old fixed offsets.
//fastrope needs to be rewritten and then we can get get ridd of this
private _vehFastRope = ["O_Heli_Light_02_unarmed_F","B_Heli_Transport_01_camo_F","RHS_UH60M_d","UK3CB_BAF_Merlin_HC3_18_GPMG_DDPM_RM","UK3CB_BAF_Merlin_HC3_18_GPMG_Tropical_RM","RHS_Mi8mt_vdv","RHS_Mi8mt_vv","RHS_Mi8mt_Cargo_vv"];
DECLARE_SERVER_VAR(vehFastRope, _vehFastRope);
DECLARE_SERVER_VAR(A3A_vehClassToCrew,call A3A_fnc_initVehClassToCrew);

///////////////////////////
//     MOD TEMPLATES    ///
///////////////////////////
//Please respect the order in which these are called,
//and add new entries to the bottom of the list.
if (A3A_hasACE) then {
	[] call A3A_fnc_aceModCompat;
};
if (A3A_hasRHS) then {
	[] call A3A_fnc_rhsModCompat;
};
if (A3A_hasIFA) then {
	[] call A3A_fnc_ifaModCompat;
};

////////////////////////////////////
//     ACRE ITEM MODIFICATIONS   ///
////////////////////////////////////
if (A3A_hasACRE) then {FactionGet(reb,"initialRebelEquipment") append ["ACRE_PRC343","ACRE_PRC148","ACRE_PRC152","ACRE_SEM52SL"];};
if (A3A_hasACRE && startWithLongRangeRadio) then {FactionGet(reb,"initialRebelEquipment") append ["ACRE_SEM70", "ACRE_PRC117F", "ACRE_PRC77"];};

////////////////////////////////////
//    UNIT AND VEHICLE PRICES    ///
////////////////////////////////////

Info("Creating pricelist");
private _rebGroups = FactionGet(reb,"groups");
server setVariable [_rebGroups get "Mil",50,true];
{server setVariable [_x,75,true]} forEach ((_rebGroups get "Tier1") - [_rebGroups get "Mil"]);
{server setVariable [_x,100,true]} forEach (_rebGroups get "Tier2");
{server setVariable [_x,150,true]} forEach (_rebGroups get "Tier3");
{timer setVariable [_x,3,true]} forEach (FactionGet(occ,"staticAT") + FactionGet(occ,"staticAA"));
{timer setVariable [_x,6,true]} forEach (FactionGet(inv,"staticAT") + FactionGet(inv,"staticAA"));
{timer setVariable [_x,0,true]} forEach FactionGet(occ,"vehiclesAPCs");
{timer setVariable [_x,10,true]} forEach FactionGet(inv,"vehiclesAPCs");
{timer setVariable [_x,0,true]} forEach FactionGet(occ,"vehiclesTanks");
{timer setVariable [_x,10,true]} forEach FactionGet(inv,"vehiclesTanks");
{timer setVariable [_x,0,true]} forEach FactionGet(occ,"vehiclesAA");
{timer setVariable [_x,3,true]} forEach FactionGet(inv,"vehiclesAA");
{timer setVariable [_x,3,true]} forEach FactionGet(occ,"vehiclesGunBoats");
{timer setVariable [_x,3,true]} forEach FactionGet(inv,"vehiclesGunBoats");
{timer setVariable [_x,0,true]} forEach FactionGet(occ,"vehiclesPlanesCAS");
{timer setVariable [_x,10,true]} forEach FactionGet(inv,"vehiclesPlanesCAS");
{timer setVariable [_x,0,true]} forEach FactionGet(occ,"vehiclesPlanesAA");
{timer setVariable [_x,10,true]} forEach FactionGet(inv,"vehiclesPlanesAA");
{timer setVariable [_x,1,true]} forEach FactionGet(occ,"vehiclesPlanesTransport");
{timer setVariable [_x,1,true]} forEach (FactionGet(occ,"vehiclesTransportHelis") - FactionGet(occ,"vehiclesHelisLight"));
{timer setVariable [_x,1,true]} forEach FactionGet(inv,"vehiclesPlanesTransport");
{timer setVariable [_x,10,true]} forEach (FactionGet(inv,"vehiclesTransportHelis") - FactionGet(occ,"vehiclesHelisLight"));
{timer setVariable [_x,0,true]} forEach FactionGet(occ,"vehiclesAttackHelis");
{timer setVariable [_x,10,true]} forEach FactionGet(inv,"vehiclesAttackHelis");
{timer setVariable [_x,0,true]} forEach FactionGet(occ, "vehiclesArtillery");
{timer setVariable [_x,5,true]} forEach FactionGet(inv, "vehiclesArtillery");

server setVariable [FactionGet(reb,"vehicleCivCar"),200,true];
server setVariable [FactionGet(reb,"vehicleCivTruck"),600,true];
server setVariable [FactionGet(reb,"vehicleCivHeli"),5000,true];
server setVariable [FactionGet(reb,"vehicleCivBoat"),200,true];
server setVariable [FactionGet(reb,"vehicleBasic") ,50,true];
server setVariable [FactionGet(reb,"vehicleLightUnarmed"),200,true];
server setVariable [FactionGet(reb,"vehicleTruck"),300,true];
{server setVariable [_x,700,true]} forEach [FactionGet(reb,"vehicleLightArmed"),FactionGet(reb,"vehicleAT")];
{server setVariable [_x,400,true]} forEach [FactionGet(reb,"staticMG"),FactionGet(reb,"vehicleBoat"),FactionGet(reb,"vehicleRepair")];
{server setVariable [_x,800,true]} forEach [FactionGet(reb,"staticMortar"),FactionGet(reb,"staticAT"),FactionGet(reb,"staticAA")];

///////////////////////
//     GARRISONS    ///
///////////////////////
Info("Initialising Garrison Variables");

tierPreference = 1;
cityUpdateTiers = [4, 8];
cityStaticsTiers = [0.2, 1];
airportUpdateTiers = [3, 6, 8];
airportStaticsTiers = [0.5, 0.75, 1];
outpostUpdateTiers = [4, 7, 9];
outpostStaticsTiers = [0.4, 0.7, 1];
otherUpdateTiers = [3, 7];
otherStaticsTiers = [0.3, 1];
[] call A3A_fnc_initPreference;

////////////////////////////
//     REINFORCEMENTS    ///
////////////////////////////
Info("Initialising Reinforcement Variables");
DECLARE_SERVER_VAR(reinforceMarkerOccupants, []);
DECLARE_SERVER_VAR(reinforceMarkerInvader, []);
DECLARE_SERVER_VAR(canReinforceOccupants, []);
DECLARE_SERVER_VAR(canReinforceInvader, []);

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
