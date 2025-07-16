//Vanilla - CfgWeapons.hpp

class CfgWeapons 
{
    // Price overrides for gun shop
    // Type 115, extra muzzle
    class Rifle_Base_F;
    class arifle_ARX_base_F : Rifle_Base_F {
        A3A_price = 600;
    };
    // ASP-1, really bad dispersion
    class DMR_04_base_F;
    class srifle_DMR_04_F : DMR_04_base_F {
        A3A_price = 1100;
    };
};
