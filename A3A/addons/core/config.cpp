#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_Events"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgSounds.hpp"
class A3A {
    #include "Templates.hpp"
    #include "Params.hpp"

#if __A3_DEBUG__
    #include "CfgFunctions.hpp"
#endif
};
#if __A3_DEBUG__
    class CfgFunctions {
        class A3A {
            class debug {
                file = QPATHTOFOLDER(functions\debug);
                class prepFunctions { preInit = 1; };
                class runPostInitFuncs { postInit = 1; };
            };
        };
    };
#else
    #include "CfgFunctions.hpp"
#endif

// Load external member list if present
#if __has_include("\A3AMembers.hpp")
#include "\A3AMembers.hpp"
#endif

#ifndef UseDoomGUI
    #include "defines.hpp"
    #include "dialogs.hpp"
#endif

#include "keybinds.hpp"

class CfgMPGameTypes {
    class ANTI {
        name = "Antistasi";
        shortcut = "ANTI";
        id = 30;
        picture = QPATHTOFOLDER(Pictures\antistasi_logo_small.paa);
        description = "";
    };
};

#include "CfgMarkers.hpp"

// Base AI unit definitions
#include "CfgVehicles.hpp"
