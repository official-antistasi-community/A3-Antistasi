class CfgVehicles
{
    // Unbreak the vanilla inheritance chain
    class Man;
    class CAManBase : Man {
        class EventHandlers;
    };
    class SoldierGB : CAManBase {
        class EventHandlers : EventHandlers {};
    };
    class I_G_Soldier_base_F : SoldierGB {
        class EventHandlers : EventHandlers
        {
            init = "if (local (_this select 0)) then {[(_this select 0), [], []] call BIS_fnc_unitHeadgear;};";
            //init line to perserve the behaviour BI intended for the I_G_Soldier_base_F classs
        };
    };

    // Rebel AI unit types
    
    //don't need to change this one?
    class I_G_Survivor_F : I_G_Soldier_base_F{};
    class a3a_unit_reb_unarmed : I_G_Survivor_F {};

    class I_G_Soldier_F : I_G_Soldier_base_F{};
    class a3a_unit_reb : I_G_Soldier_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_medic_F : I_G_Soldier_base_F{};
    class a3a_unit_reb_medic : I_G_medic_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Sharpshooter_F : I_G_Soldier_base_F{};
    class a3a_unit_reb_sniper : I_G_Sharpshooter_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Soldier_M_F : I_G_Soldier_base_F{};
    class a3a_unit_reb_marksman : I_G_Soldier_M_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Soldier_LAT_F : I_G_Soldier_base_F{};
    class a3a_unit_reb_lat : I_G_Soldier_LAT_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Soldier_AR_F : I_G_Soldier_base_F{};
    class a3a_unit_reb_mg : I_G_Soldier_AR_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Soldier_exp_F : I_G_Soldier_base_F{};
    class a3a_unit_reb_exp : I_G_Soldier_exp_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Soldier_GL_F : I_G_Soldier_base_F{};
    class a3a_unit_reb_gl : I_G_Soldier_GL_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Soldier_SL_F : I_G_Soldier_base_F{};
    class a3a_unit_reb_sl : I_G_Soldier_SL_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_engineer_F : I_G_Soldier_base_F{};
    class a3a_unit_reb_eng : I_G_engineer_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_Soldier_AT_F;
    class a3a_unit_reb_at : I_Soldier_AT_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_Soldier_AA_F;
    class a3a_unit_reb_aa : I_Soldier_AA_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_officer_F : I_G_Soldier_base_F{};
    class a3a_unit_reb_petros : I_G_officer_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    // Base side types

    class B_G_Soldier_F : I_G_Soldier_base_F{};
    class a3a_unit_west : B_G_Soldier_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class O_G_Soldier_F : I_G_Soldier_base_F{};
    class a3a_unit_east : O_G_Soldier_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class C_Man_1;
    class a3a_unit_civ : C_Man_1 {};

};
