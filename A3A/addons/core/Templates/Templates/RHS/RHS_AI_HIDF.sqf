//////////////////////////
//   Side Information   //
//////////////////////////

["name", "HIDF"] call _fnc_saveToTemplate;
["spawnMarkerName", "HIDF support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_Blue_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F_Exp\Flags\flag_GEN_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_TanoaGendarmerie"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_T_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["rhsgref_hidf_M998_2dr_halftop","rhsgref_hidf_M998_4dr_halftop", "rhsgref_hidf_m1025"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["rhsgref_hidf_m1025_m2","rhsgref_hidf_m1025_m2","rhsgref_hidf_m1025_m2","rhsgref_hidf_m1025_mk19","a3a_rhs_m966_olive"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["rhsgref_hidf_M998_2dr_fulltop","rhsgref_hidf_M998_2dr_fulltop", "rhsgref_hidf_m113a3_unarmed"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["RHS_Ural_VMF_01","RHS_Ural_Open_VMF_01"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["RHS_Ural_Ammo_VMF_01"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["RHS_Ural_Repair_VMF_01"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["RHS_Ural_Fuel_VMF_01"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["a3a_rhs_m113_olive_medical"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["a3a_rhs_m113_hidf_M240","a3a_rhs_m113_hidf_M240","rhsgref_hidf_m113a3_m2","rhsgref_hidf_m113a3_m2"]] call _fnc_saveToTemplate;            //this line determines light APCs
["vehiclesAPCs", ["rhsgref_hidf_m113a3_m2","rhsgref_hidf_m113a3_m2","rhsgref_hidf_m113a3_mk19","rhsgref_hidf_m113a3_mk19"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["a3a_RHS_M2A2_olive"]] call _fnc_saveToTemplate;                //this line determines IFVs
["vehiclesTanks", ["rhsusf_m1a1hc_wd"]] call _fnc_saveToTemplate;
["vehiclesAA", ["RHS_M6_wd"]] call _fnc_saveToTemplate;


["vehiclesTransportBoats", ["rhsgref_hidf_rhib","B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["rhsusf_mkvsoc"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["RHSGREF_A29B_HIDF"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["rhs_l159_cdf_b_CDF_CAP"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", []] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["rhs_uh1h_hidf", "rhsgred_hidf_cessna_o3a"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["rhs_uh1h_hidf_unarmed"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["rhs_uh1h_hidf"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["rhs_uh1h_hidf_gunship"]] call _fnc_saveToTemplate; 
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;

["vehiclesArtillery", ["RHS_M119_WD"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["RHS_M119_WD", ["RHS_mag_m1_he_12"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;    
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["rhsgref_hidf_m1025_m2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["rhsgref_hidf_M998_2dr"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["rhsgref_hidf_m998_4dr"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["rhsgref_hidf_M998_4dr_fulltop"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_WD"]] call _fnc_saveToTemplate;
["staticAT", ["RHS_TOW_TriPod_WD"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_D"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_WD"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_Mk2_tripwire", "rhsusf_mine_m49a1_6m"]] call _fnc_saveToTemplate;

#include "RHS_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04",
"TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08"]] call _fnc_saveToTemplate;
["voices", ["Male01ENGFRE","Male02ENGFRE"]] call _fnc_saveToTemplate;
["sfFaces", ["AfricanHead_01", "AfricanHead_02", "AfricanHead_03", "Barklem", "GreekHead_A3_05", "GreekHead_A3_06", "GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", "Sturrock", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_12", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18", "WhiteHead_19", "WhiteHead_20", "WhiteHead_21"]] call _fnc_saveToTemplate;
["sfVoices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG"]] call _fnc_saveToTemplate;
"TanoanMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["gltube", [["rhs_weap_m79", "", "", "",["rhs_mag_M441_HE","rhs_mag_m714_White","rhs_mag_m662_red"], [], ""]]];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", ["rhs_weap_m72a7"]];
_loadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEDP", "rhs_mag_maaws_HEAT"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEDP", "rhs_mag_maaws_HE"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HE","rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HE","rhs_mag_maaws_HEAT"], [], ""]
]];
_loadoutData set ["heavyATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_fim92"]];
_loadoutData set ["sidearms", ["rhsusf_weap_m1911a1"]];

_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhs_mine_Mk2_tripwire_mag","rhs_mine_Mk2_tripwire_mag", "rhsusf_mine_m49a1_6m_mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag", "rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag", "rhs_ec400_mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["rhs_grenade_mkii_mag"]];
_loadoutData set ["smokeGrenades", ["rhs_grenade_m15_mag"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow","rhs_mag_nspn_red"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Booniehat_tna_F"]];
_loadoutData set ["sniHats", ["H_Booniehat_tna_F"]];


//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData set ["items_squadleader_extras", []];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_engineer_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", []];
_loadoutData set ["items_sniper_extras", []];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear


///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["rhs_uniform_g3_m81","rhs_uniform_g3_rgr"]];
_sfLoadoutData set ["vests", ["rhsgref_TacVest_ERDL","rhsgref_otv_khaki"]];
_sfLoadoutData set ["backpacks", ["rhsgref_hidf_alicepack"]];
_sfLoadoutData set ["helmets", ["H_Bandanna_khk_hs", "H_Cap_oli_hs", "rhsusf_ach_helmet_M81", "rhsusf_ach_bare_headset_ess", "rhsusf_ach_bare_headset", "rhsusf_ach_bare_ess", "rhsusf_ach_bare"]];
_sfLoadoutData set ["binoculars", ["Rangefinder"]];
_sfLoadoutData set ["slHat", ["H_MilCap_tna_F"]];
_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_15", "rhsusf_ANPVS_14"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["rifles", [
["rhs_weap_m14_rail_fiberglass", "rhsusf_acc_aac_m14dcqd_silencer", "", "rhsusf_acc_T1_low", ["rhsusf_20Rnd_762x51_m80_Mag"], [], ""],
["rhs_weap_m16a4", "rhsusf_acc_rotex5_grey", "acc_flashlight", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""],
["rhs_weap_m16a4_carryhandle", "rhsusf_acc_rotex5_grey", "acc_flashlight", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_m4a1", "rhsusf_acc_rotex5_grey", "acc_flashlight", "rhsusf_acc_compm4", 	["rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""],
["rhs_weap_m4a1_carryhandle", "rhsusf_acc_rotex5_grey", "acc_flashlight", "", 		["rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_m4a1_carryhandle_m203", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_compm4",	["rhs_mag_30Rnd_556x45_M855A1_Stanag"], ["rhs_mag_M433_HEDP","rhs_mag_m714_White","rhs_mag_m662_red"], ""],
["rhs_weap_m4a1_carryhandle_m203", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_compm4",	["rhs_mag_30Rnd_556x45_M855A1_Stanag"], ["rhs_mag_M397_HET","rhs_mag_m714_White","rhs_mag_m662_red"], ""]
]];
_sfLoadoutData set ["SMGs", [
["rhs_weap_m3a1_specops", "", "", "rhsusf_acc_compm4", ["rhsgref_30rnd_1143x23_M1911B_SMG"], [], ""],
["rhs_weap_m4a1_carryhandle", "rhsusf_acc_rotex5_grey", "acc_flashlight", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_ELCAN", ["rhsusf_200rnd_556x45_M855_mixed_box","rhsusf_200rnd_556x45_M855_mixed_box","rhsusf_200rnd_556x45_M855_mixed_box","rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_m14_rail_fiberglass", "rhsusf_acc_aac_m14dcqd_silencer", "", "rhsusf_acc_M8541_low", ["rhsusf_20Rnd_762x51_m80_Mag"], [], "rhsusf_acc_m14_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m14_rail_fiberglass", "rhsusf_acc_aac_m14dcqd_silencer", "", "rhsusf_acc_M8541_low", ["rhsusf_20Rnd_762x51_m118_special_Mag"], [], "rhsusf_acc_m14_bipod"]
]];
//_sfLoadoutData set ["sidearms", []];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["rhs_uniform_bdu_erdl","rhsgref_uniform_ERDL"]];
_militaryLoadoutData set ["vests", ["rhsgref_alice_webbing","rhsgref_TacVest_ERDL","rhsgref_otv_khaki"]];
_militaryLoadoutData set ["backpacks", ["rhsusf_falconii", "rhsusf_falconii", "rhsgref_hidf_alicepack"]];
_militaryLoadoutData set ["helmets", ["rhsgref_helmet_pasgt_erdl"]];

_militaryLoadoutData set ["rifles", [
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""], 
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""], 
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""], 
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""], 
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""],
["rhs_weap_m4_carryhandle", "rhsusf_acc_SF3P556", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag","rhs_mag_20Rnd_556x45_M193_Stanag","rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["rhs_weap_m16a4_carryhandle", "rhsusf_acc_SF3P556", "", "", ["rhs_mag_20Rnd_556x45_M193_2MAG_Stanag","rhs_mag_20Rnd_556x45_M193_2MAG_Stanag","rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_m4_carryhandle_m203", "rhsusf_acc_SF3P556", "", "",["rhs_mag_20Rnd_556x45_M193_Stanag","rhs_mag_20Rnd_556x45_M193_Stanag","rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], ["rhs_mag_M441_HE","rhs_mag_m714_White","rhs_mag_m662_red"], ""],
["rhs_weap_m16a4_carryhandle_M203", "rhsusf_acc_SF3P556", "", "",["rhs_mag_20Rnd_556x45_M193_2MAG_Stanag","rhs_mag_20Rnd_556x45_M193_2MAG_Stanag","rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], ["rhs_mag_M433_HEDP","rhs_mag_m714_White","rhs_mag_m662_red"], ""]
]];
_militaryLoadoutData set ["SMGs", [
"rhs_weap_m3a1"
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_m249", "", "", "",["rhsusf_200rnd_556x45_M855_mixed_box", "rhsusf_100Rnd_556x45_M855_mixed_soft_pouch", "rhsusf_100Rnd_556x45_M855_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_fnmag", "", "", "",["rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_fnmag", "", "", "",["rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_fnmag", "", "", "",["rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2",["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2",["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""],
["rhs_weap_m14_rail", "", "", "rhsusf_acc_M8541_low",["rhsusf_20Rnd_762x51_m80_Mag"], [], "rhsusf_acc_m14_bipod"]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_m14_rail", "", "", "rhsusf_acc_M8541_low",["rhsusf_20Rnd_762x51_m80_Mag"], [], "rhsusf_acc_m14_bipod"], 
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4",["rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
_militaryLoadoutData set ["sidearms", ["rhsusf_weap_m1911a1"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["rhsgref_uniform_olive"]];
_policeLoadoutData set ["vests", ["rhsgref_chestrig"]];
_policeLoadoutData set ["helmets", ["H_Beret_gen_F"]];
_policeLoadoutData set ["SMGs", [
"rhs_weap_m3a1"
]];
_policeLoadoutData set ["carbines", [
"rhs_weap_m1garand_sa43"
]];
_policeLoadoutData set ["shotguns", [
"rhs_weap_M590_5RD"
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["rhsgref_uniform_og107", "rhsgref_uniform_og107_erdl"]];
_militiaLoadoutData set ["vests", ["rhsgref_chestrig","rhsgref_chicom","rhsgref_alice_webbing"]];
_militiaLoadoutData set ["backpacks", ["rhsusf_falconii"]];
_militiaLoadoutData set ["helmets", ["rhsgref_hat_m1941cap","rhsgref_hat_M1951","rhsgref_helmet_M1_bare","rhsgref_helmet_M1_erdl"]];
_militiaLoadoutData set ["NVGs", []];

_militiaLoadoutData set ["antiInfantryGrenades", ["rhs_mag_f1"]];

_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEDP", "rhs_mag_maaws_HE"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HE","rhs_mag_maaws_HEDP"], [], ""]
]];
_militiaLoadoutData set ["rifles", [
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", 	["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""],
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", 	["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""]
]];
_militiaLoadoutData set ["carbines", ["rhs_weap_m1garand_sa43"]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", 	["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""],
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", 	["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""],
["rhs_weap_m16a4_carryhandle_M203", "rhsusf_acc_SF3P556", "", "",	["rhs_mag_20Rnd_556x45_M193_Stanag","rhs_mag_20Rnd_556x45_M193_Stanag","rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], ["rhs_mag_M441_HE","rhs_mag_m714_White","rhs_mag_m662_red"], ""]
]];
_militiaLoadoutData set ["SMGs", [
"rhs_weap_m3a1"
]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_fnmag", "", "", "",["rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51_m62_tracer"], [], ""],
"rhs_weap_m1garand_sa43"
]];
_militiaLoadoutData set ["marksmanRifles", [
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", 	["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""], 
"rhs_weap_m1garand_sa43"
]];
_militiaLoadoutData set ["sidearms", ["rhsusf_weap_m1911a1"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["vests", ["rhsgref_TacVest_ERDL"]];
_crewLoadoutData set ["carbines", ["rhs_weap_m1garand_sa43"]];
_crewLoadoutData set ["helmets", ["rhsusf_cvc_green_helmet","rhsusf_cvc_green_ess"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["vests", ["rhsgref_TacVest_ERDL"]];
_pilotLoadoutData set ["SMGs", ["rhs_weap_m3a1"]];
_pilotLoadoutData set ["helmets", ["rhsusf_hgu56p_green", "rhsusf_hgu56p_visor_green", "rhsusf_hgu56p_visor_mask_green"]];

if (isClass (configFile >> "CfgPatches" >> "UK3CB_Factions_CHD_O")) then {

    (_militaryLoadoutData get "carbines") append [
    ["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
    ["UK3CB_M16A2", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
    ["UK3CB_M16A3", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
    ];
    (_militaryLoadoutData get "grenadeLaunchers") append [
    ["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
    ["UK3CB_M16A3_UGL", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
    ];
    (_militaryLoadoutData get "machineGuns") append [
    ["UK3CB_M60", "", "", "", ["UK3CB_M60_100rnd_762x51", "UK3CB_M60_100rnd_762x51_R", "UK3CB_M60_100rnd_762x51_RM", "UK3CB_M60_100rnd_762x51_RT"], [], ""]
    ];

    (_militiaLoadoutData get "grenadeLaunchers") append [
    ["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
    ["UK3CB_M16A3_UGL", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
    ];
    (_militiaLoadoutData get "machineGuns") append [
    ["UK3CB_M60", "", "", "", ["UK3CB_M60_100rnd_762x51", "UK3CB_M60_100rnd_762x51_R", "UK3CB_M60_100rnd_762x51_RM", "UK3CB_M60_100rnd_762x51_RT"], [], ""]
    ];

    (_policeLoadoutData get "rifles") append [
    "uk3cb_enfield_l8"
    ];
};

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [selectRandomWeighted ["grenadeLaunchers", 1, "rifles",2]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandomWeighted ["rifles", 3, "carbines", 1]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
	["SMGs"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;
    ["antiInfantryGrenades", 2] call _fnc_addItem;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;


    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 1] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom["ATLaunchers", "heavyATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 7] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandomWeighted ["carbines", 1, "SMGs",2, "shotguns", 1]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandomWeighted ["carbines", 1, "SMGs",2]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};
private _pilotTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    call _unarmedTemplate;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
    ["SquadLeader", _policeTemplate],
    ["Standard", _policeTemplate]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _pilotTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _policeTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
