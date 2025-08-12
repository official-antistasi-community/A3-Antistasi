class takistan {
	population[] = {
		{"city_FeeruzAbad",218},{"city_Nagara",99},{"city_Rasman",237},{"city_Garmsar",148},{"city_Bastam",66},{"city_Nur",127},{"city_Zavarak",160},{"city_Falar",86},{"city_Anar",92},{"city_ChakChak",129},{"city_Sakhee",97},{"city_Chaman",110},{"city_LoyManara",114},{"vill_Gospandi",50},{"vill_Mulladoost",110},{"vill_Khushab",84},{"vill_Jilavur",52},{"vill_Shukurkalay",127},{"vill_Imarat",40},{"vill_Ravanay",56},{"vill_Timurkalay",67},{"vill_Kakaru",29},{"vill_Landay",25},{"vill_Huzrutimam",83},{"vill_Sultansafee",52},{"vill_Jaza",61},{"vill_Chardarakht",99},{"vill_Shamali",36},{"vill_Karachinar",90},{"city_Garmarud",73}
	};
	disabledTowns[] = {}; //no towns that need to be disabled
	antennas[] = {
		{5137.9,6030.18,-0.00238037},{5578.24,9072.21,-0.842239},{5249.37,3709.48,-0.353882},{8547.92,3897.03,-0.56076},{3126.7,8223.88,-0.649429},{4014.64,3089.66,0.150574},{11710.2,9825.85,0.0984039},{2239.98,12630.7,-0.575844}
	};
	antennasBlacklistIndex[] = {}; //no antennas that need to be blacklisted
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"airport_1","outpost_5","outpost_6","outpost_7","outpost_8","resource","resource_5","resource_6"},{},{"control","control_1","control_2","control_5","control_13","control_20","control_21","control_22","control_24","control_25","control_31"}
	};
	fuelStationTypes[] = {"Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"};
	climate = "arid";
	buildObjects[] = {
		{"Land_fortified_nest_big_EP1", 300}, {"Land_Fort_Watchtower_EP1", 300}, {"Fortress2", 200}, {"Fortress1", 100}, {"Land_fortified_nest_small_EP1", 60},
		{"Land_Shed_09_F", 120}, {"Land_Shed_10_F", 140}, {"ShedBig", 100}, {"Shed", 100}, {"ShedSmall", 60}, {"Land_GuardShed", 30},
		// CUP sandbag walls
		{"Land_BagFenceLong", 10}, {"Land_BagFenceShort", 10}, {"Land_BagFenceRound", 10},        //{"Land_BagFenceEnd", 0, 5}, 
		// Other CUP fences
		{"Land_fort_artillery_nest_EP1", 200}, {"Land_fort_rampart_EP1", 50}, {"Fort_Barricade", 50}, {"Fence", 20}, {"FenceWood", 10}, {"FenceWoodPalet", 10}, 
		// Non-camo vanilla stuff
		{"Land_SandbagBarricade_01_half_F", 20}, {"Land_SlumWall_01_s_2m_F", 5}, {"Land_PillboxBunker_01_hex_F", 200},
		{"Land_Barricade_01_4m_F", 30}, {"Land_GuardBox_01_brown_F", 80}, {"Land_Tyres_F", 10}
	};
};
