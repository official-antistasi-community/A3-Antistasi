#include "..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_defaults) {
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
};

class A3A {
    class Loadouts
    {
        class CASPlane
        {
            class baseCAS
            {
                //Pylons
                loadout[] = {};
                //Weapons
                mainGun[] = {};
                rocketLauncher[] = {};
                missileLauncher[] = {};
                //Dive bombing requirements
                bombRacks[] = {};
                diveParams[] = {};
                //General script, runs just after spawn
                code = "";
                gunnerLaser = "";
            };
        };
        class CAPPlane
        {
            class baseCAP
            {
                //Pylons
                loadout[] = {};
                //General script, runs just after spawn
                code = "";
            };
        };
        class Helicopter
        {
            class baseHelicopter
            {
                //Pylons
                loadout[] = {};
                //General script, runs just after spawn
                code = "";
            };
        };
    };
};
