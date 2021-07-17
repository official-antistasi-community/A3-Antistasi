/*

 * File: fn_compatabilityLoadFaction.sqf
 * Author: Spoffy
 * Description:
 *    Loads a faction definition file, and transforms it into the old global variable system for sides.
 * Params:
 *    _file - Faction definition file path
 *    _side - Side to load them in as
 * Returns:
 *    Namespace containing faction information
 * Example Usage:
 */
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params ["_file", "_side"];

Info_2("Compatibility loading template: '%1' as side %2", _file, _side);

private _factionDefaultFile = ["EnemyDefaults","EnemyDefaults","RebelDefaults","CivilianDefaults"] #([west, east, independent, civilian] find _side);
_factionDefaultFile = "Templates\NewTemplates\FactionDefaults\" + _factionDefaultFile + ".sqf";

private _faction = [[_factionDefaultFile,_file]] call A3A_fnc_loadFaction;
private _factionPrefix = ["occ", "inv", "reb", "civ"] #([west, east, independent, civilian] find _side);
missionNamespace setVariable ["A3A_faction_" + _factionPrefix, _faction, true];  // ["A3A_faction_occ", "A3A_faction_inv", "A3A_faction_reb", "A3A_faction_civ"]

private _baseUnitClass = switch (_side) do {
	case west: { "B_G_Soldier_F" };
	case east: { "O_G_Soldier_F" };
	case independent: { "I_G_Soldier_F" };
	case civilian: { "C_Man_1" };
};

private _unitClassMap = if (_side isNotEqualTo independent) then { createHashMap } else {
	createHashMapFromArray [				// Cases matter. Lower case here because allVariables on namespace returns lowercase
		["militia_unarmed", "I_G_Survivor_F"],
		["militia_rifleman", "I_G_Soldier_F"],
		["militia_staticcrew", "I_G_Soldier_F"],
		["militia_medic", "I_G_medic_F"],
		["militia_sniper", "I_G_Sharpshooter_F"],
		["militia_marksman", "I_G_Soldier_M_F"],
		["militia_lat", "I_G_Soldier_LAT_F"],
		["militia_machinegunner", "I_G_Soldier_AR_F"],
		["militia_explosivesexpert", "I_G_Soldier_exp_F"],
		["militia_grenadier", "I_G_Soldier_GL_F"],
		["militia_squadleader", "I_G_Soldier_SL_F"],
		["militia_engineer", "I_G_engineer_F"],
		["militia_at", "I_Soldier_AT_F"],
		["militia_aa", "I_Soldier_AA_F"],
		["militia_petros", "I_G_officer_F"]
	]
};

//Register loadouts globally.
private _loadoutsPrefix = format ["loadouts_%1_", _factionPrefix];
private _allDefinitions = _faction getVariable "loadouts";
{
	private _loadoutName = _x;
	private _definition = _allDefinitions getVariable _loadoutName;
	private _unitClass = _unitClassMap getOrDefault [_loadoutName, _baseUnitClass];
	[_loadoutsPrefix + _loadoutName, _definition + [_unitClass]] call A3A_fnc_registerUnitType;
} forEach allVariables _allDefinitions;

if (_side isEqualTo east) then {
	nameInvaders = _faction getVariable "name";

	//Flag images
	CSATFlag = _faction getVariable "flag";
	CSATFlagTexture = _faction getVariable "flagTexture";
	flagCSATmrk = _faction getVariable "flagMarkerType";
	if (isServer) then {"CSAT_carrier" setMarkerText (format [localize "STR_antistasi_marker_supportCorridor", _faction getVariable "name"])};

	//Loot crate
	CSATAmmoBox = _faction getVariable "ammobox";
    CSATSurrenderCrate = _faction getVariable "surrenderCrate";
    CSATEquipmentBox = _faction getVariable "equipmentBox";

	//PVP Loadouts
	CSATPlayerLoadouts = _faction getVariable "pvpLoadouts";
	vehCSATPVP = _faction getVariable "pvpVehicles";

	CSATGrunt = "loadouts_inv_military_SquadLeader";
	CSATOfficer = "loadouts_inv_other_Official";
	CSATBodyG = "loadouts_inv_military_Rifleman";
	CSATCrew = "loadouts_inv_other_Crew";
	CSATUnarmed = "loadouts_inv_other_Unarmed";
	CSATMarksman = "loadouts_inv_military_Marksman";
	staticCrewInvaders = "loadouts_inv_military_Rifleman";
	CSATPilot = "loadouts_inv_other_Pilot";

	if (gameMode == 4) then {
		FIARifleman = "loadouts_inv_militia_Rifleman";
		FIAMarksman = "loadouts_inv_militia_Marksman";
	};

	groupsCSATSentry = ["loadouts_inv_military_Grenadier", "loadouts_inv_military_Rifleman"];
	//TODO Change Rifleman to spotter.
	groupsCSATSniper = ["loadouts_inv_military_Sniper", "loadouts_inv_military_Rifleman"];
	//TODO Create lighter Recon loadouts, and add a group of them to here.
	groupsCSATSmall = [groupsCSATSentry, groupsCSATSniper];
	//TODO Add ammobearers
	groupsCSATAA = [
		"loadouts_inv_military_SquadLeader",
		"loadouts_inv_military_AA",
		"loadouts_inv_military_AA"
	];
	groupsCSATAT = [
		"loadouts_inv_military_SquadLeader",
		"loadouts_inv_military_AT",
		"loadouts_inv_military_AT"
	];
	private _groupsCSATMediumSquad = [
		"loadouts_inv_military_SquadLeader",
		"loadouts_inv_military_MachineGunner",
		"loadouts_inv_military_Grenadier",
		"loadouts_inv_military_LAT"
	];
	groupsCSATmid = [_groupsCSATMediumSquad, groupsCSATAA, groupsCSATAT];

	groupsCSATSquad = [];
	for "_i" from 1 to 5 do {
		groupsCSATSquad pushBack [
			"loadouts_inv_military_SquadLeader",
			selectRandomWeighted ["loadouts_inv_military_LAT", 2, "loadouts_inv_military_MachineGunner", 1],
			selectRandomWeighted ["loadouts_inv_military_Rifleman", 2, "loadouts_inv_military_Grenadier", 1],
			selectRandomWeighted ["loadouts_inv_military_MachineGunner", 2, "loadouts_inv_military_Marksman", 1],
			selectRandomWeighted ["loadouts_inv_military_Rifleman", 4, "loadouts_inv_military_AT", 1],
			selectRandomWeighted ["loadouts_inv_military_AA", 1, "loadouts_inv_military_Engineer", 4],
			"loadouts_inv_military_Rifleman",
			"loadouts_inv_military_Medic"
		];
	};

	CSATSquad = groupsCSATSquad select 0;
	CSATSpecOp = [
		"loadouts_inv_SF_SquadLeader",
		"loadouts_inv_SF_Rifleman",
		"loadouts_inv_SF_MachineGunner",
		"loadouts_inv_SF_ExplosivesExpert",
		"loadouts_inv_SF_LAT",
		"loadouts_inv_SF_Medic"
	];

	if (gamemode == 4) then {
		groupsFIASmall = [
			["loadouts_inv_militia_Grenadier", "loadouts_inv_militia_Rifleman"],
			["loadouts_inv_militia_Marksman", "loadouts_inv_militia_Rifleman"],
			["loadouts_inv_militia_Marksman", "loadouts_inv_militia_Grenadier"]
		];
		groupsFIAMid = [];
		for "_i" from 1 to 6 do {
			groupsFIAMid pushBack [
				"loadouts_inv_militia_SquadLeader",
				"loadouts_inv_militia_Grenadier",
				"loadouts_inv_militia_MachineGunner",
				selectRandomWeighted [
					"loadouts_inv_militia_LAT", 1,
					"loadouts_inv_militia_Marksman", 1,
					"loadouts_inv_militia_Engineer", 1
				]
			];
		};

		groupsFIASquad = [];
		for "_i" from 1 to 5 do {
			groupsFIASquad pushBack [
				"loadouts_inv_militia_SquadLeader",
				"loadouts_inv_militia_MachineGunner",
				"loadouts_inv_militia_Grenadier",
				"loadouts_inv_militia_Rifleman",
				selectRandomWeighted ["loadouts_inv_militia_Rifleman", 1, "loadouts_inv_militia_Marksman", 1],
				selectRandomWeighted ["loadouts_inv_militia_Rifleman", 2, "loadouts_inv_militia_Marksman", 1],
				selectRandomWeighted ["loadouts_inv_militia_Rifleman", 1, "loadouts_inv_militia_ExplosivesExpert", 1],
				"loadouts_inv_militia_LAT",
				"loadouts_inv_militia_Medic"
			];
		};

		FIASquad = groupsFIASquad select 0;
	};

	vehCSATBike = _faction getVariable "vehiclesBasic" select 0;
	vehCSATLightArmed = _faction getVariable "vehiclesLightArmed";
	vehCSATLightUnarmed = _faction getVariable "vehiclesLightUnarmed";
	vehCSATTrucks = _faction getVariable "vehiclesTrucks";
	vehCSATAmmoTruck = _faction getVariable "vehiclesAmmoTrucks" select 0;
	vehCSATRepairTruck = _faction getVariable "vehiclesRepairTrucks" select 0;
	vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;

	vehCSATAPC = _faction getVariable "vehiclesAPCs";
	vehCSATTank = _faction getVariable "vehiclesTanks" select 0;
	vehCSATAA = _faction getVariable "vehiclesAA" select 0;
	vehCSATAttack = vehCSATAPC + [vehCSATTank];

	vehCSATBoat = _faction getVariable "vehiclesGunboats" select 0;
	vehCSATRBoat = _faction getVariable "vehiclesTransportBoats" select 0;
	vehCSATBoats = [vehCSATBoat, vehCSATRBoat] + (_faction getVariable "vehiclesAmphibious");

	vehCSATPlane = _faction getVariable "vehiclesPlanesCAS" select 0;
	vehCSATPlaneAA = _faction getVariable "vehiclesPlanesAA" select 0;
	vehCSATTransportPlanes = _faction getVariable "vehiclesPlanesTransport";

	vehCSATPatrolHeli = _faction getVariable "vehiclesHelisLight" select 0;
	vehCSATTransportHelis = (_faction getVariable "vehiclesHelisLight") + (_faction getVariable "vehiclesHelisTransport");
	vehCSATAttackHelis = _faction getVariable "vehiclesHelisAttack";

	vehCSATUAV = _faction getVariable "uavsAttack" select 0;
	vehCSATUAVSmall = _faction getVariable "uavsPortable" select 0;

	vehCSATMRLS = _faction getVariable "vehiclesArtillery" select 0 select 0;
	vehCSATMRLSMags = _faction getVariable "vehiclesArtillery" select 0 select 1 select 0;

	vehCSATNormal =
		  vehCSATLight
		+ vehCSATTrucks
		+ (_faction getVariable "vehiclesAmmoTrucks")
		+ (_faction getVariable "vehiclesRepairTrucks")
		+ (_faction getVariable "vehiclesFuelTrucks")
		+ (_faction getVariable "vehiclesMedical");

	vehCSATAir =
		  vehCSATTransportHelis
		+ vehCSATAttackHelis
		+ [vehCSATPlane, vehCSATPlaneAA]
		+ vehCSATTransportPlanes;

	if (gameMode == 4) then {
		vehFIAArmedCar = _faction getVariable "vehiclesMilitiaLightArmed" select 0;
		vehFIATruck = _faction getVariable "vehiclesMilitiaTrucks" select 0;
		vehFIACar = _faction getVariable "vehiclesMilitiaCars" select 0;
	};

	CSATMG = _faction getVariable "staticMGs" select 0;
	staticATInvaders = _faction getVariable "staticAT" select 0;
	staticAAInvaders = _faction getVariable "staticAA" select 0;
	CSATMortar = _faction getVariable "staticMortars" select 0;
	CSATmortarMagazineHE = _faction getVariable "mortarMagazineHE";

	MGStaticCSATB = _faction getVariable "baggedMGs" select 0 select 0;
	//TODO: Add tall/short support support.
	supportStaticCSATB = _faction getVariable "baggedMGs" select 0 select 1;
	supportStaticCSATB2 = _faction getVariable "baggedMGs" select 0 select 1;
	ATStaticCSATB = _faction getVariable "baggedAT" select 0 select 0;
	AAStaticCSATB = _faction getVariable "baggedAA" select 0 select 0;
	MortStaticCSATB = _faction getVariable "baggedMortars" select 0 select 0;
	supportStaticCSATB3 = _faction getVariable "baggedMortars" select 0 select 1;
};


if (_side isEqualTo west) then {
	nameOccupants = _faction getVariable "name";

	//Flag images
	NATOFlag = _faction getVariable "flag";
	NATOFlagTexture = _faction getVariable "flagTexture";
	flagNATOmrk = _faction getVariable "flagMarkerType";
	if (isServer) then {"NATO_carrier" setMarkerText (format [localize "STR_antistasi_marker_supportCorridor", _faction getVariable "name"])};

	//Loot crate
	NATOAmmobox = _faction getVariable "ammobox";
    NATOSurrenderCrate = _faction getVariable "surrenderCrate";
    NATOEquipmentBox = _faction getVariable "equipmentBox";

	//PVP Loadouts
	NATOPlayerLoadouts = _faction getVariable "pvpLoadouts";
	vehNATOPVP = _faction getVariable "pvpVehicles";

	NATOGrunt = "loadouts_occ_military_Rifleman";
	NATOOfficer = "loadouts_occ_other_Official";
	NATOOfficer2 = "loadouts_occ_other_Traitor";
	NATOBodyG = "loadouts_occ_military_Rifleman";
	NATOCrew = "loadouts_occ_other_Crew";
	NATOUnarmed = "loadouts_occ_other_Unarmed";
	NATOMarksman = "loadouts_occ_military_Marksman";
	staticCrewOccupants = "loadouts_occ_military_Rifleman";
	NATOPilot = "loadouts_occ_other_Pilot";

	if (gameMode != 4) then {
		FIARifleman = "loadouts_occ_militia_Rifleman";
		FIAMarksman = "loadouts_occ_militia_Marksman";
	};

	policeOfficer = "loadouts_occ_police_SquadLeader";
	policeGrunt = "loadouts_occ_police_Standard";
	groupsNATOGen = [policeOfficer, policeGrunt];

	groupsNATOSentry = ["loadouts_occ_military_Grenadier", "loadouts_occ_military_Rifleman"];
	//TODO Change Rifleman to spotter.
	groupsNATOSniper = ["loadouts_occ_military_Sniper", "loadouts_occ_military_Rifleman"];
	//TODO Create lighter Recon loadouts, and add a group of them to here.
	groupsNATOSmall = [groupsNATOSentry, groupsNATOSniper];
	//TODO Add ammobearers
	groupsNATOAA = [
		"loadouts_occ_military_SquadLeader",
		"loadouts_occ_military_AA",
		"loadouts_occ_military_AA"
	];
	groupsNATOAT = [
		"loadouts_occ_military_SquadLeader",
		"loadouts_occ_military_AT",
		"loadouts_occ_military_AT"
	];
	private _groupsNATOMediumSquad = [
		"loadouts_occ_military_SquadLeader",
		"loadouts_occ_military_MachineGunner",
		"loadouts_occ_military_Grenadier",
		"loadouts_occ_military_LAT"
	];
	groupsNATOmid = [_groupsNATOMediumSquad, groupsNATOAA, groupsNATOAT];

	groupsNATOSquad = [];
	for "_i" from 1 to 5 do {
		groupsNATOSquad pushBack [
			"loadouts_occ_military_SquadLeader",
			selectRandomWeighted ["loadouts_occ_military_LAT", 2, "loadouts_occ_military_MachineGunner", 1],
			selectRandomWeighted ["loadouts_occ_military_Rifleman", 2, "loadouts_occ_military_Grenadier", 1],
			selectRandomWeighted ["loadouts_occ_military_MachineGunner", 2, "loadouts_occ_military_Marksman", 1],
			selectRandomWeighted ["loadouts_occ_military_Rifleman", 4, "loadouts_occ_military_AT", 1],
			selectRandomWeighted ["loadouts_occ_military_AA", 1, "loadouts_occ_military_Engineer", 4],
			"loadouts_occ_military_Rifleman",
			"loadouts_occ_military_Medic"
		];
	};

	NATOSquad = groupsNATOSquad select 0;
	NATOSpecOp = [
		"loadouts_occ_SF_SquadLeader",
		"loadouts_occ_SF_Rifleman",
		"loadouts_occ_SF_MachineGunner",
		"loadouts_occ_SF_ExplosivesExpert",
		"loadouts_occ_SF_LAT",
		"loadouts_occ_SF_Medic"
	];

	if (gameMode != 4) then {
		groupsFIASmall = [
			["loadouts_occ_militia_Grenadier", "loadouts_occ_militia_Rifleman"],
			["loadouts_occ_militia_Marksman", "loadouts_occ_militia_Rifleman"],
			["loadouts_occ_militia_Marksman", "loadouts_occ_militia_Grenadier"]
		];
		groupsFIAMid = [];
		for "_i" from 1 to 6 do {
			groupsFIAMid pushBack [
				"loadouts_occ_militia_SquadLeader",
				"loadouts_occ_militia_Grenadier",
				"loadouts_occ_militia_MachineGunner",
				selectRandomWeighted [
					"loadouts_occ_militia_LAT", 1,
					"loadouts_occ_militia_Marksman", 1,
					"loadouts_occ_militia_Engineer", 1
				]
			];
		};

		groupsFIASquad = [];
		for "_i" from 1 to 5 do {
			groupsFIASquad pushBack [
				"loadouts_occ_militia_SquadLeader",
				"loadouts_occ_militia_MachineGunner",
				"loadouts_occ_militia_Grenadier",
				"loadouts_occ_militia_Rifleman",
				selectRandomWeighted ["loadouts_occ_militia_Rifleman", 1, "loadouts_occ_militia_Marksman", 1],
				selectRandomWeighted ["loadouts_occ_militia_Rifleman", 2, "loadouts_occ_militia_Marksman", 1],
				selectRandomWeighted ["loadouts_occ_militia_Rifleman", 1, "loadouts_occ_militia_ExplosivesExpert", 1],
				"loadouts_occ_militia_LAT",
				"loadouts_occ_militia_Medic"
			];
		};

		FIASquad = groupsFIASquad select 0;
	};

	vehNATOBike = _faction getVariable "vehiclesBasic" select 0;
	vehNATOLightArmed = _faction getVariable "vehiclesLightArmed";
	vehNATOLightUnarmed = _faction getVariable "vehiclesLightUnarmed";
	vehNATOTrucks = _faction getVariable "vehiclesTrucks";
	vehNATOCargoTrucks = _faction getVariable "vehiclesCargoTrucks";
	vehNATOAmmoTruck = _faction getVariable "vehiclesAmmoTrucks" select 0;
	vehNATORepairTruck = _faction getVariable "vehiclesRepairTrucks" select 0;
	vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;

	vehNATOAPC = _faction getVariable "vehiclesAPCs";
	vehNATOTank = _faction getVariable "vehiclesTanks" select 0;
	vehNATOAA = _faction getVariable "vehiclesAA" select 0;
	vehNATOAttack = vehNATOAPC + [vehNATOTank];

	vehNATOBoat = _faction getVariable "vehiclesGunboats" select 0;
	vehNATORBoat = _faction getVariable "vehiclesTransportBoats" select 0;
	vehNATOBoats = [vehNATOBoat, vehNATORBoat] + (_faction getVariable "vehiclesAmphibious");

	vehNATOPlane = _faction getVariable "vehiclesPlanesCAS" select 0;
	vehNATOPlaneAA = _faction getVariable "vehiclesPlanesAA" select 0;
	vehNATOTransportPlanes = _faction getVariable "vehiclesPlanesTransport";

	vehNATOPatrolHeli = _faction getVariable "vehiclesHelisLight" select 0;
	vehNATOTransportHelis = (_faction getVariable "vehiclesHelisLight") + (_faction getVariable "vehiclesHelisTransport");
	vehNATOAttackHelis = _faction getVariable "vehiclesHelisAttack";

	vehNATOUAV = _faction getVariable "uavsAttack" select 0;
	vehNATOUAVSmall = _faction getVariable "uavsPortable" select 0;

	vehNATOMRLS = _faction getVariable "vehiclesArtillery" select 0 select 0;
	vehNATOMRLSMags = _faction getVariable "vehiclesArtillery" select 0 select 1 select 0;

	vehNATONormal =
		  vehNATOLight
		+ vehNATOTrucks
		+ (_faction getVariable "vehiclesAmmoTrucks")
		+ (_faction getVariable "vehiclesRepairTrucks")
		+ (_faction getVariable "vehiclesFuelTrucks")
		+ (_faction getVariable "vehiclesMedical");

	vehNATOAir =
		  vehNATOTransportHelis
		+ vehNATOAttackHelis
		+ [vehNATOPlane, vehNATOPlaneAA]
		+ vehNATOTransportPlanes;

	if (gameMode != 4) then {
		vehFIAArmedCar = _faction getVariable "vehiclesMilitiaLightArmed" select 0;
		vehFIATruck = _faction getVariable "vehiclesMilitiaTrucks" select 0;
		vehFIACar = _faction getVariable "vehiclesMilitiaCars" select 0;
	};

	vehPoliceCar = _faction getVariable "vehiclesPolice" select 0;

	NATOMG = _faction getVariable "staticMGs" select 0;
	staticATOccupants = _faction getVariable "staticAT" select 0;
	staticAAOccupants = _faction getVariable "staticAA" select 0;
	NATOMortar = _faction getVariable "staticMortars" select 0;
	NATOmortarMagazineHE = _faction getVariable "mortarMagazineHE";

	MGStaticNATOB = _faction getVariable "baggedMGs" select 0 select 0;
	//TODO: Add tall/short support support.
	supportStaticNATOB = _faction getVariable "baggedMGs" select 0 select 1;
	supportStaticNATOB2 = _faction getVariable "baggedMGs" select 0 select 1;
	ATStaticNATOB = _faction getVariable "baggedAT" select 0 select 0;
	AAStaticNATOB = _faction getVariable "baggedAA" select 0 select 0;
	MortStaticNATOB = _faction getVariable "baggedMortars" select 0 select 0;
	supportStaticNATOB3 = _faction getVariable "baggedMortars" select 0 select 1;
};

if (_side isEqualTo independent) then {
	nameTeamPlayer = _faction getVariable "name";

	//Flag images
	SDKFlag = _faction getVariable "flag";
	SDKFlagTexture = _faction getVariable "flagTexture";
	SDKFlagMarkerType = _faction getVariable "flagMarkerType";

	typePetros = "loadouts_reb_militia_Petros";

	staticCrewTeamPlayer = "loadouts_reb_militia_staticCrew";
	SDKUnarmed = "loadouts_reb_militia_Unarmed";
	SDKSniper = ["loadouts_reb_militia_sniper", "loadouts_reb_militia_sniper"];
	SDKATman = ["loadouts_reb_militia_lat", "loadouts_reb_militia_lat"];
	SDKMedic = ["loadouts_reb_militia_medic", "loadouts_reb_militia_medic"];
	SDKMG = ["loadouts_reb_militia_MachineGunner", "loadouts_reb_militia_MachineGunner"];
	SDKExp = ["loadouts_reb_militia_ExplosivesExpert", "loadouts_reb_militia_ExplosivesExpert"];
	SDKGL = ["loadouts_reb_militia_Grenadier", "loadouts_reb_militia_Grenadier"];
	SDKMil = ["loadouts_reb_militia_Rifleman", "loadouts_reb_militia_Rifleman"];
	SDKSL = ["loadouts_reb_militia_SquadLeader", "loadouts_reb_militia_SquadLeader"];
	SDKEng = ["loadouts_reb_militia_Engineer", "loadouts_reb_militia_Engineer"];

	groupsSDKmid = [SDKSL,SDKGL,SDKMG,SDKMil];
	groupsSDKAT = [SDKSL,SDKMG,SDKATman,SDKATman,SDKATman];
	groupsSDKSquad = [SDKSL,SDKGL,SDKMil,SDKMG,SDKMil,SDKATman,SDKMil,SDKMedic];
	groupsSDKSquadEng = [SDKSL,SDKGL,SDKMil,SDKMG,SDKExp,SDKATman,SDKEng,SDKMedic];
	groupsSDKSquadSupp = [SDKSL,SDKGL,SDKMil,SDKMG,SDKATman,SDKMedic,[staticCrewTeamPlayer,staticCrewTeamPlayer],[staticCrewTeamPlayer,staticCrewTeamPlayer]];
	groupsSDKSniper = [SDKSniper,SDKSniper];
	groupsSDKSentry = [SDKGL,SDKMil];

	//Rebel Unit Tiers (for costs)
	sdkTier1 = SDKMil + [staticCrewTeamPlayer] + SDKMG + SDKGL + SDKATman;
	sdkTier2 = SDKMedic + SDKExp + SDKEng;
	sdkTier3 = SDKSL + SDKSniper;
	soldiersSDK = sdkTier1 + sdkTier2 + sdkTier3;

	vehSDKBike = _faction getVariable "vehicleBasic";
	vehSDKLightArmed = _faction getVariable "vehicleLightArmed";
	vehSDKAT = _faction getVariable "vehicleAT";
	vehSDKAA = _faction getVariable "vehicleAA";
	vehSDKLightUnarmed = _faction getVariable "vehicleLightUnarmed";
	vehSDKTruck = _faction getVariable "vehicleTruck";
	vehSDKPlane = _faction getVariable "vehiclePlane";
	vehSDKBoat = _faction getVariable "vehicleBoat";
	vehSDKRepair = _faction getVariable "vehicleRepair";

	SDKMGStatic = _faction getVariable "staticMG";
	staticATteamPlayer = _faction getVariable "staticAT";
	staticAAteamPlayer = _faction getVariable "staticAA";
	SDKMortar = _faction getVariable "staticMortar";
	SDKMortarHEMag = _faction getVariable "staticMortarMagHE";
	SDKMortarSmokeMag = _faction getVariable "staticMortarMagSmoke";

	civCar = _faction getVariable "vehicleCivCar";
	civTruck = _faction getVariable "vehicleCivTruck";
	civHeli = _faction getVariable "vehicleCivHeli";
	civBoat = _faction getVariable "vehicleCivBoat";

	MGStaticSDKB = _faction getVariable "baggedMGs" select 0 select 0;
	ATStaticSDKB = _faction getVariable "baggedAT" select 0 select 0;
	AAStaticSDKB = _faction getVariable "baggedAA" select 0 select 0;
	MortStaticSDKB = _faction getVariable "baggedMortars" select 0 select 0;
	supportStaticSDKB = _faction getVariable "baggedMGs" select 0 select 1;
	supportStaticsSDKB2 = _faction getVariable "baggedMGs" select 0 select 1;
	supportStaticsSDKB3 = _faction getVariable "baggedMortars" select 0 select 1;

	ATMineMag = _faction getVariable "mineAT";
	APERSMineMag = _faction getVariable "mineAPERS";

	breachingExplosivesAPC = _faction getVariable "breachingExplosivesAPC";
	breachingExplosivesTank = _faction getVariable "breachingExplosivesTank";

	initialRebelEquipment = _faction getVariable "initialRebelEquipment";
};

if (_side isEqualTo civilian) then {
	civVehCommonData = _faction getVariable "vehiclesCivCar";
	civVehRepairData = _faction getVariable "vehiclesCivRepair";
	civVehMedicalData = _faction getVariable "vehiclesCivMedical";
	civVehRefuelData = _faction getVariable "vehiclesCivFuel";
	civBoatData = _faction getVariable "vehiclesCivBoat";
	civVehIndustrialData = _faction getVariable "vehiclesCivIndustrial";
};

_faction;
