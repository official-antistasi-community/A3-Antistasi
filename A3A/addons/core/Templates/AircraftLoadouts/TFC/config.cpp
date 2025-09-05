#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_TFC) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tfc_rcaf_data_rcaf"};
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
        };
        class CAPPlane
        {
            class baseCAP;
            class B_tfc_cf35b_F : baseCAP {
                loadout[] = {"PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_AMRAAM_D_x2","PylonRack_Missile_AMRAAM_D_x2","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","","","","","",""};
            };
            class TFC_CF39_GRIPEN_F : baseCAP {
                loadout[] = {"PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x2","PylonRack_Missile_AMRAAM_C_x2"};
            };
        };
        class Helicopter
        {

        };
    };
};