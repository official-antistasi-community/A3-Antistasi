// Real defaults are set in functions/init/fn_initParams.sqf and should match the descriptions below
// 9999 is a special value that causes that parameter to be loaded from the last save, if any
// 9998 is a reserved value and should not be used

class Params
{
    class howTo0
    {
        title = $STR_antistasi_param_howTo0;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class howTo1
    {
        title = $STR_antistasi_param_howTo1;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class howTo2
    {
        title = $STR_antistasi_param_howTo2;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class howToSpacer
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class loadSave
    {
        title = $STR_antistasi_param_loadSave;
        values[] = {1,0};
        texts[] = {$STR_lib_info_yes,$STR_lib_info_no};
        default = 1;
    };
    class gameMode
    {
        title = $STR_antistasi_param_gameMode;
        values[] = {9999,1,2,3};
        texts[] = {$STR_antistasi_param_gameMode_default, $STR_antistasi_param_gameMode_Reb_vs_Gov_vs_Inv, $STR_antistasi_param_gameMode_Reb_vs_Gov_and_Inv, $STR_antistasi_param_gameMode_Reb_vs_Gov};
        default = 9999;
    };
    class autoSave
    {
        title = $STR_antistasi_param_autoSave;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_yes,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class autoSaveInterval
    {
        title = $STR_antistasi_param_autoSaveInterval;
        values[] = {9999,600,1200,1800,3600,5400};
        texts[] = {$STR_antistasi_param_default_60,"10","20","30","60","90"};
        default = 9999;
    };
    class membership
    {
        title = $STR_antistasi_param_membership;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_yes,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class switchComm
    {
        title = $STR_antistasi_param_switchComm;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_yes,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class tkPunish
    {
        title = $STR_antistasi_param_tkPunish;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_yes,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class mRadius
    {
        title = $STR_antistasi_param_mRadius;
        values[] = {9999,2000,4000,6000,8000,10000,12000};
        texts[] = {$STR_antistasi_param_default_4000,"2000","4000","6000","8000","10000","12000"};
        default = 9999;
    };
    class pMarkers
    {
        title = $STR_antistasi_param_pMarkers;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_yes,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class AISkill
    {
        title = $STR_antistasi_param_AISkill;
        values[] = {9999,1,2,3};
        texts[] = {$STR_antistasi_param_AISkill_default,$STR_antistasi_param_diff_easy,$STR_antistasi_param_diff_normal,$STR_antistasi_param_diff_hard};
        default = 9999;
    };
    class unlockItem
    {
        title = $STR_antistasi_param_unlockItem;
        values[] = {9999,15,25,40,1e6};
        texts[] = {$STR_antistasi_param_default_25,"15","25","40","1 000 000"};
        default = 9999;
    };
    class memberOnlyMagLimit
    {
        title = $STR_antistasi_param_memberOnlyMagLimit;
        values[] = {9999,10,20,30,40,50,60};
        texts[] = {$STR_antistasi_param_default_40,"10","20","30","40","50","60"};
        default = 9999;
    };
    class civTraffic
    {
        title = $STR_antistasi_param_civTraffic;
        values[] = {9999,0,1,2,4,};
        texts[] = {$STR_antistasi_param_civTraffic_default,$STR_A3_None,$STR_A3_OPTIONS_LOW,$STR_A3_OPTIONS_MEDIUM,$STR_A3_OPTIONS_HIGH};
        default = 9999;
    };
    class memberSlots
    {
        title = $STR_antistasi_param_memberSlots;
        values[] = {9999,0,20,40,60,80,100};
        texts[] = {$STR_antistasi_param_memberSlots_default,$STR_A3_None,"20%","40%","60%","80%","All"};
        default = 9999;
    };
    class memberDistance
    {
        title = $STR_antistasi_param_memberDistance;
        values[] = {9999,4000,5000,6000,7000,8000,16000};
        texts[] = {$STR_antistasi_param_memberDistance_default,"4 Kmts","5 Kmts","6 Kmts","7 Kmts","8 Kmts",$STR_a3_ta_vanguard_unlimited};
        default = 9999;
    };
    class allowFT
    {
        title = $STR_antistasi_param_allowFT;
        values[] = {9999,0,1};
        texts[] = {$STR_antistasi_param_allowFT_default,$STR_antistasi_param_allowFT_friendlyPos,$STR_antistasi_param_allowFT_onlyAirHQ};
        default = 9999;
    };
    class napalmEnabled
    {
        title = $STR_antistasi_param_napalmEnabled;
        values[] = {9999,0,1};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_no,$STR_lib_info_yes};
        default = 9999;
    };
    class unlockedUnlimitedAmmo
    {
        title = $STR_antistasi_param_unlockedUnlimitedAmmo;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class allowGuidedLaunchers
    {
        title = $STR_antistasi_param_allowGuidedLaunchers;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class allowUnlockedExplosives
    {
        title = $STR_antistasi_param_allowUnlockedExplosives;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class startWithLongRangeRadio
    {
        title = $STR_antistasi_param_startWithLongRangeRadio;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_yes,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class helmetLossChance
    {
        title = $STR_antistasi_param_helmetLossChance;
        values[] = {9999,0,33,66,100};
        texts[] = {$STR_antistasi_param_helmetLossChance_default,$STR_a3_wl_param15_value1,$STR_antistasi_param_helmetLossChance_Sometimes,$STR_antistasi_param_helmetLossChance_Often,$STR_a3_rscdisplaycampaignlobby_always};
        default = 9999;
    };
    class Spacer10
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class EnableLootToCrate
    {
        title = $STR_antistasi_param_EnableLootToCrate;
        values[] = {9999, 0, 1};
        texts[] = {$STR_antistasi_param_default_enabled, $STR_disabled, $STR_enabled};
        default = 9999;
    };
    class LTCLootUnlocked
    {
        title = $STR_antistasi_param_LTCLootUnlocked;
        values[] = {9999, 0, 1};
        texts[] = {$STR_antistasi_param_default_disabled, $STR_disabled, $STR_enabled};
        default = 9999;
    };
    class Spacer11
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class Kart
    {
        title = $STR_antistasi_param_Kart;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class Mark
    {
        title = $STR_antistasi_param_Mark;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class Heli
    {
        title = $STR_antistasi_param_Heli;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class Expansion
    {
        title = $STR_antistasi_param_Expansion;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class Jets
    {
        title = $STR_antistasi_param_Jets;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class Orange
    {
        title = $STR_antistasi_param_Orange;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class Tanks
    {
        title = $STR_antistasi_param_Tanks;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class GlobMob
    {
        title = $STR_antistasi_param_GlobMob;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class Enoch
    {
        title = $STR_antistasi_param_Enoch;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class OfficialMod
    {
        title = $STR_antistasi_param_OfficialMod;
        values[] = {9999,1,0};
        texts[] = {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class AoW
    {
        title = $STR_antistasi_param_AoW;
        values[] = {9999,1,0};
        texts[] =  {$STR_antistasi_param_default_no,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
        class VN
    {
        title = $STR_antistasi_param_SOG;
        values[] = {9999,1,0};
        texts[] =  {$STR_antistasi_param_default_yes,$STR_lib_info_yes,$STR_lib_info_no};
        default = 9999;
    };
    class Spacer0
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class AdvancedParams
    {
        title = $STR_antistasi_param_AdvancedParams;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class LogLevel
    {
        title = $STR_antistasi_param_LogLevel;
        values[] = {9999,1,2,3};
        texts[] = {$STR_antistasi_param_LogLevel_default, "Error", "Info", "Debug"};
        default = 9999;
    };
    class SupportOptions
    {
        title = $STR_antistasi_param_SupportOptions;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class allowUnfairSupports
    {
        title = $STR_antistasi_param_allowUnfairSupports;
        values[] = {9999, 0, 1};
        texts[] = {$STR_antistasi_param_default_notAllowed, $STR_antistasi_param_notAllowed, $STR_antistasi_param_Allowed};
        default = 9999;
    }
    class allowFuturisticSupports
    {
        title = $STR_antistasi_param_allowFuturisticSupports;
        values[] = {9999, 0, 1};
        texts[] = {$STR_antistasi_param_default_notAllowed, $STR_antistasi_param_notAllowed, $STR_antistasi_param_Allowed};
        default = 9999;
    }
    class CrateOptions
    {
        title = $STR_antistasi_param_CrateOptions;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class truelyRandomCrates
    {
        title = $STR_antistasi_param_truelyRandomCrates;
        values[] = {9999, 0, 1};
        texts[] = {$STR_antistasi_param_default_false, $STR_antistasi_param_false, $STR_antistasi_param_true};
        default = 9999;
    };
    class cratePlayerScaling
    {
        title = $STR_antistasi_param_cratePlayerScaling;
        values[] = {9999, 0, 1};
        texts[] = {$STR_antistasi_param_default_true, $STR_antistasi_param_false, $STR_antistasi_param_true};
        default = 9999;
    };
    class crateWepTypeMax
    {
        title = $STR_antistasi_param_crateWepTypeMax;
        values[] = {9999,0,2,4,6,8,12,16};
        texts[] = {$STR_antistasi_param_default_9,"1","3","5","7","9","13","17"};
        default = 9999;
    };
    class crateWepNumMax
    {
        title = $STR_antistasi_param_crateWepNumMax;
        values[] = {9999,0,1,3,5,8,10,15};
        texts[] = {$STR_antistasi_param_default_8,$STR_A3_None,"1","3","5","8","10","15"};
        default = 9999;
    };
    class Spacer1
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateItemTypeMax
    {
        title = $STR_antistasi_param_crateItemTypeMax;
        values[] = {9999,0,2,4,9};
        texts[] = {$STR_antistasi_param_default_5,"1","3","5","10"};
        default = 9999;
    };
    class crateItemNumMax
    {
        title = $STR_antistasi_param_crateItemNumMax;
        values[] = {9999,0,1,3,5,10,15};
        texts[] = {$STR_antistasi_param_default_5,$STR_A3_None,"1","3","5","10","15"};
        default = 9999;
    };
    class Spacer2
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateAmmoTypeMax
    {
        title = $STR_antistasi_param_crateAmmoTypeMax;
        values[] = {9999,0,2,4,6,9,14,19};
        texts[] = {$STR_antistasi_param_default_7,"1","3","5","7","10","15","20"};
        default = 9999;
    };
    class crateAmmoNumMax
    {
        title = $STR_antistasi_param_crateAmmoNumMax;
        values[] = {9999,0,1,3,5,10,15,20,25,30};
        texts[] = {$STR_antistasi_param_default_20,$STR_A3_None,"1","3","5","10","15","20","25","30"};
        default = 9999;
    };
    class Spacer3
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateExplosiveTypeMax
    {
        title = $STR_antistasi_param_crateExplosiveTypeMax;
        values[] = {9999,0,2,4,9};
        texts[] = {$STR_antistasi_param_default_3,"1","3","5","10"};
        default = 9999;
    };
    class crateExplosiveNumMax
    {
        title = $STR_antistasi_param_crateExplosiveNumMax;
        values[] = {9999,0,1,3,5,10,15};
        texts[] = {$STR_antistasi_param_default_5,$STR_A3_None,"1","3","5","10","15"};
        default = 9999;
    };
    class Spacer4
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateAttachmentTypeMax
    {
        title = $STR_antistasi_param_crateAttachmentTypeMax;
        values[] = {9999,0,2,4,6,9,14,19};
        texts[] = {$STR_antistasi_param_default_7,"1","3","5","7","10","15","20"};
        default = 9999;
    };
    class crateAttachmentNumMax
    {
        title = $STR_antistasi_param_crateAttachmentNumMax;
        values[] = {9999,0,1,3,5,10,15,20,25,30};
        texts[] = {$STR_antistasi_param_default_15,$STR_A3_None,"1","3","5","10","15","20","25","30"};
        default = 9999;
    };
    class Spacer5
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateBackpackTypeMax
    {
        title = $STR_antistasi_param_crateBackpackTypeMax;
        values[] = {9999,0,2,4,9};
        texts[] = {$STR_antistasi_param_default_0,"1","3","5","10"};
        default = 9999;
    };
    class crateBackpackNumMax
    {
        title = $STR_antistasi_param_crateBackpackNumMax;
        values[] = {9999,0,1,3,5,10,15};
        texts[] = {$STR_antistasi_param_default_3,$STR_A3_None,"1","3","5","10","15"};
        default = 9999;
    };
    class Spacer6
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateVestTypeMax
    {
        title = $STR_antistasi_param_crateVestTypeMax;
        values[] = {9999,0,2,4,9};
        texts[] = {$STR_antistasi_param_default_0,"1","3","5","10"};
        default = 9999;
    };
    class crateVestNumMax
    {
        title = $STR_antistasi_param_crateVestNumMax;
        values[] = {9999,0,1,3,5,10,15};
        texts[] = {$STR_antistasi_param_default_3,$STR_A3_None,"1","3","5","10","15"};
        default = 9999;
    };
    class Spacer7
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateHelmetTypeMax
    {
        title = $STR_antistasi_param_crateHelmetTypeMax;
        values[] = {9999,0,2,4,9};
        texts[] = {$STR_antistasi_param_default_0,"1","3","5","10"};
        default = 9999;
    };
    class crateHelmetNumMax
    {
        title = $STR_antistasi_param_crateHelmetNumMax;
        values[] = {9999,0,1,3,5,10,15};
        texts[] = {$STR_antistasi_param_default_0,$STR_A3_None,"1","3","5","10","15"};
        default = 9999;
    };
    class Spacer8
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateDeviceTypeMax
    {
        title = $STR_antistasi_param_crateDeviceTypeMax;
        values[] = {9999,0,2,4,9};
        texts[] = {$STR_antistasi_param_default_3,"1","3","5","10"};
        default = 9999;
    };
    class crateDeviceNumMax
    {
        title = $STR_antistasi_param_crateDeviceNumMax;
        values[] = {9999,0,1,3,5,10,15};
        texts[] = {$STR_antistasi_param_default_3,$STR_A3_None,"1","3","5","10","15"};
        default = 9999;
    };
};
