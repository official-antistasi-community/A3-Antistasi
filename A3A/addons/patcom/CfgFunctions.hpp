class CfgFunctions {
    class A3A {
        class Artillery {
            file = QPATHTOFOLDER(functions\Artillery);
            class artilleryAdd {};
            class artilleryDangerClose {};
            class artilleryFireMission {};
            class getReloadTime {};
        };

        class Civilian {
            file = QPATHTOFOLDER(functions\Civilian);
            class civilianFiredNearEH {};
            class civilianInitEH {};
            class createAmbientCiv {};
            class createAmbientCivTraffic {};
            class createCivilianTracks {};
            class createMusicSource {};
            class createResourceCiv {};
            class createRoomLight {};
            class getDayState {};
        };

        class Patcom {
            file = QPATHTOFOLDER(functions\Patcom);
            class clearVehicleCargo {};
            class debugText3D {};
            class debug3DPath {};
            class getSafePos {};
            class patrolArea {};
            class patrolArmStatics {};
            class patrolAttack {};
            class patrolBuildingEnterable {};
            class patrolCivilianCommander {};
            class patrolCommander {};
            class patrolCreateWaypoint {};
            class patrolDefend {};
            class patrolEnterableBuildings {};
            class patrolFlankPos {};
            class patrolGetEnemies {};
            class patrolGroupGarrison {};
            class patrolGroupVariables {};
            class patrolHandleFormation {};
            class patrolInit {};
            class patrolLoop {};
            class patrolSearchBuilding {};
            class patrolSetCombatModes {};
            class patrolWater {};
        };
    };
};
