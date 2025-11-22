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
            PostInit = "params ['_entity']; _entity call A3A_fnc_initUnitLoadout";
        };
		displayName = "Rifleman";
        editorSubcategory = "a3a_military";
        scopeCurator = 2;
        A3A_loadout = "military_Rifleman";
    };
    class a3a_unit_west_squadleader : a3a_unit_west_rifleman {
        class EventHandlers : EventHandlers {
            PostInit = "params ['_entity']; _entity call A3A_fnc_initUnitLoadout";
        };
		displayName = "Squad Leader";
        A3A_loadout = "military_SquadLeader";
    };
    class a3a_unit_west_medic : a3a_unit_west_rifleman {
        class EventHandlers : EventHandlers {
            PostInit = "params ['_entity']; _entity call A3A_fnc_initUnitLoadout";
        };
		displayName = "Medic";
        A3A_loadout = "military_Medic";
        attendant = 1;
        nameSound = "veh_infantry_medic_s";
        picture = "pictureHeal";
        role = "CombatLifeSaver";
        textPlural = "medics";
        textSingular = "medic";
    };
    class a3a_unit_west_engineer : a3a_unit_west_rifleman {
        class EventHandlers : EventHandlers {
            PostInit = "params ['_entity']; _entity call A3A_fnc_initUnitLoadout";
        };
		displayName = "Engineer";
        A3A_loadout = "military_Engineer";
        engineer = 1;
        canDeactivateMines = 1;
        icon = "iconManEngineer";
        picture = "pictureRepair";
        role = "Sapper";
    };
    class a3a_unit_west_explosivesexpert : a3a_unit_west_rifleman {
        class EventHandlers : EventHandlers {
            PostInit = "params ['_entity']; _entity call A3A_fnc_initUnitLoadout";
        };
		displayName = "Explosives Expert";
        A3A_loadout = "military_ExplosivesExpert";
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "Sapper";
    };
    class a3a_unit_west_grenadier : a3a_unit_west_rifleman {
        class EventHandlers : EventHandlers {
            PostInit = "params ['_entity']; _entity call A3A_fnc_initUnitLoadout";
        };
		displayName = "Grenadier";
        A3A_loadout = "military_Grenadier";
    };
    class a3a_unit_west_LAT : a3a_unit_west_rifleman {
        class EventHandlers : EventHandlers {
            PostInit = "params ['_entity']; _entity call A3A_fnc_initUnitLoadout";
        };
		displayName = "LAT";
        A3A_loadout = "military_LAT";
    };
    class a3a_unit_west_AT : a3a_unit_west_rifleman {
        class EventHandlers : EventHandlers {
            PostInit = "params ['_entity']; _entity call A3A_fnc_initUnitLoadout";
        };
		displayName = "AT";
        A3A_loadout = "military_AT";
    };
    class a3a_unit_west_AA : a3a_unit_west_rifleman {
        class EventHandlers : EventHandlers {
            PostInit = "params ['_entity']; _entity call A3A_fnc_initUnitLoadout";
        };
		displayName = "AA";
        A3A_loadout = "military_AA";
    };
    class a3a_unit_west_machinegunner : a3a_unit_west_rifleman {
        class EventHandlers : EventHandlers {
            PostInit = "params ['_entity']; _entity call A3A_fnc_initUnitLoadout";
        };
		displayName = "Machine Gunner";
        A3A_loadout = "military_MachineGunner";
    };
    class a3a_unit_west_marksman : a3a_unit_west_rifleman {
        class EventHandlers : EventHandlers {
            PostInit = "params ['_entity']; _entity call A3A_fnc_initUnitLoadout";
        };
		displayName = "Marksman";
        A3A_loadout = "military_Marksman";
    };
    class a3a_unit_west_sniper : a3a_unit_west_rifleman {
        class EventHandlers : EventHandlers {
            PostInit = "params ['_entity']; _entity call A3A_fnc_initUnitLoadout";
        };
		displayName = "Sniper";
        A3A_loadout = "military_Sniper";
    };
};
