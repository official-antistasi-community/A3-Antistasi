//IFA - CfgVehicles.hpp

class DefaultEventHandlers;
class CfgVehicles 
{
	class LIB_US_Willys_MB_M1919;
	class a3a_LIB_Willys_MB_M1919 : LIB_US_Willys_MB_M1919{
		hiddenSelectionsTextures[] = {"WW2\Assets_t\Vehicles\Cars_t\IF_Willys_MB\Willys_co.paa","\WW2\Assets_t\Vehicles\Cars_t\IF_Willys_MB\Willys_Additional_co.paa"};
		typicalCargo[] = {"LIB_SOV_AT_soldier"};
		crew = "LIB_SOV_unequip";
		faction = "LIB_RKKA";
		side = 0;
	};
	class LIB_DAK_PzKpfwIV_H;
	class a3a_lib_PzKpfwIV_noShield : LIB_DAK_PzKpfwIV_H{
		faction = "LIB_WEHRMACHT";
		hiddenSelectionsTextures[] = {"\WW2\Assets_t\Vehicles\Tanks_t\IF_PzKpfwIV_H\Body_co.paa","\WW2\Assets_t\Vehicles\Tanks_t\IF_PzKpfwIV_H\Turret_co.paa","\WW2\Assets_t\Vehicles\Tanks_t\IF_PzKpfwIV_H\Wheels_co.paa","\WW2\Assets_t\Vehicles\Tanks_t\IF_PzKpfwIV_H\Tracks_co.paa"};
	};
	class LIB_Zis6_Parm;
	class a3a_lib_Zis6_BOX : LIB_Zis6_Parm {
		displayName = "ZIS-5V (Box)";
		transportRepair = 0;
		ace_repair_canRepair = 0;
		typicalCargo[] = {"LIB_FFI_LAT_Soldier"};
		faction = "LIB_FFI";
		side = 2;
	};

	class B_HMG_02_high_weapon_F;
	class I_G_HMG_02_high_weapon_F : B_HMG_02_high_weapon_F{
		class assembleInfo;
	};
	class a3a_hmg_02_high_weapon : I_G_HMG_02_high_weapon_F{
		class assembleInfo : assembleInfo {
			assembleTo = "a3a_hmg_02_high";
		};
	};
	class a3a_mmg_02_high_weapon : I_G_HMG_02_high_weapon_F{
		class assembleInfo : assembleInfo {
			assembleTo = "a3a_mmg_02_high";
		};
	};
	class HMG_02_high_base_F;
	class B_G_HMG_02_high_F : HMG_02_high_base_F{
		class AnimationSources;
		class Turrets;
	};
	class a3a_hmg_02_high_base : B_G_HMG_02_high_F{
		scope = 0;
		class Turrets : Turrets{
			class MainTurret;
		};
	};
	class a3a_hmg_02_high : a3a_hmg_02_high_base{
		scope = 2;
		displayName = ".50 M2HB (AA Tripod)";
		class AnimationSources : AnimationSources{
			class Hide_Shield {
				animPeriod = 0.01;
				initPhase = 1;
				source = "user";
				useSource = 1;
			};
			class Hide_Rail {
				animPeriod = 0.01;
				initPhase = 1;
				source = "user";
				useSource = 1;
			};
			class Revolving {
				source = "revolving";
				weapon = "LIB_M2";
			};
			class muzzle_source {
				source = "reload";
				weapon = "LIB_M2";
			};
			class muzzle_source_rot {
				source = "ammorandom";
				weapon = "LIB_M2";
			};
			class ReloadAnim {
				source = "reload";
				weapon = "LIB_M2";
			};
			class ReloadMagazine {
				source = "reloadmagazine";
				weapon = "LIB_M2";
			};
		};
		class Turrets : Turrets{
			class MainTurret : MainTurret{
				magazines[] = {"LIB_100Rnd_127x99_M2","LIB_100Rnd_127x99_M2","LIB_100Rnd_127x99_M2","LIB_100Rnd_127x99_M2"};
				weapons[] = {"LIB_M2"};
			};
		};
		animationList[] ={};
	};
	class a3a_mmg_02_high : a3a_hmg_02_high{
		displayName = ".30 M2HB (AA Tripod)";
		class AnimationSources : AnimationSources{
			class Hide_Shield {
				animPeriod = 0.01;
				initPhase = 0;
				source = "user";
				useSource = 1;
			};
			class Hide_Rail {
				animPeriod = 0.01;
				initPhase = 1;
				source = "user";
				useSource = 1;
			};
			class Revolving {
				source = "revolving";
				weapon = "lib_maxim_m30";
			};
			class muzzle_source {
				source = "reload";
				weapon = "lib_maxim_m30";
			};
			class muzzle_source_rot {
				source = "ammorandom";
				weapon = "lib_maxim_m30";
			};
			class ReloadAnim {
				source = "reload";
				weapon = "lib_maxim_m30";
			};
			class ReloadMagazine {
				source = "reloadmagazine";
				weapon = "lib_maxim_m30";
			};
		};
		class Turrets : Turrets{
			class MainTurret : MainTurret{
				magazines[] = {"lib_250rnd_7_62x54R_maxim_D","lib_250rnd_7_62x54R_maxim_D","lib_250rnd_7_62x54R_maxim_D","lib_250rnd_7_62x54R_maxim_D"};
				weapons[] = {"lib_maxim_m30"};
			};
		};
		animationList[] ={};
	};

	// CBA event handlers fix
	class Tank;
	class LIB_Armored_Target_Dummy : Tank {
		delete EventHandlers;
	};

	// Nose-fall tweaks to make planes turn at a semi-decent rate when flown by AI
	// Note: LIB_Ju87 not adjusted because planes with low maxSpeed use different AI logic
	class LIB_GER_Plane_base;
	class LIB_FW190F8 : LIB_GER_Plane_base
	{
		draconicTorqueXCoef = 2;
	};
	class LIB_SU_Plane_base;
	class LIB_P39 : LIB_SU_Plane_base
	{
		draconicTorqueXCoef = 2;
	};
	class LIB_Pe2 : LIB_SU_Plane_base
	{
		draconicTorqueXCoef = 2;
	};
	class LIB_US_Plane_base;
	class LIB_P47 : LIB_US_Plane_base
	{
		draconicTorqueXCoef = 2;
	};
};
