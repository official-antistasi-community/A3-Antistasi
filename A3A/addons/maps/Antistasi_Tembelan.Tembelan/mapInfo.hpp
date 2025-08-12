class tembelan {
/*
population numbers are reasonable, hence no need to manually adapt them
*/
	population[] = {};
	disabledTowns[] = {
		"DefaultKeyPoint1","DefaultKeyPoint2","DefaultKeyPoint21","DefaultKeyPoint49","DefaultKeyPoint58","DefaultKeyPoint60","DefaultKeyPoint79"
	};
	antennas[] = {
		{502.398,348.476,0.000190735},{4310.99,844.668,0.0271759},{1724.15,4777.62,-1.14441e-005},{2916.02,4174.11,1.14441e-005},
		{3020.15,8111.37,0.517868},{4133.57,8028.41,0.30658},{7080.68,5748.77,0.500134},{9160.06,4707.45,0.19401},
		{9542.17,5029,0.0381298},{9191.69,6012.89,0},{9238.39,6075.66,0.160484},{5780,6207.91,0.00521088}
	};
	antennasBlacklistIndex[] = {1,4,6,8,9};
	banks[] = {};
	garrison[] = {{},{"airport_2", "airport_4", "outpost_10", "seaport_2"},{},{}};
	fuelStationTypes[] = {"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F"};
	climate = "temperate";
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
