
#include "..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(EAW) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
    /*
    class EAW_Intros {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
        requiredVersion = REQUIRED_VERSION;
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    }
    class EAW_Intros_SPE_Compat {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    }
    */
    
    //ugly hack to deal with broken requiredAddons from EAW_Intros
    /*
    class WW2_SPE_Core_c_UI_MenuBackgrounds_c {};
    class WW2_SPE_Normandy_c {};
    class WW2_SPE_Normandy {};
    class WW2_SPE_Missions_s_Video_s {};
    class WW2_SPE_Missions_p_Scenarios_p{};
    class WW2_SPE_Missions_p_Showcases_p{};
    class WW2_SPE_Missions_p_Cutscene_p {};
    class WW2_SPE_Missions_p_Credits_p {};
    class WW2_SPE_Missions_p_Campaigns_p{};
    class WW2_SPE_Core_t_MainMenuSpotlight_t{};
    class WW2_SPE_Core_t_MenuBackgrounds_t {};
    class WW2_SPE_Core_t_GUI_t {};
    class WW2_SPE_Core_c_UI_MainMenu_c{};
    */
};