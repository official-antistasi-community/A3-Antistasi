class Params
{
    class gameMode
    {
        title = $STR_A3A_Params_gameMode_title;
        values[] = {1,2,3};
        texts[] = {$STR_A3A_Params_gameMode_RvGvI, $STR_A3A_Params_gameMode_RvGaI, $STR_A3A_Params_gameMode_RvG};
        default = 1;
    };
    class autoSave
    {
        title = $STR_A3A_Params_autoSave_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class autoSaveInterval
    {
        title = $STR_A3A_Params_autoSaveInterval_title;
        values[] = {600,1200,1800,3600,5400};
        texts[] = {"10","20","30","60","90"};
        default = 3600;
    };
    class playerMarkersEnabled
    {
        title = $STR_A3A_Params_playerMarkersEnabled_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class limitedFT
    {
        title = $STR_A3A_Params_limitedFT_title;
        values[] = {0,1,2};
        texts[] = {$STR_A3A_Params_limitedFT_any, $STR_A3A_Params_limitedFT_hq, $STR_A3A_Params_generic_none};
        default = 1;
    };
    class civTraffic
    {
        title = $STR_A3A_Params_civTraffic_title;
        values[] = {0,1,2,4};
        texts[] = {$STR_A3A_Params_generic_none, $STR_A3A_Params_generic_low, $STR_A3A_Params_generic_medium, $STR_A3A_Params_generic_high};
        default = 2;
    };
    class distanceMission
    {
        title = $STR_A3A_Params_distanceMission_title;
        values[] = {2000,4000,6000,8000,10000,12000};
        texts[] = {"2000","4000","6000","8000","10000","12000"};
        default = 4000;
    };
    class distanceSPWN
    {
        title = $STR_A3A_Params_distanceSPWN_title;
        values[] = {700,800,900,1000,1100,1200};
        texts[] = {"700","800","900","1000","1100","1200"};
        default = 1000;
    };
    class enemyNearDistance
    {
        title = $STR_A3A_Params_enemyNearDistance_title;
        values[] = {200,300,400,500};
        texts[] = {"200","300","400","500"};
        default = 300;
    };
    class globalCivilianMax
    {
        title = $STR_A3A_Params_globalCivilianMax_title;
        values[] = {0,2,5,10,15,20};
        texts[] = {"0","2","5","10","15","20"};
        default = 10;
    };
    class maxCiviliansPerTown
    {
        title = $STR_A3A_Params_maxCiviliansPerTown_title;
        values[] = {0,2,5,10,15};
        texts[] = {"0","2","5","10","15"};
        default = 5;
    };
    class initialPlayerMoney
    {
        title = $STR_A3A_Params_initialPlayerMoney_title;
        values[] = {0, 100, 250, 500, 1000, 2500};
        texts[] = {"0","100","250","500","1000","2500"};
        default = 100;
    };
    class initialFactionMoney
    {
        title = $STR_A3A_Params_initialFactionMoney_title;
        values[] = {0,1000,2500,5000,10000};
        texts[] = {"0","1000","2500","5000","10000"};
        default = 1000;
    };
    class initialHr
    {
        title = $STR_A3A_Params_initialHr_title;
        values[] = {0, 8, 16, 24, 32, 50};
        texts[] = {"0","8","16","24","32","50"};
        default = 8;
    };
    class A3A_idleTimeout
    {
        title = $STR_A3A_Params_idleTimeout_title;
        values[] = {120,300,900,1800,9999999};
        texts[] = {$STR_A3A_Params_generic_2min, $STR_A3A_Params_generic_5min, $STR_A3A_Params_generic_15min, $STR_A3A_Params_generic_30min, $STR_A3A_Params_generic_disabled};
        default = 900;
    };
    class A3A_gcMaxObjects
    {
        title = $STR_A3A_Params_gcMaxObjects_title;
        values[] = {50,100,150,200,300};
        texts[] = {"50","100","150","200","300"};
        default = 150;
    };
    class A3A_GCThreshold
    {
        title = $STR_A3A_Params_GCThreshold_title;
        values[] = {3600, 7200, 10800, 14400, 0};
        texts[] = {"1hr", "2hrs", "3hrs", "4hrs", $STR_A3A_Params_generic_disabled};
        Default = 14400;
    };
    class A3A_reviveTime
    {
        title = $STR_A3A_Params_reviveTime_title;
        values[] = {5,10,15};
        texts[] = {$STR_A3A_Params_reviveTime_5s, $STR_A3A_Params_reviveTime_10s, $STR_A3A_Params_reviveTime_15s};
        default = 10;
    };
    class A3A_selfReviveMethods
    {
        title = $STR_A3A_Params_selfReviveMethods_title;
        values[] = {0,1};
        texts[] = {$STR_A3A_Params_generic_disabled, $STR_A3A_Params_selfReviveMethods_withstand};
        default = 1;
    };
    class A3A_builderPermissions
    {
        title = $STR_A3A_Params_builderPermissions_title;
        values[] = {1, 2, 3};
        texts[] = {$STR_A3A_Params_builderPermissions_tl, $STR_A3A_Params_builderPermissions_engi, $STR_A3A_Params_builderPermissions_both};
        default = 3;
    };
    class A3A_removeRestore
    {
        title = $STR_A3A_Params_removeRestore_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class A3A_sendDownedNotification
    {
        title = $STR_A3A_Params_sendDownedNotification_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };

    class SpacerMembership
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class TitleMembership
    {
        title = $STR_A3A_Params_TitleMembership_title;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class membershipEnabled
    {
        title = $STR_A3A_Params_membershipEnabled_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class A3A_guestCommander
    {
        title = $STR_A3A_Params_guestCommander_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class tkPunish
    {
        title = $STR_A3A_Params_tkPunish_title;
        values[] = {0,1,2};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip,$STR_antistasi_dialogs_generic_button_yes_text,$STR_A3A_Params_tkPunish_logonly};
        default = 2;
    };
    class memberSlots
    {
        title = $STR_A3A_Params_memberSlots_title;
        values[] = {0,20,40,60,80,100};
        texts[] = {$STR_A3A_Params_generic_none,"20%","40%","60%","80%", $STR_A3A_Params_generic_all};
        default = 20;
    };
    class memberDistance
    {
        title = $STR_A3A_Params_memberDistance_title;
        values[] = {4000,5000,6000,7000,8000,10000,16000,-1};  // 16000 is left as backwards compatibility
        texts[] = {$STR_A3A_Params_generic_4km, $STR_A3A_Params_generic_5km, $STR_A3A_Params_generic_6km, $STR_A3A_Params_generic_7km, $STR_A3A_Params_generic_8km, $STR_A3A_Params_generic_10km, $STR_A3A_Params_generic_16km, $STR_A3A_Params_generic_unlimited};
        default = 5000;
    };

    class SpacerBalance
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class TitleBalance
    {
        title = $STR_A3A_Params_TitleBalance_title;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class A3A_enemyBalanceMul
    {
        title = $STR_A3A_Params_enemyBalanceMul_title;
        values[] = {4,6,8,10,12,14,17,20,24,28};
        texts[] =  {"0.4x","0.6x","0.8x","1.0x","1.2x","1.4x","1.7x","2.0x","2.4x","2.8x"};
        default = 10;
    };
    class A3A_enemyAttackMul
    {
        attr[] = {"server"};
        title = $STR_A3A_Params_enemyAttackMul_title;
        values[] = {4,6,8,10,12,14,17,20,24,28};
        texts[] =  {"0.4x","0.6x","0.8x","1.0x","1.2x","1.4x","1.7x","2.0x","2.4x","2.8x"};
        default = 10;
    };
    class A3A_invaderBalanceMul
    {
        attr[] = {"server"};
        title = $STR_A3A_Params_invaderBalanceMul_title;
        values[] = {10,11,12,13,14,15};
        texts[] =  {"1.0x","1.1x","1.2x","1.3x","1.4x","1.5x"};
        default = 12;
    };
    class A3A_enemyResponseTime
    {
        attr[] = {"server"};
        title = $STR_A3A_Params_enemyResponseTime_title;
        values[] = {20,15,10,7,5};
        texts[] =  {$STR_A3A_Params_generic_veryslow, $STR_A3A_Params_generic_slow, $STR_A3A_Params_generic_normal, $STR_A3A_Params_generic_fast, $STR_A3A_Params_generic_veryfast};
        default = 10;
    };
    class A3A_attackHQProximityMul
    {
        attr[] = {"server"};
        title = $STR_A3A_Params_attackHQProximityMul_title;
        values[] = {1,2,3,5,8};
        texts[] =  {$STR_A3A_Params_generic_nochange,"2x","3x","5x","8x"};
        default = 3;
    };
    class A3A_enemySkillMul
    {
        title = $STR_A3A_Params_enemySkillMul_title;
        values[] = {0,1,2,3,4};
        texts[] = {$STR_A3A_Params_generic_verylow, $STR_A3A_Params_generic_low, $STR_A3A_Params_generic_normal, $STR_A3A_Params_generic_high, $STR_A3A_Params_generic_veryhigh};
        default = 2;
    };
    class A3A_rebelSkillMul
    {
        title = $STR_A3A_Params_rebelSkillMul_title;
        values[] = {0,1,2,3,4};
        texts[] = {$STR_A3A_Params_generic_verylow, $STR_A3A_Params_generic_low, $STR_A3A_Params_generic_normal, $STR_A3A_Params_generic_high, $STR_A3A_Params_generic_veryhigh};
        default = 2;
    };
    class napalmEnabled
    {
        title = $STR_A3A_Params_napalmEnabled_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class allowUnfairSupports
    {
        attr[] = {"server"};
        title = $STR_A3A_Params_allowUnfairSupports_title;
        values[] = {0, 1};
        texts[] = {$STR_A3A_Params_generic_notallowed, $STR_A3A_Params_generic_allowed};
        default = 0;
    };
    class allowFuturisticSupports
    {
        attr[] = {"server"};
        title = $STR_A3A_Params_allowFuturisticSupports_title;
        values[] = {0, 1};
        texts[] = {$STR_A3A_Params_generic_notallowed, $STR_A3A_Params_generic_allowed};
        default = 0;
    };
    class A3A_rebelGarrisonLimit
    {
        title = $STR_A3A_Params_rebelGarrisonLimit_title;
        tooltip = $STR_A3A_Params_rebelGarrisonLimit_tooltip;
        values[] = {-1, 16, 24, 32};
        texts[] = {$STR_A3A_Params_generic_nolimit, "16", "24", "32"};
        default = 24;
    };

    class SpacerEquipment
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class TitleEquipment
    {
        title = $STR_A3A_Params_TitleEquipment_title;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class minWeaps
    {
        title = $STR_A3A_Params_minWeaps_title;
        values[] = {15,25,40,-1};
        texts[] = {"15","25","40", $STR_A3A_Params_generic_nounlocks};
        default = 25;
    };
    class A3A_guestItemLimit
    {
        title = $STR_A3A_Params_guestItemLimit_title;
        values[] = {0,10,15,25,40};
        texts[] = {$STR_A3A_Params_generic_nolimit,"10","15","25","40"};
        default = 0;
    };
    class unlockedUnlimitedAmmo
    {
        attr[] = {"server"};
        title = $STR_A3A_Params_unlockedUnlimitedAmmo_title;
        values[] = {1,0};
        texts[] = {$STR_antistasi_dialogs_generic_button_yes_text,$STR_antistasi_dialogs_generic_button_no_tooltip};
        default = 0;
    };
    class allowGuidedLaunchers
    {
        attr[] = {"server"};
        title = $STR_A3A_Params_allowGuidedLaunchers_title;
        values[] = {1,0};
        texts[] = {$STR_antistasi_dialogs_generic_button_yes_text,$STR_antistasi_dialogs_generic_button_no_tooltip};
        default = 0;
    };
    class allowUnlockedExplosives
    {
        attr[] = {"server"};
        title = $STR_A3A_Params_allowUnlockedExplosives_title;
        values[] = {1,0};
        texts[] = {$STR_antistasi_dialogs_generic_button_yes_text,$STR_antistasi_dialogs_generic_button_no_tooltip};
        default = 0;
    };
    class startWithLongRangeRadio
    {
        attr[] = {"server"};
        title = $STR_A3A_Params_startWithLongRangeRadio_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class aceFood
    {
        attr[] = {"server"};
        title = $STR_A3A_Params_aceFood_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class helmetLossChance
    {
        title = $STR_A3A_Params_helmetLossChance_title;
        values[] = {0,33,66,100};
        texts[] = {$STR_A3A_Params_generic_never, $STR_A3A_Params_generic_sometimes, $STR_A3A_Params_generic_often, $STR_A3A_Params_generic_always};
        default = 33;
    };
    class LootToCrateRadius
    {
        title = $STR_A3A_Params_LootToCrateRadius_title;
        values[] = {0,10,15,20};
        texts[] = {$STR_A3A_Params_generic_disabled, $STR_A3A_Params_generic_10m, $STR_A3A_Params_generic_15m, $STR_A3A_Params_generic_20m};
        default = 10;
    };
    class LTCLootUnlocked
    {
        title = $STR_A3A_Params_LTCLootUnlocked_title;
        values[] = {0, 1};
        texts[] = {$STR_A3A_Params_generic_disabled, $STR_A3A_Params_generic_enabled};
        default = 0;
    };

    class SpacerLoot
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class TitleLoot
    {
        title = $STR_A3A_Params_TitleLoot_title;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class bobChaosCrates
    {
        title = $STR_A3A_Params_bobChaosCrates_title;
        values[] = {0, 1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class cratePlayerScaling
    {
        title = $STR_A3A_Params_cratePlayerScaling_title;
        values[] = {0, 1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class crateWepTypeMax
    {
        title = $STR_A3A_Params_crateWepTypeMax_title;
        values[] = {0,2,4,6,8,12,16};
        texts[] = {"1","3","5","7","9","13","17"};
        default = 8;
    };
    class crateWepNumMax
    {
        title = $STR_A3A_Params_crateWepNumMax_title;
        values[] = {0,1,3,5,8,10,15};
        texts[] = {$STR_A3A_Params_generic_none,"1","3","5","8","10","15"};
        default = 8;
    };
    class crateItemTypeMax
    {
        title = $STR_A3A_Params_crateItemTypeMax_title;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 4;
    };
    class crateItemNumMax
    {
        title = $STR_A3A_Params_crateItemNumMax_title;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_A3A_Params_generic_none,"1","3","5","10","15"};
        default = 5;
    };
    class crateAmmoTypeMax
    {
        title = $STR_A3A_Params_crateAmmoTypeMax_title;
        values[] = {0,2,4,6,9,14,19};
        texts[] = {"1","3","5","7","10","15","20"};
        default = 6;
    };
    class crateAmmoNumMax
    {
        title = $STR_A3A_Params_crateAmmoNumMax_title;
        values[] = {0,1,3,5,10,15,20,25,30};
        texts[] = {$STR_A3A_Params_generic_none,"1","3","5","10","15","20","25","30"};
        default = 20;
    };
    class crateExplosiveTypeMax
    {
        title = $STR_A3A_Params_crateExplosiveTypeMax_title;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 4;
    };
    class crateExplosiveNumMax
    {
        title = $STR_A3A_Params_crateExplosiveNumMax_title;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_A3A_Params_generic_none,"1","3","5","10","15"};
        default = 5;
    };
    class crateAttachmentTypeMax
    {
        title = $STR_A3A_Params_crateAttachmentTypeMax_title;
        values[] = {0,2,4,6,9,14,19};
        texts[] = {"1","3","5","7","10","15","20"};
        default = 6;
    };
    class crateAttachmentNumMax
    {
        title = $STR_A3A_Params_crateAttachmentNumMax_title;
        values[] = {0,1,3,5,10,15,20,25,30};
        texts[] = {$STR_A3A_Params_generic_none,"1","3","5","10","15","20","25","30"};
        default = 15;
    };
    class crateBackpackTypeMax
    {
        title = $STR_A3A_Params_crateBackpackTypeMax_title;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 0;
    };
    class crateBackpackNumMax
    {
        title = $STR_A3A_Params_crateBackpackNumMax_title;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_A3A_Params_generic_none,"1","3","5","10","15"};
        default = 3;
    };
    class crateVestTypeMax
    {
        title = $STR_A3A_Params_crateVestTypeMax_title;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 0;
    };
    class crateVestNumMax
    {
        title = $STR_A3A_Params_crateVestNumMax_title;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_A3A_Params_generic_none,"1","3","5","10","15"};
        default = 3;
    };
    class crateHelmetTypeMax
    {
        title = $STR_A3A_Params_crateHelmetTypeMax_title;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 0;
    };
    class crateHelmetNumMax
    {
        title = $STR_A3A_Params_crateHelmetNumMax_title;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_A3A_Params_generic_none,"1","3","5","10","15"};
        default = 3;
    };
    class crateDeviceTypeMax
    {
        title = $STR_A3A_Params_crateDeviceTypeMax_title;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 2;
    };
    class crateDeviceNumMax
    {
        title = $STR_A3A_Params_crateDeviceNumMax_title;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_A3A_Params_generic_none,"1","3","5","10","15"};
        default = 3;
    };

    class SpacerDevelopment
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class TitleDevelopment
    {
        title = $STR_A3A_Params_TitleDevelopment_title;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class LogLevel
    {
        title = $STR_A3A_Params_LogLevel_title;
        values[] = {1,2,3,4};
        texts[] = {$STR_A3A_Params_LogLevel_error, $STR_A3A_Params_LogLevel_info, $STR_A3A_Params_LogLevel_debug, $STR_A3A_Params_LogLevel_verbose};
        default = 2;
    };
    class A3A_logDebugConsole
    {
        title = $STR_A3A_Params_logDebugConsole_title;
        values[] = {-1,1,2};
        texts[] = {$STR_A3A_Params_generic_none, $STR_A3A_Params_logDebugConsole_nondev, $STR_A3A_Params_generic_all};
        default = 1;
    };
    class A3A_GUIDevPreview
    {
        title = $STR_A3A_Params_GUIDevPreview_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
};
