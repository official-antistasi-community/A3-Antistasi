#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
////////////////////////////////////
//      ACE ITEMS LIST           ///
////////////////////////////////////
Info("Creating ACE Items List");
aceItems = [
	"ACE_EarPlugs",
	"ACE_RangeCard",
	"ACE_Clacker",
	"ACE_DefusalKit",
	"ACE_MapTools",
	"ACE_Flashlight_MX991",
	"ACE_wirecutter",
	"ACE_artilleryTable",
	"ACE_PlottingBoard",
	"ACE_EntrenchingTool",
	"ACE_Cellphone",
	"ACE_CableTie",
	"ACE_SpottingScope",
	"ACE_Tripod",
	"ACE_Spraypaintred",
	"ACE_UAVBattery",
	"ACE_SpareBarrel",
	"ACE_Flashlight_XL50",
	"ACE_HandFlare_White",
	"ACE_Chemlight_HiBlue",
	"ACE_Chemlight_HiGreen",
	"ACE_Chemlight_HiRed",
	"ACE_Chemlight_HiWhite",
	"ACE_Chemlight_HiYellow",
	"ACE_Chemlight_Orange",
	"ACE_Chemlight_UltraHiOrange",
	"ACE_Chemlight_White",
	"ACE_rope3",
	"ACE_rope6", 
	"ACE_rope12", 
	"ACE_rope15", 
	"ACE_rope18", 
	"ACE_rope27", 
	"ACE_rope36"
];

aceMedItems = [
	"ACE_plasmaIV",
	"ACE_plasmaIV_500",
	"ACE_plasmaIV_250",
	"ACE_salineIV",
	"ACE_salineIV_500",
	"ACE_salineIV_250",
	"ACE_surgicalKit",
	"ACE_tourniquet",
	"ACE_epinephrine",
	"ACE_morphine",
	"ACE_adenosine",
	"ACE_splint",
	"ACE_bodyBag",
	"ACE_personalAidKit",
	"ACE_suture",
	"a3a_coffeeIV",
	"a3a_coffeeIV_500",
	"a3a_coffeeIV_250"
];

aceDefaultBloodItems = [
	"ACE_bloodIV",
	"ACE_bloodIV_250",
	"ACE_bloodIV_500",
	"ACE_painkillers"
];

aceDefaultBandages = [ //ACM is intended to be used with its own bandage items.
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_packingBandage",
	"ACE_quikclot"
];

advItems = [
	"adv_aceCPR_AED"
];

katMedItems = [ //Support and tested with KAM 2.13.3 Stable
	"kat_accuvac",	//KAT Airway - Item
	"kat_guedel",	//KAT Airway - Item
	"kat_larynx",	//KAT Airway - Item
	
	"kat_Pulseoximeter",	//KAT Breathing - Item
	"kat_chestSeal",	//KAT Breathing - Item
	"kat_aatKit",	//KAT Breathing - Item
	"kat_ncdKit",	//KAT Breathing - Item
	"kat_stethoscope",	//KAT Breathing - Item
	"kat_BVM",	//KAT Breathing - Item
	"kat_pocketBVM",	//KAT Breathing - Item
	"kat_oxygenTank_150_Empty",	//KAT Breathing - Item
	"kat_oxygenTank_150_Item",	//KAT Breathing - Item
	"kat_oxygenTank_300_Empty",	//KAT Breathing - Item
	"kat_oxygenTank_300_Item",	//KAT Breathing - Item
	"kat_oxygenTank_150",	//KAT Breathing - Magazine
	"kat_oxygenTank_300",	//KAT Breathing - Magazine
	
	//"kat_mask_M04",	//KAT Chemical - Glasses
	//"kat_mask_M50",	//KAT Chemical - Glasses
	"kat_gasmaskFilter",	//KAT Chemical - Item
	"kat_sealant",	//KAT Chemical - Item
	//"KAT_1Rnd_82mm_Mo_Type0",	//KAT Chemical - Magazine for Mortar shell
	//"KAT_1Rnd_82mm_Mo_TypeCS",	//KAT Chemical - Magazine for Mortar shell
	//"KAT_M7A3",	//KAT Chemical - Magazine for HandGrenade
	//"KAT_Gas_TripWireMine_Mag",	//KAT Chemical - Magazine for TripWireMine
	
	"kat_bloodIV_A",	//KAT Circulation - Item
	"kat_bloodIV_A_250",	//KAT Circulation - Item
	"kat_bloodIV_A_500",	//KAT Circulation - Item
	"kat_bloodIV_A_N",	//KAT Circulation - Item
	"kat_bloodIV_A_N_250",	//KAT Circulation - Item
	"kat_bloodIV_A_N_500",	//KAT Circulation - Item
	"kat_bloodIV_AB",	//KAT Circulation - Item
	"kat_bloodIV_AB_250",	//KAT Circulation - Item
	"kat_bloodIV_AB_500",	//KAT Circulation - Item
	"kat_bloodIV_AB_N",	//KAT Circulation - Item
	"kat_bloodIV_AB_N_250",	//KAT Circulation - Item
	"kat_bloodIV_AB_N_500",	//KAT Circulation - Item
	"kat_bloodIV_B",	//KAT Circulation - Item
	"kat_bloodIV_B_250",	//KAT Circulation - Item
	"kat_bloodIV_B_500",	//KAT Circulation - Item
	"kat_bloodIV_B_N",	//KAT Circulation - Item
	"kat_bloodIV_B_N_250",	//KAT Circulation - Item
	"kat_bloodIV_B_N_500",	//KAT Circulation - Item
	"kat_bloodIV_O",	//KAT Circulation - Item
	"kat_bloodIV_O_250",	//KAT Circulation - Item
	"kat_bloodIV_O_500",	//KAT Circulation - Item
	"kat_bloodIV_O_N",	//KAT Circulation - Item
	"kat_bloodIV_O_N_250",	//KAT Circulation - Item
	"kat_bloodIV_O_N_500",	//KAT Circulation - Item
	"KAT_Empty_bloodIV_250",	//KAT Circulation - Item
	"KAT_Empty_bloodIV_500",	//KAT Circulation - Item
	"kat_AED",	//KAT Circulation - Item
	"kat_X_AED",	//KAT Circulation - Item
	"kat_crossPanel",	//KAT Circulation - Item
	
	"kat_PainkillerItem",	//KAT Pharmacy - Item
	"kat_Painkiller",	//KAT Pharmacy - Magazine
	"kat_CarbonateItem",	//KAT Pharmacy - Item
	"kat_Carbonate",	//KAT Pharmacy - Magazine
	"kat_PervitinItem",	//KAT Pharmacy - Item
	"kat_Pervitin",	//KAT Pharmacy - Magazine
	"kat_CaffeineItem",	//KAT Pharmacy - Item
	"kat_Caffeine",	//KAT Pharmacy - Magazine
	"kat_PenthroxItem",	//KAT Pharmacy - Item
	"kat_Penthrox",	//KAT Pharmacy - Magazine
	"kat_IV_16",	//KAT Pharmacy - Item
	"kat_IO_FAST",	//KAT Pharmacy - Item
	"kat_naloxone",	//KAT Pharmacy - Item
	"kat_EACA",	//KAT Pharmacy - Item
	"kat_TXA",	//KAT Pharmacy - Item
	"kat_norepinephrine",	//KAT Pharmacy - Item
	"kat_phenylephrine",	//KAT Pharmacy - Item
	"kat_nitroglycerin",	//KAT Pharmacy - Item
	"kat_amiodarone",	//KAT Pharmacy - Item
	"kat_lidocaine",	//KAT Pharmacy - Item
	"kat_atropine",	//KAT Pharmacy - Item
	"kat_ketamine",	//KAT Pharmacy - Item
	"kat_fentanyl",	//KAT Pharmacy - Item
	"kat_nalbuphine",	//KAT Pharmacy - Item
	"kat_lorazepam",	//KAT Pharmacy (Used in Surgery) - Item
	"kat_flumazenil",	//KAT Pharmacy (Used in Surgery) - Item
	"kat_etomidate",	//KAT Pharmacy (Used in Surgery) - Item
	
	"kat_scalpel",	//KAT Surgery - Item
	"kat_retractor",	//KAT Surgery - Item
	"kat_clamp",	//KAT Surgery - Item
	"kat_plate",	//KAT Surgery - Item
	"kat_vacuum",	//KAT Surgery - Item
	
	//"kat_armband_doctor",	//KAT Misc - Glasses (Cosmetics)
	//"kat_Armband_Doctor_Item",	//KAT Misc - Item (Cosmetics)
	//"kat_armband_kat",	//KAT Misc - Glasses (Cosmetics)
	//"kat_Armband_Kat_Item",	//KAT Misc - Item (Cosmetics)
	//"kat_armband_medic",	//KAT Misc - Glasses (Cosmetics)
	//"kat_Armband_Medic_Item",	//KAT Misc - Item (Cosmetics)
	//"kat_armband_red_cross",	//KAT Misc - Glasses (Cosmetics)
	//"kat_Armband_Red_Cross_Item",	//KAT Misc - Item (Cosmetics)
	"Attachable_Helistretcher",	//KAT Misc - Item
	"kat_Bubble_Wrap_Item",	//KAT Misc - Item
	"kat_Bubble_Wrap",	//KAT Misc - Magazine
	"kat_IFAK",	//KAT Misc - Item
	"kat_IFAK_Magazine",	//KAT Misc - Magazine
	"kat_AFAK",	//KAT Misc - Item
	"kat_AFAK_Magazine",	//KAT Misc - Magazine
	"kat_MFAK",	//KAT Misc - Item
	"kat_MFAK_Magazine",	//KAT Misc - Magazine
	"kat_stretcherBag"	//KAT Misc - Vehicle (Backpack)
];

acmMedItems = [ //Support and tested with ACM 1.4.7 Stable
	"ACM_PressureBandage", //ACM Catastrophic Bleeding - Item
	"ACM_EmergencyTraumaDressing", //ACM Catastrophic Bleeding - Item
	"ACM_ElasticWrap", //ACM Catastrophic Bleeding - Item

	"ACM_ACCUVAC", //ACM Airway Management - Item
	"ACM_CricKit", //ACM Airway Management - Item
	"ACM_IGel", //ACM Airway Management - Item
	"ACM_NPA", //ACM Airway Management - Item
	"ACM_OPA", //ACM Airway Management - Item
	"ACM_SuctionBag", //ACM Airway Management - Item

	"ACM_BVM", //ACM Breathing - Item
	"ACM_ChestSeal", //ACM Breathing - Item
	"ACM_ChestTubeKit", //ACM Breathing - Item
	"ACM_NCDKit", //ACM Breathing - Item
	"ACM_OxygenTank_425", //ACM Breathing - Magazine
	"ACM_OxygenTank_425_Empty", //ACM Breathing - Item
	"ACM_PocketBVM", //ACM Breathing - Item
	"ACM_PulseOximeter", //ACM Breathing - Item
	"ACM_Stethoscope", //ACM Breathing - Item
	"ACM_ThoracostomyKit", //ACM Breathing - Item

	"ACM_IV_14g", //ACM Circulation - Item
	"ACM_IV_16g", //ACM Circulation - Item
	"ACM_AED", //ACM Circulation - Item
	"ACM_IO_EZ", //ACM Circulation - Item
	"ACM_IO_FAST", //ACM Circulation - Item
	"ACM_PressureCuff", //ACM Circulation - Item
	"ACM_Syringe_1", //ACM Circulation - Item
	"ACM_Syringe_3", //ACM Circulation - Item
	"ACM_Syringe_5", //ACM Circulation - Item
	"ACM_Syringe_10", //ACM Circulation - Item
	"ACM_Syringe_10_Epinephrine", //ACM Circulation - Magazine. This class is also used for other medications

	"ACM_BloodBag_A_250", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_A_500", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_A_1000", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_AN_250", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_AN_500", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_AN_1000", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_AB_250", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_AB_500", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_AB_1000", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_ABN_250", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_ABN_500", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_ABN_1000", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_B_250", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_B_500", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_B_1000", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_BN_250", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_BN_500", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_BN_1000", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_O_250", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_O_500", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_O_1000", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_ON_250", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_ON_500", //ACM Fluid Transfusion - Item
	"ACM_BloodBag_ON_1000", //ACM Fluid Transfusion - Item
	
	"ACM_FieldBloodTransfusionKit_250", //ACM Fluid Transfusion - Item
	"ACM_FieldBloodTransfusionKit_500", //ACM Fluid Transfusion - Item
	"ACM_FreshBloodBag_250", //ACM Fluid Transfusion - Item
	"ACM_FreshBloodBag_500", //ACM Fluid Transfusion - Item

	"ACM_Vial_Adenosine", //ACM Medication - Item
	"ACM_Vial_Amiodarone", //ACM Medication - Item
	"ACM_Vial_Atropine", //ACM Medication - Item
	"ACM_Vial_CalciumChloride", //ACM Medication - Item
	"ACM_Vial_Epinephrine", //ACM Medication - Item
	"ACM_Vial_Etrapenem", //ACM Medication - Item
	"ACM_Vial_Esmolol", //ACM Medication - Item
	"ACM_Vial_Fentanyl", //ACM Medication - Item
	"ACM_Vial_Ketamine", //ACM Medication - Item
	"ACM_Vial_Lidocaine", //ACM Medication - Item
	"ACM_Vial_Morphine", //ACM Medication - Item
	"ACM_Vial_Ondansetron", //ACM Medication - Item
	"ACM_Vial_TXA", //ACM Medication - Item

	"ACM_AmmoniaInhalant", //ACM Medication - Magazine
	"ACM_Autoinjector_ATNA", //ACM Medication - Item
	"ACM_Lozenge_Fentanyl", //ACM Medication - Item
	"ACM_Autoinjector_Midazolam", //ACM Medication - Item
	"ACM_Spray_Naloxone", //ACM Medication - Item
	"ACM_Paracetamol", //ACM Medication - Magazine
	"ACM_Paracetamol_SinglePack", //ACM Medication - Item
	"ACM_Paracetamol_DoublePack", //ACM Medication - Magazine
	"ACM_Inhaler_Penthrox", //ACM Medication - Magazine

	"ACM_SAMSplint", //ACM Disability

	//"ACM_Grenade_CS", //ACM CBRN - Magazine
	//"ACM_Grenade_Shell_CS", //ACM CBRN - Magazine
	//"ACM_Mortar_Shell_8Rnd_CS", //ACM CBRN - Magazine
	//"ACM_Mortar_Shell_8Rnd_Chlorine", //ACM CBRN - Magazine
	//"ACM_Mortar_Shell_8Rnd_Sarin", //ACM CBRN - Magazine
	//"ACM_Mortar_Shell_8Rnd_Lewisite", //ACM CBRN - Magazine
	"ACM_GasMaskFilter" //ACM CBRN - Item
];

aceCoolingItems = [
	"ACE_Canteen",
	"ACE_Canteen_Half",
	"ACE_Canteen_Empty",
	"ACE_WaterBottle",
	"ACE_WaterBottle_Half",
	"ACE_WaterBottle_Empty",
	"ACE_Can_Franta",
	"ACE_Can_RedGull",
	"ACE_Can_Spirit"
];

aceFoodItems = [
	"ACE_Banana",
	"ACE_Sunflower_Seeds",
	"ACE_Humanitarian_Ration",
	"ACE_MRE_BeefStew",
	"ACE_MRE_ChickenTikkaMasala",
	"ACE_MRE_ChickenHerbDumplings",
	"ACE_MRE_CreamChickenSoup",
	"ACE_MRE_CreamTomatoSoup",
	"ACE_MRE_LambCurry",
	"ACE_MRE_MeatballsPasta",
	"ACE_MRE_SteakVegetables"
];

/*
publicVariable "aceItems";
publicVariable "aceMedItems";
publicVariable "aceMedItemsBlood";
publicVariable "advItems";
publicVariable "katMedItems";
publicVariable "aceCoolingItems";
publicVariable "aceFoodItems";
*/

////////////////////////////////////
//   ACE ITEMS MODIFICATIONS     ///
////////////////////////////////////
FactionGet(reb,"initialRebelEquipment") append aceItems;


//ACE medical starting items
if (A3A_hasACEMedical && !A3A_hasKAT && !A3A_hasACM) then {
	FactionGet(reb,"initialRebelEquipment") append aceMedItems;
	FactionGet(reb,"initialRebelEquipment") append aceDefaultBloodItems;
	FactionGet(reb,"initialRebelEquipment") append aceDefaultBandages;
};

if (A3A_hasADV) then {
	FactionGet(reb,"initialRebelEquipment") append advItems;
};

if (A3A_hasKAT && A3A_hasACEMedical && !A3A_hasACM) then {
	FactionGet(reb,"initialRebelEquipment") append aceMedItems;
	FactionGet(reb,"initialRebelEquipment") append katMedItems;
	FactionGet(reb,"initialRebelEquipment") append aceDefaultBandages;
};

if (A3A_hasACM && A3A_hasACEMedical && !A3A_hasKAT) then {
	FactionGet(reb,"initialRebelEquipment") append aceMedItems;
	FactionGet(reb,"initialRebelEquipment") append acmMedItems;
};

FactionGet(reb,"initialRebelEquipment") append aceCoolingItems;

if (aceFood) then {
	FactionGet(reb,"initialRebelEquipment") append aceFoodItems;
};

if !("lowTech" in A3A_factionEquipFlags) then {
	lootItem append ["ACE_acc_pointer_green_IR","ACE_Chemlight_Shield","ACE_VMH3","ACE_VMM3"];
};
lootMagazine deleteAt (lootMagazine find "ACE_PreloadedMissileDummy");
allLightAttachments deleteAt (allLightAttachments find "ACE_acc_pointer_green");
lootItem deleteAt (lootItem find "MineDetector");
