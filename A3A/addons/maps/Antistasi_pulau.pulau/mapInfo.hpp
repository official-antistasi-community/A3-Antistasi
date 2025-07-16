class pulau {
	population[] = {
		{"DefaultKeyPoint1",38},
		{"DefaultKeyPoint2",59},
		{"DefaultKeyPoint3",76},
		{"DefaultKeyPoint4",41},
		{"DefaultKeyPoint5",57},
		{"DefaultKeyPoint7",43},
		{"DefaultKeyPoint8",28},
		{"DefaultKeyPoint10",47},
		{"DefaultKeyPoint15",31},
		{"DefaultKeyPoint19",33},
		{"DefaultKeyPoint20",64},
		{"DefaultKeyPoint21",34},
		{"DefaultKeyPoint22",27},
		{"DefaultKeyPoint23",58},
		{"DefaultKeyPoint24",30},
		{"DefaultKeyPoint25",38},
		{"DefaultKeyPoint26",33},
		{"DefaultKeyPoint27",59},
		{"DefaultKeyPoint28",52},
		{"DefaultKeyPoint32",31},
		{"Loholoho",233}
	};
	disabledTowns[] = {"DefaultKeyPoint6","DefaultKeyPoint9","DefaultKeyPoint11","DefaultKeyPoint12","DefaultKeyPoint13","DefaultKeyPoint14","DefaultKeyPoint16","DefaultKeyPoint17","DefaultKeyPoint18","DefaultKeyPoint29","DefaultKeyPoint30","DefaultKeyPoint31"};
	antennas[] = {
		{6004.48,6269.15,-7.62939e-006},{5367.93,8981.39,0.00322723},{7329.88,2402.91,0.0544472},{1907,7127.88,0.0916786},{9409.2,3129.01,0.885342},{7075.77,1006.8,7.62939e-005},{2626.32,1945.44,0.00999451}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {
        {5934.3,5828.19,0}
	};
	garrison[] = {
		{},{"seaport_1","outpost_1","outpost_18"},{},{"control_0","control_1","control_2","control_10","control_11"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	climate = "tropical";
	buildObjects[] = {
		// Large vanilla tropical structures
		{"Land_BagBunker_01_large_green_F", 300}, {"Land_HBarrier_01_tower_green_F", 300}, {"Land_BagBunker_01_small_green_F", 60},
		{"Land_Shed_09_F", 120}, {"Land_Shed_10_F", 140},
		// vanilla tropical sandbag walls
		{"Land_BagFence_01_short_green_F", 10}, {"Land_BagFence_01_round_green_F", 10}, {"Land_BagFence_01_long_green_F", 10},
		// Non-camo vanilla stuff
		{"Land_SandbagBarricade_01_half_F", 20}, {"Land_SlumWall_01_s_2m_F", 5}, {"Land_PillboxBunker_01_hex_F", 200},
		{"Land_Barricade_01_4m_F", 30}, {"Land_GuardBox_01_brown_F", 80}, {"Land_Tyres_F", 10}
	};
};
