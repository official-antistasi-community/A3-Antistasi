//Vanilla - ifv.hpp

//Marshall
class B_APC_Wheeled_01_base_F;
class B_APC_Wheeled_01_cannon_F : B_APC_Wheeled_01_base_F { class EventHandlers; };
class a3a_B_APC_Wheeled_01_cannon_F : B_APC_Wheeled_01_cannon_F
{
    animationList[] = {"showBags",0.5,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class B_T_APC_Wheeled_01_cannon_F : B_APC_Wheeled_01_cannon_F {};
class a3a_B_T_APC_Wheeled_01_cannon_F : B_T_APC_Wheeled_01_cannon_F
{
    animationList[] = {"showBags",0.5,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};

//Rhino
class AFV_Wheeled_01_base_F;
class B_AFV_Wheeled_01_cannon_F : AFV_Wheeled_01_base_F { class EventHandlers; };
class a3a_AFV_Wheeled_01_cannon_F : B_AFV_Wheeled_01_cannon_F
{
    animationList[] = {"showCamonetHull",0,"showCamonetCannon",0,"showCamonetTurret",0,"showSLATHull",1};
    // Already has initVehicle EH
};
class B_T_AFV_Wheeled_01_cannon_F : AFV_Wheeled_01_base_F { class EventHandlers; };
class a3a_T_AFV_Wheeled_01_cannon_F :  B_T_AFV_Wheeled_01_cannon_F
{
    animationList[] = {"showCamonetHull",0,"showCamonetCannon",0,"showCamonetTurret",0,"showSLATHull",1};
    // Already has initVehicle EH
};

//Gorgon
class I_APC_Wheeled_03_base_F;
class I_APC_Wheeled_03_cannon_F : I_APC_Wheeled_03_base_F { class EventHandlers; }
class a3a_APC_Wheeled_03_cannon_F : I_APC_Wheeled_03_cannon_F
{
    animationList[] = {"showCamonetHull",0,"showBags",0.3,"showBags2",0.3,"showTools",0.3,"showSLATHull",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class a3a_APC_Wheeled_03_cannon_blufor_F : a3a_APC_Wheeled_03_cannon_F
{
    textureList[] = {};
    hiddenSelectionsTextures[] = {"a3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_CO.paa","a3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext2_CO.paa","a3\armor_f_gamma\APC_Wheeled_03\data\RCWS30_CO.paa","a3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_alpha_CO.paa","a3\armor_f\data\camonet_aaf_fia_desert_co.paa","a3\armor_f\data\cage_sand_co.paa"};
};

//Mora
class I_APC_tracked_03_base_F;
class I_APC_tracked_03_cannon_F : I_APC_tracked_03_base_F { class EventHandlers; };
class a3a_APC_tracked_03_cannon_F : I_APC_tracked_03_cannon_F
{
    animationList[] = {"showBags",0.3,"showBags2",0.3,"showCamonetHull",0,"showCamonetTurret",0,"showTools",0.3,"showSLATHull",1,"showSLATTurret",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class I_E_APC_tracked_03_base_F;
class I_E_APC_tracked_03_cannon_F : I_E_APC_tracked_03_base_F { class EventHandlers; };
class a3a_E_APC_tracked_03_cannon_F : I_E_APC_tracked_03_cannon_F
{
    animationList[] = {"showBags",0.3,"showBags2",0.3,"showCamonetHull",0,"showCamonetTurret",0,"showTools",0.3,"showSLATHull",1,"showSLATTurret",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
//Marid
class APC_Wheeled_02_base_v2_F;
class O_APC_Wheeled_02_rcws_v2_F : APC_Wheeled_02_base_v2_F { class EventHandlers; };
class a3a_APC_Wheeled_02_rcws_v2_F : O_APC_Wheeled_02_rcws_v2_F
{
    animationList[] = {"showBags",0.2,"showCanisters",0.2,"showTools",0.2,"showCamonetHull",0,"showSLATHull",1};
    // Already has initVehicle EH
};
class O_T_APC_Wheeled_02_rcws_v2_ghex_F : APC_Wheeled_02_base_v2_F { class EventHandlers; };
class a3a_T_APC_Wheeled_02_rcws_v2_F : O_T_APC_Wheeled_02_rcws_v2_ghex_F
{
    animationList[] = {"showBags",0.2,"showCanisters",0.2,"showTools",0.2,"showCamonetHull",0,"showSLATHull",1};
    // Already has initVehicle EH
};

//Kamysh
class O_APC_Tracked_02_base_F;
class O_APC_Tracked_02_cannon_F : O_APC_Tracked_02_base_F { class EventHandlers; };
class a3a_APC_Tracked_02_cannon_F : O_APC_Tracked_02_cannon_F
{
    animationList[] = {"showTracks",0.5,"showCamonetHull",0,"showBags",0.5,"showSLATHull",1};
    // Already has initVehicle EH
};
class O_T_APC_Tracked_02_cannon_ghex_F : O_APC_Tracked_02_cannon_F {};
class a3a_T_APC_Tracked_02_cannon_F : O_T_APC_Tracked_02_cannon_ghex_F
{
    animationList[] = {"showTracks",0.5,"showCamonetHull",0,"showBags",0.5,"showSLATHull",1};
    // Already has initVehicle EH
};