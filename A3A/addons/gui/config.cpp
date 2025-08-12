#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        // Needs A3 loadorder for arsenal limits dialog
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder", "A3A_core"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#if __A3_DEBUG__
    class A3A {
        #include "CfgFunctions.hpp"
    };
#else
    #include "CfgFunctions.hpp"
#endif


// Whether order should be maintained is unknown.
#include "dialogues\defines.hpp"
#include "dialogues\textures.inc"
#include "dialogues\controls.hpp"
#include "dialogues\dialogs.hpp"
#include "dialogues\rsc.hpp"