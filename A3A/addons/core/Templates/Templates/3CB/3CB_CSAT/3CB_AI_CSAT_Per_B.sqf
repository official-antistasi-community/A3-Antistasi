//Arid


//////////////////////////
//       Vehicles       //
//////////////////////////
["vehiclesBasic", ["UK3CB_CSAT_B_O_M1030"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_CSAT_B_O_Tigr_FFV"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_CSAT_B_O_Tigr_STS","UK3CB_CSAT_B_O_GAZ_Vodnik_Cannon"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_CSAT_B_O_Marid_Unarmed_Cage","UK3CB_CSAT_B_O_GAZ_Vodnik","UK3CB_CSAT_B_O_MAZ_Transport_Open","UK3CB_CSAT_B_O_MAZ_Transport_Closed","UK3CB_CSAT_B_O_Kamaz_Open","UK3CB_CSAT_B_O_Kamaz_Covered","UK3CB_CSAT_B_O_Ural_Open","UK3CB_CSAT_B_O_Ural","UK3CB_CSAT_B_O_Marid_Unarmed_Cage","UK3CB_CSAT_B_O_GAZ_Vodnik"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_CSAT_B_O_MAZ_543_Recovery","UK3CB_CSAT_B_O_Ural_Recovery"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_CSAT_B_O_MAZ_543_Reammo","UK3CB_CSAT_B_O_Ural_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_CSAT_B_O_MAZ_543_Repair","UK3CB_CSAT_B_O_Ural_Repair","UK3CB_CSAT_B_O_Kamaz_Repair","UK3CB_CSAT_B_O_Kamaz_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_CSAT_B_O_MAZ_543_Refuel","UK3CB_CSAT_B_O_Ural_Fuel","UK3CB_CSAT_B_O_Kamaz_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_CSAT_B_O_Gaz66_Med","UK3CB_CSAT_B_O_GAZ_Vodnik_MedEvac","UK3CB_CSAT_B_O_Marid_Amb"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_CSAT_B_O_Marid","UK3CB_CSAT_B_O_BTR80a","UK3CB_CSAT_B_O_BTR80a","UK3CB_CSAT_B_O_BMD2"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["UK3CB_CSAT_B_O_BMP3MERA","UK3CB_CSAT_B_O_BMP3M","UK3CB_CSAT_B_O_BMP3LATE"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_CSAT_B_O_T80A","UK3CB_CSAT_B_O_T80BV","UK3CB_CSAT_B_O_T80BVK","UK3CB_CSAT_B_O_T80U","UK3CB_CSAT_B_O_T80UK"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_CSAT_B_O_ZsuTank","UK3CB_CSAT_B_O_ZSU39"]] call _fnc_saveToTemplate;


["vehiclesAmphibious", ["UK3CB_CSAT_B_O_Marid","UK3CB_CSAT_B_O_BTR80a","UK3CB_CSAT_B_O_BTR80a","UK3CB_CSAT_B_O_BMD2","UK3CB_CSAT_B_O_BMP3MERA","UK3CB_CSAT_B_O_BMP3M","UK3CB_CSAT_B_O_BMP3LATE"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_CSAT_B_O_Su25SM"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_CSAT_B_O_MIG29SM"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["UK3CB_CSAT_B_O_Orca","UK3CB_CSAT_B_O_Bell412_Utility"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["UK3CB_CSAT_B_O_Taru_covered","UK3CB_CSAT_B_O_Mi8"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["UK3CB_CSAT_B_O_Orca_Armed_MULTI","UK3CB_CSAT_B_O_Bell412_Armed","UK3CB_CSAT_B_O_Bell412_Armed_AT"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_CSAT_B_O_Kajman","UK3CB_CSAT_B_O_Mi_24G"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_CSAT_B_O_BM21","UK3CB_CSAT_B_O_2S3","UK3CB_CSAT_B_O_2S1","UK3CB_CSAT_B_O_D30"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_CSAT_B_O_2S1", ["rhs_mag_3of56_35","rhs_mag_bk13_5"]],
["UK3CB_CSAT_B_O_2S3",["rhs_mag_HE_2a33", "rhs_mag_WP_2a33"]],
["UK3CB_CSAT_B_O_BM21", ["rhs_mag_m21of_1"]],
["UK3CB_CSAT_B_O_D30", ["rhs_mag_3of56_10","rhs_mag_d462_2","rhs_mag_s463_2","rhs_mag_3of69m_2"]]
]] call _fnc_saveToTemplate;


["uavsAttack", ["UK3CB_CSAT_B_O_Ababil_AT","UK3CB_CSAT_B_O_Fenghuang"]] call _fnc_saveToTemplate;
["uavsPortable", ["UK3CB_CSAT_B_O_Darter"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["UK3CB_CSAT_B_O_Offroad_HMG"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_CSAT_B_O_Gaz66_Open","UK3CB_CSAT_F_O_Gaz66_Covered"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_CSAT_B_O_Offroad_Unarmed"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_TKP_O_LandRover_Closed","UK3CB_TKP_O_LandRover_Open"]] call _fnc_saveToTemplate;

["staticAA", ["UK3CB_CSAT_B_O_Igla_AA_pod","UK3CB_CSAT_B_O_RBS70"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

_uniforms = ["UK3CB_CSAT_B_O_U_CombatUniform_Shortsleeve", "UK3CB_CSAT_B_O_U_CombatUniform", "UK3CB_CSAT_B_O_U_Tanktop"];
_slUniforms = ["UK3CB_CSAT_B_O_U_JumperUniform"];
_sfUniforms = ["UK3CB_CSAT_B_O_U_SF_CombatUniform", "UK3CB_CSAT_B_O_U_SF_CombatUniform_Shortsleeve"];

_tankUniforms = ["UK3CB_CSAT_B_O_U_Tank_Uniform"];
_pilotUniforms = ["UK3CB_CSAT_B_O_U_H_Pilot"];
_officerUniforms = ["UK3CB_CSAT_B_O_U_Officer"];

_vests = ["UK3CB_CSAT_B_O_V_TacVest", "UK3CB_CSAT_B_O_V_Carrier_Rig_Light","UK3CB_CSAT_B_O_V_Carrier_Rig_Compact"];
_glVests = ["UK3CB_CSAT_B_O_V_Carrier_Rig_Heavy"];
_Hvests = ["UK3CB_CSAT_B_O_V_Carrier_Rig_CQB","UK3CB_CSAT_B_O_V_Carrier_Rig", "UK3CB_CSAT_B_O_V_Carrier_Rig_Tactical"];

_milVests = ["UK3CB_CSAT_B_O_V_TacVest", "UK3CB_TKA_I_V_6Sh92_Oli","UK3CB_TKA_I_V_6Sh92_Radio_Oli","UK3CB_TKA_I_V_6Sh92_vog_Oli"];

_medicVests = ["UK3CB_CSAT_B_O_V_Carrier_Rig_Heavy_Med","UK3CB_CSAT_B_O_V_Carrier_Rig_Light_Med"];
_crewVests = ["UK3CB_CSAT_B_O_V_Carrier_Rig_Crew"];
_sfVests = ["UK3CB_CSAT_B_O_V_Carrier_Rig_Tactical_TAN","UK3CB_CSAT_B_O_V_Carrier_Rig_Recon_TAN","UK3CB_CSAT_B_O_V_Carrier_Rig_CQB_TAN","UK3CB_CSAT_B_O_V_Carrier_Rig_Light_Tan","UK3CB_CSAT_B_O_V_Carrier_Rig_Heavy_Tan"];

_backpacks = ["UK3CB_CSAT_B_O_B_FIELDPACK","UK3CB_CSAT_B_O_B_RIF"];

_helmets = ["UK3CB_CSAT_B_O_H_6b27m", "UK3CB_CSAT_B_O_H_6b27m_ESS"];
_sfHelmets = ["UK3CB_CSAT_B_O_H_6b27m_Alt", "UK3CB_CSAT_B_O_H_6b27m_ESS_Alt"];
_slHat = ["UK3CB_CSAT_B_O_H_Patrolcap_Mic"];
_sniHats = ["UK3CB_CSAT_B_O_H_BoonieHat"];

_milHelmets = ["UK3CB_CSAT_B_O_H_Patrolcap", "UK3CB_CSAT_B_O_H_SSh68_Covered"];
_milMedicHelmets = ["UK3CB_CSAT_B_O_H_SSh68_Covered_Medic"];