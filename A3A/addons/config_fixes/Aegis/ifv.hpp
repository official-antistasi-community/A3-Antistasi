//Aegis - ifv.hpp

// Mora/Lancer/Odyniec //
class APC_Tracked_03_base_v2_F;
class I_APC_tracked_03_cannon_v2_F : APC_Tracked_03_base_v2_F { class EventHandlers; };
class a3a_I_APC_tracked_03_cannon_v2_F : I_APC_tracked_03_cannon_v2_F
{
    animationList[] = {"showBags",0.3,"showBags2",0.3,"showCamonetHull",0,"showCamonetTurret",0,"showTools",0.3,"showSLATHull",1,"showSLATTurret",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class I_E_APC_tracked_03_cannon_v2_F : APC_Tracked_03_base_v2_F { class EventHandlers; };
class a3a_I_E_APC_tracked_03_cannon_v2_F : I_E_APC_tracked_03_cannon_v2_F
{
    animationList[] = {"showBags",0.3,"showBags2",0.3,"showCamonetHull",0,"showCamonetTurret",0,"showTools",0.3,"showSLATHull",1,"showSLATTurret",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class B_A_APC_tracked_03_cannon_v2_F : APC_Tracked_03_base_v2_F { class EventHandlers; };
class a3a_B_A_APC_tracked_03_cannon_v2_F : B_A_APC_tracked_03_cannon_v2_F
{
    animationList[] = {"showBags",0.3,"showBags2",0.3,"showCamonetHull",0,"showCamonetTurret",0,"showTools",0.3,"showSLATHull",1,"showSLATTurret",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class B_A_APC_tracked_03_cannon_v2_wdl_F : APC_Tracked_03_base_v2_F { class EventHandlers; };
class a3a_B_A_APC_tracked_03_cannon_v2_wdl_F : B_A_APC_tracked_03_cannon_v2_wdl_F
{
    animationList[] = {"showBags",0.3,"showBags2",0.3,"showCamonetHull",0,"showCamonetTurret",0,"showTools",0.3,"showSLATHull",1,"showSLATTurret",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class B_A_APC_tracked_03_cannon_v2_tna_F : APC_Tracked_03_base_v2_F { class EventHandlers; };
class a3a_B_A_APC_tracked_03_cannon_v2_tna_F : B_A_APC_tracked_03_cannon_v2_tna_F
{
    animationList[] = {"showBags",0.3,"showBags2",0.3,"showCamonetHull",0,"showCamonetTurret",0,"showTools",0.3,"showSLATHull",1,"showSLATTurret",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};

// Marshall/Borsuk //
class APC_Wheeled_01_base_v2_F;
class B_APC_Wheeled_01_cannon_v2_F : APC_Wheeled_01_base_v2_F { class EventHandlers; };
class a3a_B_APC_Wheeled_01_cannon_v2_F : B_APC_Wheeled_01_cannon_v2_F
{
    animationList[] = {"showBags",0.5,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class B_W_APC_Wheeled_01_cannon_v2_F : APC_Wheeled_01_base_v2_F { class EventHandlers; };
class a3a_B_W_APC_Wheeled_01_cannon_v2_F : B_W_APC_Wheeled_01_cannon_v2_F
{
    animationList[] = {"showBags",0.5,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class B_T_APC_Wheeled_01_cannon_v2_F : APC_Wheeled_01_base_v2_F { class EventHandlers; };
class a3a_B_T_APC_Wheeled_01_cannon_v2_F : B_T_APC_Wheeled_01_cannon_v2_F
{
    animationList[] = {"showBags",0.5,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class Aegis_I_E_APC_Wheeled_01_cannon_v2_F : APC_Wheeled_01_base_v2_F { class EventHandlers; };
class a3a_Aegis_I_E_APC_Wheeled_01_cannon_v2_F : Aegis_I_E_APC_Wheeled_01_cannon_v2_F
{
    animationList[] = {"showBags",0.5,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};

// Marid/Kazak //
class APC_Wheeled_02_base_v2_F;
class O_APC_Wheeled_02_rcws_v2_F : APC_Wheeled_02_base_v2_F { class EventHandlers; };
class a3a_O_APC_Wheeled_02_rcws_v2_F : O_APC_Wheeled_02_rcws_v2_F
{
    animationList[] = {"showBags",0.2,"showCanisters",0.2,"showTools",0.2,"showCamonetHull",0,"showSLATHull",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class O_T_APC_Wheeled_02_rcws_v2_ghex_F : APC_Wheeled_02_base_v2_F { class EventHandlers; };
class a3a_O_T_APC_Wheeled_02_rcws_v2_ghex_F : O_T_APC_Wheeled_02_rcws_v2_ghex_F
{
    animationList[] = {"showBags",0.2,"showCanisters",0.2,"showTools",0.2,"showCamonetHull",0,"showSLATHull",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class O_R_APC_Wheeled_02_rcws_v2_F : APC_Wheeled_02_base_v2_F { class EventHandlers; };
class a3a_O_R_APC_Wheeled_02_rcws_v2_F : O_R_APC_Wheeled_02_rcws_v2_F
{
    animationList[] = {"showBags",0.2,"showCanisters",0.2,"showTools",0.2,"showCamonetHull",0,"showSLATHull",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};

// Kamysh/Okhotnik //
class O_APC_Tracked_02_base_F;
class O_APC_Tracked_02_cannon_F : O_APC_Tracked_02_base_F { class EventHandlers; };
class a3a_O_APC_Tracked_02_cannon_F : O_APC_Tracked_02_cannon_F
{
    animationList[] = {"showTracks",0.5,"showCamonetHull",0,"showBags",0.5,"showSLATHull",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class O_T_APC_Tracked_02_cannon_ghex_F : O_APC_Tracked_02_base_F { class EventHandlers; };
class a3a_O_T_APC_Tracked_02_cannon_ghex_F : O_T_APC_Tracked_02_cannon_ghex_F
{
    animationList[] = {"showTracks",0.5,"showCamonetHull",0,"showBags",0.5,"showSLATHull",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};
class O_APC_Tracked_02_30mm_lxWS : O_APC_Tracked_02_cannon_F {};
class Aegis_O_R_APC_Tracked_02_30mm_lxWS : O_APC_Tracked_02_30mm_lxWS {};
class a3a_Aegis_O_R_APC_Tracked_02_30mm_lxWS : Aegis_O_R_APC_Tracked_02_30mm_lxWS
{
    animationList[] = {"showTracks",0.5,"showCamonetHull",0,"showBags",0.5,"showSLATHull",1};
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
};

// Bogatyr //
class APC_Wheeled_04_base_F;
class O_R_APC_Wheeled_04_cannon_F : APC_Wheeled_04_base_F { class Turrets;};
class a3a_O_R_APC_Wheeled_04_cannon_base : O_R_APC_Wheeled_04_cannon_F { scope = 0; class EventHandlers; class Turrets : Turrets { class MainTurret; }; };
class a3a_O_R_APC_Wheeled_04_cannon_F : a3a_O_R_APC_Wheeled_04_cannon_base
{
    scope = 2;
    class EventHandlers : EventHandlers
    {
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
    };
    class Turrets : Turrets 
    {
        class MainTurret : MainTurret
        {
            magazines[] = {"140Rnd_30mm_MP_shells_Tracer_Green","140Rnd_30mm_MP_shells_Tracer_Green","60Rnd_30mm_APFSDS_shells_Tracer_Green","60Rnd_30mm_APFSDS_shells_Tracer_Green","2000Rnd_762x51_Belt_Green","4rnd_Vorona_HEAT","4rnd_Vorona_HE"};
            weapons[] = {"autocannon_30mm_CTWS","LMG_coax_ext","missiles_Vorona_vehicle"};
        };
    };
};
