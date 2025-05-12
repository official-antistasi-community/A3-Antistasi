// IFA - CfgAmmo.hpp

class CfgAmmo {
    // Make the bombs non-weird
    class BombCore;
    class SPE_Bomb_base : BombCore {
        sideAirFriction = 0;
    };
};
