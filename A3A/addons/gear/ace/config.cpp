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
    class IV {
        class BloodIV;
        class a3a_coffeeIV : BloodIV {
            ratio[] = {"a3a_coffee",1};
            gui_message = $STR_A3A_Medical_Treatment_receivingCoffee;
            type = "Saline";
            dose = 4;
            maxDose = 18;
            timeInSystem = 1800;
            hrIncreaseHigh[] = {0,20};
            hrIncreaseLow[] = {0,20};
            hrIncreaseNormal[] = {0,20};
        }
        class a3a_coffeeIV_500 : a3a_coffeeIV {
            dose = 2;
            timeInSystem = 900;
            volume = 500;
        }
        class a3a_coffeeIV_250 : a3a_coffeeIV {
            dose = 1;
            timeInSystem = 450;
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
        }
        class a3a_coffeeIV_500 : a3a_coffeeIV {
            displayName = $STR_A3A_ESPRESSO_500_GIVE;
            items[] = {"a3a_coffeeIV_500"};
        }
        class a3a_coffeeIV_250 : a3a_coffeeIV {
            displayName = $STR_A3A_ESPRESSO_250_GIVE;
            items[] = {"a3a_coffeeIV_250"};
        }
}