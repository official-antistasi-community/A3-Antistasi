class regero {
    population[] = {
        {"elguapo",25},{"angelito",101},{"corona",25},{"sanhernando",30},{"quentao",39},
        {"santafuero",51},{"farallon",25},{"mantolin",392},{"carbado",25},{"mellana",45},
        {"sanferes",27},{"ango",27},{"tarolla",44},{"puentora",27},{"yarra",70},
        {"chatto",36},{"woodend",25},{"westrubicon",26},{"lagolon",25},{"hillgrove",25},
        {"wattleglen",25},{"eastrubicon",25},{"clayton",54},{"sanisabel",364},{"portonuevo",403},
        {"cartera",78},{"viggo",67},{"desay",25}
    };
    disabledTowns[] = {};
    antennas[] = {
        {7954.92,4073.66,-0.00434113},{5882.92,2019.64,-4.3018},{2386.09,6897.74,0.9758},
        {7277.5,2559.15,-15.4134},{7530.9,2127.34,5.72205e-006},{7187.52,1389.39,0.474205},
        {8438.74,2433.79,-0.0430965},{9554.05,4129.93,-15.3871},{6542.54,9463.2,0.0699959},
        {551.773,5187,0.804718},{9608.08,6791.51,1.35839},{9444.25,2874.31,-34.1},
        {7165.63,555.428,-15.4359},{9347.84,1332.12,-0.0178871},{9354.15,1329.87,0.0515499},
        {9351.84,1197.67,-0.0194836},{9290.96,1080.57,-15.4632},{3816.77,4608.34,0},
        {6395.2,6490.85,0.0109787},{1757.94,1962.84,0}
    };
    antennasBlacklistIndex[] = {1, 4, 6, 7, 11, 12, 13, 15, 16};
    // Porto Nuevo, San Isabel, Angelito, Mantolin, Tarolla, Yarra Junction
    banks[] = {{7725.96,2057.89,0},{5810.59,2072.48,0},{2898.92,2773.55,0},{3272.17,4608.3,0},{3959.47,7069.8,0},{7425.13,6384.64,0}};
    garrison[] = {{},{"airport_5", "outpost_12", "outpost_10", "control_13", "control_20"},{},{"control_13", "control_20"}};
    fuelStationTypes[] = {
        "Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"
    };
    climate = "arid";
	buildObjects[] = {
		// Large vanilla arid structures
		{"Land_BagBunker_Large_F", 300}, {"Land_BagBunker_Tower_F", 300}, {"Land_BagBunker_Small_F", 60},
		{"Land_Shed_09_F", 120}, {"Land_Shed_10_F", 140},
		// Vanilla arid sandbag walls
		{"Land_BagFence_Long_F", 10}, {"Land_BagFence_Round_F", 10}, {"Land_BagFence_Short_F", 10},
		// Non-camo vanilla stuff
		{"Land_SandbagBarricade_01_half_F", 20}, {"Land_SlumWall_01_s_2m_F", 5}, {"Land_PillboxBunker_01_hex_F", 200},
		{"Land_Barricade_01_4m_F", 30}, {"Land_GuardBox_01_brown_F", 80}, {"Land_Tyres_F", 10}
	};
};