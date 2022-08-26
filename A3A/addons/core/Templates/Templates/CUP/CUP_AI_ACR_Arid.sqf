//////////////////////////
//   Side Information   //
//////////////////////////

["name", "ACR"] call _fnc_saveToTemplate;                         //this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION
["spawnMarkerName", "ACR support corridor"] call _fnc_saveToTemplate;             //this line determines the name tag for the "carrier" on the map -- Example: ["spawnMarkerName", "NATO support corridor"] - ENTER ONLY ONE OPTION

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;                         //this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", "cup\baseconfigs\cup_baseconfigs\data\flags\flag_cz_co.paa"] call _fnc_saveToTemplate;                 //this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", "flag_CzechRepublic"] call _fnc_saveToTemplate;             //this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_B_UAZ_Open_ACR", "CUP_B_UAZ_Unarmed_ACR", "CUP_B_LR_Transport_CZ_D"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_B_Dingo_GL_CZ_Des", "CUP_B_Dingo_CZ_Des", "CUP_B_HMMWV_AGS_GPK_ACR", "CUP_B_HMMWV_DSHKM_GPK_ACR", "CUP_B_HMMWV_M2_GPK_ACR", "CUP_B_LR_Special_Des_CZ_D", "CUP_B_UAZ_SPG9_ACR", "CUP_B_UAZ_METIS_ACR", "CUP_B_UAZ_MG_ACR", "CUP_B_UAZ_AGS30_ACR"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["CUP_B_T810_Unarmed_CZ_DES", "CUP_B_T810_Armed_CZ_DES"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", []] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["CUP_B_T810_Reammo_CZ_DES"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["CUP_B_T810_Repair_CZ_DES"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["CUP_B_T810_Refuel_CZ_DES"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_B_LR_Ambulance_CZ_D", "CUP_B_BMP2_AMB_CZ_Des"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["CUP_B_BRDM2_CZ_Des", "CUP_B_BRDM2_HQ_CZ_Des", "CUP_B_BMP2_CZ_Des"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_B_T72_CZ"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_B_nM1097_AVENGER_USA_DES"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_B_L39_CZ"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["CUP_B_L39_CZ"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", []] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["CUP_B_Mi171Sh_Unarmed_ACR"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["CUP_B_Mi171Sh_Unarmed_ACR"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_B_Mi35_Dynamic_CZ", "CUP_B_Mi35_Dynamic_CZ_Des"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CUP_B_RM70_CZ"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CUP_B_RM70_CZ", ["CUP_40Rnd_GRAD_HE"]]]] call _fnc_saveToTemplate;

["uavsAttack", ["CUP_B_USMC_DYN_MQ9"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["CUP_B_nM1025_M2_USA_DES"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["CUP_B_MTVR_USA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CUP_B_nM1025_Unarmed_USA_DES"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_DSHKM_ACR"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_RBS70_ACR"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_B_2b14_82mm_ACR"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_1","LivonianHead_10","LivonianHead_2","LivonianHead_3","LivonianHead_4",
"LivonianHead_5","LivonianHead_6","LivonianHead_7","LivonianHead_8","LivonianHead_9",
"WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_05","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_13",
"WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18",
"WhiteHead_19","WhiteHead_21","WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_CZ_ACR","CUP_D_Male02_CZ_ACR","CUP_D_Male03_CZ_ACR","CUP_D_Male04_CZ_ACR","CUP_D_Male05_CZ_ACR"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = ["loadoutData"] call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7V_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VL_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VM_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VR_M"], [], ""],
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_9K32Strela", "", "", "", [""], [], ""],
    ["CUP_launch_FIM92Stinger", "", "", "", [""], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_RGO"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_PVS15_black"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["CUP_H_CZ_Hat01"]];
_loadoutData set ["sniHats", []];

_loadoutData set ["glasses", ["G_Tactical_Clear", "G_Tactical_Black", "G_Shades_Black", "G_Shades_Blue", "G_Shades_Green", "G_Shades_Red", "G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Sport_BlackWhite", "G_Sport_Blackyellow", "G_Sport_Greenblack", "G_Sport_Checkered", "G_Sport_Red", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", ["G_Combat", "G_Lowprofile"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];
private _sfmmItems = ["cup_optic_an_pvs_10_black"];

if (A3A_hasACE) then {
	_slItems append ["ACE_microDAGR", "ACE_DAGR"];
	_eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
	_mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = ["sfLoadoutData"] call _fnc_createLoadoutData;
_sfLoadoutData merge _loadoutData;
_sfLoadoutData set ["items_marksman_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["items_sniper_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["uniforms", ["CUP_U_B_CZ_DST_NoKneepads", "CUP_U_B_CZ_DST_Kneepads", "CUP_U_B_CZ_DST_Kneepads_Gloves", "CUP_U_B_CZ_DST_Kneepads_Sleeve", "CUP_U_B_CZ_DST_TShirt"]];
_sfLoadoutData set ["vests", ["CUP_V_CZ_NPP2006_co_des"]];
_sfLoadoutData set ["mgVests", ["CUP_V_B_Ciras_Coyote2"]];
_sfLoadoutData set ["medVests", ["CUP_V_CPC_medical_coy"]];
_sfLoadoutData set ["glVests", ["CUP_V_B_Ciras_Coyote"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_cbr"]];
_sfLoadoutData set ["slBackpacks", ["B_Kitbag_cbr"]];
_sfLoadoutData set ["atBackpacks", ["B_Kitbag_cbr"]];
_sfLoadoutData set ["helmets", ["CUP_H_CZ_Helmet07", "CUP_H_CZ_Helmet08", "CUP_H_OpsCore_Spray", "CUP_H_OpsCore_Tan"]];
_sfLoadoutData set ["slHat", ["CUP_H_CZ_Cap_Headphones_des"]];
_sfLoadoutData set ["sniHats", ["CUP_H_CZ_Booniehat_fold_des"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_GPNVG_black"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["CUP_CZ_BREN2_762_14", "CUP_muzzle_snds_SCAR_H", "", "CUP_optic_ACOG2", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_CZ_BREN2_762_14", "CUP_muzzle_snds_SCAR_H", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["rifles", [
    ["CUP_CZ_BREN2_762_14", "CUP_muzzle_snds_SCAR_H", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_CZ_BREN2_762_14", "CUP_muzzle_snds_SCAR_H", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_CZ_BREN2_762_14", "CUP_muzzle_snds_SCAR_H", "", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["CUP_CZ_BREN2_556_8", "CUP_muzzle_snds_M16", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_CZ_BREN2_762_8", "CUP_muzzle_snds_SCAR_H", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""],
    ["CUP_CZ_BREN2_556_8", "CUP_muzzle_snds_M16", "", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_CZ_BREN2_762_8", "CUP_muzzle_snds_SCAR_H", "", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_CZ_BREN2_762_14_GL", "CUP_muzzle_snds_SCAR_H", "", "CUP_optic_CompM4", ["CUP_30Rnd_762x39_CZ807"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_CZ_BREN2_556_14_GL", "CUP_muzzle_snds_M16", "", "CUP_optic_CompM4", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_CZ_BREN2_762_14_GL", "CUP_muzzle_snds_SCAR_H", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_762x39_CZ807"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_CZ_BREN2_556_14_GL", "CUP_muzzle_snds_M16", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M4A1_BUIS_GL", "CUP_muzzle_snds_M16", "", "CUP_optic_CompM4", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M4A1_BUIS_GL", "CUP_muzzle_snds_M16", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5SD6", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_Red_Tracer_9x19_MP5","CUP_30Rnd_Subsonic_9x19_MP5"], [], ""],
    ["CUP_smg_MP5SD6", "", "", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_Red_Tracer_9x19_MP5","CUP_30Rnd_Subsonic_9x19_MP5"], [], ""],
    ["CUP_smg_MP5SD6", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_Red_Tracer_9x19_MP5","CUP_30Rnd_Subsonic_9x19_MP5"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_Mk48", "", "", "CUP_optic_Aimpoint_5000", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_Mk48", "", "", "CUP_optic_ElcanM145", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_M60E4", "", "", "CUP_optic_Aimpoint_5000", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_M60E4", "", "", "CUP_optic_ElcanM145", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_HK417_20", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_HK417_Camo_Desert"], [], "bipod_01_F_blk"],
    ["CUP_arifle_HK417_20", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417_Camo_Desert"], [], "bipod_01_F_blk"],
    ["CUP_srifle_RSASS_Black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "bipod_01_F_blk"],
    ["CUP_srifle_RSASS_Black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_blk", "CUP_muzzle_snds_AWM", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"],
    ["CUP_srifle_M107_Base", "CUP_muzzle_mfsup_Suppressor_M107_Black", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_10Rnd_127x99_M107"], [], ""],
    ["CUP_srifle_M107_Base", "CUP_muzzle_mfsup_Suppressor_M107_Black", "", "cup_optic_an_pas_13c2", ["CUP_10Rnd_127x99_M107"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_RPG18", "", "", "", [""], [], ""],
    ["CUP_launch_M72A6", "", "", "", [""], [], ""],
    ["CUP_launch_M136", "", "", "", [""], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_Glock17", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = ["militaryLoadoutData"] call _fnc_createLoadoutData;
_militaryLoadoutData merge _loadoutData;
_militaryLoadoutData set ["uniforms", ["CUP_U_B_CZ_DST_NoKneepads", "CUP_U_B_CZ_DST_Kneepads", "CUP_U_B_CZ_DST_Kneepads_Sleeve"]];
_militaryLoadoutData set ["vests", ["CUP_V_CZ_NPP2006_nk_des"]];
_militaryLoadoutData set ["slVests", ["CUP_V_CZ_NPP2006_co_des"]];
_militaryLoadoutData set ["backpacks", ["B_Carryall_cbr", "B_FieldPack_cbr"]];
_militaryLoadoutData set ["slBackpacks", ["B_Kitbag_cbr"]];
_militaryLoadoutData set ["atBackpacks", ["B_Kitbag_cbr"]];
_militaryLoadoutData set ["helmets", ["CUP_H_CZ_Helmet01", "CUP_H_CZ_Helmet02", "CUP_H_CZ_Helmet07", "CUP_H_CZ_Helmet08"]];
_militaryLoadoutData set ["sniHats", ["CUP_H_CZ_Booniehat_vz95_des"]];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["slRifles", [
    ["CUP_CZ_BREN2_762_14", "", "", "CUP_optic_ACOG2", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""],
    ["CUP_CZ_BREN2_556_14", "", "", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_CZ_BREN2_762_14", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""],
    ["CUP_CZ_BREN2_556_14", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["CUP_CZ_BREN2_762_14", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""],
    ["CUP_CZ_BREN2_556_14", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_CZ_BREN2_762_14", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""],
    ["CUP_CZ_BREN2_556_14", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_CZ_BREN2_762_14", "", "", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""],
    ["CUP_CZ_BREN2_556_14", "", "", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_CZ_BREN2_556_8", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_CZ_BREN2_762_8", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""],
    ["CUP_CZ_BREN2_556_8", "", "", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_CZ_BREN2_762_8", "", "", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_CZ_BREN2_762_14_GL", "", "", "CUP_optic_CompM4", ["CUP_30Rnd_762x39_CZ807"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_CZ_BREN2_556_14_GL", "", "", "CUP_optic_CompM4", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_CZ_BREN2_762_14_GL", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_762x39_CZ807"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_CZ_BREN2_556_14_GL", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_EVO", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_9x19_EVO"], [], ""],
    ["CUP_smg_EVO", "", "", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_9x19_EVO"], [], ""],
    ["CUP_smg_EVO", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_EVO"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_m249_pip4", "", "", "CUP_optic_Aimpoint_5000", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_m249_pip4", "", "", "CUP_optic_ElcanM145", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_m249_pip4", "", "", "CUP_optic_ACOG2", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_M60E4", "", "", "CUP_optic_Aimpoint_5000", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_M60E4", "", "", "CUP_optic_ElcanM145", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_M60E4", "", "", "CUP_optic_ACOG2", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_HK417_20", "", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_HK417_Camo_Desert"], [], ""],
    ["CUP_arifle_HK417_20", "", "", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417_Camo_Desert"], [], ""],
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_CZ750", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_10Rnd_762x51_CZ750_Tracer"], [], "bipod_01_F_blk"],
    ["CUP_srifle_CZ750", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_10Rnd_762x51_CZ750_Tracer"], [], "bipod_01_F_blk"],
    ["CUP_srifle_CZ750", "", "", "CUP_optic_LeupoldMk4", ["CUP_10Rnd_762x51_CZ750_Tracer"], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_RPG18", "", "", "", [""], [], ""],
    ["CUP_launch_M72A6", "", "", "", [""], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_CZ75", "", "", "", ["CUP_16Rnd_9x19_cz75"], [], ""],
    ["CUP_hgun_Compact", "", "", "", ["CUP_10Rnd_9x19_Compact"], [], ""],
    ["CUP_hgun_Duty", "", "", "", ["16Rnd_9x21_Mag"], [], ""],
    ["CUP_hgun_Phantom", "", "", "", ["CUP_18Rnd_9x19_Phantom"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = ["policeLoadoutData"] call _fnc_createLoadoutData;
_policeLoadoutData merge _loadoutData;

_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];

_policeLoadoutData set ["shotGuns", [
    ["CUP_sgun_M1014", "", "", "", ["CUP_8Rnd_12Gauge_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
    ["CUP_smg_M3A1_blk", "", "", "", ["CUP_30Rnd_45ACP_M3A1_BLK_M"], [], ""],
    ["CUP_smg_MP5A5", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = ["militiaLoadoutData"] call _fnc_createLoadoutData;
_militiaLoadoutData merge _loadoutData;
_militiaLoadoutData set ["uniforms", ["CUP_U_B_CZ_DST_TShirt"]];
_militiaLoadoutData set ["vests", ["CUP_V_CZ_NPP2006_nk_des"]];
_militiaLoadoutData set ["sniVests", ["CUP_V_CZ_NPP2006_co_des"]];
_militiaLoadoutData set ["backpacks", ["B_Carryall_cbr", "B_FieldPack_cbr"]];
_militiaLoadoutData set ["slBackpacks", ["B_Kitbag_cbr"]];
_militiaLoadoutData set ["atBackpacks", ["CUP_B_RPGPack_Khaki"]];
_militiaLoadoutData set ["helmets", ["CUP_H_CZ_Helmet01", "CUP_H_CZ_Helmet02", "CUP_H_CZ_Helmet07", "CUP_H_CZ_Helmet08"]];
_militiaLoadoutData set ["sniHats", ["CUP_H_CZ_Booniehat_vz95_des"]];

_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_Sa58P_rearris", "", "", "", ["CUP_30Rnd_Sa58_M_TracerR"], [], ""],
    ["CUP_arifle_Sa58P_RIS1", "", "", "", ["CUP_30Rnd_Sa58_M_TracerR"], [], ""],
    ["CUP_arifle_Sa58V_rearris", "", "", "", ["CUP_30Rnd_Sa58_M_TracerR"], [], ""],
    ["CUP_arifle_Sa58RIS1", "", "", "", ["CUP_30Rnd_Sa58_M_TracerR"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_Sa58s_rearris", "", "", "", ["CUP_30Rnd_Sa58_M_TracerR"], [], ""],
    ["CUP_arifle_Sa58_Carbine_RIS_VFG", "", "", "", ["CUP_30Rnd_Sa58_M_TracerR"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_Sa58RIS2_gl", "", "", "", ["CUP_30Rnd_Sa58_M_TracerR"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_EVO", "", "", "", ["CUP_30Rnd_9x19_EVO"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_lmg_M60E4", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_RPG18", "", "", "", [""], [], ""]
]];
_militiaLoadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7V_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VL_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VM_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VR_M"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_CZ75", "", "", "", ["CUP_16Rnd_9x19_cz75"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = ["crewLoadoutData"] call _fnc_createLoadoutData;
_crewLoadoutData merge _loadoutData;
_crewLoadoutData set ["uniforms", ["CUP_U_B_CZ_DST_TShirt"]];
_crewLoadoutData set ["vests", ["CUP_V_CZ_vest19"]];
_crewLoadoutData set ["helmets", ["CUP_H_CZ_Helmet05"]];

private _pilotLoadoutData = ["pilotLoadoutData"] call _fnc_createLoadoutData;
_pilotLoadoutData merge _loadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_B_CZ_Pilot_WDL"]];
_pilotLoadoutData set ["vests", ["CUP_V_CZ_vest20"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B"]];

