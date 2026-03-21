#include "..\script_component.hpp"

class CfgPatches 
{
    class ADDON {
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = 
		{
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
            mass = 10;
        };
    };


    class a3a_coffeeIV_500 : a3a_coffeeIV {
	    displayName=$STR_A3A_ESPRESSO_500;
        model = "\z\ace\addons\medical_treatment\data\IVBag_500ml.p3d";
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(ace\assets\EsspInfBag-500ml.paa)};
        class ItemInfo : ItemInfo
        {
            mass = 5;
        };
    };


    class a3a_coffeeIV_250 : a3a_coffeeIV
    {
	    displayName=$STR_A3A_ESPRESSO_250;
        model = "\z\ace\addons\medical_treatment\data\IVBag_250ml.p3d";
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(ace\assets\EsspInfBag-250ml.paa)};
        class ItemInfo : ItemInfo
        {
            mass = 2.5;
        };
    };
};

class ace_medical_treatment {
    class Medication {
        class ACE_Can_Spirit {
            dose = 1;
            maxDose = 40;
            maxDoseDeviation = 2;
            timeInSystem = 3600;
            timeTillMaxEffect = 120;
            hrIncreaseLow[] = {0, 5};
            hrIncreaseNormal[] = {0, 5};
            hrIncreaseHigh[] = {0, 5};
        };
        class ACE_Can_Franta : ACE_Can_Spirit {};
        class ACE_Can_RedGull : ACE_Can_Spirit {
            maxDose = 10;
            hrIncreaseLow[] = {5, 15};
            hrIncreaseNormal[] = {5, 15};
            hrIncreaseHigh[] = {5, 15};
        };
        class a3a_coffeeIV{
            dose = 1;
            maxDose = 4;
            maxDoseDeviation = 2;
            timeInSystem = 3600;
            timeTillMaxEffect = 10;
            hrIncreaseLow[] = {10, 20};
            hrIncreaseNormal[] = {10, 50};
            hrIncreaseHigh[] = {10, 40};
        }
        class a3a_coffeeIV_500 : a3a_coffeeIV {
            dose = 0.5;
            timeInSystem = 1800;
            volume = 500;
        }
        class a3a_coffeeIV_250 : a3a_coffeeIV {
            dose = 0.25;
            timeInSystem = 900;
            volume = 250;
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
        class Painkillers;
        class ACE_Can_Spirit : Painkillers{
            condition = "params ['_medic', '_patient']; _medic == _patient;";
            displayName = "Drink can of Spirit";
            displayNameProgress = "Drinking";
            items[] = {"ACE_Can_Spirit"};
            animationMedic = "";
            animationMedicProne = "";
            animationMedicSelf = ace_field_rations_drinkCrouchCan;
            animationMedicSelfProne = ace_field_rations_drinkProneCan;
            sounds[] = {"ace_field_rations_drinkCan1", "ace_field_rations_drinkCan1", "ace_field_rations_drinkCan2"};
            litter[] = {{"ACE_Can_Spirit_Item"}};
        };
        class ACE_Can_Franta : ACE_Can_Spirit {            
            displayName = "Drink can of Franta";
            items[] = {"ACE_Can_Franta"};
            litter[] = {{"ACE_Can_Franta_Item"}};
        };
        class ACE_Can_RedGull : ACE_Can_Spirit {
            displayName = "Drink can of RedGull";
            items[] = {"ACE_Can_RedGull"};
            litter[] = {{"ACE_Can_RedGull_Item"}};
        };
}

class CfgFunctions
{
    class A3A
    {
        class medical {
            file = "x\A3A\addons\gear\ace\functions";
            class coffeeIV {};
        };
    };
};