// IFA - CfgAmmo.hpp

class CfgAmmo {
    // Buffs to bring mortar effectiveness against unarmoured somewhere near vanilla against armoured
    class Sh_82mm_AMOS;
    class LIB_Sh_82_HE : Sh_82mm_AMOS {
        indirectHitRange = 13;
    };
    class LIB_Sh_81_HE : LIB_Sh_82_HE {
        indirectHitRange = 12.6;
    };
    class LIB_Sh_60_HE : LIB_Sh_82_HE {
        indirectHitRange = 11;
    };
};
