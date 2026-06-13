//SPE - config.cpp

#include "..\..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(MWB_M36)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"MWB_M36Jackson"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

    
class CfgVehicles {
    class SPE_M10;
    class SPE_M4A1_75;
    class MWB_M36B1 : SPE_M4A1_75 {
        class EventHandlers;
    };
    class MWB_M36B2 : SPE_M10 {
        class EventHandlers;
};
    class MWB_M36 : MWB_M36B2{
        class EventHandlers;
};
    class a3a_MWB_M36_US : MWB_M36{
        class EventHandlers : EventHandlers {
            postinit = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        };
        textureList[] = {"US_607TD_1945",1,"US_703TD_1945",1,"US_808TD_1945",1,"US_776TD_1945",1};
    };
    class a3a_MWB_M36B1_French : MWB_M36B1{
        faction = "SPE_FR_ARMY";
        class EventHandlers : EventHandlers {
            postinit = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        };
        textureList[] = {"France",1};
    };
    class a3a_MWB_M36B1_US : a3a_MWB_M36B1_French{
        textureList[] = {"US_654TD_1945",1,"US_813TD_1945",1,"US_899TD_1945",1};
    };
    class a3a_MWB_M36B2_French : MWB_M36B2{
        faction = "SPE_FR_ARMY";
        class EventHandlers : EventHandlers {
            postinit = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        };
        textureList[] = {"French",1,"France2",1};
    };
    class a3a_MWB_M36B2_Korea : a3a_MWB_M36B2_French{
        faction = "SPE_US_ARMY";
        textureList[] = {"Korea",1};
    };
};