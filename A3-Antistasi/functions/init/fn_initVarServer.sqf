/*
 * This file is called after initVarCommon.sqf, on the server only.
 *
 * We also initialise anything in here that we don't want a client that's joining to overwrite, as JIP happens before initVar.
 */
scriptName "initVarServer.sqf";
private _fileName = "initVarServer.sqf";
[2,"initVarServer started",_fileName] call A3A_fnc_log;


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
[2,"initialising general server variables",_fileName] call A3A_fnc_log;

//time to delete dead bodies, vehicles etc..
DECLARE_SERVER_VAR(cleantime, 3600);
//initial spawn distance. Less than 1Km makes parked vehicles spawn in your nose while you approach.
DECLARE_SERVER_VAR(distanceSPWN, 1000);
DECLARE_SERVER_VAR(distanceSPWN1, 1300);
DECLARE_SERVER_VAR(distanceSPWN2, 500);
//Quantity of Civs to spawn in (most likely per client - Bob Murphy 26.01.2020)
DECLARE_SERVER_VAR(civPerc, 5);
//The furthest distance the AI can attack from using helicopters or planes
DECLARE_SERVER_VAR(distanceForAirAttack, 10000);
//The furthest distance the AI can attack from using trucks and armour
DECLARE_SERVER_VAR(distanceForLandAttack, if (hasIFA) then {5000} else {3000});
//Max units we aim to spawn in. It's not very strictly adhered to.
DECLARE_SERVER_VAR(maxUnits, 140);

//Disabled DLC according to server parameters
DECLARE_SERVER_VAR(disabledMods, call A3A_fnc_initDisabledMods);

//Legacy tool for scaling AI difficulty. Could use a rewrite.
DECLARE_SERVER_VAR(difficultyCoef, if !(isMultiplayer) then {0} else {floor ((({side group _x == teamPlayer} count (call A3A_fnc_playableUnits)) - ({side group _x != teamPlayer} count (call A3A_fnc_playableUnits))) / 5)});


//Mostly state variables, used by various parts of Antistasi.
DECLARE_SERVER_VAR(bigAttackInProgress, false);
DECLARE_SERVER_VAR(AAFpatrols,0);
DECLARE_SERVER_VAR(reinfPatrols, 0);
DECLARE_SERVER_VAR(smallCAmrk, []);
DECLARE_SERVER_VAR(smallCApos, []);

DECLARE_SERVER_VAR(attackPos, []);
DECLARE_SERVER_VAR(attackMrk, []);
DECLARE_SERVER_VAR(airstrike, []);

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
DECLARE_SERVER_VAR(napalmCurrent, false);
//Whether the players have Nightvision unlocked
DECLARE_SERVER_VAR(haveNV, false);
DECLARE_SERVER_VAR(missionsX, []);
//List of statics (MGs, AA, etc) that will be saved and loaded.
DECLARE_SERVER_VAR(staticsToSave, []);
//Whether the players have access to radios.
DECLARE_SERVER_VAR(haveRadio, hasTFAR || hasACRE);
//List of vehicles that are reported (I.e - Players can't go undercover in them)
DECLARE_SERVER_VAR(reportedVehs, []);
//Currently destroyed buildings.
DECLARE_SERVER_VAR(destroyedBuildings, []);
//Initial HR
server setVariable ["hr",8,true];
//Initial faction money pool
server setVariable ["resourcesFIA",1000,true];

////////////////////////////////////
//     SERVER ONLY VARIABLES     ///
////////////////////////////////////
//We shouldn't need to sync these.
[2,"Setting server only variables",_fileName] call A3A_fnc_log;


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

dealerCrate = ""; // Crate for the FND_Dealer mission

///////////////////////////////////////////
//     INITIALISING ITEM CATEGORIES     ///
///////////////////////////////////////////
[2,"Initialising item categories",__FILE__] call A3A_fnc_log;

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
	"diveGear"
];

DECLARE_SERVER_VAR(otherEquipmentArrayNames, _otherEquipmentArrayNames);

//We're going to use this to sync the variables later.
everyEquipmentRelatedArrayName = allEquipmentArrayNames + unlockedEquipmentArrayNames + otherEquipmentArrayNames;

//Initialise them all as empty arrays.
{
	DECLARE_SERVER_VAR_FROM_VARIABLE(_x, []);
} forEach everyEquipmentRelatedArrayName;

////////////////////////////////////
//          MOD CONFIG           ///
////////////////////////////////////
[2,"Setting mod configs",_fileName] call A3A_fnc_log;

//TFAR config
if (hasTFAR) then
{
	if (isServer) then
	{
		[] spawn {
			waitUntil {sleep 1; !isNil "TF_server_addon_version"};
			[2,"Initializing TFAR settings","initVar.sqf"] call A3A_fnc_log;
			["TF_no_auto_long_range_radio", true, true,"mission"] call CBA_settings_fnc_set;						//set to false and players will spawn with LR radio.
			if (hasIFA) then
				{
				["TF_give_personal_radio_to_regular_soldier", false, true,"mission"] call CBA_settings_fnc_set;
				["TF_give_microdagr_to_soldier", false, true,"mission"] call CBA_settings_fnc_set;
				};
			//tf_teamPlayer_radio_code = "";publicVariable "tf_teamPlayer_radio_code";								//to make enemy vehicles usable as LR radio
			//tf_east_radio_code = tf_teamPlayer_radio_code; publicVariable "tf_east_radio_code";					//to make enemy vehicles usable as LR radio
			//tf_guer_radio_code = tf_teamPlayer_radio_code; publicVariable "tf_guer_radio_code";					//to make enemy vehicles usable as LR radio
			["TF_same_sw_frequencies_for_side", true, true,"mission"] call CBA_settings_fnc_set;						//synchronize SR default frequencies
			["TF_same_lr_frequencies_for_side", true, true,"mission"] call CBA_settings_fnc_set;						//synchronize LR default frequencies
		};
	};
};

////////////////////////////////////
//      CIVILIAN UNITS LIST      ///
////////////////////////////////////
[2,"Creating civilians",_fileName] call A3A_fnc_log;

//No real reason we initialise this on the server right now...
private _arrayCivs = ["C_man_polo_1_F","C_man_polo_1_F_afro","C_man_polo_1_F_asia","C_man_polo_1_F_euro","C_man_sport_1_F_tanoan"];
DECLARE_SERVER_VAR(arrayCivs, _arrayCivs);


//////////////////////////////////////
//         TEMPLATE SELECTION      ///
//////////////////////////////////////
[2,"Reading templates",_fileName] call A3A_fnc_log;

private _templateVariables = [
	//Rebels
	"nameTeamPlayer",
	"SDKFlag",
	"SDKFlagTexture",
	"typePetros",
	"staticCrewTeamPlayer",
	"SDKUnarmed",
	"SDKSniper",
	"SDKATman",
	"SDKMedic",
	"SDKMG",
	"SDKExp",
	"SDKGL",
	"SDKMil",
	"SDKSL",
	"SDKEng",
	"groupsSDKmid",
	"groupsSDKAT",
	"groupsSDKSquad",
	"groupsSDKSquadEng",
	"groupsSDKSquadSupp",
	"groupsSDKSniper",
	"groupsSDKSentry",
	"sdkTier1",
	"sdkTier2",
	"sdkTier3",
	"soldiersSDK",
	"vehSDKBike",
	"vehSDKLightArmed",
	"vehSDKAT",
	"vehSDKLightUnarmed",
	"vehSDKTruck",
	"vehSDKPlane",
	"vehSDKBoat",
	"vehSDKRepair",
	"civCar",
	"civTruck",
	"civHeli",
	"civBoat",
	"SDKMGStatic",
	"staticATTeamPlayer",
	"staticAATeamPlayer",
	"SDKMortar",
	"SDKMortarHEMag",
	"SDKMortarSmokeMag",
	"MGStaticSDKB",
	"ATStaticSDKB",
	"AAStaticSDKB",
	"MortStaticSDKB",
	"supportStaticSDKB",
	"supportStaticsSDKB2",
	"supportStaticsSDKB3",
	"ATMineMag",
	"APERSMineMag",

	//@Spoffy, is the correct like this?
	"breachingExplosivesAPC",
	"breachingExplosivesTank",

	//Occupants
	"nameOccupants",
	"factionGEN",
	"factionMaleOccupants",
	"factionFIA",
	"NATOFlag",
	"NATOFlagTexture",
	"flagNATOmrk",
	"NATOAmmobox",
	"NATOPlayerLoadouts",
	"vehNATOPVP",
	"NATOGrunt",
	"NATOOfficer",
	"NATOOfficer2",
	"NATOBodyG",
	"NATOCrew",
	"NATOUnarmed",
	"NATOMarksman",
	"staticCrewOccupants",
	"NATOPilot",
	"FIARifleman",
	"FIAMarksman",
	"policeOfficer",
	"policeGrunt",
	"groupsNATOSentry",
	"groupsNATOSniper",
	"groupsNATOsmall",
	"groupsNATOAA",
	"groupsNATOAT",
	"groupsNATOmid",
	"NATOSquad",
	"NATOSpecOp",
	"groupsNATOSquad",
	"groupsFIASmall",
	"groupsFIAMid",
	"FIASquad",
	"groupsFIASquad",
	"groupsNATOGen",
	"vehNATOBike",
	"vehNATOLightArmed",
	"vehNATOLightUnarmed",
	"vehNATOTrucks",
	"vehNATOCargoTrucks",
	"vehNATOAmmoTruck",
	"vehNATORepairTruck",
	"vehNATOLight",
	"vehNATOAPC",
	"vehNATOTank",
	"vehNATOAA",
	"vehNATOAttack",
	"vehNATOBoat",
	"vehNATORBoat",
	"vehNATOBoats",
	"vehNATOPlane",
	"vehNATOPlaneAA",
	"vehNATOTransportPlanes",
	"vehNATOPatrolHeli",
	"vehNATOTransportHelis",
	"vehNATOAttackHelis",
	"vehNATOUAV",
	"vehNATOUAVSmall",
	"vehNATOMRLS",
	"vehNATOMRLSMags",
	"vehNATONormal",
	"vehNATOAir",
	"vehFIAArmedCar",
	"vehFIATruck",
	"vehFIACar",
	"vehPoliceCar",
	"NATOMG",
	"staticATOccupants",
	"staticAAOccupants",
	"NATOMortar",
	"MGStaticNATOB",
	"ATStaticNATOB",
	"AAStaticNATOB",
	"MortStaticNATOB",
	"supportStaticNATOB",
	"supportStaticNATOB2",
	"supportStaticNATOB3",
	//Invaders
	"nameInvaders",
	"factionMaleInvaders",
	"factionFIA",
	"CSATFlag",
	"CSATFlagTexture",
	"flagCSATmrk",
	"CSATAmmoBox",
	"CSATPlayerLoadouts",
	"vehCSATPVP",
	"CSATGrunt",
	"CSATOfficer",
	"CSATBodyG",
	"CSATCrew",
	"CSATMarksman",
	"staticCrewInvaders",
	"CSATPilot",
	"FIARifleman",
	"FIAMarksman",
	"groupsCSATSentry",
	"groupsCSATSniper",
	"groupsCSATsmall",
	"groupsCSATAA",
	"groupsCSATAT",
	"groupsCSATmid",
	"CSATSquad",
	"CSATSpecOp",
	"groupsCSATSquad",
	"groupsFIASmall",
	"groupsFIAMid",
	"FIASquad",
	"groupsFIASquad",
	"vehCSATBike",
	"vehCSATLightArmed",
	"vehCSATLightUnarmed",
	"vehCSATTrucks",
	"vehCSATAmmoTruck",
	"vehCSATRepairTruck",
	"vehCSATLight",
	"vehCSATAPC",
	"vehCSATTank",
	"vehCSATAA",
	"vehCSATAttack",
	"vehCSATBoat",
	"vehCSATRBoat",
	"vehCSATBoats",
	"vehCSATPlane",
	"vehCSATPlaneAA",
	"vehCSATTransportPlanes",
	"vehCSATPatrolHeli",
	"vehCSATTransportHelis",
	"vehCSATAttackHelis",
	"vehCSATUAV",
	"vehCSATUAVSmall",
	"vehCSATMRLS",
	"vehCSATMRLSMags",
	"vehCSATNormal",
	"vehCSATAir",
	"vehFIAArmedCar",
	"vehFIATruck",
	"vehFIACar",
	"CSATMG",
	"staticATInvaders",
	"staticAAInvaders",
	"CSATMortar",
	"MGStaticCSATB",
	"ATStaticCSATB",
	"AAStaticCSATB",
	"MortStaticCSATB",
	"supportStaticCSATB",
	"supportStaticCSATB2",
	"supportStaticCSATB3"
];

{
	ONLY_DECLARE_SERVER_VAR_FROM_VARIABLE(_x);
} forEach _templateVariables;


if !(hasIFA) then {
	//Rebel Templates
	switch (true) do {
		case (!activeGREF): {call compile preProcessFileLineNumbers "Templates\Vanilla_Reb_FIA_Altis.sqf"};
		case (has3CB): {call compile preProcessFileLineNumbers "Templates\3CB_Reb_TTF_Arid.sqf"};
		case (teamPlayer != independent): {call compile preProcessFileLineNumbers "Templates\RHS_Reb_CDF_Arid.sqf"};
		case (activeGREF): {call compile preProcessFileLineNumbers "Templates\RHS_Reb_NAPA_Arid.sqf"};
	};
	//Occupant Templates
	switch (true) do {
		case (!activeUSAF): {call compile preProcessFileLineNumbers "Templates\Vanilla_Occ_NATO_Altis.sqf"};
		case (has3CB): {call compile preProcessFileLineNumbers "Templates\BAF_Occ_BAF_Arid.sqf"};
		case (teamPlayer != independent): {call compile preProcessFileLineNumbers "Templates\RHS_Occ_CDF_Arid.sqf"};
		case (activeUSAF): {call compile preProcessFileLineNumbers "Templates\RHS_Occ_USAF_Arid.sqf"};
	};
	//Invader Templates
	switch (true) do {
		case (!activeAFRF): {call compile preProcessFileLineNumbers "Templates\Vanilla_Inv_CSAT_Altis.sqf";};
		case (has3CB): {call compile preProcessFileLineNumbers "Templates\3CB_Inv_TKM_Arid.sqf"};
		case (activeAFRF): {call compile preProcessFileLineNumbers "Templates\RHS_Inv_AFRF_Arid.sqf"};
	};
	//Civilian Templates
	switch (true) do {
		case (!activeAFRF): {call compile preProcessFileLineNumbers "Templates\Vanilla_Civ.sqf";};
		case (has3CB): {call compile preProcessFileLineNumbers "Templates\3CB_Civ.sqf"};
		case (activeAFRF): {call compile preProcessFileLineNumbers "Templates\RHS_Civ.sqf"};
	};
}
else {
	//IFA Templates
	call compile preProcessFileLineNumbers "Templates\IFA_Reb_POL_Temp.sqf";
	call compile preProcessFileLineNumbers "Templates\IFA_Inv_SOV_Temp.sqf";
	call compile preProcessFileLineNumbers "Templates\IFA_Occ_WEH_Temp.sqf";
	call compile preProcessFileLineNumbers "Templates\IFA_Civ.sqf";
};

////////////////////////////////////
//      CIVILIAN VEHICLES       ///
////////////////////////////////////
[2,"Creating civilian vehicles lists",_fileName] call A3A_fnc_log;

private _fnc_vehicleIsValid = {
	params ["_type"];
	private _configClass = configFile >> "CfgVehicles" >> _type;
	if !(isClass _configClass) exitWith {
		[1, format ["Vehicle class %1 not found", _type], _filename] call A3A_fnc_Log;	
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

_civVehiclesWeighted append ([civVehCommonData, 4] call _fnc_filterAndWeightArray);
_civVehiclesWeighted append ([civVehIndustrialData, 1] call _fnc_filterAndWeightArray);
_civVehiclesWeighted append ([civVehMedicalData, 0.1] call _fnc_filterAndWeightArray);
_civVehiclesWeighted append ([civVehRepairData, 0.1] call _fnc_filterAndWeightArray);
_civVehiclesWeighted append ([civVehRefuelData, 0.1] call _fnc_filterAndWeightArray);

for "_i" from 0 to (count _civVehiclesWeighted - 2) step 2 do {
	_civVehicles pushBack (_civVehiclesWeighted select _i);
};

DECLARE_SERVER_VAR(arrayCivVeh, _civVehicles);
DECLARE_SERVER_VAR(civVehiclesWeighted, _civVehiclesWeighted);


private _civBoats = [];
private _civBoatsWeighted = [];

// Boats don't need any re-weighting, so just copy the data

for "_i" from 0 to (count civBoatData - 2) step 2 do {
	private _boat = civBoatData select _i;
	if (_boat call _fnc_vehicleIsValid) then {
		_civBoats pushBack _boat;
		_civBoatsWeighted pushBack _boat;
		_civBoatsWeighted pushBack (civBoatData select (_i+1));
	};
};

DECLARE_SERVER_VAR(civBoats, _civBoats);
DECLARE_SERVER_VAR(civBoatsWeighted, _civBoatsWeighted);

private _undercoverVehicles = (arrayCivVeh - ["C_Quadbike_01_F"]) + civBoats + [civHeli];
DECLARE_SERVER_VAR(undercoverVehicles, _undercoverVehicles);

//////////////////////////////////////
//      GROUPS CLASSIFICATION      ///
//////////////////////////////////////
[2,"Identifying unit types",_fileName] call A3A_fnc_log;
//Identify Squad Leader Units
private _squadLeaders = (SDKSL + [(NATOSquad select 0),(NATOSpecOp select 0),(CSATSquad select 0),(CSATSpecOp select 0),(FIASquad select 0)]);
DECLARE_SERVER_VAR(squadLeaders, _squadLeaders);
//Identify Medic Units
private _medics = SDKMedic + [(FIAsquad select ((count FIAsquad)-1)),(NATOSquad select ((count NATOSquad)-1)),(NATOSpecOp select ((count NATOSpecOp)-1)),(CSATSquad select ((count CSATSquad)-1)),(CSATSpecOp select ((count CSATSpecOp)-1))];
DECLARE_SERVER_VAR(medics, _medics);
//Define Sniper Groups and Units
private _sniperGroups = [groupsNATOSniper,groupsCSATSniper];
DECLARE_SERVER_VAR(sniperGroups, _sniperGroups);

//////////////////////////////////////
//        ITEM INITIALISATION      ///
//////////////////////////////////////
//This is all very tightly coupled.
//Beware when changing these, or doing anything with them, really.

[2,"Initializing hardcoded categories",_fileName] call A3A_fnc_log;
[] call A3A_fnc_categoryOverrides;
[2,"Scanning config entries for items",_fileName] call A3A_fnc_log;
[A3A_fnc_equipmentIsValidForCurrentModset] call A3A_fnc_configSort;
[2,"Categorizing vehicle classes",_fileName] call A3A_fnc_log;
[] call A3A_fnc_vehicleSort;
[2,"Categorizing equipment classes",_fileName] call A3A_fnc_log;
[] call A3A_fnc_equipmentSort;
[2,"Sorting grouped class categories",_fileName] call A3A_fnc_log;
[] call A3A_fnc_itemSort;
[2,"Building loot lists",_fileName] call A3A_fnc_log;
[] call A3A_fnc_loot;

////////////////////////////////////
//   CLASSING TEMPLATE VEHICLES  ///
////////////////////////////////////
[2,"Identifying vehicle types",_fileName] call A3A_fnc_log;
private _vehNormal = (vehNATONormal + vehCSATNormal + [vehFIATruck,vehSDKTruck,vehSDKLightArmed,vehSDKBike,vehSDKRepair]);
DECLARE_SERVER_VAR(vehNormal, _vehNormal);

private _vehBoats = [vehNATOBoat,vehCSATBoat,vehSDKBoat];
DECLARE_SERVER_VAR(vehBoats, _vehBoats);

private _vehAttack = vehNATOAttack + vehCSATAttack;
DECLARE_SERVER_VAR(vehAttack, _vehAttack);

private _vehPlanes = (vehNATOAir + vehCSATAir + [vehSDKPlane]);
DECLARE_SERVER_VAR(vehPlanes, _vehPlanes);

private _vehAttackHelis = vehCSATAttackHelis + vehNATOAttackHelis;
DECLARE_SERVER_VAR(vehAttackHelis, _vehAttackHelis);

private _vehFixedWing = [vehNATOPlane,vehNATOPlaneAA,vehCSATPlane,vehCSATPlaneAA,vehSDKPlane] + vehNATOTransportPlanes + vehCSATTransportPlanes;
DECLARE_SERVER_VAR(vehFixedWing, _vehFixedWing);

private _vehUAVs = [vehNATOUAV,vehCSATUAV];
DECLARE_SERVER_VAR(vehUAVs, _vehUAVs);

private _vehAmmoTrucks = [vehNATOAmmoTruck,vehCSATAmmoTruck];
DECLARE_SERVER_VAR(vehAmmoTrucks, _vehAmmoTrucks);

private _vehAPCs = vehNATOAPC + vehCSATAPC;
DECLARE_SERVER_VAR(vehAPCs, _vehAPCs);

private _vehTanks = [vehNATOTank,vehCSATTank];
DECLARE_SERVER_VAR(vehTanks, _vehTanks);

private _vehTrucks = vehNATOTrucks + vehCSATTrucks + [vehSDKTruck,vehFIATruck];
DECLARE_SERVER_VAR(vehTrucks, _vehTrucks);

private _vehAA = [vehNATOAA,vehCSATAA];
DECLARE_SERVER_VAR(vehAA, _vehAA);

private _vehMRLS = [vehCSATMRLS, vehNATOMRLS];
DECLARE_SERVER_VAR(vehMRLS, _vehMRLS);

private _vehTransportAir = vehNATOTransportHelis + vehCSATTransportHelis + vehNATOTransportPlanes + vehCSATTransportPlanes;
DECLARE_SERVER_VAR(vehTransportAir, _vehTransportAir);

private _vehFastRope = ["O_Heli_Light_02_unarmed_F","B_Heli_Transport_01_camo_F","RHS_UH60M_d","RHS_Mi8mt_vdv","RHS_Mi8mt_vv","RHS_Mi8mt_Cargo_vv"];
DECLARE_SERVER_VAR(vehFastRope, _vehFastRope);

private _vehUnlimited = vehNATONormal + vehCSATNormal + [vehNATORBoat,vehNATOPatrolHeli,vehCSATRBoat,vehCSATPatrolHeli,vehNATOUAV,vehNATOUAVSmall,NATOMG,NATOMortar,vehCSATUAV,vehCSATUAVSmall,CSATMG,CSATMortar];
DECLARE_SERVER_VAR(vehUnlimited, _vehUnlimited);

private _vehFIA = [vehSDKBike,vehSDKLightArmed,SDKMGStatic,vehSDKLightUnarmed,vehSDKTruck,vehSDKBoat,SDKMortar,staticATteamPlayer,staticAAteamPlayer,vehSDKRepair];
DECLARE_SERVER_VAR(vehFIA, _vehFIA);

// sanity check the lists to catch some serious problems early
private _badVehs = [];
{
    if !(isClass (configFile >> "CfgVehicles" >> _x)) then {
        _badVehs pushBackUnique _x;
    };
} forEach (vehNormal + vehBoats + vehAttack + vehPlanes + vehAA + vehMRLS + vehUnlimited + vehFIA);

if (count _badVehs > 0) then {
	[1, format ["Missing vehicle classnames: %1", str _badVehs], _filename] call A3A_fnc_log;
};

///////////////////////////
//     MOD TEMPLATES    ///
///////////////////////////
//Please respect the order in which these are called,
//and add new entries to the bottom of the list.
if (hasACE) then {
	[] call A3A_fnc_aceModCompat;
};
if (hasRHS) then {
	[] call A3A_fnc_rhsModCompat;
};
if (hasIFA) then {
	[] call A3A_fnc_ifaModCompat;
};

////////////////////////////////////
//     ACRE ITEM MODIFICATIONS   ///
////////////////////////////////////
if (hasACRE) then {initialRebelEquipment append ["ACRE_PRC343","ACRE_PRC148","ACRE_PRC152","ACRE_PRC77","ACRE_PRC117F"];};

////////////////////////////////////
//    UNIT AND VEHICLE PRICES    ///
////////////////////////////////////
[2,"Creating pricelist",_fileName] call A3A_fnc_log;
{server setVariable [_x,50,true]} forEach SDKMil;
{server setVariable [_x,75,true]} forEach (sdkTier1 - SDKMil);
{server setVariable [_x,100,true]} forEach  sdkTier2;
{server setVariable [_x,150,true]} forEach sdkTier3;
//{timer setVariable [_x,0,true]} forEach (vehAttack + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA,vehCSATPlane,vehCSATPlaneAA] + vehCSATAttackHelis + vehAA + vehMRLS);
{timer setVariable [_x,3,true]} forEach [staticATOccupants,staticAAOccupants];
{timer setVariable [_x,6,true]} forEach [staticATInvaders,staticAAInvaders];
{timer setVariable [_x,0,true]} forEach vehNATOAPC;
{timer setVariable [_x,10,true]} forEach vehCSATAPC;
timer setVariable [vehNATOTank,0,true];
timer setVariable [vehCSATTank,10,true];
timer setVariable [vehNATOAA,0,true];
timer setVariable [vehCSATAA,3,true];
timer setVariable [vehNATOBoat,3,true];
timer setVariable [vehCSATBoat,3,true];
timer setVariable [vehNATOPlane,0,true];
timer setVariable [vehCSATPlane,10,true];
timer setVariable [vehNATOPlaneAA,0,true];
timer setVariable [vehCSATPlaneAA,10,true];
{timer setVariable [_x,1,true]} forEach vehNATOTransportPlanes;
{timer setVariable [_x,1,true]} forEach vehNATOTransportHelis - [vehNATOPatrolHeli];
{timer setVariable [_x,1,true]} forEach vehCSATTransportPlanes;
{timer setVariable [_x,10,true]} forEach vehCSATTransportHelis - [vehCSATPatrolHeli];
{timer setVariable [_x,0,true]} forEach vehNATOAttackHelis;
{timer setVariable [_x,10,true]} forEach vehCSATAttackHelis;
timer setVariable [vehNATOMRLS,0,true];
timer setVariable [vehCSATMRLS,5,true];

server setVariable [civCar,200,true];													//200
server setVariable [civTruck,600,true];													//600
server setVariable [civHeli,5000,true];													//5000
server setVariable [civBoat,200,true];													//200
server setVariable [vehSDKBike ,50,true];												//50
server setVariable [vehSDKLightUnarmed,200,true];										//200
server setVariable [vehSDKTruck,300,true];											//300
{server setVariable [_x,700,true]} forEach [vehSDKLightArmed,vehSDKAT];
{server setVariable [_x,400,true]} forEach [SDKMGStatic,vehSDKBoat,vehSDKRepair];			//400
{server setVariable [_x,800,true]} forEach [SDKMortar,staticATteamPlayer,staticAAteamPlayer];			//800

///////////////////////
//     GARRISONS    ///
///////////////////////
[2,"Initialising Garrison Variables",_fileName] call A3A_fnc_log;

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
[2,"Initialising Reinforcement Variables",_fileName] call A3A_fnc_log;
DECLARE_SERVER_VAR(reinforceMarkerOccupants, []);
DECLARE_SERVER_VAR(reinforceMarkerInvader, []);
DECLARE_SERVER_VAR(canReinforceOccupants, []);
DECLARE_SERVER_VAR(canReinforceInvader, []);

/////////////////////////////////////////
//     SYNCHRONISE SERVER VARIABLES   ///
/////////////////////////////////////////
[2,"Sending server variables",_fileName] call A3A_fnc_log;

//Declare this last, so it syncs last.
DECLARE_SERVER_VAR(initVarServerCompleted, true);
{
	publicVariable _x;
} forEach serverInitialisedVariables;

[2,"initVarServer completed",_fileName] call A3A_fnc_log;
