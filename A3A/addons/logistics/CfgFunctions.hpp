class CfgFunctions {
    class ADDON {
        class Dev {
            file = QPATHTOFOLDER(Dev);
            class convertCargoToNew {};
            class convertNodesToNew {};
            class drawSeats {};
            class generateCargoOffset {};
            class generateHardPoints {};
        };

        class Public {
            file = QPATHTOFOLDER(Public);
            class addLoadAction {};
            class getVehCapacity {};
            class isLoadable {};
        };

        class Private {
            file = QPATHTOFOLDER(Private);
            class addAction {};
            class addOrRemoveObjectMass {};
            class addWeaponAction {};
            class canLoad {};
            class getCargoConfig {};
            class getCargoNodeType {};
            class getCargoOffsetAndDir {};
            class getNodeConfig {};
            class getVehicleNodes {};
            class initMountedWeapon {};
            class load {};
            class packObject {};
            class refreshVehicleLoad {};
            class removeWeaponAction {};
            class toggleAceActions {};
            class toggleLock {};
            class tryLoad {};
            class unload {};
            class unpackObject {};
        };
    };
};
