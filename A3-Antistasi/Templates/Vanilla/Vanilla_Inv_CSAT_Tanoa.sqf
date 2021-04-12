////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameInvaders = "CSAT";

//SF Faction
factionMaleInvaders = "OPF_V_F";
//Miltia Faction
if (gameMode == 4) then {factionFIA = ""};

//Flag Images
CSATFlag = "Flag_CSAT_F";
CSATFlagTexture = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
flagCSATmrk = "flag_CSAT";
if (isServer) then {"CSAT_carrier" setMarkerText "CSAT Carrier"};

//Loot Crate
CSATAmmoBox = "O_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
CSATPlayerLoadouts = [
	//Team Leader
	["Templates\Vanilla\Loadouts\vanilla_opfor_teamLeader_tanoa"] call A3A_fnc_getLoadout,
	//Medic
	["Templates\Vanilla\Loadouts\vanilla_opfor_medic_tanoa"] call A3A_fnc_getLoadout,
	//Autorifleman
	["Templates\Vanilla\Loadouts\vanilla_opfor_machineGunner_tanoa"] call A3A_fnc_getLoadout,
	//Marksman
	["Templates\Vanilla\Loadouts\vanilla_opfor_marksman_tanoa"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["Templates\Vanilla\Loadouts\vanilla_opfor_AT_tanoa"] call A3A_fnc_getLoadout,
	//AT2
	["Templates\Vanilla\Loadouts\vanilla_opfor_AT2_tanoa"] call A3A_fnc_getLoadout
];

//PVP Player Vehicles
vehCSATPVP = ["O_T_MRAP_02_ghex_F","O_T_LSV_02_unarmed_F","O_T_MRAP_02_hmg_ghex_F","O_T_LSV_02_armed_F"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
CSATGrunt = "O_T_Soldier_F";
CSATOfficer = "O_T_Officer_F";
CSATBodyG = "O_V_Soldier_ghex_F";
CSATCrew = "O_T_Crew_F";
CSATMarksman = "O_T_Soldier_M_F";
staticCrewInvaders = "O_T_Support_MG_F";
CSATPilot = "O_T_Pilot_F";

//Militia Units
if (gameMode == 4) then
	{
	FIARifleman = "O_T_Soldier_F";
	FIAMarksman = "O_T_Soldier_M_F";
	};

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsCSATSentry = ["O_T_Soldier_GL_F","O_T_Soldier_F"];
groupsCSATSniper = ["O_T_Sniper_F","O_T_Spotter_F"];
groupsCSATsmall = [groupsCSATSentry,["O_T_Recon_M_F","O_T_Recon_F"],groupsCSATSniper];
//Fireteams
groupsCSATAA = ["O_T_Soldier_TL_F","O_T_Soldier_AA_F","O_T_Soldier_AA_F","O_T_Soldier_AAA_F"];
groupsCSATAT = ["O_T_Soldier_TL_F","O_T_Soldier_AT_F","O_T_Soldier_AT_F","O_T_Soldier_AAT_F"];
groupsCSATmid = [["O_T_Soldier_TL_F","O_T_Soldier_AR_F","O_T_Soldier_GL_F","O_T_Soldier_LAT_F"],groupsCSATAA,groupsCSATAT];
//Squads
CSATSquad = ["O_T_Soldier_SL_F","O_T_Soldier_F","O_T_Soldier_LAT_F","O_T_Soldier_M_F","O_T_Soldier_TL_F","O_T_Soldier_AR_F","O_T_Soldier_A_F","O_T_Medic_F"];
CSATSpecOp = ["O_V_Soldier_TL_ghex_F","O_V_Soldier_JTAC_ghex_F","O_V_Soldier_M_ghex_F","O_V_Soldier_Exp_ghex_F","O_V_Soldier_LAT_ghex_F","O_V_Soldier_Medic_ghex_F"];
groupsCSATSquad =
	[
	CSATSquad,
	["O_T_Soldier_SL_F","O_T_Soldier_AR_F","O_T_Soldier_GL_F","O_T_Soldier_M_F","O_T_Soldier_AT_F","O_T_Soldier_AAT_F","O_T_Soldier_A_F","O_T_Medic_F"],
	["O_T_Soldier_SL_F","O_T_Soldier_LAT_F","O_T_Soldier_TL_F","O_T_Soldier_AR_F","O_T_Soldier_A_F","O_T_Support_Mort_F","O_T_Support_AMort_F","O_T_Medic_F"],
	["O_T_Soldier_SL_F","O_T_Soldier_LAT_F","O_T_Soldier_TL_F","O_T_Soldier_AR_F","O_T_Soldier_A_F","O_T_Support_MG_F","O_T_Support_AMG_F","O_T_Medic_F"],
	["O_T_Soldier_SL_F","O_T_Soldier_LAT_F","O_T_Soldier_TL_F","O_T_Soldier_AR_F","O_T_Soldier_A_F","O_T_Soldier_AA_F","O_T_Soldier_AAA_F","O_T_Medic_F"],
	["O_T_Soldier_SL_F","O_T_Soldier_LAT_F","O_T_Soldier_TL_F","O_T_Soldier_AR_F","O_T_Soldier_A_F","O_T_Engineer_F","O_T_Engineer_F","O_T_Medic_F"]
	];

//Militia Groups
if (gameMode == 4) then
	{
	//Teams
	groupsFIASmall =
		[
		["O_T_Soldier_GL_F","O_T_Soldier_F"],
		["O_T_Soldier_M_F","O_T_Soldier_F"],
		["O_T_Soldier_M_F","O_T_Soldier_M_F"]
		];
	//Fireteams
	groupsFIAMid =
		[
		["O_T_Soldier_SL_F","O_T_Soldier_M_F","O_T_Soldier_AR_F","O_T_Soldier_A_F"],
		["O_T_Soldier_TL_F","O_T_Soldier_AR_F","O_T_Soldier_GL_F","O_T_Soldier_LAT_F"],
		["O_T_Soldier_TL_F","O_T_Soldier_LAT_F","O_T_Soldier_LAT_F","O_T_Soldier_LAT_F"]
		];
	//Squads
	FIASquad = ["O_T_Soldier_SL_F","O_T_Soldier_F","O_T_Soldier_LAT_F","O_T_Soldier_M_F","O_T_Soldier_TL_F","O_T_Soldier_AR_F","O_T_Soldier_A_F","O_T_Medic_F"];
	groupsFIASquad =
		[
		FIASquad,
		["O_T_Soldier_SL_F","O_T_Soldier_LAT_F","O_T_Soldier_M_F","O_T_Soldier_TL_F","O_T_Soldier_A_F","O_T_Soldier_GL_F","O_T_Engineer_F","O_T_Medic_F"]
		];
	};

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehCSATBike = "O_T_Quadbike_01_ghex_F";
vehCSATLightArmed = ["O_T_MRAP_02_gmg_ghex_F","O_T_MRAP_02_hmg_ghex_F","O_T_LSV_02_armed_F"];
vehCSATLightUnarmed = ["O_T_MRAP_02_ghex_F","O_T_LSV_02_unarmed_F"];
vehCSATTrucks = ["O_T_Truck_03_transport_ghex_F","O_T_Truck_03_covered_ghex_F"];
vehCSATAmmoTruck = "O_T_Truck_03_ammo_ghex_F";
vehCSATRepairTruck = "O_T_Truck_03_repair_ghex_F";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
//Armored
vehCSATAPC = ["O_T_APC_Wheeled_02_rcws_ghex_F","O_T_APC_Tracked_02_cannon_ghex_F"];
vehCSATTank = "O_T_MBT_02_cannon_ghex_F";
vehCSATAA = "O_T_APC_Tracked_02_AA_ghex_F";
vehCSATAttack = vehCSATAPC + [vehCSATTank];
//Boats
vehCSATBoat = "O_T_Boat_Armed_01_hmg_F";
vehCSATRBoat = "O_T_Boat_Transport_01_F";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat,"O_T_APC_Wheeled_02_rcws_ghex_F"];
//Planes
vehCSATPlane = "O_Plane_CAS_02_dynamicLoadout_F";
vehCSATPlaneAA = "O_Plane_Fighter_02_F";
vehCSATTransportPlanes = ["O_T_VTOL_02_infantry_F"];
//Heli
vehCSATPatrolHeli = "O_Heli_Light_02_unarmed_F";
vehCSATTransportHelis = ["O_Heli_Transport_04_bench_F",vehCSATPatrolHeli];
vehCSATAttackHelis = ["O_Heli_Light_02_F","O_Heli_Attack_02_F"];
//UAV
vehCSATUAV = "O_UAV_02_F";
vehCSATUAVSmall = "O_UAV_01_F";
//Artillery
vehCSATMRLS = "O_T_MBT_02_arty_ghex_F";
vehCSATMRLSMags = "32Rnd_155mm_Mo_shells";
//Combined Arrays
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, vehCSATRepairTruck, "O_T_Truck_03_fuel_ghex_F", "O_T_Truck_03_medical_ghex_F"];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA] + vehCSATTransportPlanes;

//Militia Vehicles
if (gameMode == 4) then
	{
	vehFIAArmedCar = "O_MRAP_02_hmg_F";
	vehFIATruck = "O_Truck_02_transport_F";
	vehFIACar = "O_MRAP_02_F";
	};

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
CSATMG = "I_G_HMG_02_high_F";
staticATInvaders = "O_static_AT_F";
staticAAInvaders = "O_static_AA_F";
CSATMortar = "O_Mortar_01_F";

//Static Weapon Bags
MGStaticCSATB = "I_G_HMG_02_high_weapon_F";
ATStaticCSATB = "O_AT_01_weapon_F";
AAStaticCSATB = "O_AA_01_weapon_F";
MortStaticCSATB = "O_Mortar_01_weapon_F";
//Short Support
supportStaticCSATB = "I_G_HMG_02_support_F";
//Tall Support
supportStaticCSATB2 = "I_G_HMG_02_support_high_F";
//Mortar Support
supportStaticCSATB3 = "O_Mortar_01_support_F";
