//IFA - config.cpp

#include "..\..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(IFA_ACE)
    {
        name = COMPONENT_NAME;
        units[] = {"a3a_hmg_02_high", "a3a_hmg_02_high_weapon","a3a_LIB_Willys_MB_M1919","a3a_lib_Zis6_BOX","a3a_lib_PzKpfwIV_noShield"};
        weapons[] = {"a3a_lib_M712","a3a_lib_AVT_40","a3a_lib_M2_Carbine"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_config_fixes_IFA","IFA3_COMP_ACE_main","IFA3_COMP_ACE_mortar"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "..\CfgVehicles.hpp"
#include "..\CfgWeapons.hpp"
#include "..\CfgAmmo.hpp"