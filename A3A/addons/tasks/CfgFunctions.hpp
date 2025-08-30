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
        };
        class Params { // params getter functions for the tasks  |  returns false if failed, otherwise params array
            file = QPATHTOFOLDER(Params);
            class testTask_p {};
            class city_taxi_p {};
            class city_repair_p {};
        };
        class Tasks { // task  |  Passed task HM to store task instructions into
            file = QPATHTOFOLDER(Tasks);
            //class testTask {};
            class cityBattle {};
            class LOG_Supplies {};
            class city_taxi {};
            class city_repair {};
        };
    };
};
