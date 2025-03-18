//RHS - hidf_rhs.hpp

class rhsusf_m966_w;
class a3a_rhs_m966_olive : rhsusf_m966_w{
	crew = "rhsgref_hidf_rifleman";
	dlc = "RHS_GREF";
	faction = "rhsgref_faction_hidf";
	animationList[] = {"hide_CIP",1,"hide_A2_Parts",1,"Hide_A2Bumper",1,"Hide_Brushguard",0.5};
	HiddenSelectionsTextures[] = {"rhsgref\addons\rhsgref_vehicles_ret\data\hidf\hmmwv\m998_exterior_lg_co.paa","rhsgref\addons\rhsgref_vehicles_ret\data\hidf\hmmwv\m998_interior_lg_co.paa","rhsgref\addons\rhsgref_vehicles_ret\data\hidf\hmmwv\A2_parts_lg_co.paa","rhsgref\addons\rhsgref_vehicles_ret\data\hidf\hmmwv\wheel_wranglermt_lg_co.paa","rhsgref\addons\rhsgref_vehicles_ret\data\hidf\hmmwv\m998_mainbody_lg_co.paa","rhsusf\addons\rhsusf_hmmwv\textures\gratting_w_co.paa","rhsgref\addons\rhsgref_vehicles_ret\data\hidf\hmmwv\tile_exmetal_lg_co.paa","rhsgref\addons\rhsgref_vehicles_ret\data\hidf\hmmwv\m1025_lg_co.paa","rhsgref\addons\rhsgref_vehicles_ret\data\hidf\hmmwv\mk64mount_lg_co.paa","",""};
};

class rhsusf_m113tank_base;
class rhsusf_m113_usarmy_unarmed : rhsusf_m113tank_base{
	class AnimationSources;
};
class rhsusf_m113_usarmy_medical : rhsusf_m113_usarmy_unarmed{
	class AnimationSources : AnimationSources{
		class IFF_Panels_Hide;
	};
};
class a3a_rhs_m113_olive_medical : rhsusf_m113_usarmy_medical{
	crew = "rhsgref_hidf_crewman";
	dlc = "RHS_GREF";
	faction = "rhsgref_faction_hidf";
	class AnimationSources : AnimationSources{
		class IFF_Panels_Hide : IFF_Panels_Hide{
			initPhase = 1;
		};
	};
	hiddenSelectionsTextures[] = {"rhsusf\addons\rhsusf_m113\data_new\m113a3_01_od_med_co.paa","rhsusf\addons\rhsusf_m113\data_new\m113a3_02_od_l_co.paa","rhsusf\addons\rhsusf_m113\data_new\m113a3_03_wd_co.paa","rhsusf\addons\rhsusf_m113\data_new\m113a3_int03_wd_co.paa"};
};

class rhsusf_m113_usarmy_M240 : rhsusf_m113tank_base{
	class AnimationSources;
};
class a3a_rhs_m113_hidf_M240_base : rhsusf_m113_usarmy_M240{
	scope = 0;
	class AnimationSources : AnimationSources{
		class IFF_Panels_Hide;
	};
};
class a3a_rhs_m113_hidf_M240 : a3a_rhs_m113_hidf_M240_base{
	crew = "rhsgref_hidf_crewman";
	dlc = "RHS_GREF";
	faction = "rhsgref_faction_hidf";
	scope = 2;
	class AnimationSources : AnimationSources{
		class IFF_Panels_Hide : IFF_Panels_Hide{
			initPhase = 1;
		};
	};
	hiddenSelectionsTextures[] = {"rhsgref\addons\rhsgref_vehicles_ret\data\hidf\m113a3_01_lg_l_co.paa","rhsgref\addons\rhsgref_vehicles_ret\data\hidf\m113a3_02_lg_l_co.paa","rhsgref\addons\rhsgref_vehicles_ret\data\hidf\m113a3_03_lg_co.paa","rhsusf\addons\rhsusf_m113\data_new\m113a3_int03_wd_co.paa","rhsusf\addons\rhsusf_m113\data_new\m23_pintle_wd_co.paa",""};
};

class APC_Tracked_03_base_F;
class RHS_M2A2_Base : APC_Tracked_03_base_F{
	class AnimationSources;
};
class RHS_M2A2 : RHS_M2A2_Base{
	class AnimationSources : AnimationSources{
		class IFF_Panels_Hide;
	};
};
class a3a_RHS_M2A2_olive : RHS_M2A2{
	crew = "rhsgref_hidf_crewman";
	dlc = "RHS_GREF";
	faction = "rhsgref_faction_hidf";
	class AnimationSources : AnimationSources{
		class IFF_Panels_Hide : IFF_Panels_Hide{
			initPhase = 1;
		};
	};
	hiddenSelectionsTextures[] = {"rhsusf\addons\rhsusf_a2port_armor\m2a2_bradley\data\woodland\m6_base_co.paa","rhsusf\addons\rhsusf_a2port_armor\m2a2_bradley\data\woodland\m6_a3_co.paa","rhsusf\addons\rhsusf_a2port_armor\m2a2_bradley\data\woodland\ultralp_co.paa","rhsusf\addons\rhsusf_a2port_armor\m2a2_bradley\data\woodland\m6_base_co.paa","rhsusf\addons\rhsusf_a2port_armor\m2a2_bradley\data\woodland\m6_base_co.paa"};
};