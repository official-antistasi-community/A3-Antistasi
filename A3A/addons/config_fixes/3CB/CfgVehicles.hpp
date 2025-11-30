//3CB - CfgVehicles.hpp

class CfgVehicles 
{
	#include "tan_air_3cb.hpp"
	class UK3CB_KRG_B_M270_Avenger;
	class a3a_green_M270_Avenger : UK3CB_KRG_B_M270_Avenger
    {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M270\data\mlrs_hull_olive_co.paa","\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M270\data\m998a2_avenger_1_olive_co.paa","\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M270\data\m998a2_avenger_3_co.paa","a3\armor_f\data\camonet_nato_green_co.paa"};
    };
    class UK3CB_MDF_O_Mystere;
    class a3a_UK3CB_Fake_Mig : UK3CB_MDF_O_Mystere {
        hiddenSelectionsMaterials[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\air\UK3CB_Factions_Vehicles_Mystere\data\mig.rvmat"};
        hiddenSelectionsTextures[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\air\UK3CB_Factions_Vehicles_Mystere\data\mig_co.paa"};
        crew = "UK3CB_CW_SOV_O_EARLY_JET_PILOT";
        displayName = "Mig (Faux)";
        faction = "UK3CB_CW_SOV_O_EARLY";
        side = 0;
    };
    class a3a_UK3CB_Fake_Sabre : UK3CB_MDF_O_Mystere {
        hiddenSelectionsMaterials[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\air\UK3CB_Factions_Vehicles_Mystere\data\sabre.rvmat"};
        hiddenSelectionsTextures[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\air\UK3CB_Factions_Vehicles_Mystere\data\usaf_co.paa"};
        crew = "UK3CB_CW_US_B_EARLY_JET_PILOT";
        displayName = "Sabre (Faux)";
        faction = "UK3CB_CW_US_B_EARLY";
        side = 1;
    };
};

