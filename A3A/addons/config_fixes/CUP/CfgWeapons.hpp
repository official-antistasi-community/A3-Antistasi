class CfgWeapons
{
    // Price overrides for gun shop
    // Subsonic sniper
    class Rifle_Base_F;
    class CUP_srifle_VSSVintorez : Rifle_Base_F {
        A3A_price = 900;
    };
    // Bad dispersion, fancy ammo
    class CUP_arifle_xm29_ke_base : Rifle_Base_F {
        A3A_price = 500;
    };
    // Very bad dispersion relative to parent weapons
    class CUP_arifle_XM8_Base;
    class CUP_arifle_XM8_Compact : CUP_arifle_XM8_Base {
        A3A_price = 500;
    };
    class CUP_arifle_XM8_Compact_FG : CUP_arifle_XM8_Base {
        A3A_price = 500;
    };
    class CUP_arifle_G36_Base;
    class CUP_arifle_G36C : CUP_arifle_G36_Base {
        A3A_price = 420;
    };
    // Built-in optics
    class CUP_arifle_G36_Base_CarryhandleOptics : CUP_arifle_G36_Base {
        A3A_price = 700;
    };
    class CUP_arifle_G36A;
    class CUP_arifle_AG36 : CUP_arifle_G36A {
        A3A_price = 820;
    };
};
