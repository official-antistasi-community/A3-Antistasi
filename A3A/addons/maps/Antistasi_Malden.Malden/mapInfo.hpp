class malden {
	population[] = {}; //automated data is fine and needs no adaptation
	disabledTowns[] = {"Malden_C_Airport","Malden_L_Moray"};
	antennas[] = {
		{5692.11,5551.59,1.4357},{4744.17,7156.41,0.00292969},{7057.21,9932.39,3.05176e-005},{7000.77,10033.3,0.808578},{8309.54,10138.9,-0.000183105},{4967.98,2280.99,0.0695496},{9635.35,3309.94,0.510147},{11320.1,4122.02,0.194778}
	};
	antennasBlacklistIndex[] = {2,5,7};
	banks[] = {}; //only one possible building but directly next to a factory
	garrison[] = {{},{"airport","seaport_7"},{},{}};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
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
