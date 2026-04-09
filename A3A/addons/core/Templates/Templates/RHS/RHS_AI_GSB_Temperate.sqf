//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Green Sea Battalion"] call _fnc_saveToTemplate;
["spawnMarkerName", "GSB"] call _fnc_saveToTemplate;

["flag", "gsb_rhs_22_flag_var"] call _fnc_saveToTemplate;
["flagTexture", "\rhsgref\addons\rhsgref_main\data\Flags\flag_cdf_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_cdf"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["GSB_Aligator_PVS","gsb_mrap_03","gsb_offroad","gsb_rhs_22_BRDM2UM","gsb_rhs_22_m1151_olive","gsb_rhs_22_m1152_TCV_olive","gsb_rhs_tigr"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["GSB_Aligator_DPP","gsb_mrap_03_gmg","gsb_mrap_03_hmg","gsb_offroad_armed","gsb_rhs_22_BRDM2_HQ","gsb_rhs_22_m1151_m2_v1_olive","gsb_rhs_22_m1151_mk19_v1_olive","gsb_rhs_22_m1151_olive_pkm","gsb_rhs_22_ural_Zu23","gsb_rhs_tigr_sts","RHS_Ural_Zu23_gsb"]] call _fnc_saveToTemplate;             // Should be armed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesTrucks", ["gsb_rhs_22_ural","gsb_rhs_22_ural_open","gsb_rhsusf_M1232","GSB_rhsusf_M1232_MC_M2","GSB_rhsusf_M1232_MC_MK19","gsb_Truck_02_covered_F","gsb_Truck_02_transport_F","RHS_Ural_gsb"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["gsb_rhs_22_m1152_olive"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["gsb_rhs_22_m1152_rsv_olive"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["gsb_rhs_22_ural_repair","gsb_Truck_02_box_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["gsb_rhs_22_ural_fuel","gsb_Truck_02_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["gsb_Truck_02_medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["gsb_rhs_22_BRDM2","gsb_rhs_btr80","gsb_rhs_btr80a","KAP_gsb_22_btr80"]] call _fnc_saveToTemplate;             // armed, lightly armoured, with 6-8 passengers 
["vehiclesAPCs", ["APC_Tracked_02_gsb","APC_Wheeled_01_gsb","apc_wheeled_03_gsb","gsb_rhs_22_bmp2","gsb_rhs_22_bmp2d","gsb_rhs_bmp2","gsb_rhs_bmp3m","gsb_rhs_btr80a","KAP_gsb_22_APC_Wheeled_01","KAP_gsb_22_M2A3"]] call _fnc_saveToTemplate;                  // armed with enclosed turret, armoured, with 6-8 passengers
["vehiclesIFVs", ["APC_Tracked_02_gsb_slat","apc_wheeled_03_gsb_slat","KAP_gsb_22_M2A3_BUSKI","KAP_gsb_22_M2A3_BUSKIII"]] call _fnc_saveToTemplate;                  // capable of surviving multiple rockets, cannon armed, with 6-8 passengers
["vehiclesLightTanks", ["gsb_rooikat","gsb_rooikat_up"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["B_MBT_01_cannon_F_GSB","B_MBT_01_TUSK_F_GSB","B_MBT_04_cannon_F_gsb","gsb_rhs_22_m1a1fep_od","gsb_rhs_22_t72ba_tv","gsb_rhs_22_t72bb_tv","gsb_rhs_t80ue1","KAP_gsb_22_t80ue1","rhs_t72bd_gsb","rhs_t72be_gsb"]] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", []] call _fnc_saveToTemplate;
["vehiclesAA", ["APC_Tracked_02_AA_gsb","gsb_rhs_22_zsu234"]] call _fnc_saveToTemplate;                    // ideally heavily armed with anti-ground capability and enclosed turret. Passengers will be ignored


["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["rhsusf_mkvsoc"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["gsb_rhs_22_BRDM2","gsb_rhs_btr80","gsb_rhs_btr80a","KAP_gsb_22_btr80"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["GSB_L_159","KAP_GSB_22_Plane_Fighter_04","RHS_Su25_GSB"]] call _fnc_saveToTemplate;             // Will be used with CAS script, must be defined in setPlaneLoadout. Needs fixed gun and either rockets or missiles
["vehiclesPlanesAA", ["GSB_L_159","KAP_GSB_22_Plane_Fighter_04"]] call _fnc_saveToTemplate;              //
["vehiclesAirPatrol", ["KAP_GSB_22_UH1Y_UNARMED","KAP_GSB_22_UH60M2_d"]] call _fnc_saveToTemplate; 
["vehiclesPlanesTransport", ["RHS_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["GSB_Mi8mt_Cargo","KAP_GSB_22_UH1Y_UNARMED"]] call _fnc_saveToTemplate;            // ideally fragile & unarmed helis seating 4+
["vehiclesHelisTransport", ["gsb_ch47f","GSB_Mi8AMT","GSB_Mi8mt","KAP_GSB_22_UH60M","KAP_GSB_22_UH60M2_d"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["GSB_Mi24P_CAS","KAP_GSB_22_UH1Y","KAP_GSB_22_UH1Y_FFAR"]] call _fnc_saveToTemplate;      // Utility helis with fixed or door guns + rocket pods
["vehiclesHelisAttack", ["GSB_Mi24V_CAS","gsb_rhs_22_mi24g_CAS"]] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesArtillery", ["gsb_rhs_22_BM21","RHS_BM21_gsb"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["gsb_rhs_22_BM21", ["rhs_mag_m21of_1"]],
["RHS_BM21_gsb", ["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["gsb_offroad_armed","gsb_rhs_22_m1151_olive_pkm"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["RHS_Ural_gsb"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["gsb_offroad","gsb_rhs_22_m1152_TCV_olive"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["GSB_Aligator_VPC"]] call _fnc_saveToTemplate;

["staticMGs", ["rhsgref_cdf_b_DSHKM"]] call _fnc_saveToTemplate;
["staticAT", ["rhsgref_cdf_b_AGS30_TriPod","rhsgref_cdf_b_SPG9","rhsgref_cdf_b_SPG9M"]] call _fnc_saveToTemplate;
["staticAA", ["rhsgref_cdf_b_Igla_AA_pod"]] call _fnc_saveToTemplate;
["staticMortars", ["rhsgref_cdf_b_reg_M252"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "rhs_1Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["rhssaf_mine_tma4"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_a200_dz35"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["faces", ["LivonianHead_6","Mason_v2","Oakes_v2","RHS_GreekHead_A3_01","RHS_GreekHead_A3_08","RHS_GreekHead_A3_09","RHS_LivonianHead_1","RHS_LivonianHead_10","RHS_LivonianHead_2","RHS_LivonianHead_3","RHS_LivonianHead_4","RHS_LivonianHead_5","RHS_LivonianHead_6","RHS_LivonianHead_7","RHS_RussianHead_1","RHS_WhiteHead_01","RHS_WhiteHead_04","RHS_WhiteHead_05","RHS_WhiteHead_06","RHS_WhiteHead_07","RHS_WhiteHead_08","RHS_WhiteHead_09","RHS_WhiteHead_10","RHS_WhiteHead_11","RHS_WhiteHead_14","RHS_WhiteHead_15","RHS_WhiteHead_16","RHS_WhiteHead_25","RHS_WhiteHead_27","RHS_WhiteHead_28","RHS_WhiteHead_32","RussianHead_1","RussianHead_2","RussianHead_3","RussianHead_4","RussianHead_5","Smith_v2","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;
"RussianMen" call _fnc_saveNames;

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
["rhs_weap_m72a7","","","",["rhs_m72a7_mag"],[],""],
["rhs_weap_rpg26","","","",["rhs_rpg26_mag"],[],""],
["rhs_weap_rpg18","","","",["rhs_rpg18_mag"],[],""]
]];
_loadoutData set ["ATLaunchers", [
["rhs_weap_rpg7","","","rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag"],[],""],
["GSB_launch_MPRL90","","","",["MPRL90_HEAT"],[],""],
["rhs_weap_rpg7","","","rhs_acc_1pn93_2",["rhs_rpg7_PG7VL_mag"],[],""]
]];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", [
["rhs_weap_igla","","","",["rhs_mag_9k38_rocket"],[],""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["rhssaf_mine_tma4_mag"]];
_loadoutData set ["APMines", ["rhs_mag_mine_pfm1","rhssaf_mine_mrud_a_mag"]];
_loadoutData set ["lightExplosives", ["rhssaf_tm100_mag","rhssaf_tm200_mag"]];
_loadoutData set ["heavyExplosives", ["rhssaf_tm500_mag"]];

_loadoutData set ["antiTankGrenades", ["rhs_charge_tnt_x2_mag","rhssaf_mag_brk_m79"]];
_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5","rhs_mag_f1"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_nspd"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_nspn_yellow","rhs_mag_nspn_green","rhs_mag_nspn_red"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhs_pdu4"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["gsb_fieldpack_radio","gsb_fieldpack_radio_roll","gsb_rhs_22_bp_RadioBag_01"]];
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
_sfLoadoutData set ["uniforms", ["U_gsb_rhs_22_6sh122_gloves"]];
_sfLoadoutData set ["vests", ["gsb_vest_6b43","gsb_vest_6b43_L","gsb_vest_6b43_M","gsb_vest_6b43_M_pistol","gsb_spec_vest","gsb_spec_vest_h"]];
_sfLoadoutData set ["backpacks", ["gsb_rhs_22_bp_kitbag","gsb_rhs_22_bp_compact","GSB_BERGEN_BAG"]];
_sfLoadoutData set ["helmets", ["gsb_rhs_22_opscore_cover_pelt"]];
_sfLoadoutData set ["slRifles", [
["rhs_weap_ak74mr","rhs_acc_tgpa","","rhsusf_acc_ACOG_RMR",["rhs_30Rnd_545x39_7N10_AK"],[],""],
["rhs_weap_ak74mr_gp25","rhs_acc_tgpa","","rhs_acc_1p87",["rhs_30Rnd_545x39_7N10_AK"],["rhs_VOG25"],""],
["rhs_weap_ak74m_zenitco01_b33","rhs_acc_tgpa","","rhs_acc_okp7_picatinny",["rhs_30Rnd_545x39_7N22_AK"],[],"rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["rifles", [
["rhs_weap_ak74mr","rhs_acc_tgpa","","rhs_acc_rakursPM",["rhs_30Rnd_545x39_7N10_AK"],[],"rhs_acc_grip_rk6"],
["rhs_weap_ak74mr","rhs_acc_tgpa","","rhsusf_acc_g33_T1",["rhs_30Rnd_545x39_7N10_AK"],[],"rhsusf_acc_tacsac_blk"],
["rhs_weap_ak74mr","rhs_acc_tgpa","","rhsusf_acc_ACOG3",["rhs_30Rnd_545x39_7N10_AK"],[],"rhs_acc_grip_rk6"]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_asval_grip_npz","","","rhs_acc_rakursPM",["rhs_20rnd_9x39mm_SP5"],[],""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74mr_gp25","rhs_acc_tgpa","","rhsusf_acc_ACOG3_USMC",["rhs_30Rnd_545x39_7N10_AK"],["rhs_VOG25"],""],
["rhs_weap_ak74mr_gp25","rhs_acc_tgpa","","rhsusf_acc_g33_xps3",["rhs_30Rnd_545x39_7N10_AK"],["rhs_VOG25"],""]
]];
_sfLoadoutData set ["SMGs", [
["GSB_NMG_weapons_vpo","","","rhsusf_acc_T1_high",["GSB_71rnd_762mm_psh_nmg"],[],""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_gsb_weap_cpkp","","","rhs_acc_1pn34",["gsb_cpkp_150Rnd_65x68"],[],""],
["rhs_gsb_weap_cpkp","","","rhs_acc_1p63",["gsb_cpkp_150Rnd_65x68"],[],""]
]];
_sfLoadoutData set ["marksmanRifles", [
["GSB_NMG_weapon_svc338","","","rhs_acc_dh520x56",["10Rnd_338_Mag"],[],""]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_t5000","","","rhs_acc_dh520x56",["rhs_5Rnd_338lapua_t5000"],[],""]
]];
_sfLoadoutData set ["sidearms", [
["GSB_ChAP40","gsb_chap40_silencer","","",["gsb_15Rnd_40sw_Mag"],[],""]
]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_gsb_rhs_22_afg"]];
_militaryLoadoutData set ["vests", ["gsb_rhs_6b45","gsb_rhs_6b45_grn","gsb_rhs_6b45_holster","gsb_rhs_6b45_light","gsb_rhs_6b45_mg","gsb_rhs_6b45_off","gsb_rhs_6b45_rifleman","gsb_rhs_6b45_rifleman_2","gsb_spcs_saw","gsb_spcs_mg","gsb_spcs_rifle","gsb_spcs_TL","gsb_spcs_SL","gsb_spcs_sniper"]];
_militaryLoadoutData set ["backpacks", ["gsb_rhs_22_bp_carryall","gsb_rhs_22_bp_compact","gsb_fieldpack"]];
_militaryLoadoutData set ["helmets", ["gsb_rhs_22_kaska_k93M","gsb_rhs_22_kaska_k93_medic","gsb_rhs_22_kaska_k93","gsb_rhs_22_6b47_hsm","gsb_rhs_22_6b47_ess","gsb_rhs_22_6b7_1m_cov_ess_bala"]];
_militaryLoadoutData set ["slRifles", [
["rhs_weap_ak74mr","rhs_acc_uuk","","rhsusf_acc_ACOG_MDO",["rhs_30Rnd_545x39_7N10_AK"],[],""],
["rhs_weap_ak74mr","rhs_acc_uuk","","rhsusf_acc_ELCAN_ard",["rhs_30Rnd_545x39_7N10_AK"],[],"rhs_acc_grip_rk6"],
["rhs_weap_ak74mr_gp25","rhs_acc_uuk","","rhsusf_acc_compm4",["rhs_30Rnd_545x39_7N10_AK"],["rhs_VOG25"],""]
]];
_militaryLoadoutData set ["rifles", [
["rhs_weap_aks74n_2","rhs_acc_dtk1983","","",["rhs_30Rnd_545x39_7N10_AK"],[],""],
["rhs_weap_ak74mr","rhs_acc_uuk","","rhsusf_acc_eotech_xps3",["rhs_30Rnd_545x39_7N10_AK"],[],""],
["rhs_weap_ak74mr","rhs_acc_uuk","","rhs_acc_1p87",["rhs_30Rnd_545x39_7N10_AK"],[],""],
["rhs_weap_ak104_zenitco01_b33","rhs_acc_pgs64","rhs_acc_2dpZenit_ris","rhs_acc_rakursPM",["rhs_30Rnd_762x39mm_polymer"],[],"rhsusf_acc_rvg_blk"],
["GSB_char98","","","",["30Rnd_580x42_Mag_AK"],[],""],
["GSB_char98_Rail","","","rhsusf_acc_eotech_xps3",["30Rnd_580x42_Mag_AK"],[],""],
["GSB_char98_RMP","","rhsusf_acc_anpeq15side_bk","rhsusf_acc_ACOG2",["30Rnd_580x42_Mag_AK"],[],"rhsusf_acc_grip3"],
["GSB_char98_Rail_short","","","rhsusf_acc_RM05",["30Rnd_580x42_Mag_AK"],[],""],
["GSB_charm_545","","rhsusf_acc_anpeq15A","rhsusf_acc_RX01_NoFilter",["rhs_30Rnd_545x39_7N6M_AK"],[],"rhsusf_acc_tdstubby_blk"],
["GSB_charm_556","","rhsusf_acc_M952V","rhsusf_acc_mrds",["rhs_mag_30Rnd_556x45_M855A1_Stanag"],[],"rhsusf_acc_grip3"],
["GSB_charm_762","","rhs_acc_2dpZenit_ris","rhs_acc_ekp8_18",["rhs_30Rnd_762x39mm_bakelite"],[],"rhs_acc_grip_rk2"]
]];
_militaryLoadoutData set ["carbines", [
["GSB_char98","","","",["30Rnd_580x42_Mag_AK"],[],""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74mr_gp25","rhs_acc_uuk","","rhs_acc_rakursPM",["rhs_30Rnd_545x39_7N10_AK"],["rhs_gsb_BFO13","rhs_gsb_KVG10"],""],
["rhs_weap_ak74n_gp25","rhs_acc_dtk1983","","",["rhs_30Rnd_545x39_7N10_AK"],["rhs_gsb_BFO13","rhs_gsb_KVG10"],""],
["GSB_char98_Rail_GL","","","",["30Rnd_580x42_Mag_AK"],["rhs_gsb_BFO13","rhs_gsb_KVG10"],""]
]];
_militaryLoadoutData set ["SMGs", [
["GSB_NMG_weapons_vpo","","","",["GSB_71rnd_762mm_psh_nmg"],[],""],
["rhs_weap_aks74u","rhs_acc_pgs64_74u","","",["rhs_30Rnd_545x39_7N6M_AK"],[],""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip_L","","","rhsusf_acc_ACOG2_USMC",["rhsusf_200rnd_556x45_mixed_box"],[],"rhsusf_acc_kac_grip_saw_bipod"],
["rhs_gsb_weap_cpkp","","","",["gsb_cpkp_150Rnd_65x68"],[],""],
["rhs_weap_m240B","","","rhsusf_acc_ACOG_MDO",["rhsusf_100Rnd_762x51_m62_tracer"],[],""],
["GSB_chssw98","","","",["150Rnd_580x42_Mag_Tracer_SAW"],[],""],
["GSB_hlc_lmg_MG3_optic","","","",["gsb_cpkp_150Rnd_65x68"],[],""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["TRU_weap_TB68M_PICA","","","rhs_acc_dh520x56",["TRU_mag_TB68M_25rnd_65x68B"],["TRU_mag_TB50RG_HE"],""],
["TRU_weap_TB68M_THSR","","","rhsusf_acc_nxs_3515x50_md",["TRU_mag_TB68M_25rnd_65x68B"],["TRU_mag_TB50RG_HE"],""]
]];
_militaryLoadoutData set ["sniperRifles", [
["GSB_NMG_weapon_svc338","","","rhs_acc_dh520x56",["10Rnd_338_Mag"],[],""]
]];
_militaryLoadoutData set ["sidearms", [
["GSB_ChAP40","","","",["gsb_15Rnd_40sw_Mag"],[],""]
]];


///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["gsb_nbc_suit_uniform"]];
_policeLoadoutData set ["vests", ["rhs_6b2"]];
_policeLoadoutData set ["helmets", ["GSB_ushanka","GSB_ushanka_open"]];
_policeLoadoutData set ["SMGs", [
["GSB_ch_oryx","","","",["15Rnd_12ga_Mag_Oryx"],[],""],
["GSB_NMG_weapons_vpo","","","",["GSB_71rnd_762mm_psh_nmg"],[],""]
]];
_policeLoadoutData set ["sidearms", [
["rhs_weap_makarov_pm","","","",["rhs_mag_9x18_8_57N181S"],[],""]
]];


////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["gsb_aaf_uni_sh2","gsb_aaf_uni_sh1"]];
_militiaLoadoutData set ["vests", ["gsb_vest_md12","gsb_vest_md12_ak","gsb_vest_md12_green","gsb_vest_md12_ak_green","rhs_chicom","rhs_chicom_khk"]];
_militiaLoadoutData set ["backpacks", ["gsb_rhs_22_bp_compact","rhs_rd54"]];
_militiaLoadoutData set ["helmets", ["gsb_rhs_22_6b7_1m","gsb_rhs_22_6b7_1m_bala2","gsb_rhs_22_6b7_1m_ess","gsb_rhs_22_6b7_1m_flag","gsb_rhs_22_6b7_1m_medic","gsb_rhs_22_m22_fieldcap","gsb_rhs_22_m22_fieldcap_tilted","gsb_6B27M_nocov_painted","gsb_6B27M_nocov_medic","Cossack"]];
_militiaLoadoutData set ["slRifles", [
["GSB_char98","","","",["30Rnd_580x42_Mag_AK"],[],""],
["GSB_charm_545","","","",["rhs_30Rnd_545x39_7N6M_AK"],[],""]
]];
_militiaLoadoutData set ["rifles", [
["GSB_char98","","","",["30Rnd_580x42_Mag_AK"],[],""],
["GSB_char98_Rail_short","","","",["30Rnd_580x42_Mag_AK"],[],""],
["GSB_charm_762","","","",["rhs_30Rnd_762x39mm_bakelite"],[],""]
]];
_militiaLoadoutData set ["carbines", [
["GSB_char98_Rail_short","","","",["30Rnd_580x42_Mag_AK"],[],""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["GSB_char98_Rail_GL","","","",["30Rnd_580x42_Mag_AK"],["rhs_VOG25"],""],
["GSB_charm_545_GL","","","",["rhs_30Rnd_545x39_7N6M_AK"],["rhs_VOG25"],""],
["GSB_charm_556_GL","","","",["rhs_mag_30Rnd_556x45_M855A1_Stanag"],["rhs_VOG25"],""]
]];
_militiaLoadoutData set ["SMGs", [
["GSB_NMG_weapons_vpo","","","",["GSB_71rnd_762mm_psh_nmg"],[],""]
]];
_militiaLoadoutData set ["machineGuns", [
["GSB_chssw98","","","",["150Rnd_580x42_Mag_Tracer_SAW"],[],""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["TRU_weap_TB68M_PICA","","","rhsusf_acc_M8541",["TRU_mag_TB68M_25rnd_65x68B"],[],""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_svds","","","rhs_acc_pso1m21",["rhs_10Rnd_762x54mmR_7N1"],[],""]
]];
_militiaLoadoutData set ["sidearms", [
["rhs_weap_makarov_pm","","","",["rhs_mag_9x18_8_57N181S"],[],""]
]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["gsb_overall_uniform"]];
_crewLoadoutData set ["vests", ["gsb_rhs_22_6b45"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4"]];
_crewLoadoutData set ["carbines", [
["GSB_char98_Rail_short","","","",["30Rnd_580x42_Mag_AK"],[],""]
]];
_crewLoadoutData set ["SMGs", [
["GSB_NMG_weapons_vpo","","","",["GSB_71rnd_762mm_psh_nmg"],[],""]
]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["gsb_rhs_22_aaf_uni_ju"]];
_pilotLoadoutData set ["vests", ["gsb_rhs_22_6b45_holster"]];
_pilotLoadoutData set ["helmets", ["rhsusf_hgu56p","rhsusf_hgu56p_visor","rhs_zsh7a_mike_green_alt"]];
_pilotLoadoutData set ["carbines", [
["GSB_char98_Rail_short","","","",["30Rnd_580x42_Mag_AK"],[],""]
]];
_pilotLoadoutData set ["SMGs", [
["rhs_weap_savz61","","","",["rhsgref_20rnd_765x17_vz61"],[],""]
]];


private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["uniforms", ["gsb_officer_aaf_uniform"]];
_officerLoadoutData set ["vests", ["rhs_belt_sks"]];
_officerLoadoutData set ["helmets", ["GSB_beret_red"]];
_officerLoadoutData set ["SMGs", [
["GSB_ch_oryx","","","",["15Rnd_12ga_Mag_Oryx"],[],""]
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
