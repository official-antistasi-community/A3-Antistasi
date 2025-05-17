// IFA - CfgAmmo.hpp


class CfgAmmo {
    class LIB_Bullet_Plane_base;
    class LIB_Bullet_AP_base;
    class LIB_Bullet_Vehicle_base;

    class LIB_B_127x99_Ball : LIB_Bullet_Vehicle_base {
        caliber = 1.43;
        hit = 20;
    };
    class LIB_B_37mm_61k_AP : LIB_Bullet_AP_base {
        ace_vehicle_damage_incendiary = 0.5;
        caliber = 3.0;
    };
    class LIB_B_37mm_AP : LIB_Bullet_Plane_base {
        ace_vehicle_damage_incendiary = 0.5;
        indirectHit = 4;
        indirectHitRange = 3;
    };
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

    // Make the bombs more consistent
    class BombCore;
    class LIB_Bomb_base : BombCore {
        sideAirFriction = 0;
    };
};
