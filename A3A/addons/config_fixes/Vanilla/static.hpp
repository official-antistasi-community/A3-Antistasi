// Vanilla - static.hpp

// Increase traverse arc of vanilla Titan launchers
// Changing turret config parameters sucks
class LandVehicle;
class StaticWeapon : LandVehicle {
    class Turrets;
};
class StaticMGWeapon : StaticWeapon {
    class Turrets : Turrets {
        class MainTurret;
    };
};
class AT_01_base_F : StaticMGWeapon {
    class Turrets : Turrets {
        class MainTurret : MainTurret {
            maxTurn = 75;
            minTurn = -75;
        };
    };
};
class AA_01_base_F : StaticMGWeapon {
    class Turrets : Turrets {
        class MainTurret : MainTurret {
            maxTurn = 75;
            minTurn = -75;
        };
    };
};
