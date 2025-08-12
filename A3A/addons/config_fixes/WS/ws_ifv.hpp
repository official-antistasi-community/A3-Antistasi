//WS - ws_ifv.hpp

//Marshall
//Ion

class APC_Wheeled_01_base_F;
class APC_Wheeled_01_command_base_lxWS : APC_Wheeled_01_base_F { class EventHandlers; };    // also used for NATO
class B_ION_APC_Wheeled_01_command_lxWS: APC_Wheeled_01_command_base_lxWS {};
class a3a_ION_APC_Wheeled_01_command_lxWS : B_ION_APC_Wheeled_01_command_lxWS
{
    animationList[] = {"showBags",0.5,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1};
	class EventHandlers : EventHandlers
	{
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
	};
};
class B_APC_Wheeled_01_cannon_lxWS;
class B_ION_APC_Wheeled_01_cannon_lxWS: B_APC_Wheeled_01_cannon_lxWS { class EventHandlers; };
class a3a_ION_APC_Wheeled_01_cannon_lxWS : B_ION_APC_Wheeled_01_cannon_lxWS
{
    scope = 2;
    animationList[] = {"showBags",0.5,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1};
	class EventHandlers : EventHandlers
	{
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
	};
};
class B_D_APC_Wheeled_01_atgm_lxWS;
class a3a_ION_APC_Wheeled_01_atgm : B_D_APC_Wheeled_01_atgm_lxWS {
    side = 1;
    crew = "B_ION_Soldier_lxWS";
    faction = "BLU_ION_lxWS";
    textureList[] = {"ION_BLACK", 1};
    hiddenSelectionsTextures[] = {"lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_ion_base_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\apc_wheeled_ion_adds_co.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\apc_wheeled_ion_tows_co.paa","a3\armor_f\Data\camonet_AAF_stripe_desert_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\cage_black_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_ion_lxws_CO.paa"};
};

//NATO
class a3a_APC_Wheeled_01_command_lxWS : APC_Wheeled_01_command_base_lxWS
{
    animationList[] = {"showBags",0.5,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1};
	class EventHandlers : EventHandlers
	{
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
	};
};
class B_T_APC_Wheeled_01_command_lxWS : APC_Wheeled_01_command_base_lxWS {};
class a3a_T_APC_Wheeled_01_command_lxWS : B_T_APC_Wheeled_01_command_lxWS
{
    animationList[] = {"showBags",0.5,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1};
	class EventHandlers : EventHandlers
	{
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
	};
};

//Iskatel/Kamysh
//Arid
class O_APC_Tracked_02_30mm_lxWS;
class a3a_APC_Tracked_02_30mm_lxWS : O_APC_Tracked_02_30mm_lxWS
{
    animationList[] = {"showTracks",0.5,"showCamonetHull",0,"showBags",0.5,"showSLATHull",1};
    // Has initVehicle EH already
};
//Tropical
class O_T_APC_Tracked_02_30mm_lxWS;
class a3a_T_APC_Tracked_02_30mm_lxWS : O_T_APC_Tracked_02_30mm_lxWS
{
    animationList[] = {"showTracks",0.5,"showCamonetHull",0,"showBags",0.5,"showSLATHull",1};
    // Has initVehicle EH already
};
//SFIA
class O_SFIA_APC_Tracked_02_30mm_lxWS;
class a3a_SFIA_APC_Tracked_02_30mm_lxWS : O_SFIA_APC_Tracked_02_30mm_lxWS
{
    animationList[] = {"showTracks",0.5,"showCamonetHull",0,"showBags",0.5,"showSLATHull",1};
    // Has initVehicle EH already
};
class O_SFIA_APC_Tracked_02_cannon_lxWS;
class a3a_SFIA_APC_Tracked_02_cannon_lxWS : O_SFIA_APC_Tracked_02_cannon_lxWS
{
    animationList[] = {"showTracks",0.5,"showCamonetHull",0,"showBags",0.5,"showSLATHull",1};
    // Has initVehicle EH already
};
//ION
class a3a_ION_APC_Tracked_02_30mm : O_APC_Tracked_02_30mm_lxWS
{
    side = 1;
    crew = "B_ION_Soldier_lxWS";
    faction = "BLU_ION_lxWS";
    animationList[] = {"showTracks",1,"showCamonetHull",0,"showBags",0.2,"showSLATHull",1};
    textureList[] = {"Grey", 1};
    hiddenSelectionsTextures[] = {"lxWS\vehicles_1_f_lxws\APC_Tracked_02\data\APC_Tracked_02_ext_01_black_CO.paa","lxWS\vehicles_1_f_lxws\APC_Tracked_02\data\APC_Tracked_02_ext_02_black_CO.paa","lxWS\vehicles_1_f_lxws\APC_Tracked_02\data\APC_Tracked_02_ext_03_black_CO.paa","lxWS\vehicles_1_f_lxws\APC_Tracked_02\data\APC_Tracked_02_30mm_black_co.paa","A3\Armor_F\Data\camonet_CSAT_Stripe_Desert_CO.paa","lxWS\vehicles_1_f_lxws\APC_Tracked_02\data\cage_black_CO.paa"};
    // Has initVehicle EH already
};
