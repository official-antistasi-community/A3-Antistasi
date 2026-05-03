/*
// Probably works if we wanna save ~100 lines
#define ADDP(var1) var1##_p
#define GENTASK(fnc,cat,wt,leg) class fnc {\
        category = QUOTE(cat);\
        func = QFUNC(fnc);\
        params = QFUNC(ADDP(fnc));\
        version = 1;\
        weight = wt;\
        isLegacy = leg;\
    }
#define LEGACY_TASK(fnc,cat,wt) GENTASK(fnc,cat,wt,1)
#define NEW_TASK(fnc,cat,wt) GENTASK(fnc,cat,wt,0)

class Tasks {
    LEGACY_TASK(KillOfficial,AS,1);
    LEGACY_TASK(KillSpecOps,AS,1);
};
*/

class Tasks {
    //Legacy tasks
    class AS_Official {
        category = "AS";                // What category the task belongs to
        func = QFUNCMAIN(AS_Official);      // Task function
        params = QFUNC(AS_Official_p);  // Parameters function
        version = 1;                    // Version number of task, update when compatibility is broken between last version and new update
        weight = 1;
        isLegacy = 1;                   // 1 = simple spawn, 0 = new runTask framework
    };
    class AS_specOP {
        category = "AS";
        func = QFUNCMAIN(AS_specOP);
        params = QFUNC(AS_specOP_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
    class AS_Traitor {
        category = "AS";
        func = QFUNCMAIN(AS_Traitor);
        params = QFUNC(AS_Traitor_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
    class CON_Outpost {
        category = "CON";
        func = QFUNCMAIN(CON_Outpost);
        params = QFUNC(CON_Outpost_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
    class convoy {
        category = "CONVOY";
        func = QFUNCMAIN(convoy);
        params = QFUNC(convoy_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
    class DES_Antenna {
        category = "DES";
        func = QFUNCMAIN(DES_Antenna);
        params = QFUNC(DES_Antenna_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
    class DES_Heli {
        category = "DES";
        func = QFUNCMAIN(DES_Heli);
        params = QFUNC(DES_Heli_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
    class DES_Vehicle {
        category = "DES";
        func = QFUNC(DES_Vehicle);
        params = QFUNC(DES_Vehicle_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
/*    class LOG_Ammo {
        category = "LOG";
        func = QFUNCMAIN(LOG_Ammo);
        params = QFUNC(LOG_Ammo_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
*/    class LOG_Bank {
        category = "LOG";
        func = QFUNCMAIN(LOG_Bank);
        params = QFUNC(LOG_Bank_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
    class LOG_Gunshop {
        category = "LOG";
        func = QFUNCMAIN(LOG_Gunshop);
        params = QFUNC(LOG_Gunshop_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
    class LOG_Salvage {
        category = "LOG";
        func = QFUNCMAIN(LOG_Salvage);
        params = QFUNC(LOG_Salvage_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
    class RES_Prisoners {
        category = "RES";
        func = QFUNCMAIN(RES_Prisoners);
        params = QFUNC(RES_Prisoners_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
    class RES_Refugees {
        category = "RES";
        func = QFUNCMAIN(RES_Refugees);
        params = QFUNC(RES_Refugees_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
    class SUP_PoliceStation {
        category = "SUPP";
        func = QFUNCMAIN(SUP_PoliceStation);
        params = QFUNC(SUP_PoliceStation_p);
        version = 1;
        weight = 1;
        isLegacy = 1;
    };
    class LOG_Weapons {
        category = "LOG";
        func = QFUNC(LOG_Weapons);
        params = QFUNC(LOG_Weapons_p);
        version = 1;
        weight = 1;
        isLegacy = 0;
    };
    class SUP_Supplies {
        category = "SUPP";
        func = QFUNC(SUP_Supplies);
        params = QFUNC(SUP_Supplies_p);
        version = 1;
        weight = 1;
        isLegacy = 0;
    };
};

class CityTasks {
    class Taxi {
        func = QFUNC(city_taxi); // the task information needed to run the task
        params = QFUNC(city_taxi_p); // determines the parameters for a task, if no valid ones can be genereated return false
        version = 1; //version number of task, update when compatibility is broken between last version and new update
        weight = 1;
    };
    class Repair {
        func = QFUNC(city_repair); // the task information needed to run the task
        params = QFUNC(city_repair_p); // determines the parameters for a task, if no valid ones can be genereated return false
        version = 1; //version number of task, update when compatibility is broken between last version and new update
        weight = 1;
    };
    class Hostage {
        func = QFUNC(city_hostage); // the task information needed to run the task
        params = QFUNC(city_hostage_p); // determines the parameters for a task, if no valid ones can be genereated return false
        version = 1; //version number of task, update when compatibility is broken between last version and new update
        weight = 1;
    };
    class KillCop {
        func = QFUNC(city_killcop); // the task information needed to run the task
        params = QFUNC(city_killcop_p); // determines the parameters for a task, if no valid ones can be genereated return false
        version = 1; //version number of task, update when compatibility is broken between last version and new update
        weight = 1;
    };

};
