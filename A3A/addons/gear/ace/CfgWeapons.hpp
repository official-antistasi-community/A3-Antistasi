
class CfgWeapons {

	class ACE_adenosine;

	class a3a_coagulant : ACE_adenosine {
        author = AUTHOR;
	    displayName= "Combat Stim C";
        descriptionShort = "Autoinjector labled Combat Stim C";
        descriptionUse = "A autoinjector with unknown content simply labled Combat Stim composition C";
	};
	class a3a_adrenaline : ACE_adenosine {
        author = AUTHOR;
	    displayName = "Combat Stim A";
        descriptionShort = "Autoinjector labled Combat Stim A";
        descriptionUse = "A autoinjector with unknown content simply labled Combat Stim composition A";
	};

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