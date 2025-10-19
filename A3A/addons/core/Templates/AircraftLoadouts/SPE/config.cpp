#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_SPE) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

// Warning: SPE has its own bomb hack (SPE_fnc_aiBombHelper_Fired). It seems to be deterministic so we can counter it,
// but I haven't checked their logic, and it might change in future.

class A3A {
    class Loadouts
    {
        class CASPlane
        {
            class baseCAS;
            class SPE_FW190F8 : baseCAS {
                loadout[] = {"SPE_250Rnd_MG151","SPE_250Rnd_MG151","SPE_400Rnd_MG131","SPE_400Rnd_MG131","SPE_1Rnd_SC50","SPE_1Rnd_SC50","SPE_1Rnd_SC500","SPE_1Rnd_SC50","SPE_1Rnd_SC50"};
                mainGun[] = {"SPE_2xMG151"};
                bombRacks[] = {"SPE_SC500_Bomb_Mount","SPE_SC50_Bomb_Mount"};
                diveParams[] = {800, 300, 110, 55, 15, {1.5, -1}};
            };
            class SPE_P47 : baseCAS {
                loadout[] = {"SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_3Rnd_M8_P47","SPE_3Rnd_M8_P47","SPE_1Rnd_US_500lb","SPE_1Rnd_US_500lb","SPE_1Rnd_US_500lb"};
                mainGun[] = {"SPE_8xM2_P47"};
                rocketLauncher[] = {"SPE_M8_Launcher_P47"};
                bombRacks[] = {"SPE_US_500lb_Bomb_Mount"};
                diveParams[] = {800, 350, 110, 55, 15, {-6, 0}};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class SPE_P47 : baseCAP {
                loadout[] = {"SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","","","","",""};
            };
            class SPE_FW190F8 : baseCAP {
                loadout[] = {"SPE_250Rnd_MG151","SPE_250Rnd_MG151","SPE_400Rnd_MG131","SPE_400Rnd_MG131","","","","",""};
            };
        };
    };
};
