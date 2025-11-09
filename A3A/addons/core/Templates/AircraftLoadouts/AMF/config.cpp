#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_AMF) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"AMF_FAMAS","CUP_AirVehicles_Core"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class A3A {
    class Loadouts
    {
        class CASPlane
        {
            class baseCAS;
            class AMF_RAFALE_M_01_F : baseCAS {
                loadout[] = {"magazine_125Rnd_30M791","Laserbatteries","240Rnd_CMFlare_Chaff_Magazine","PylonMissile_Missile_MICAIR_x1","PylonMissile_Missile_MICAIR_x1","PylonRack_3_Missile_MICAIR_x1","PylonRack_3_Missile_MICAIR_x1","PylonRack_3Rnd_LGM_AASM","PylonRack_3Rnd_LGM_AASM","PylonRack_Missile_TANK_02_x1_f","PylonRack_Missile_TANK_02_x1_f","PylonRack_2_Missile_MICAIR_x1","PylonRack_2_Missile_MICAIR_x1","PylonRack_Missile_TANK_01_x1_f"};
                mainGun[] = {"weapon_30m791"};
                missileLauncher[] = {"PylonRack_3Rnd_LGM_AASM"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class AMF_RAFALE_M_01_F : baseCAP {
                loadout[] = {"magazine_125Rnd_30M791","Laserbatteries","240Rnd_CMFlare_Chaff_Magazine","PylonMissile_Missile_MICAIR_x1","PylonMissile_Missile_MICAIR_x1","PylonRack_3_Missile_MICAIR_x1","PylonRack_3_Missile_MICAIR_x1","PylonRack_Missile_METEOR_1_x1","PylonRack_Missile_METEOR_1_x1","PylonRack_Missile_TANK_02_x1_f","PylonRack_Missile_TANK_02_x1_f","PylonRack_Missile_METEOR_INT_x1","PylonRack_Missile_METEOR_INT_x1","PylonRack_Missile_TANK_01_x1_f"};
            };
            class B_AMF_PLANE_FIGHTER_02_F : baseCAP {
                loadout[] = {"magazine_250Rnd_30DEFA554","240Rnd_CMFlare_Chaff_Magazine","PylonRack_Missile_MAGIC2_x1","PylonRack_mirage2_Missile_MICAIR_x1","PylonRack_mirage2_Missile_MICAIR_x1","PylonRack_Missile_MAGIC2_x1","PylonRack_mirage1_Missile_MICAIR_x1","PylonRack_mirage1_Missile_MICAIR_x1"};
            };
        };
        class Helicopter
        {

        };
    };
};
