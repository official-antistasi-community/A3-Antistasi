//IFA - CfgWeapons.hpp

//Fun weapons for finding in lootcrates or on SF
class Mode_SemiAuto;
class CfgWeapons 
{
	class ItemCore;
	class LIB_M1918A2_BAR_Bipod : ItemCore{
		picture = "\WW2\Assets_t\Weapons\Equipment_t\Weapons\MuzzleItem\Gear_ACC_BAR_Bipod_ca.paa";
	};
	class LIB_M1918A2_BAR_Handle : ItemCore{
		picture = "\WW2\Assets_t\Weapons\Equipment_t\Weapons\MuzzleItem\Gear_ACC_BAR_Handle_ca.paa";
	};
    class LIB_RIFLE;
    class LIB_PISTOL;
    class LIB_M1_Carbine : LIB_RIFLE {
        class Short;
    };
    class LIB_SVT_40 : LIB_RIFLE {
        class Short;
    };
    class LIB_M1896 : LIB_PISTOL{
        class Single;
    };
    class a3a_lib_M712 : LIB_M1896{
        displayName = "M712 Mauser";
        descriptionShort = "9x19mm machine pistol";
        recoil = "recoil_pistol_4five";
        recoilProne = "recoil_pistol_4five";
        changeFiremodeSound[] = {"A3\sounds_f\weapons\closure\firemode_changer_2.wss",0.1778,1,5};
        class Full : Single{
            aiDispersionCoefX = 2;
            aiDispersionCoefY = 3;
            displayName = "Full";
            autoFire = 1;
            textureType = "fullAuto";
            reloadTime = 0.066;
            maxRange = 25;
            maxRangeProbab = 0.05;
            midRange = 12.5;
            midRangeProbab = 0.5;
            minRange = 0;
            minRangeProbab = 1.0;
            showToPlayer = 1;
        };
        modes[] = {"Single", "Full"};
    };
    class a3a_lib_AVT_40 : LIB_SVT_40 {
        displayName = "AVT-40";
        descriptionShort = "AVT-40 Automatic rifle";
        changeFiremodeSound[] = {"A3\sounds_f\weapons\closure\firemode_changer_2.wss",0.1778,1,5};
        class Full : Short{
            aiDispersionCoefX = 2;
            aiDispersionCoefY = 3;
            displayName = "Full";
            autoFire = 1;
            textureType = "fullAuto";
            reloadTime = 0.08;
            maxRangeProbab = 0.05;
            midRangeProbab = 0.2;
            minRangeProbab = 0.7;
            minRange = 0;
            showToPlayer = 1;
        };
        modes[] = {"Single","Full","Far","Medium","Short"};
    };
    class a3a_lib_M2_Carbine : LIB_M1_Carbine{
        displayName = "M2 Carbine";
        descriptionShort = "M2 Carbine .30 Automatic rifle";
        changeFiremodeSound[] = {"A3\sounds_f\weapons\closure\firemode_changer_2.wss",0.1778,1,5};
        class Full : Short{
            aiDispersionCoefX = 2;
            aiDispersionCoefY = 3;
            displayName = "Full";
            autoFire = 1;
            textureType = "fullAuto";
            reloadTime = 0.08;
            maxRangeProbab = 0.05;
            midRangeProbab = 0.2;
            minRangeProbab = 0.7;
            minRange = 0;
            showToPlayer = 1;
        };
        modes[] = {"Single","Full","Far","Medium","Short"};
    };

    // Adjust so that the mortars aren't wildly inaccurate at longer ranges
    class LIB_MortarCannon_base;
    class LIB_GRWR34 : LIB_MortarCannon_base {
        class Single1 : Mode_SemiAuto {
            artilleryDispersion = 4;
        };
        class Single2 : Single1 {
            artilleryDispersion = 4;
        };
        class Single3 : Single1 {
            artilleryDispersion = 4;
        };
    };
    class LIB_BM37 : LIB_MortarCannon_base {
        class Single1 : Mode_SemiAuto {
            artilleryDispersion = 4;
        };
        class Single2 : Single1 {
            artilleryDispersion = 4;
        };
        class Single3 : Single1 {
            artilleryDispersion = 4;
        };
    };
    class LIB_M2_60 : LIB_MortarCannon_base {
        class Single1 : Mode_SemiAuto {
            artilleryDispersion = 4;
        };
        class Single2 : Single1 {
            artilleryDispersion = 4;
        };
        class Single3 : Single1 {
            artilleryDispersion = 4;
        };
    };
};