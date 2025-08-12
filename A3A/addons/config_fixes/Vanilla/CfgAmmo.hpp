class CfgAmmo 
{
    // Price overrides for gun shop
    // ASP-1 ammo
    class BulletBase;
    class B_127x54_Ball : BulletBase {
        A3A_price = 5.0;
    };
    // SDAR ammo
    class B_556x45_Ball;
    class B_556x45_dual : B_556x45_Ball {
        A3A_price = 3.0;
    };
};
