class CfgVehicles
{
    class SPE_R200_base;
    class SPE_R200_Unarmed_base : SPE_R200_base{
        class AnimationSources;
    };
    class SPE_GER_R200_Unarmed : SPE_R200_Unarmed_base {
        class AnimationSources : AnimationSources{
            class hide_canopy_source;
        };
    };
    class a3a_SPE_R200 : SPE_GER_R200_Unarmed {
        displayName = "Stoewer R200";
        hiddenSelectionsTextures[] = {"ww2\spe_assets_t\vehicles\wheeled_u1_t\r200\r200_1_co.paa","ww2\spe_assets_t\vehicles\wheeled_u1_t\r200\r200_2_co.paa",""};
        class AnimationSources : AnimationSources{
            class hide_canopy_source;
            class hide_jack_source : hide_canopy_source {
                displayName = "Hide Jack";
                initPhase = 1;
            };
            class hide_shovel_source : hide_canopy_source {
                displayName = "Hide Shovel";
                initPhase = 1;
            };
        };
    };
    class SPE_GER_R200_Hood : SPE_R200_Unarmed_base {
        class AnimationSources : AnimationSources{
            class hide_canopy_source;
        };
    };
    class a3a_SPE_R200_Hood : SPE_GER_R200_Hood {
        displayName = "Stoewer R200 (Canopy)";
        hiddenSelectionsTextures[] = {"ww2\spe_assets_t\vehicles\wheeled_u1_t\r200\r200_1_co.paa","ww2\spe_assets_t\vehicles\wheeled_u1_t\r200\r200_2_co.paa",""};
        class AnimationSources : AnimationSources{
            class hide_canopy_source;
            class hide_jack_source : hide_canopy_source {
                displayName = "Hide Jack";
                initPhase = 1;
            };
            class hide_shovel_source : hide_canopy_source {
                displayName = "Hide Shovel";
                initPhase = 1;
            };
        };
    };
    class SPE_G503_MB_base;
    class SPE_G503_MB_Unarmed_base : SPE_G503_MB_base{
        class EventHandlers;
        class AnimationSources;
    };
    class SPE_US_G503_MB : SPE_G503_MB_Unarmed_base {
    };
    class a3a_SPE_G503_MB : SPE_US_G503_MB {
        class EventHandlers : EventHandlers{
           class SPE_System_NumberMarkings {};
        };
        class AnimationSources : AnimationSources{
            class hide_bridge_marking_source{
                initPhase = 1;
                displayName = "Hide Bridge Marking"
                animPeriod = 1e-05;
                source = "user";
                useSource = 1;
                };
            class hide_tools_source{
                initPhase = 1;
                displayName = "Hide Tools";
                animPeriod = 1e-05;
                source = "user";
                useSource = 1;
                };
            class hide_jerry_can_source{
                initPhase = 1;
                displayName = "Hide Jerry Can";
                animPeriod = 1e-05;
                source = "user";
                useSource = 1;
                };
            class hide_spare_wheel_source{
                initPhase = 1;
                displayName = "Hide Spare Wheel";
                animPeriod = 1e-05;
                source = "user";
                useSource = 1;
                };
        };
        displayName = "WO CJ-2";
        hiddenSelectionsTextures[] = {"ww2\spe_assets_t\vehicles\wheeled_u1_t\g503_mb\g503_1_co.paa","ww2\spe_assets_t\vehicles\wheeled_u1_t\g503_mb\g503_2_co.paa","ww2\spe_assets_t\vehicles\wheeled_u1_t\g503_mb\g503_3_co.paa","","","","","","","","",""};
    };
    class SPE_G503_MB_Open_base: SPE_G503_MB_Unarmed_base{};
    class SPE_US_G503_MB_Open : SPE_G503_MB_Open_base{};
    class a3a_SPE_G503_MB_Open : SPE_US_G503_MB_Open{
        class EventHandlers : EventHandlers{
            class SPE_System_NumberMarkings {};
        };
        class AnimationSources : AnimationSources{
            class hide_canopy_source{
                initPhase = 1;
                displayName = "Hide Canopy";
                animPeriod = 1e-05;
                source = "user";
                useSource = 1;
                };
            class hide_tools_source{
                initPhase = 1;
                displayName = "Hide Tools";
                animPeriod = 1e-05;
                source = "user";
                useSource = 1;
                };
            class hide_jerry_can_source{
                initPhase = 1;
                displayName = "Hide Jerry Can";
                animPeriod = 1e-05;
                source = "user";
                useSource = 1;
                };
            class hide_spare_wheel_source{
                initPhase = 1;
                displayName = "Hide Spare Wheel";
                animPeriod = 1e-05;
                source = "user";
                useSource = 1;
                };
        };
        displayName = "WO CJ-2 (Open)";
        hiddenSelectionsTextures[] = {"ww2\spe_assets_t\vehicles\wheeled_u1_t\g503_mb\g503_1_co.paa","ww2\spe_assets_t\vehicles\wheeled_u1_t\g503_mb\g503_2_co.paa","ww2\spe_assets_t\vehicles\wheeled_u1_t\g503_mb\g503_3_co.paa","","","","","","","","",""};
    };
};