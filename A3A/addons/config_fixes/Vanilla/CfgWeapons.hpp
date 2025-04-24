//Vanilla - CfgWeapons.hpp

class CfgWeapons 
{
    // Fix bad base weapon
    class arifle_AK12_GL_base_F;
    class arifle_AK12_GL_lush_F : arifle_AK12_GL_base_F
    {
        baseWeapon = "arifle_AK12_GL_lush_F";
    };

    // Price overrides for gun shop
    // Type 115, extra muzzle
    class Rifle_Base_F;
    class arifle_ARX_base_F : Rifle_Base_F {
        A3A_price = 300;
    };
    // ASP-1, really bad dispersion
    class DMR_04_base_F;
    class srifle_DMR_04_F : DMR_04_base_F {
        A3A_price = 1000;
    };
};
