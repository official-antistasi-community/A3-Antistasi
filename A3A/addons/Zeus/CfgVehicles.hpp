class CfgVehicles
{
    class I_G_Survivor_F;
    class a3a_unit_reb_unarmed : I_G_Survivor_F {
        class EventHandlers;
        editorCategory = "a3a_rebels";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class I_G_Soldier_F;
    class a3a_unit_reb : I_G_Soldier_F {
        class EventHandlers;
        editorCategory = "a3a_rebels";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class I_G_medic_F;
    class a3a_unit_reb_medic : I_G_medic_F {
        class EventHandlers;
        editorCategory = "a3a_rebels";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class I_G_Sharpshooter_F;
    class a3a_unit_reb_sniper : I_G_Sharpshooter_F {
        class EventHandlers;
        editorCategory = "a3a_rebels";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class I_G_Soldier_M_F;
    class a3a_unit_reb_marksman : I_G_Soldier_M_F {
        class EventHandlers;
        editorCategory = "a3a_rebels";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class I_G_Soldier_LAT_F;
    class a3a_unit_reb_lat : I_G_Soldier_LAT_F {
        class EventHandlers;
        editorCategory = "a3a_rebels";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class I_G_Soldier_AR_F;
    class a3a_unit_reb_mg : I_G_Soldier_AR_F {
        class EventHandlers;
        editorCategory = "a3a_rebels";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class I_G_Soldier_exp_F;
    class a3a_unit_reb_exp : I_G_Soldier_exp_F {
        class EventHandlers;
        editorCategory = "a3a_rebels";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class I_G_Soldier_GL_F;
    class a3a_unit_reb_gl : I_G_Soldier_GL_F {
        class EventHandlers;
        editorCategory = "a3a_rebels";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class I_G_Soldier_SL_F;
    class a3a_unit_reb_sl : I_G_Soldier_SL_F {
        class EventHandlers;
        editorCategory = "a3a_rebels";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class I_G_engineer_F;
    class a3a_unit_reb_eng : I_G_engineer_F {
        class EventHandlers;
        editorCategory = "a3a_rebels";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class I_Soldier_AT_F;
    class a3a_unit_reb_at : I_Soldier_AT_F {
        class EventHandlers;
        editorCategory = "a3a_rebels";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class I_Soldier_AA_F;
    class a3a_unit_reb_aa : I_Soldier_AA_F {
        class EventHandlers;
        editorCategory = "a3a_rebels";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };


    // Base side types

    class B_G_Soldier_F;
    class a3a_unit_west : B_G_Soldier_F {
        class EventHandlers;
        editorCategory = "a3a_occupants";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class O_G_Soldier_F;
    class a3a_unit_east : O_G_Soldier_F {
        class EventHandlers;
        editorCategory = "a3a_invaders";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    class C_Man_1;
    class a3a_unit_civ : C_Man_1 {
        class EventHandlers;
        editorCategory = "a3a_civilian";
        editorSubcategory = "a3a_men_internal";
        scopeCurator = 0;
    };

    //Occupant Military
    
    class a3a_unit_west_rifleman : a3a_unit_west {
        class EventHandlers : EventHandlers {
            PostInit = "this call A3A_fnc_initUnitLoadout";
        };
		displayName = "Rifleman";
        editorSubcategory = "a3a_military";
        scopeCurator = 2;
    };
};
