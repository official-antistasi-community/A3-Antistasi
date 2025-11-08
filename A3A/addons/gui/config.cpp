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

class A3A {
#if __A3_DEBUG__
    #include "CfgFunctions.hpp"
#endif
};

#if __A3_DEBUG__
    class CfgFunctions {
        class A3A_GUI {
            class mainMenu {
                file = QPATHTOFOLDER(functions\mainMenu);
                class communityAdDialog {};
                class mapSelectorDialog {};
                class optionsDialog {};
                class remarksDialog {};
                class showInterruptButtons {};
            };
        };
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

#include "mainmenu.hpp"
#include "interruptMenu.hpp"