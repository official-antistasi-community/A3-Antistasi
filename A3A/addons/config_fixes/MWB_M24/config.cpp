//SPE - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(MWB_M24)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"MWB_M24Chaffee"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

    
class CfgVehicles {
    class SPE_M18_Hellcat_Base;
    class MWB_M24Chaffee : SPE_M18_Hellcat_Base {
        class EventHandlers;
    };
    class a3a_MWB_M24Chaffee_US : MWB_M24Chaffee {
        class EventHandlers : EventHandlers {
            postinit = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        };
        textureList[] = {"USDusty",1,"Blank",0,"USSecondCavalry",1,"USSevenFiveTwo",1,"USEightOne",1,"USOneThree",1,"USThreeRecon",1,"USRebelsRoost",1,"USRakkasans",1,"USWinter",0,"USTiger",0,"PEFTOK",0,"SpainSantiago",0,"ItalyCentauro",0,"Austria",0,"Khmer",0,"Korea",0,"Norway",0,"BritsOne",0,"BritsTwo",0,"BritsThree",0,"BritsFour",0,"FranceOne",0,"FranceTwo",0,"FranceThree",0,"FranceDouaumont",0,"FranceConti",0,"FranceSmolensk",0,"FranceBazeille",0,"Iraq",0,"Japan",0,"Turkey",0,"Greece",0,"GreeceOld",0,"ARVN",0,"Taiwan",0,"Netherlands",0,"Canada",0,"Pakistan",0};
    };
    class a3a_MWB_M24Chaffee_UK : a3a_MWB_M24Chaffee_US {
        textureList[] = {"USDusty",0,"Blank",0,"USSecondCavalry",0,"USSevenFiveTwo",0,"USEightOne",0,"USOneThree",0,"USThreeRecon",0,"USRebelsRoost",0,"USRakkasans",0,"USWinter",0,"USTiger",0,"PEFTOK",0,"SpainSantiago",0,"ItalyCentauro",0,"Austria",0,"Khmer",0,"Korea",0,"Norway",0,"BritsOne",1,"BritsTwo",1,"BritsThree",1,"BritsFour",1,"FranceOne",0,"FranceTwo",0,"FranceThree",0,"FranceDouaumont",0,"FranceConti",0,"FranceSmolensk",0,"FranceBazeille",0,"Iraq",0,"Japan",0,"Turkey",0,"Greece",0,"GreeceOld",0,"ARVN",0,"Taiwan",0,"Netherlands",0,"Canada",1,"Pakistan",0};
    };
    class a3a_MWB_M24Chaffee_French : a3a_MWB_M24Chaffee_US {
        faction = "SPE_FR_ARMY";
        textureList[] = {"USDusty",0,"Blank",0,"USSecondCavalry",0,"USSevenFiveTwo",0,"USEightOne",0,"USOneThree",0,"USThreeRecon",0,"USRebelsRoost",0,"USRakkasans",0,"USWinter",0,"USTiger",0,"PEFTOK",0,"SpainSantiago",0,"ItalyCentauro",0,"Austria",0,"Khmer",0,"Korea",0,"Norway",0,"BritsOne",0,"BritsTwo",0,"BritsThree",0,"BritsFour",0,"FranceOne",1,"FranceTwo",1,"FranceThree",1,"FranceDouaumont",1,"FranceConti",1,"FranceSmolensk",1,"FranceBazeille",1,"Iraq",0,"Japan",0,"Turkey",0,"Greece",0,"GreeceOld",0,"ARVN",0,"Taiwan",0,"Netherlands",0,"Canada",0,"Pakistan",0};
    };
    class a3a_MWB_M24Chaffee_ARVN : a3a_MWB_M24Chaffee_US {
        textureList[] = {"USDusty",0,"Blank",0.3,"USSecondCavalry",0,"USSevenFiveTwo",0,"USEightOne",0,"USOneThree",0,"USThreeRecon",0,"USRebelsRoost",0,"USRakkasans",0,"USWinter",0,"USTiger",0.1,"PEFTOK",0,"SpainSantiago",0,"ItalyCentauro",0,"Austria",0,"Khmer",0,"Korea",0,"Norway",0,"BritsOne",0,"BritsTwo",0,"BritsThree",0,"BritsFour",0,"FranceOne",0,"FranceTwo",0,"FranceThree",0,"FranceDouaumont",0,"FranceConti",0,"FranceSmolensk",0,"FranceBazeille",0,"Iraq",0,"Japan",0,"Turkey",0,"Greece",0,"GreeceOld",0,"ARVN",1,"Taiwan",0,"Netherlands",0,"Canada",0,"Pakistan",0};
    };
    class a3a_MWB_M24Chaffee_ROK : a3a_MWB_M24Chaffee_US {
        textureList[] = {"USDusty",0,"Blank",0,"USSecondCavalry",0,"USSevenFiveTwo",0,"USEightOne",0,"USOneThree",0,"USThreeRecon",0,"USRebelsRoost",0,"USRakkasans",0,"USWinter",0,"USTiger",0,"PEFTOK",0,"SpainSantiago",0,"ItalyCentauro",0,"Austria",0,"Khmer",0,"Korea",1,"Norway",0,"BritsOne",0,"BritsTwo",0,"BritsThree",0,"BritsFour",0,"FranceOne",0,"FranceTwo",0,"FranceThree",0,"FranceDouaumont",0,"FranceConti",0,"FranceSmolensk",0,"FranceBazeille",0,"Iraq",0,"Japan",0,"Turkey",0,"Greece",0,"GreeceOld",0,"ARVN",0,"Taiwan",0,"Netherlands",0,"Canada",0,"Pakistan",0};
    };
};