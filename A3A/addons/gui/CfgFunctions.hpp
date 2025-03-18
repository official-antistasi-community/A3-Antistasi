// note use of preInit & postInit will run for EVERY mission, use sparingly or with non a3a mission aborts in place, example check if the class (missionConfigFile >> "A3A") exists
class CfgFunctions {
    class ADDON {
        class GUI {
            file = QPATHTOFOLDER(functions\GUI);
            class adminTab {};
            class aiManagementTab {};
            class airSupportTab {};
            class arsenalLimitsDialog {};
            class buyVehicleDialog {};
            class buyVehicleTabs {};
            class commanderTab {};
            class configColorToArray {};
            class constructTab {};
            class customLoadoutsDialog {};
            class donateTab {};
            class fastTravelTab {};
            class fireMissionEH {};
            class getGroupInfo {};
            class getGroupVehicle {};
            class getVehicleCrewCount {};
            class hqDialog {};
            class mainDialog {};
            class mapDrawHcGroupsEH {};
            class mapDrawOutpostsEH {};
            class mapDrawSelectEH {};
            class mapDrawUserMarkersEH {};
            class playerManagementTab {};
            class playerTab {};
            class recruitDialog {};
            class recruitSquadDialog {};
            class requestMissionDialog {};
            class setUpPlacerHints {};
            class teamLeaderRTSPlacerDialog {};
        };

        class SetupGUI {
            file = QPATHTOFOLDER(functions\SetupGUI);
            class setupDialog {};
            class setupFactionsTab {};
            class setupLoadgameTab {};
            class setupParamsTab {};
            class setupConfirmDialog {};
            class setupHQPosDialog {};
        };

        class controlsHelpers {
            file = QPATHTOFOLDER(functions\controlsHelpers);
            class directChildCtrls {};
            class emplaceControl {};
            class sortCGList {};
        };

        class objectHelpers {
            file = QPATHTOFOLDER(functions\objectHelpers);
            class sizeOf {};
        };
    };
};
