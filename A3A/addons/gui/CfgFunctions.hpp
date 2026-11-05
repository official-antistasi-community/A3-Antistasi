// note use of preInit & postInit will run for EVERY mission, use sparingly or with non a3a mission aborts in place, example check if the class (missionConfigFile >> "A3A") exists
class CfgFunctions {
    class ADDON {
        class GUI {
            file = QPATHTOFOLDER(functions\GUI);
            class adminCopyUIDDialog {};
            class adminTab {};
            class aiManagementTab {};
            class airSupportTab {};
            class airTaxiTab {};
            class arsenalLimitsDialog {};
            class buildContextMenu {};
            class buyIntelDialog {};
            class buyVehicleDialog {};
            class buyVehicleTabs {};
            class chronicleTab {};
            class commanderTab {};
            class configColorToArray {};
            class constructTab {};
            class customLoadoutsDialog {};
            class deliverVehicleTab {};
            class deployedFlagDialog {};
            class donateTab {};
            class factionDebugTab {};
            class fastTravelTab {};
            class fireMissionEH {};
            class garrisonsTab {};
            class getGroupInfo {};
            class getGroupVehicle {};
            class getLocationMarkerName {};
            class getLocationMarkerType {};
            class getVehicleCrewCount {};
            class hqDialog {};
            class junkyardDialog {};
            class junkyardRepairTab {};
            class lootDeliveryDialog {};
            class mainDialog {};
            class mapDrawHcGroupsEH {};
            class mapDrawOutpostsEH {};
            class mapDrawSelectEH {};
            class mapDrawUserMarkersEH {};
            class missionAreaEH {};
            class playerManagementTab {};
            class playerStatsTab {};
            class playerTab {};
            class progressBar {};
            class recruitDialog {};
            class recruitSquadDialog {};
            class requestMissionDialog {};
            class setUpPlacerHints {};
            class squadComposerDialog {};
            class subCommandersDialog {};
            class teamLeaderRTSPlacerDialog {};
            class townsTab {};
            class siteUpgradesTab {};
            class townUpgradesTab {};
            class warStatusTab {};
        };

        class SetupGUI {
            file = QPATHTOFOLDER(functions\SetupGUI);
            class setupDialog {};
            class setupFactionsTab {};
            class setupLoadgameTab {};
            class setupParamsTab {};
            class setupConfirmDialog {};
            class setupHQPosDialog {};
            class setupTransferDialog {};
        };

        class controlsHelpers {
            file = QPATHTOFOLDER(functions\controlsHelpers);
            class directChildCtrls {};
            class emplaceControl {};
            class setTwoLineLabel {};
            class sortCGList {};
        };

        class mainMenu {
            file = QPATHTOFOLDER(functions\mainMenu);
            class bugReportDialog {};
            class communityAdDialog {};
            class mapSelectorDialog {};
            class optionsDialog {};
            class remarksDialog {};
            class showInterruptButtons {};
        };

        class objectHelpers {
            file = QPATHTOFOLDER(functions\objectHelpers);
            class sizeOf {};
        };

        class roleSelect {
            file = QPATHTOFOLDER(functions\roleSelect);
            class roleSelectDialog {};
        };

        class RRR {
            file = QPATHTOFOLDER(functions\RRR);
            class clearEmptyWeapons {};
            class serviceVehicle {};
            class serviceVehicleGlobal {};
            class vehServiceDialog {};
        };

        class gunShop {
            file = QPATHTOFOLDER(functions\gunShop);
            class addItemToBlackList {};
            class addToCart {};
            class blackListedItems {};
            class calculateItemPrice {};
            class checkOut {};
            class createFilters {};
            class createGunShopTab {};
            class fetchGunShopLists {};
            class gatherGunShopLists {};
            class gunShop {};
            class handleSearchEvents {};
            class lcgRand {};
            class updateCartNumber{};
            class updateCartPositions {};
            class updateFilters {};
            class updateTotalCost {};
        };
    };
};
