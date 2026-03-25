#include "..\script_component.hpp"

class CfgPatches 
{
    class A3A_gear_ace_medical  {
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = 
		{
            "A3A_gear",
            "A3_Data_F_AoW_Loadorder",
            "ace_medical_treatment"
		};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
        skipWhenMissingDependencies = 1;
    };
};



class CfgWeapons {
    class ACE_ItemCore;
    class ACE_bloodIV : ACE_ItemCore{
        class ItemInfo;
    };
    class a3a_coffeeIV : ACE_bloodIV {
        author = AUTHOR;
	    displayName=$STR_A3A_ESPRESSO_1000;
        //picture = QPATHTOFOLDER(ace\assets\EsspInfBag-1000ml.paa);
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(ace\assets\EsspInfBag-1000ml.paa)};
        descriptionShort = $STR_A3A_ESPRESSO_SHORT;
        descriptionUse = $STR_A3A_ESPRESSO_USE;
        class ItemInfo : ItemInfo
        {
            mass = 12;
        };
    };


    class a3a_coffeeIV_500 : a3a_coffeeIV {
	    displayName=$STR_A3A_ESPRESSO_500;
        model = "\z\ace\addons\medical_treatment\data\IVBag_500ml.p3d";
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(ace\assets\EsspInfBag-500ml.paa)};
        class ItemInfo : ItemInfo
        {
            mass = 6;
        };
    };


    class a3a_coffeeIV_250 : a3a_coffeeIV
    {
	    displayName=$STR_A3A_ESPRESSO_250;
        model = "\z\ace\addons\medical_treatment\data\IVBag_250ml.p3d";
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(ace\assets\EsspInfBag-250ml.paa)};
        class ItemInfo : ItemInfo
        {
            mass = 3;
        };
    };
};

class ace_medical_treatment {
    class Medication {
        class ACE_Can_Spirit {
            painReduce = 0.035;
            dose = 1;
            maxDose = 40;
            maxDoseDeviation = 12;
            timeInSystem = 3600;
            timeTillMaxEffect = 120;
            hrIncreaseLow[] = {0, 5};
            hrIncreaseNormal[] = {0, 5};
            hrIncreaseHigh[] = {0, 5};
        };
        class ACE_Can_Franta : ACE_Can_Spirit {};
        class ACE_Can_RedGull : ACE_Can_Spirit {
            maxDose = 10;
            timeInSystem = 7200;
            hrIncreaseLow[] = {5, 15};
            hrIncreaseNormal[] = {5, 15};
            hrIncreaseHigh[] = {5, 15};
        };
        class a3a_coffeeIV{
            dose = 1;
            maxDose = 4;
            maxDoseDeviation = 2;
            timeInSystem = 3600;
            timeTillMaxEffect = 160;
            hrIncreaseLow[] = {10, 20};
            hrIncreaseNormal[] = {10, 50};
            hrIncreaseHigh[] = {10, 40};
        }
        class a3a_coffeeIV_500 : a3a_coffeeIV {
            dose = 0.5;
            timeTillMaxEffect = 80;
            timeInSystem = 1800;
            volume = 500;
            hrIncreaseLow[] = {5, 10};
            hrIncreaseNormal[] = {5, 25};
            hrIncreaseHigh[] = {5, 20};
        }
        class a3a_coffeeIV_250 : a3a_coffeeIV {
            dose = 0.25;
            timeTillMaxEffect = 40;
            timeInSystem = 900;
            volume = 250;
            hrIncreaseLow[] = {2.5, 5};
            hrIncreaseNormal[] = {2.5, 12.5};
            hrIncreaseHigh[] = {2.5, 10};
        }
    }
    class IV {
        class BloodIV;
        class a3a_coffeeIV : BloodIV {
            ratio[] = {"Saline",0.5, "a3a_coffee",0.5};
            gui_message = $STR_A3A_Medical_Treatment_receivingCoffee;
            type = "a3a_coffee";
        }
        class a3a_coffeeIV_500 : a3a_coffeeIV {
            volume = 500;
        }
        class a3a_coffeeIV_250 : a3a_coffeeIV {
            volume = 250;
        }
    }
}

class ace_medical_treatment_actions {
    
        class BloodIV;
        class a3a_coffeeIV : BloodIV {
            displayName = $STR_A3A_ESPRESSO_1000_GIVE;
            displayNameProgress = $STR_A3A_ESPRESSO_ACTION;
            items[] = {"a3a_coffeeIV"};
            callbackSuccess = "A3A_fnc_coffeeIV";
        }
        class a3a_coffeeIV_500 : a3a_coffeeIV {
            displayName = $STR_A3A_ESPRESSO_500_GIVE;
            items[] = {"a3a_coffeeIV_500"};
        }
        class a3a_coffeeIV_250 : a3a_coffeeIV {
            displayName = $STR_A3A_ESPRESSO_250_GIVE;
            items[] = {"a3a_coffeeIV_250"};
        }
        class FieldDressing ;
        class ACE_Can_Spirit : FieldDressing {
            allowedSelections[] = {"Head"};
            condition = "params ['_medic', '_patient']; _medic == _patient;";
            displayName = "Drink can of Spirit";
            displayNameProgress = "Drinking";
            items[] = {"ACE_Can_Spirit"};
            animationMedic = "";
            animationMedicProne = "";
            animationMedicSelf = ""; 
            animationMedicSelfProne = "";
            litter[] = {{"Land_Can_V1_F"},{"Land_Can_Dented_F"},{"Land_Can_Dented_F"}};
            callbackStart = "A3A_fnc_drinkMed";
            treatmentTime = 10;
        };
        class ACE_Can_Franta : ACE_Can_Spirit {            
            displayName = "Drink can of Franta";
            items[] = {"ACE_Can_Franta"};
            litter[] = {{"Land_Can_V2_F"},{"Land_Can_V2_F"},{"Land_Can_V2_F"}};
        };
        class ACE_Can_RedGull : ACE_Can_Spirit {
            displayName = "Drink can of RedGull";
            items[] = {"ACE_Can_RedGull"};
            litter[] = {{"Land_Can_V3_F"},{"Land_Can_V3_F"},{"Land_Can_V3_F"}};
        };
}

class CfgFunctions
{
    class A3A
    {
        class medical {
            file = "x\A3A\addons\gear\ace\functions";
            class coffeeIV {};
            class drinkMed {};
        };
    };
};