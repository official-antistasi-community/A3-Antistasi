////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameOccupants = "USAF";

//Police Faction
factionGEN = "BLU_GEN_F";
//SF Faction
factionMaleOccupants = "rhs_faction_socom";
//Miltia Faction
if (gameMode != 4) then {factionFIA = "rhsgref_faction_hidf"};

//Flag Images
NATOFlag = "Flag_US_F";
NATOFlagTexture = "a3\data_f\flags\flag_us_co.paa";
flagNATOmrk = "flag_USA";
if (isServer) then {"NATO_carrier" setMarkerText "USMC Carrier"};

//Loot Crate
NATOAmmobox = "B_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
NATOPlayerLoadouts = [
	//Team Leader
	["Templates\RHS\Loadouts\rhs_usaf_teamLeader"] call A3A_fnc_getLoadout,
	//Medic
	["Templates\RHS\Loadouts\rhs_usaf_medic"] call A3A_fnc_getLoadout,
	//Autorifleman
	["Templates\RHS\Loadouts\rhs_usaf_machineGunner"] call A3A_fnc_getLoadout,
	//Marksman
	["Templates\RHS\Loadouts\rhs_usaf_marksman"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["Templates\RHS\Loadouts\rhs_usaf_AT"] call A3A_fnc_getLoadout,
	//AT2
	["Templates\RHS\Loadouts\rhs_usaf_rifleman"] call A3A_fnc_getLoadout
];

//PVP Player Vehicles
vehNATOPVP = ["rhsusf_m1025_d_s","rhsusf_m998_d_s_2dr","rhsusf_m998_d_s_2dr_fulltop","rhsusf_m998_d_s_4dr","rhsusf_m1025_d_s_m2","rhsusf_mrzr4_d_mud","rhsusf_m1240a1_m240_usmc_d"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
NATOGrunt = "rhsusf_usmc_marpat_d_rifleman_light";
NATOOfficer = "rhsusf_usmc_marpat_d_officer";
NATOOfficer2 = "rhsusf_army_ucp_rifleman_101st";
NATOBodyG = "rhsusf_army_ucp_rifleman_1stcav";
NATOCrew = "rhsusf_usmc_marpat_d_crewman";
NATOUnarmed = "B_G_Survivor_F";
NATOMarksman = "rhsusf_usmc_marpat_d_marksman";
staticCrewOccupants = "rhsusf_usmc_marpat_d_rifleman";
NATOPilot = "rhsusf_airforce_jetpilot";

//Militia Units
if (gameMode != 4) then
	{
	FIARifleman = "rhsgref_hidf_rifleman";
	FIAMarksman = "rhsgref_hidf_marksman";
	};

//Police Units
policeOfficer = "rhsusf_army_ocp_rifleman_m590";
policeGrunt = "rhsusf_army_ocp_rifleman_82nd";

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsNATOSentry = ["rhsusf_usmc_marpat_d_grenadier",NATOGrunt];
groupsNATOSniper = ["rhsusf_socom_marsoc_sniper","rhsusf_socom_marsoc_spotter"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper];
//Fireteams
groupsNATOAA = ["rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_autorifleman","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_stinger"];
groupsNATOAT = ["rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_autorifleman","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_javelin"];
groupsNATOmid = [["rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_autorifleman_m249","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_riflemanat"],groupsNATOAA,groupsNATOAT];
//Squads
NATOSquad = ["rhsusf_usmc_marpat_d_squadleader","rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_autorifleman_m249","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_autorifleman_m249","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_marksman","rhsusf_navy_marpat_d_medic"];
NATOSpecOp = ["rhsusf_socom_marsoc_teamleader","rhsusf_socom_marsoc_teamchief","rhsusf_socom_marsoc_cso_mk17","rhsusf_socom_marsoc_marksman","rhsusf_socom_marsoc_cso_breacher","rhsusf_socom_marsoc_cso_eod","rhsusf_socom_marsoc_cso_grenadier","rhsusf_socom_marsoc_sarc"];
groupsNATOSquad =
	[
	NATOSquad,
	["rhsusf_usmc_marpat_d_squadleader","rhsusf_usmc_marpat_d_machinegunner","rhsusf_usmc_marpat_d_riflemanat","rhsusf_usmc_marpat_d_riflemanat","rhsusf_usmc_marpat_d_grenadier","rhsusf_usmc_marpat_d_javelin","rhsusf_usmc_marpat_d_javelin_assistant","rhsusf_navy_marpat_d_medic"],
	["rhsusf_usmc_marpat_d_squadleader","rhsusf_usmc_marpat_d_machinegunner","rhsusf_usmc_marpat_d_riflemanat","rhsusf_usmc_marpat_d_grenadier","rhsusf_usmc_marpat_d_grenadier","rhsusf_usmc_marpat_d_stinger","rhsusf_usmc_marpat_d_rifleman_light","rhsusf_navy_marpat_d_medic"],
	["rhsusf_usmc_marpat_d_squadleader","rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_autorifleman_m249","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_autorifleman_m249","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_explosives","rhsusf_navy_marpat_d_medic"]
	];

//Militia Groups
if (gameMode != 4) then
	{
	//Teams
	groupsFIASmall =
		[
		["rhsgref_hidf_grenadier","rhsgref_hidf_rifleman"],
		["rhsgref_hidf_marksman","rhsgref_hidf_rifleman"]
		];
	//Fireteams
	groupsFIAMid =
		[
		["rhsgref_hidf_teamleader","rhsgref_hidf_machinegunner","rhsgref_hidf_machinegunner_assist","rhsgref_hidf_grenadier"],
		["rhsgref_hidf_teamleader","rhsgref_hidf_rifleman_m72","rhsgref_hidf_rifleman_m72","rhsgref_hidf_grenadier"]
		];
	//Squads
	FIASquad = ["rhsgref_hidf_squadleader","rhsgref_hidf_machinegunner","rhsgref_hidf_machinegunner_assist","rhsgref_hidf_rifleman","rhsgref_hidf_rifleman_m72","rhsgref_hidf_rifleman_m72","rhsgref_hidf_grenadier","rhsgref_hidf_medic"];
	groupsFIASquad = [FIASquad];
	};

//Police Groups
//Teams
groupsNATOGen = [policeOfficer,policeGrunt];

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehNATOBike = "B_Quadbike_01_F";
vehNATOLightArmed = ["rhsusf_m1025_d_s_m2","rhsusf_CGRCAT1A2_M2_usmc_d","rhsusf_CGRCAT1A2_Mk19_usmc_d","rhsusf_M1117_D","rhsusf_M1220_M2_usarmy_d","rhsusf_M1237_M2_usarmy_d","rhsusf_M1238A1_M2_socom_d","rhsusf_m1045_d_s","rhsusf_m1240a1_mk19_usmc_d","rhsusf_m1240a1_m240_usmc_d","rhsusf_m1240a1_m2_usmc_d"];
vehNATOLightUnarmed = ["rhsusf_m1025_d_s","rhsusf_m998_d_s_2dr","rhsusf_m998_d_s_2dr_fulltop","rhsusf_m998_d_s_4dr","rhsusf_CGRCAT1A2_usmc_d","rhsusf_M1232_usarmy_d","rhsusf_m1240a1_usmc_d"];
vehNATOTrucks = ["rhsusf_M1078A1P2_D_open_fmtv_usarmy","rhsusf_M1078A1P2_B_D_fmtv_usarmy","rhsusf_M1078A1P2_B_D_open_fmtv_usarmy","rhsusf_M1083A1P2_D_fmtv_usarmy","rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy"];
vehNATOCargoTrucks = [];
vehNATOAmmoTruck = "rhsusf_M977A4_AMMO_BKIT_usarmy_d";
vehNATORepairTruck = "rhsusf_M977A4_REPAIR_BKIT_usarmy_d";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
//Armored
vehNATOAPC = ["rhsusf_stryker_m1126_m2_d","rhsusf_stryker_m1126_mk19_d","rhsusf_stryker_m1127_m2_d","rhsusf_stryker_m1132_m2_d","RHS_M2A3_BUSKIII","RHS_M2A3_BUSKI","rhsusf_M1237_MK19_usarmy_d","RHS_M2A2_BUSKI","rhsusf_m113d_usarmy","rhsusf_m113d_usarmy_M240","rhsusf_m113d_usarmy_MK19"];
vehNATOTank = "rhsusf_m1a1fep_d";
vehNATOAA = "RHS_M6";
vehNATOAttack = vehNATOAPC + [vehNATOTank];
//Boats
vehNATOBoat = "rhsusf_mkvsoc";
vehNATORBoat = "rhsgref_hidf_rhib";
vehNATOBoats = [vehNATOBoat,vehNATORBoat,"rhsusf_m113d_usarmy","rhsusf_m113d_usarmy_M240","rhsusf_m113d_usarmy_MK19"];
//Planes
vehNATOPlane = "RHS_A10";
vehNATOPlaneAA = "rhsusf_f22";
vehNATOTransportPlanes = ["RHS_C130J"];
//Heli
vehNATOPatrolHeli = "RHS_MELB_MH6M";
vehNATOTransportHelis = ["RHS_UH60M_d","RHS_CH_47F_light","rhsusf_CH53E_USMC_GAU21_D",vehNATOPatrolHeli];
vehNATOAttackHelis = ["RHS_MELB_AH6M_L","RHS_AH64D","RHS_UH1Y_d","RHS_AH1Z"];
//UAV
vehNATOUAV = "B_UAV_02_F";
vehNATOUAVSmall = "B_UAV_01_F";
//Artillery
vehNATOMRLS = "rhsusf_m109d_usarmy";
vehNATOMRLSMags = "rhs_mag_155mm_m795_28";
//Combined Arrays
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, "rhsusf_M978A4_BKIT_usarmy_d","rhsusf_m113d_usarmy_medical", vehNATORepairTruck];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;

//Militia Vehicles
if (gameMode != 4) then
	{
	vehFIAArmedCar = "rhsgref_hidf_m1025_m2";
	vehFIATruck = "rhsusf_M1078A1P2_D_fmtv_usarmy";
	vehFIACar = "rhsgref_hidf_m998_4dr";
	};

//Police Vehicles
vehPoliceCar = "rhsusf_mrzr4_d_mud";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
NATOMG = "RHS_M2StaticMG_USMC_D";
staticATOccupants = "RHS_TOW_TriPod_USMC_D";
staticAAOccupants = "RHS_Stinger_AA_pod_D";
NATOMortar = "RHS_M252_USMC_D";

//Static Weapon Bags
MGStaticNATOB = "RHS_M2_Gun_Bag";
ATStaticNATOB = "rhs_Tow_Gun_Bag";
AAStaticNATOB = "B_AA_01_weapon_F";
MortStaticNATOB = "rhs_M252_Gun_Bag";
//Short Support
supportStaticNATOB = "rhs_TOW_Tripod_Bag";
//Tall Support
supportStaticNATOB2 = "RHS_M2_Tripod_Bag";
//Mortar Support
supportStaticNATOB3 = "rhs_M252_Bipod_Bag";
