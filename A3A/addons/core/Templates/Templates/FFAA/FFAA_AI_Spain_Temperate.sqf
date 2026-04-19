//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Spanish Army"] call _fnc_saveToTemplate;
["spawnMarkerName", "Spanish Army"] call _fnc_saveToTemplate;

["flag", "ffaa_bandera_GTS"] call _fnc_saveToTemplate;
["flagTexture", "\A3\ui_f\data\map\markers\flags\Spain_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Spain"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["ffaa_et_anibal","ffaa_et_neton_mk2","ffaa_et_vamtac_trans","ffaa_et_vamtac_trans_blind","ffaa_et_vamtac_ume"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["ffaa_et_lince_lag40","ffaa_et_lince_m2","ffaa_et_lince_mg3","ffaa_et_rg31_samson","ffaa_et_vamtac_crows","ffaa_et_vamtac_lag40","ffaa_et_vamtac_m2","ffaa_et_vamtac_st5_lag40","ffaa_et_vamtac_st5_m2","ffaa_et_vamtac_st5_mg3","ffaa_et_vamtac_st5_spike","ffaa_et_vamtac_tow"]] call _fnc_saveToTemplate;             // Should be armed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesTrucks", ["ffaa_et_m250_carga_blin","ffaa_et_m250_carga_lona_blin","ffaa_et_pegaso_carga","ffaa_et_pegaso_carga_lona"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["ffaa_et_m250_recuperacion_blin"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["ffaa_et_m250_municion_blin","ffaa_et_pegaso_municion"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["ffaa_et_pegaso_repara_municion"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["ffaa_et_m250_combustible_blin"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["ffaa_et_lince_ambulancia","ffaa_et_toa_ambulancia"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["ffaa_ar_piranhaIIIC","ffaa_et_toa_m2","ffaa_et_toa_spike"]] call _fnc_saveToTemplate;             // armed, lightly armoured, with 6-8 passengers 
["vehiclesAPCs", ["ffaa_ar_piranhaIIIC_lance","ffaa_et_pizarro_mauser"]] call _fnc_saveToTemplate;                  // armed with enclosed turret, armoured, with 6-8 passengers
["vehiclesIFVs", []] call _fnc_saveToTemplate;                  // capable of surviving multiple rockets, cannon armed, with 6-8 passengers
["vehiclesLightTanks", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["ffaa_et_leopardo"]] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", []] call _fnc_saveToTemplate;
["vehiclesAA", ["ffaa_et_vamtac_mistral"]] call _fnc_saveToTemplate;                    // ideally heavily armed with anti-ground capability and enclosed turret. Passengers will be ignored


["vehiclesTransportBoats", ["ffaa_ar_supercat","ffaa_ar_zodiac_hurricane","ffaa_ar_zodiac_hurricane_long"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["I_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["ffaa_ar_harrier","ffaa_ea_ef18m"]] call _fnc_saveToTemplate;             // Will be used with CAS script, must be defined in setPlaneLoadout. Needs fixed gun and either rockets or missiles
["vehiclesPlanesAA", ["ffaa_ar_harrier","ffaa_ea_ef18m"]] call _fnc_saveToTemplate;              // 
["vehiclesPlanesTransport", ["ffaa_ea_hercules"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["ffaa_famet_ec135","ffaa_uh1h"]] call _fnc_saveToTemplate;            // ideally fragile & unarmed helis seating 4+
["vehiclesHelisTransport", ["ffaa_famet_ch47_mg","ffaa_famet_ch47_mg_cargo","ffaa_nh90_tth_armed","ffaa_nh90_tth_transport"]] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["ffaa_uh1h","ffaa_uh1h_armed"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["ffaa_nh90_nfh_transport"]] call _fnc_saveToTemplate;      // Utility helis with fixed or door guns + rocket pods
["vehiclesHelisAttack", ["ffaa_famet_tigre"]] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesArtillery", ["ffaa_ar_m109","ffaa_et_m109"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["ffaa_ar_m109", ["32Rnd_155mm_Mo_shells"]],
["ffaa_et_m109", ["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", ["ffaa_ea_reaper"]] call _fnc_saveToTemplate;
["uavsPortable", ["ffaa_et_searcherIII","ffaa_raven"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["ffaa_et_lince_lag40","ffaa_et_lince_m2","ffaa_et_lince_mg3"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["ffaa_et_pegaso_carga"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["ffaa_et_anibal"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["ffaa_m2_ship_tripode"]] call _fnc_saveToTemplate;
["staticAT", ["ffaa_milan_tripode","ffaa_spike_tripode","ffaa_tow_tripode"]] call _fnc_saveToTemplate;
["staticAA", ["ffaa_mistral_tripode"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white_illumination"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["faces", ["LivonianHead_6","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
"ffaa_espanombres" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
["ffaa_armas_c90","","","",["ffaa_mag_c90"],[],""]
]];
_loadoutData set ["ATLaunchers", [
["ffaa_armas_c100","","","ffaa_optic_vosel",["ffaa_mag_c100"],[],""]
]];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["ClaymoreDirectionalMine_Remote_Mag","APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["HandGrenade","ffaa_granada_alhambra"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellRed","SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["ffaa_nvgoggles"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Laserdesignator"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];

_loadoutData set ["facewear", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData set ["items_squadLeader_extras", []];
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
_sfLoadoutData set ["uniforms", ["ffaa_CombatUniform_shortsleeve_item_b"]];
_sfLoadoutData set ["vests", ["ffaa_et_moe_peco_02_2025_bs"]];
_sfLoadoutData set ["backpacks", ["ffaa_brilat_mochila_asalto_boscoso","ffaa_brilat_mochila_ligera_boscoso","ffaa_brilat_mochila_boscoso"]];
_sfLoadoutData set ["helmets", ["ffaa_casco_Fast_MTP_H","ffaa_casco_Fast_MTP_H_C_M"]];
_sfLoadoutData set ["facewear", []];
_sfLoadoutData set ["slRifles", [
["ffaa_armas_hkg36k_tir","ffaa_snds_GT_556","ffaa_acc_puntero_ir","ffaa_optic_Elcan",["ffaa_556x45_g36"],[],"ffaa_bipod_G36"],
["ffaa_armas_hk417A2_long_blk","muzzle_snds_B","ffaa_acc_puntero_ir","ffaa_optic_acog",["ffaa_20Rnd_762x51_hk417"],[],""]
]];
_sfLoadoutData set ["rifles", [
["ffaa_armas_hk416A5_short_blk","ffaa_snds_GT_556","ffaa_acc_puntero_ir","ffaa_optic_romeo4t_black",["ffaa_30Rnd_556x45_hk416"],[],""],
["ffaa_armas_hk416A5_short_blk","ffaa_snds_GT_556","ffaa_acc_puntero_ir","ffaa_optic_Elcan",["ffaa_30Rnd_556x45_hk416"],[],""]
]];
_sfLoadoutData set ["carbines", [
["ffaa_armas_hkg36k_tir","ffaa_snds_GT_556","ffaa_acc_puntero_ir","ffaa_optic_holografico",["ffaa_556x45_g36"],[],""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["ffaa_armas_hkag36e_tir","ffaa_snds_GT_556","ffaa_acc_puntero_ir","ffaa_optic_romeo4t_black",["ffaa_556x45_g36"],["1Rnd_HE_Grenade_shell"],""],
["ffaa_armas_hkag36e_tir","ffaa_snds_GT_556","ffaa_acc_puntero_ir","ffaa_optic_Elcan_ARD",["ffaa_556x45_g36"],["1Rnd_HE_Grenade_shell"],""]
]];
_sfLoadoutData set ["SMGs", [
["ffaa_armas_ump","muzzle_snds_L","acc_pointer_IR","optic_Holosight_blk_F",["ffaa_9x19_ump"],[],""],
["ffaa_armas_hkmp510a3","","acc_flashlight","ffaa_optic_holografico",["ffaa_9x19_mp5"],[],""]
]];
_sfLoadoutData set ["machineGuns", [
["ffaa_armas_mg4","muzzle_snds_B","ffaa_acc_puntero_ir","ffaa_optic_mg4_g36",["ffaa_556x45_mg4"],[],""],
["ffaa_armas_minimi","","ffaa_acc_puntero_ir","ffaa_optic_acog",["200Rnd_556x45_Box_F"],[],""]
]];
_sfLoadoutData set ["marksmanRifles", [
["ffaa_armas_hk417A2_long_blk","muzzle_snds_B","","ffaa_optic_Mk4_v2",["ffaa_20Rnd_762x51_hk417"],[],""]
]];
_sfLoadoutData set ["sniperRifles", [
["ffaa_armas_m95","","","ffaa_optic_3x12x50",["ffaa_127x99_ap"],[],""]
]];
_sfLoadoutData set ["sidearms", [
["ffaa_armas_usp","muzzle_snds_L","","",["ffaa_9x19_pistola"],[],""]
]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["ffaa_brilat_CombatUniform_item_b"]];
_militaryLoadoutData set ["vests", ["ffaa_brilat_chaleco_05_bs","ffaa_brilat_chaleco_07_bs","ffaa_brilat_chaleco_03_bs","ffaa_brilat_chaleco_02_bs","ffaa_brilat_chaleco_01_bs"]];
_militaryLoadoutData set ["backpacks", ["ffaa_brilat_mochila_boscoso","ffaa_brilat_mochila_asalto_boscoso","ffaa_brilat_mochila_bs_medica_2025","ffaa_brilat_mochila_ligera_boscoso","ffaa_brilat_mochila_viaje_boscoso"]];
_militaryLoadoutData set ["helmets", ["ffaa_brilat_casco_b","ffaa_casco_marte_04_mod_3_b","ffaa_casco_marte_04_mod_4_b","ffaa_casco_marte_04_mod_1_b","ffaa_casco_marte_04_mod_2_b"]];
_militaryLoadoutData set ["facewear", ["ffaa_Glasses","ffaa_brilat_item_nbq","ffaa_Balaclava_blk","ffaa_Balaclava_lowprofile_blk"]];
_militaryLoadoutData set ["slRifles", [
["ffaa_armas_hkg36e","","","",["ffaa_556x45_g36"],[],""],
["ffaa_armas_hkg36e","","ffaa_acc_puntero_ir","ffaa_optic_g36_holo",["ffaa_556x45_g36"],[],""],
["ffaa_armas_hkg36e","","","",["ffaa_556x45_g36"],[],""],
["ffaa_armas_hkag36e_tir","","","ffaa_optic_acog",["ffaa_556x45_g36"],["1Rnd_HE_Grenade_shell"],""]
]];
_militaryLoadoutData set ["rifles", [
["ffaa_armas_hkg36e_normal","","","",["ffaa_556x45_g36"],[],""],
["ffaa_armas_hkg36e","","","",["ffaa_556x45_g36"],[],""],
["ffaa_armas_hkg36k","","","",["ffaa_556x45_g36"],[],""]
]];
_militaryLoadoutData set ["carbines", [
["ffaa_armas_hkg36k_normal","","","",["ffaa_556x45_g36"],[],""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["ffaa_armas_hkag36e","","","",["ffaa_556x45_g36"],["1Rnd_HE_Grenade_shell"],""],
["ffaa_armas_hkag36e_tir","","","ffaa_optic_acog",["ffaa_556x45_g36"],["1Rnd_HE_Grenade_shell"],""]
]];
_militaryLoadoutData set ["SMGs", [
["ffaa_armas_ump","","ffaa_acc_puntero_ir","ffaa_optic_holografico",["ffaa_9x19_ump"],[],""]
]];
_militaryLoadoutData set ["machineGuns", [
["ffaa_armas_mg4","","ffaa_acc_puntero_ir","ffaa_optic_acog",["ffaa_556x45_mg4"],[],""],
["ffaa_armas_mg3","","","",["ffaa_762x51_mg3"],[],""],
["ffaa_armas_ameli","","","ffaa_optic_susat",["ffaa_556x45_ameli"],[],""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["ffaa_armas_hkg36e_tir","","","ffaa_optic_Mk4_v1",["ffaa_556x45_g36"],[],"ffaa_bipod_G36"]
]];
_militaryLoadoutData set ["sniperRifles", [
["ffaa_armas_aw","","","ffaa_optic_3x12x50",["ffaa_762x51_accuracy"],[],""]
]];
_militaryLoadoutData set ["sidearms", [
["ffaa_armas_p226","","","",["ffaa_9x19_pistola"],[],""]
]];


///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["ffaa_brilat_CombatUniform_item_bk"]];
_policeLoadoutData set ["vests", ["ffaa_brilat_chaleco_06_bk"]];
_policeLoadoutData set ["helmets", ["ffaa_famet_boina"]];
_policeLoadoutData set ["SMGs", [
["ffaa_armas_p90","","acc_flashlight","ffaa_optic_romeo4t_black",["ffaa_507x28_p90"],[],""],
["ffaa_armas_p90","","acc_flashlight","ffaa_optic_holografico",["ffaa_507x28_p90"],[],""],
["ffaa_armas_sdassc","","","ffaa_optic_holografico",["ffaa_8Rnd_12Gauge_Pellets"],[],""],
["ffaa_armas_sdass","","","ffaa_optic_holografico",["ffaa_8Rnd_12Gauge_Pellets"],[],""]
]];
_policeLoadoutData set ["sidearms", [
["ffaa_armas_usp","muzzle_snds_L","","",["ffaa_9x19_pistola"],[],""]
]];


////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["ffaa_CombatUniform_shortsleeve_item_2025_mc"]];
_militiaLoadoutData set ["vests", ["V_HarnessO_gry","V_Chestrig_blk","V_BandollierB_rgr"]];
_militiaLoadoutData set ["backpacks", ["ffaa_brilat_mochila_medica","ffaa_brilat_mochila_ligera_arida","ffaa_brilat_mochila_viaje_arida"]];
_militiaLoadoutData set ["helmets", ["ffaa_moe_casco_01_1_d","ffaa_moe_casco_01_2_d","ffaa_moe_casco_01_1_bk","ffaa_moe_casco_01_2_b"]];
_militiaLoadoutData set ["slRifles", [
["ffaa_armas_cetme_c","","","ffaa_optic_acog",["ffaa_762x51_cedmec"],[],""],
["ffaa_armas_cetme_e","","","",["ffaa_762x51_cedmec"],[],""],
["ffaa_armas_cetme_lc","","","ffaa_optic_enasa",["ffaa_556x45_cedmel"],[],""],
["ffaa_armas_cetme_lc","","","ffaa_optic_romeo4t_black",["ffaa_556x45_cedmel"],[],""]
]];
_militiaLoadoutData set ["rifles", [
["ffaa_armas_cetme_l","","","",["ffaa_556x45_cedmel"],[],""],
["ffaa_armas_cetme_lc","","","",["ffaa_556x45_cedmel"],[],""]
]];
_militiaLoadoutData set ["carbines", [
["ffaa_armas_cetme_lc","","","",["ffaa_556x45_cedmel"],[],""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["ffaa_armas_hkag36k","","","",["ffaa_556x45_g36"],["1Rnd_HE_Grenade_shell"],""]
]];
_militiaLoadoutData set ["SMGs", [
["ffaa_armas_p90","","","",["ffaa_507x28_p90"],[],""],
["ffaa_armas_ump","","","",["ffaa_9x19_ump"],[],""],
["ffaa_armas_hkmp5pdw","","","",["ffaa_9x19_mp5"],[],""],
["ffaa_armas_hkmp5a5","","","",["ffaa_9x19_mp5"],[],""]
]];
_militiaLoadoutData set ["machineGuns", [
["ffaa_armas_mg3","","","",["ffaa_762x51_mg3"],[],""],
["ffaa_armas_ameli","","","",["ffaa_556x45_ameli"],[],""],
["ffaa_armas_minimi","","","",["200Rnd_556x45_Box_F"],[],""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["ffaa_armas_cetme_c","","","ffaa_optic_Mk4_v2",["ffaa_762x51_cedmec"],[],""]
]];
_militiaLoadoutData set ["sniperRifles", [
["ffaa_armas_aw","","","ffaa_optic_3x12x50",["ffaa_762x51_accuracy"],[],""]
]];
_militiaLoadoutData set ["sidearms", [
["ffaa_armas_p226","","","",["ffaa_9x19_pistola"],[],""]
]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["ffaa_CombatUniform_shortsleeve_item_b"]];
_crewLoadoutData set ["vests", ["ffaa_brilat_chaleco_02_bs"]];
_crewLoadoutData set ["helmets", ["ffaa_brilat_casco_tripulacion"]];
_crewLoadoutData set ["carbines", [
["ffaa_armas_hkg36k","","","",["ffaa_556x45_g36"],[],""]
]];
_crewLoadoutData set ["SMGs", [
["ffaa_armas_hkg36k","","","",["ffaa_556x45_g36"],[],""]
]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["ffaa_pilot_harri_uniforme_item"]];
_pilotLoadoutData set ["vests", []];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetFighter_B","ffaa_casco_hercules_piloto"]];
_pilotLoadoutData set ["carbines", [
["ffaa_armas_hkg36k_tir","","","ffaa_optic_holografico",["ffaa_556x45_g36"],[],""]
]];
_pilotLoadoutData set ["SMGs", [
["ffaa_armas_ump","","","",["ffaa_9x19_ump"],[],""]
]];


private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["uniforms", ["ffaa_CombatUniform_shortsleeve_item_2025_bs"]];
_officerLoadoutData set ["vests", ["FFAA_V_Safety_BRILOG"]];
_officerLoadoutData set ["helmets", ["ffaa_brilat_boina"]];
_officerLoadoutData set ["SMGs", [
["ffaa_armas_p90","","","",["ffaa_507x28_p90"],[],""]
]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
  [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
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
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

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
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

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
    ["backpacks"] call _fnc_setBackpack;

    ["SMGs"] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    ["SquadLeader", _squadLeaderTemplate],
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
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _policeTemplate]], _officerLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
