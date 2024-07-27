/*
 * This is the first initVar that gets called, and it gets called on both the client and the server.
 * Generally, this should only be constants.
 */

scriptName "initVarCommon.sqf";
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("initVarCommon started");

////////////////////////////////////
// INITIAL SETTING AND VARIABLES ///
////////////////////////////////////
Info("Setting initial variables");
debug = false;
//A3A_customHintEnable = false; // Disables custom hints for boot duration. Is set to true in initClient.

// Antistasi revive vest damage adjustments
A3A_vestDamageAdj = createHashMap;

////////////////////////////////////
//     BEGIN SIDES AND COLORS    ///
////////////////////////////////////

Occupants = west;
Invaders = east;
teamPlayer = independent;		// uh, probably don't need this yet unless something is busted?
colorOccupants = "colorBLUFOR";
colorInvaders = "colorOPFOR";
colorTeamPlayer = "colorGUER";
respawnTeamPlayer = "respawn_guerrila";			// not really sure why we have two markers here (also "Synd_HQ")
posHQ = getMarkerPos respawnTeamPlayer;

////////////////////////////////////////
//     DECLARING PATCOM VARIABLES    ///
////////////////////////////////////////
Info("Initialising PATCOM Variables");

PATCOM_DEBUG = false; // Enable PATCOM specific debug.
PATCOM_VISUAL_RANGE = 400; // How far before PATCOM can start to detect enemies.
PATCOM_TARGET_TIME = 120; // How long before PATCOM unit forgets about an enemy.
PATCOM_ARTILLERY_MANAGER = true; // Allow Patcome to control AI Artillery. False is default A3 Artillery AI.
PATCOM_ARTILLERY_DELAY = 30; // How quickly artillery becomes available again after firing in seconds.
PATCOM_AI_STATICS = true; // Allow AI to find and arm statics near their group.
PATCOM_AI_STATIC_ARM = 120; // How long AI stay on static weapons after they arm them.

////////////////////////////////////////
//     DECLARING ITEM CATEGORIES     ///
////////////////////////////////////////
Info("Declaring item categories");

weaponCategories = ["Rifles", "Handguns", "MachineGuns", "MissileLaunchers", "Mortars", "RocketLaunchers", "Shotguns", "SMGs", "SniperRifles", "UsedLaunchers"];
itemCategories = ["Gadgets", "Bipods", "MuzzleAttachments", "PointerAttachments", "Optics", "Binoculars", "Compasses", "FirstAidKits", "GPS", "LaserDesignators",
	"Maps", "Medikits", "MineDetectors", "NVGs", "Radios", "Toolkits", "UAVTerminals", "Watches", "Glasses", "Headgear", "Vests", "Uniforms", "Backpacks"];

magazineCategories = ["MagArtillery", "MagBullet", "MagFlare", "Grenades", "MagLaser", "MagMissile", "MagRocket", "MagShell", "MagShotgun", "MagSmokeShell"];
explosiveCategories = ["Mine", "MineBounding", "MineDirectional"];
otherCategories = ["Unknown"];

//************************************************************************************************************
//ALL ITEMS THAT ARE MEMBERS OF CATEGORIES BELOW THIS LINE **MUST** BE A MEMBER OF ONE OF THE ABOVE CATEGORIES.
//************************************************************************************************************

//Categories that consist only of members of other categories, e.g, 'Weapons' contains items of every category from in weaponCategories;
aggregateCategories = ["Weapons", "Items", "Magazines", "Explosives"];

//All items in here *must* also be a member of one of the above categories.
//These are here because it's non-trivial to identify items in them. They might be a very specific subset of items, or the logic that identifies them might not be perfect.
//It's recommended that these categories be used with caution.
specialCategories = ["AA", "AT", "GrenadeLaunchers", "LightAttachments", "LaserAttachments", "Chemlights", "SmokeGrenades", "LaunchedSmokeGrenades", "LaunchedFlares", "HandFlares", "IRGrenades","LaserBatteries",
	"RebelUniforms", "CivilianUniforms", "BackpacksEmpty", "BackpacksTool", "BackpacksStatic", "BackpacksDevice", "BackpacksRadio", "CivilianVests", "ArmoredVests", "ArmoredHeadgear", "CosmeticHeadgear",
	"CosmeticGlasses", "ThermalNVGs", "OpticsClose", "OpticsMid", "OpticsLong", "ExplosiveCharges", "Disposable"];


allCategoriesExceptSpecial = weaponCategories + itemCategories + magazineCategories + explosiveCategories + otherCategories + aggregateCategories;
allCategories = allCategoriesExceptSpecial + specialCategories;

// Initialize categoryOverrides. Clients need this for equipmentClassToCategories to work.
[] call A3A_fnc_categoryOverrides;

////////////////////////////////////
//     BEGIN MOD DETECTION       ///
////////////////////////////////////
Info("Starting mod detection");

// Load the climate here for the moment, because we need it early and globally
private _worldName = toLower worldName;
A3A_climate = toLower (if (isText (missionConfigFile/"A3A"/"mapInfo"/_worldName/"climate")) then {
    getText (missionConfigFile/"A3A"/"mapInfo"/_worldName/"climate")
} else {
    getText (configFile/"A3A"/"mapInfo"/_worldName/"climate")
});

// Short Info of loaded mods needs to be added to this array. eg: `A3A_loadedTemplateInfoXML pushBack ["RHS","All factions will be replaced by RHS (AFRF &amp; USAF &amp; GREF)."];`
A3A_loadedTemplateInfoXML = [];

//Mod detection is done locally to each client, in case some clients have different modsets for some reason.
//Radio Detection
A3A_hasTFAR = isClass (configFile >> "CfgPatches" >> "task_force_radio");
A3A_hasACRE = isClass (configFile >> "cfgPatches" >> "acre_main");
A3A_hasTFARBeta = isClass (configFile >> "CfgPatches" >> "tfar_static_radios");
if (A3A_hasTFARBeta) then {A3A_hasTFAR = false};

//ILBE Assault Pack - Rewrite Detection (TFAR Long Range radio backpacks)
A3A_hasILBE = ((A3A_hasTFAR || A3A_hasTFARBeta) && isClass (configFile >> "CfgWeapons" >> "tfw_blade"));

//cTab Detection
A3A_hascTab = (isClass (configFile >> "CfgWeapons" >> "ItemcTab"));

//ACE Detection
A3A_hasACE = (!isNil "ace_common_fnc_isModLoaded");
A3A_hasACEHearing = isClass (configFile >> "CfgSounds" >> "ACE_EarRinging_Weak");
A3A_hasACEMedical = isClass (configFile >> "CfgSounds" >> "ACE_heartbeat_fast_3");

//ADV-CPR Pike Edition detection
A3A_hasADV = false;
if (A3A_hasACEMedical && isClass (configFile >> "CfgPatches" >> "adv_aceCPR")) then {A3A_hasADV = true; Info("ADV Detected.") };

//KAT medical detection
A3A_hasKAT = false;
if(A3A_hasACEMedical && isClass (configFile >> "CfgWeapons" >> "kat_scalpel")) then {A3A_hasKAT = true; Info("KAT MED Detected.") };

A3A_hasIFA = false;			// this one is everywhere, just mark it false and remove later

// Zeus enhanced
A3A_hasZen = (isClass (configFile >> "CfgPatches" >> "zen_common"));

//Content Mods (Units, Vehicles, Weapons, Clothes etc.)
//These are handled by a script in the Templates folder to keep integrators away from critical code.
//call A3A_fnc_detector;

////////////////////////////////////
//        BUILDINGS LISTS        ///
////////////////////////////////////
Info("Creating building arrays");

A3A_buildingWhitelist = [
	"Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F", "Land_Cargo_Tower_V4_F"
];
A3A_milBuildingWhitelist = A3A_buildingWhitelist + [
	"Land_Radar_01_HQ_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_HQ_V4_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F", "Land_Cargo_Patrol_V4_F","Land_HelipadSquare_F","Land_Posed","Land_Hlaska","Land_fortified_nest_small_EP1",
	"Land_fortified_nest_small","Fort_Nest","Fortress1","Land_GuardShed","Land_BagBunker_Small_F","Land_BagBunker_01_small_green_F","Land_vn_b_tower_01","Land_vn_o_shelter_05","Land_vn_bagbunker_01_small_green_f","Land_vn_bagbunker_small_f", "Land_vn_o_tower_01","Land_vn_o_tower_02", "Land_vn_o_tower_03","Land_vn_hut_tower_01", 
	"Land_vn_o_platform_05","Land_vn_o_platform_06","Land_vn_o_snipertree_01","Land_vn_o_snipertree_02","Land_vn_o_snipertree_03","Land_vn_o_snipertree_04","Land_vn_o_platform_01","Land_vn_o_platform_02","Land_vn_o_platform_03", "Land_vn_hlaska", "Land_vn_b_trench_bunker_04_01", "Land_vn_pillboxbunker_02_hex_f", "Land_vn_guardtower_01_f",
	"Land_vn_strazni_vez", "Land_vn_b_trench_firing_05", "Land_vn_cementworks_01_grey_f", "Land_vn_cementworks_01_brick_f", "Land_vn_radar_01_hq_f", "Land_vn_a_office01", "Land_SPE_Sandbag_Nest"
];
A3A_buildingBlacklist = [
	"Bridge_PathLod_base_F","Land_Slum_House03_F","Land_Bridge_01_PathLod_F","Land_Bridge_Asphalt_PathLod_F","Land_Bridge_Concrete_PathLod_F","Land_Bridge_HighWay_PathLod_F","Land_Bridge_01_F","Land_Bridge_Asphalt_F","Land_Bridge_Concrete_F","Land_Bridge_HighWay_F","Land_Canal_Wall_Stairs_F","warehouse_02_f",
	"cliff_wall_tall_f","cliff_wall_round_f","containerline_02_f","containerline_01_f","warehouse_01_f","quayconcrete_01_20m_f","airstripplatform_01_f","airport_02_terminal_f","cliff_wall_long_f","shop_town_05_f","Land_ContainerLine_01_F","Land_MilOffices_V1_F","Land_vn_b_trench_bunker_01_01","Land_vn_mil_barracks_i_ep1","Land_vn_barracks_03_f",
	"Land_vn_barracks_01","Land_vn_b_trench_bunker_02_01","Land_vn_b_trench_bunker_02_02","Land_vn_hootch_01_12","Land_vn_hootch_01_11","Land_vn_barracks_02_f","Land_vn_hootch_01_01","Land_vn_barracks_05_f","Land_vn_barracks_04_f","Land_vn_barracks_03_01","Land_vn_barracks_03","Land_vn_barracks_03_02","Land_vn_b_trench_bunker_02_04",
	"Land_vn_b_trench_bunker_02_03","Land_vn_b_trench_bunker_01_02","Land_vn_hootch_01_02","Land_vn_hootch_02_11","Land_vn_hootch_02_01","Land_vn_hootch_02_02","Land_vn_hootch_01_03","Land_vn_hootch_02_03","Land_vn_hootch_01_13","Land_vn_barracks_03_04","Land_vn_barracks_03_03","Land_vn_b_trench_bunker_03_02","Land_vn_b_trench_bunker_03_01",
	"Land_vn_quonset_02_01","Land_vn_quonset_02","Land_vn_quonset_01","Land_vn_hootch_01","Land_vn_hootch_02","Land_vn_barracks_02","Land_vn_barracks_02_01","Land_vn_barracks_04","Land_vn_b_trench_bunker_03_03","Land_vn_tent_mash_01_01","Land_vn_tent_mash_01_02","Land_vn_tent_01_03","Land_vn_tent_01_01","Land_vn_tent_01_02","Land_vn_tent_01_04",
	"Land_vn_barracks_04_01","Land_vn_barracks_04_02","Land_vn_b_trench_bunker_01_03","Land_vn_b_trench_bunker_03_04","Land_vn_tent_mash_01_04","Land_vn_tent_02_01","Land_vn_tent_02_02","Land_vn_tent_mash_01","Land_vn_tent_mash_02_03","Land_vn_tent_mash_02_04","Land_vn_hut_old02","Land_vn_tent_02_04","Land_vn_tent_02_03","Land_vn_tent_mash_02_02",
	"Land_vn_tent_mash_02_01","Land_vn_tent_mash_01_03","Land_vn_army_hut_storrage","Land_vn_army_hut_int","Land_vn_wf_field_hospital_east","Land_vn_army_hut2_int","Land_vn_army_hut3_long_int", "Land_vn_o_prop_cong_cage_01", "Land_vn_o_prop_cong_cage_02", "Land_vn_o_prop_cong_cage_03",
	"Land_SPE_bocage_long_mound", "Land_SPE_bocage_short_mound", "Land_SPE_bocage_short_mound_lc", "Land_SPE_bocage_long_mound_lc"
];
//Lights and Lamps array used for 'Blackout'
A3A_lampTypes = [
	"Lamps_Base_F", "PowerLines_base_F", "Land_LampDecor_F", "Land_LampHalogen_F", "Land_LampHarbour_F", "Land_LampShabby_F", "Land_NavigLight", "Land_runway_edgelight", "Land_PowerPoleWooden_L_F", "Land_SPE_StreetLamp_Off", "Land_SPE_StreetLamp", "Land_SPE_StreetLamp_pole_off", "Land_SPE_StreetLamp_pole", "Land_SPE_StreetLamp_wall_off", "Land_SPE_StreetLamp_wall", "Land_SPE_Ger_Lamp", "Land_SPE_US_Lamp", "Land_SPE_Onion_Lamp"
];

////////////////////////////////////
//     SOUNDS AND ANIMATIONS     ///
////////////////////////////////////
Info("Compiling sounds and animations");

A3A_sounds_dogBark = ["x\A3A\addons\core\Music\dog_bark01.wss", "x\A3A\addons\core\Music\dog_bark02.wss", "x\A3A\addons\core\Music\dog_bark04.wss", "x\A3A\addons\core\Music\dog_bark05.wss", "x\A3A\addons\core\Music\dog_maul01.wss", "x\A3A\addons\core\Music\dog_yelp02.wss"];
injuredSounds =  // Todo: migrate functions to A3A_sounds_callMedic
[
	"a3\sounds_f\characters\human-sfx\Person0\P0_moan_13_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_14_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_15_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_16_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_17_words.wss",
	"a3\sounds_f\characters\human-sfx\Person0\P0_moan_18_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_20_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_20_words.wss",
	"a3\sounds_f\characters\human-sfx\Person1\P1_moan_21_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_22_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_23_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_24_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_25_words.wss",
	"a3\sounds_f\characters\human-sfx\Person1\P1_moan_26_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_27_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_28_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_29_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_30_words.wss",
	"a3\sounds_f\characters\human-sfx\Person1\P1_moan_31_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_32_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_33_words.wss","a3\sounds_f\characters\human-sfx\Person2\P2_moan_19_words.wss"
];
A3A_sounds_moan = injuredSounds;

A3A_sounds_soundInjured_low = [];
A3A_sounds_soundInjured_mid = [];
A3A_sounds_soundInjured_max = [];
[] call A3A_fnc_createCivilianTracks;

private _soundPersonParent = "a3\sounds_f\characters\human-sfx\";
for "_person" from 1 to 18 do {
	private _personFolder = str _person;
	if (_person < 10) then { _personFolder = "0" + _personFolder; };
	private _personFolder = "P" + _personFolder + "\";
	{
		private _soundList = missionNamespace getVariable ["A3A_sounds_soundInjured_" + _x, []];
		for "_level" from 1 to 5 do {
			_soundList pushBack (_soundPersonParent + _personFolder + "Soundinjured_"+_x+"_"+str _level+".wss");
		};
	} forEach ["Low","Mid","Max"];

};

////////////////////////////////////
//     	    MEDICAL STUFF        ///
////////////////////////////////////

// Generated by scanning for abdomen hitpoint armor > 1. Will probably never change.
private _strongUniforms = ["U_O_CombatUniform_ocamo","U_O_GhillieSuit","U_O_PilotCoveralls","U_O_Wetsuit","U_O_CombatUniform_oucamo","U_O_SpecopsUniform_ocamo",
"U_O_SpecopsUniform_blk","U_I_pilotCoveralls","U_O_FullGhillie_lsh","U_O_FullGhillie_sard","U_O_FullGhillie_ard","U_O_T_Soldier_F",
"U_O_T_Sniper_F","U_O_T_FullGhillie_tna_F","U_O_V_Soldier_Viper_F","U_O_V_Soldier_Viper_hex_F","U_O_R_Gorka_01_F","U_O_R_Gorka_01_brown_F",
"U_O_R_Gorka_01_camo_F","U_O_R_Gorka_01_black_F"];

A3A_strongUniformsHM = _strongUniforms createHashMapFromArray [];		// fills with nils, which is fine

medicAnims = ["AinvPknlMstpSnonWnonDnon_medic_1","AinvPknlMstpSnonWnonDnon_medic0","AinvPknlMstpSnonWnonDnon_medic1","AinvPknlMstpSnonWnonDnon_medic2"];


Info("initVarCommon completed");
