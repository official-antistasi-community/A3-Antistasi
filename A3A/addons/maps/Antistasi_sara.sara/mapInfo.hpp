class sara {
	population[] = {
		{"Sara_Rashidah",25},{"Sara_Balmopan",97},{"Sara_Estrella",66},{"Sara_Chantico",82},{"Sara_Cedras",33},{"Sara_Ambergris",59},{"Sara_Ortego",450},{"Sara_Cayo",94},{"Sara_Iguana",107},{"Sara_Dolores",315},{"Sara_Parato",26},{"Sara_Tiberia",49},{"Sara_Geraldo",33},{"Sara_Corazol",397},{"Sara_Gulan",38},{"Sara_Somato",167},{"Sara_Bonanza",25},{"Sara_Corinto",31},{"Sara_Yoro",25},{"Sara_Pesto",25},{"Sara_Paraiso",450},{"Sara_Arcadia",74},{"Sara_Masbete",59},{"Sara_Pita",82},{"Sara_Bagango",218},{"Sara_Eponia",109},{"Sara_Everon",59},{"Sara_Hunapu",34},{"Sara_Pacamac",30},{"Sara_Tlaloc",33},{"Sara_Obregan",147},{"Sara_Carmen",33},{"Sara_Ixel",31},{"Sara_Mercalillo",154},{"Sara_Modesta",52},{"Sara_Valor",25},{"Sara_Gaula",45},{"Sara_Mataredo",25},{"Sara_Benoma",25},{"Sara_Tandag",43},{"Sara_Rahmadi",30}
	};
	disabledTowns[] = {}; //no towns that need to be disabled
	antennas[] = {
		{3142.96,2739.15,0.18647},{8514.74,7996.98,0.0240936},{11464.1,6307.43,-0.0322723},{11885.1,6210.11,-15.4125},{9617.11,9829.03,0},{10214.7,9348.09,0.0702515},{9738.74,9966.7,-0.226944},{10415.5,9761.01,-0.0189056},{12621.4,7490.31,0.1297},{12560.1,8362.11,-0.157566},{13328.6,9055.83,0.350442},{4940.89,15457.6,-0.18277},{12327.2,15031.4,0},{14788,12762.9,-15.4287},{11068.1,16903.5,-0.0132771},{13964.6,15752.9,-15.429},{17263.3,14160.1,-0.1},{17605.3,9567.2,0},{18921.8,14188.5,-0.000673294},{8197.28,7769.87,0}
	};
	antennasBlacklistIndex[] = {1,3,4,5,9,11,13,16,17};
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"airport_1","seaport_6","outpost_22","outpost_15","resource_9","outpost_19","outpost_14","resource_11"},{},{"control_28","control_27"}
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
