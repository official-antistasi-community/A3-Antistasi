class stubbhult {
    population[] = {
        {"gussbo",49},{"aker",48},{"bockshult",60},{"ekenas",99},{"bexet",72},{"hylte",134},{"yaberg",54},{"gullanabba",348},{"balshult",170},
        {"femsjo",91},{"hallaboke",51},{"saraboke",93},{"hokhult",23},{"boalt",135},{"lojenas",71},{"sodra_bokeberg",29},{"norra_bokeberg",30},
        {"backhasten",19},{"rangalsbo",55},{"rangelsnas",35},{"ekenaso",10},{"krakshult",55},{"kalvhult",93},{"gnosjo",46},{"bohult",26},
        {"hjalmshult",35},{"sofieslatt",36},{"mjalahult",44},{"vallshult",47},{"saxhult",14},{"unnaryd",21},{"yttre_mjala",58},{"dohult",25},
        {"eldshult",69},{"ostra_bokeberg",57},{"langaryd",64}
    };
    disabledTowns[] = {
        "bockshult","sofieslatt","gussbo","ekenaso","bohult","vallshult","saxhult","norra_bokeberg","hokhult",
    };
    antennas[] = {
        {5643.8,7265.82,0},{5540.82,5020.95,0},
        {5531.03,4567.72,0.000167847},{2908.3,6545.92,0.00120926},
        {8110.87,3083.77,0.0357056},{6068.57,9802.19,0},
        {9139.44,8597.88,0},{2109.49,4809.39,0.0322266},
        {7321.96,10270.2,0.00366974},{5454.29,1827.34,0.0399227},
        {7798.56,1549.83,0},{10274.8,9230.43,0.0019989},
        {2431.04,9782.04,0.0503807},{894.818,5745.19,0.280094},
        {6000.43,11409.4,0},{8813.55,1240.22,0.000663757},
        {4572.95,713.594,0.0327225},{9150.88,11212.3,0.00497055},
        {873.016,3053.71,0},{12017.8,457.863,0}
    };
    antennasBlacklistIndex[] = {0,2,3,4,8,11,12,16,17};
    banks[] = {
        {2405.14,5072.26,0},{8623.46,9843.15,0},{1252.83,10667.1,0}
    };
    garrison[] = {
        {},{"outpost_6","factory_1","outpost_7","outpost_25","resource_31"},
        {},{"control_4","control_5"}
    };
    fuelStationTypes[] = {
        "Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F",
        "Jbad_Ind_FuelStation_Feed"
    };
    climate = "temperate";
    buildObjects[] = {
    // Large vanilla tropical structures
    {"Land_BagBunker_01_large_green_F", 300}, {"Land_HBarrier_01_tower_green_F", 300}, {"Land_BagBunker_01_small_green_F", 60},
    {"Land_Shed_09_F", 120}, {"Land_Shed_10_F", 140},
    // vanilla tropical sandbag walls
    {"Land_BagFence_01_short_green_F", 10}, {"Land_BagFence_01_round_green_F", 10}, {"Land_BagFence_01_long_green_F", 10},
    // Non-camo vanilla stuff
    {"Land_SandbagBarricade_01_half_F", 20}, {"Land_SlumWall_01_s_2m_F", 5},
    {"Land_Barricade_01_4m_F", 30}, {"Land_GuardBox_01_brown_F", 80}, {"Land_Tyres_F", 10}
};
policeStationTypes[] = {
		"Land_PoliceStation_01_F"
	};
};