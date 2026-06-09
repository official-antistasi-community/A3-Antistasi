class CfgFunctions {
    class ADDON {
        class Core {
            file = QPATHTOFOLDER(Core);
            class genTaskUID {};
            class getSettings { postInit = 1; };
            class requestTask {};
            class runTask {};
            class selectCityTask {};
        };
        class Helpers { // task helper functions  |  Common functionality used by tasks or the params getters
            file = QPATHTOFOLDER(Helpers);
            class hintNear {};
            class minutesFromNow {};
            class nearFriendlyMarkers {};
            class nearHostileMarkers {};
            class rewardPlayers {};
            class taskNotifyNear {};
        };
        class CityParams {  // params getters for city tasks  |  take city marker as input, unlike other params functions
            file = QPATHTOFOLDER(CityParams);
            class city_killcop_p {};
            class city_hostage_p {};
            class city_taxi_p {};
            class city_repair_p {};
        };
        class Params { // params getter functions for the tasks  |  returns false if failed, otherwise params array
            file = QPATHTOFOLDER(Params);
            class AS_Official_p {};
            class AS_SpecOp_p {};
            class AS_Traitor_p {};
            class CON_Outpost_p {};
            class convoy_p {};
            class DES_Antenna_p {};
            class DES_Heli_p {};
            class DES_Vehicle_p {};
            class LOG_Ammo_p {};
            class LOG_Bank_p {};
            class LOG_Gunshop_p {};
            class LOG_Salvage_p {};
            class LOG_Weapons_p {};
            class RES_Prisoners_p {};
            class RES_Refugees_p {};
            class SUP_PoliceStation_p {};
            class SUP_Supplies_p {};
        };
        class Tasks {
            file = QPATHTOFOLDER(Tasks);
            class cityBattle {};
            class city_killcop {};
            class city_hostage {};
            class city_taxi {};
            class city_repair {};
            class SUP_Supplies {};
            class LOG_Weapons {};
        };
    };
};
