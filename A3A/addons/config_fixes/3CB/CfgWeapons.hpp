//3CB - CfgWeapons.hpp

class CfgWeapons 
{
    class UK3CB_CZ550;
    class a3a_UK3CB_CZ550_8mm : UK3CB_CZ550
    {
        BaseWeapon = "a3a_UK3CB_CZ550_8mm";
        descriptionshort = "Hunting Rifle <br/>Caliber: 8×57mm IS";
        displayname = "CZ-550 Lux";
        magazines[] = {"rhsgref_5Rnd_792x57_kar98k"};
        magazineWell[] = {"CBA_792x57_K98"};
        recoil = "recoil_dmr_01";
    };
    
    class UK3CB_MG3;
    class UK3CB_MG3_KWS_T : UK3CB_MG3{
        BaseWeapon = "UK3CB_MG3_KWS_T";
    };
    class UK3CB_M21;
    class UK3CB_M21_Bipod_Railed : UK3CB_M21{
        BaseWeapon = "UK3CB_M21_Bipod_Railed";
    };
    class uk3cb_auga2_sr_carb;
    class uk3cb_auga2_sr_carb_tan : uk3cb_auga2_sr_carb{
        BaseWeapon = "uk3cb_auga2_sr_carb_tan";
    };
};

