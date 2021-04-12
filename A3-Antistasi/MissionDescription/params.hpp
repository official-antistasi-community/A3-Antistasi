class Params
{
     class loadSave
     {
          title = "Load last Persistent Save";
          values[] = {1,0};
          texts[] = {"Yes","No"};
          default = 1;
     };
     class gameMode
     {
          title = "Game Mode - Do NOT change this mid mission";
          values[] = {1,2,3};
          texts[] = {"Reb vs Gov vs Inv","Reb vs Gov & Inv","Reb vs Gov"};
          default = 1;
     };
     class autoSave
     {
          title = "Enable Autosave (every X minutes)";
          values[] = {1,0};
          texts[] = {"Yes","No"};
          default = 1;
     };
     class autoSaveInterval
     {
          title = "Time between autosaves (in minutes)";
          values[] = {600,1200,1800,3600,5400};
          texts[] = {"10","20","30","60","90"};
          default = 3600;
     };
     class membership
     {
          title = "Enable Server Membership";
          texts[] = {"Yes","No"};
          values[] = {1,0};
          default = 1;
     };
     class switchComm
     {
          title = "Enable Commander Switch (highest ranked player)";
          values[] = {1,0};
          texts[] = {"Yes","No"};
          default = 1;
     };
     class tkPunish
     {
          title = "Enable Teamkill Punish";
          values[] = {1,0};
          texts[] = {"Yes","No"};
          default = 1;
     };
     class mRadius
     {
          title = "Max distance from HQ for tasks";
          values[] = {2000,4000,6000,8000,10000,12000};
          default = 4000;
     };
     class allowPvP
     {
          title = "Allow PvP Slots";
          values[] = {1,0};
          texts[] = {"Yes","No"};
          default = 1;
     };
     class pMarkers
     {
          title = "Allow Friendly Player Markers";
          values[] = {1,0};
          texts[] = {"Yes","No"};
          default = 1;
     };
     class AISkill
     {
          title = "Mission Difficulty";
          values[] = {1,2,3};
          texts[] = {"Easy","Normal","Hard"};
          default = 2;
     };
     class unlockItem
     {
          title = "Number of the same item required to unlock";
          values[] = {15,25,40};
          default = 25;
     };
     class memberOnlyMagLimit
     {
          title = "Number of magazines needed for guests to be able to use them";
          values[] = {10,20,30,40,50,60};
          default = 40;
     };
     class civTraffic
     {
          title = "Rate of Civ Traffic";
          values[] = {0,1,2,4,};
          texts[] = {"None","Low","Medium","High"};
          default = 2;
     };
     class memberSlots
     {
          title = "Percentage of Reserved Slots for Members";
          values[] = {0,20,40,60,80,100};
          texts[] = {"None","20%","40%","60%","80%","All"};
          default = 20;
     };
     class memberDistance
     {
          title = "Max distance non members can be from the closest member or HQ (they will be teleported to HQ after some timeout)";
          values[] = {4000,5000,6000,7000,8000,16000};
          texts[] = {"4 Kmts","5 Kmts","6 Kmts","7 Kmts","8 Kmts","Unlimited"};
          default = 5000;
     };
	 class allowMembersFactionGarageAccess
     {
          title = "Allow members to access the faction garage";
          texts[] = {"Yes", "No"};
          values[] = {1,0};
          default = 1;
     };
     class personalGarageMax
     {
          title = "Max personal garage slots";
          texts[] = {"Unlimited", "2", "5", "10"};
          values[] = {0,2,5,10};
          default = 2;
     };
     class allowFT
     {
          title = "Fast Travel Targets Allowed";
          values[] = {0,1};
          texts[] = {"Any friendly position","Only Airports & HQ"};
          default = 1;
     };
     class napalmEnabled
     {
          title = "Enable Napalm Bombing for AI";
          values[] = {0,1};
          texts[] = {"No","Yes"};
          default = 0;
     };
     class teamSwitchDelay
     {
          title = "Delay After Leaving Before a Player Can Join Another Team";
          values[] = {0, 900, 1800, 3600};
          texts[] = {"No delay","15 minutes","30 minutes","60 minutes"};
          default = 3600;
     };
     class unlockedUnlimitedAmmo
     {
          title = "Do Unlocked Weapons Automatically Unlock Their Standard Magazine?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 0;
     };
     class allowGuidedLaunchers
     {
          title = "Should Guided Launchers become unlocked?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 0;
     };
     class allowUnlockedExplosives
     {
          title = "Should Explosives become unlocked?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 0;
     };
     class startWithLongRangeRadio
     {
          title = "[TFAR] Start with Long Range Radio?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 1;
     };
     class helmetLossChance
     {
          title = "Chance of helmet loss on headshots";
          values[] = {0,33,66,100};
          texts[] = {"Never","Sometimes","Often","Always"};
          default = 33;
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
          title = "Enable Loot to crate";
          values[] = {0, 1};
          texts[] = {"Disabled", "Enabled"};
          default = 1;
     };
     class LTCLootUnlocked
     {
          title = "Loot to crate: transfers unlocked items";
          values[] = {0, 1};
          texts[] = {"Disabled", "Enabled"};
          default = 0;
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
          title = "Allow Items and Vehicles from Karts DLC?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 0;
     };
     class Mark
     {
          title = "Allow Items and Vehicles from Marksman DLC?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 0;
     };
     class Heli
     {
          title = "Allow Items and Vehicles from Heli DLC?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 0;
     };
     class Expansion
     {
          title = "Allow Items and Vehicles from Apex DLC?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 0;
     };
     class Jets
     {
          title = "Allow Items and Vehicles from Jets DLC?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 0;
     };
     class Orange
     {
          title = "Allow Items and Vehicles from Laws of War DLC?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 0;
     };
     class Tanks
     {
          title = "Allow Items and Vehicles from Tanks DLC?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 0;
     };
     class GlobMob
     {
          title = "Allow Items and Vehicles from Global Mobilization DLC?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 0;
     };
     class Enoch
     {
          title = "Allow Items and Vehicles from Contact DLC?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 0;
     };
     class OfficialMod
     {
          title = "Allow ADR-97 DLC?";
          values[] = {1,0};
          texts[] =  {"Yes","No"};
          default = 0;
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
          title = "ADVANCED USERS ONLY";
          values[] = {""};
          texts[] = {""};
          default = "";
     };
	 class LogLevel
	 {
		  title = "Logging Level (Amount of detail in .rpt file)";
		  values[] = {1,2,3};
		  texts[] = {"Error", "Info", "Debug"};
		  default = 3;
	 };
     class SupportOptions
     {
         title = "SUPPORT OPTIONS";
         values[] = {""};
         texts[] = {""};
         default = "";
     };
     class allowUnfairSupports
     {
         title = "[Experimental - Use at own risk] Allow unfair supports to be used by the enemy";
         values[] = {0, 1};
         texts[] = {"Not allowed", "Allowed"};
         default = 0;
     }
     class allowFuturisticSupports
     {
         title = "[Experimental - Use at own risk](Requires unfair supports) Allow futuristic supports to be used by the enemy";
         values[] = {0, 1};
         texts[] = {"Not allowed", "Allowed"};
         default = 0;
     }
     class CrateOptions
     {
          title = "LOOT CRATE OPTIONS";
          values[] = {""};
          texts[] = {""};
          default = "";
     };
	 class truelyRandomCrates
	 {
		  title = "[Experimental] Truely Random Crates: Remove all balance checks from Crates";
		  values[] = {0, 1};
		  texts[] = {"False", "True"};
		  default = 0;
	 };
	 class cratePlayerScaling
	 {
		title = "Decrease loot quantity as player count increases? (Yes is recommended for balance reasons)";
		values[] = {0, 1};
		texts[] = {"False", "True"};
		default = 1;
	 };
     class crateWepTypeMax
     {
          title = "Maximum Weapon Types in Crates";
          values[] = {0,2,4,6,8,12,16};
          texts[] = {"1","3","5","7","9","13","17"};
          default = 9;
     };
     class crateWepNumMax
     {
          title = "Maximum Weapon Quantity in Crates";
          values[] = {0,1,3,5,8,10,15};
          texts[] = {"None","1","3","5","8","10","15"};
          default = 8;
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
          title = "Maximum Item Types in Crates";
          values[] = {0,2,4,9};
          texts[] = {"1","3","5","10"};
          default = 4;
     };
     class crateItemNumMax
     {
          title = "Maximum Item Quantity in Crates";
          values[] = {0,1,3,5,10,15};
          texts[] = {"None","1","3","5","10","15"};
          default = 5;
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
          title = "Maximum Ammo Types in Crates";
          values[] = {0,2,4,6,9,14,19};
          texts[] = {"1","3","5","7","10","15","20"};
          default = 6;
     };
     class crateAmmoNumMax
     {
          title = "Maximum Ammo Quantity in Crates";
          values[] = {0,1,3,5,10,15,20,25,30};
          texts[] = {"None","1","3","5","10","15","20","25","30"};
          default = 20;
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
          title = "Maximum Explosive Types in Crates";
          values[] = {0,2,4,9};
          texts[] = {"1","3","5","10"};
          default = 2;
     };
     class crateExplosiveNumMax
     {
          title = "Maximum Explosive Quantity in Crates";
          values[] = {0,1,3,5,10,15};
          texts[] = {"None","1","3","5","10","15"};
          default = 5;
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
          title = "Maximum Attachment Types in Crates";
          values[] = {0,2,4,6,9,12,15,19};
          texts[] = {"1","3","5","7","10","13","16","20"};
          default = 6;
     };
     class crateAttachmentNumMax
     {
          title = "Maximum Attachment Quantity in Crates";
          values[] = {0,1,3,5,7,10,15,20,30};
          texts[] = {"None","1","3","5","7","10","15","20","30"};
          default = 15;
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
          title = "Maximum Backpack Types in Crates";
          values[] = {0,2,4,9};
          texts[] = {"1","3","5","10"};
          default = 0;
     };
     class crateBackpackNumMax
     {
          title = "Maximum Backpack Quantity in Crates";
          values[] = {0,1,3,5,10,15};
          texts[] = {"None","1","3","5","10","15"};
          default = 3;
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
          title = "Maximum Vest Types in Crates";
          values[] = {0,2,4,9};
          texts[] = {"1","3","5","10"};
          default = 0;
     };
     class crateVestNumMax
     {
          title = "Maximum Vest Quantity in Crates";
          values[] = {0,1,3,5,10,15};
          texts[] = {"None","1","3","5","10","15"};
          default = 0;
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
          title = "Maximum Helmet Types in Crates";
          values[] = {0,2,4,9};
          texts[] = {"1","3","5","10"};
          default = 0;
     };
     class crateHelmetNumMax
     {
          title = "Maximum Helmet Quantity in Crates";
          values[] = {0,1,3,5,10,15};
          texts[] = {"None","1","3","5","10","15"};
          default = 0;
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
          title = "Maximum Device Backpack Types in Crates";
          values[] = {0,2,4,9};
          texts[] = {"1","3","5","10"};
          default = 2;
     };
     class crateDeviceNumMax
     {
          title = "Maximum Device Backpack Quantity in Crates";
          values[] = {0,1,3,5,10,15};
          texts[] = {"None","1","3","5","10","15"};
          default = 3;
     };
};
