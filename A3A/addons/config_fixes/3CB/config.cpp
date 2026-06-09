//3CB - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(3CB) 
    {
        name = COMPONENT_NAME;
        units[] = {"a3a_UK3CB_Fake_Sabre", "a3a_UK3CB_Fake_Mig", "a3a_green_M270_Avenger", "a3a_3CB_UH1H_tan", "a3a_3CB_UH1H_M240_tan", "a3a_3CB_UH1H_GUNSHIP_tan", "a3a_3CB_Bell412_Utility_tan", "a3a_3CB_Bell412_Armed_tan", "a3a_3CB_Bell412_Armed_AT_tan"};
        weapons[] = {"a3a_UK3CB_CZ550_8mm"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","UK3CB_Factions_Vehicles_SUV",
        "UK3CB_Factions_Weapons_AUG","UK3CB_Factions_Weapons_M14","UK3CB_Factions_Weapons_MG3"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
        skipWhenMissingDependencies = 1;
    };
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
