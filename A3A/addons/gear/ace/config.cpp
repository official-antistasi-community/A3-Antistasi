#include "..\script_component.hpp"

class CfgPatches 
{
    class A3A_gear_ace_medical  {
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = 
		{
            "A3A_gear",
            "A3_Data_F_AoW_Loadorder",
            "ace_medical_treatment"
		};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
        skipWhenMissingDependencies = 1;
    };
};

#include "CfgFunctions.hpp"
#include "CfgMedicalActions.hpp"
#include "CfgMedicalTreatment.hpp"
#include "CfgWeapons.hpp"