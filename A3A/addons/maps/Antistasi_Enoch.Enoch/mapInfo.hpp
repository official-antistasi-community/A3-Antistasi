class enoch {
	population[] = {
		{"Adamow",200},{"Bielawa",150},{"Borek",150},{"Brena",150},{"Dolnik",100},{"Gieraltow",400},{"Gliniska",150},{"Grabin",250},{"Huta",150},{"Karlin",50},{"Kolembrody",100},{"Lembork",50},{"Lipina",100},{"Lukow",200},{"Muratyn",50},{"Nadbor",600},{"Nidek",100},{"Olszanka",100},{"Polana",100},{"Radacz",150},{"Radunin",150},{"Roztoka",50},{"Sitnik",150},{"Sobotka",100},{"Tarnow",200},{"Topolin",650},{"Zalesie",150},{"Zapadlisko",100}
	};
	disabledTowns[] = {}; //seems no location needs to be disabled
	antennas[] = {
		{3830.61,1827.19,0},{5007.39,2131.27,0},{1583.47,7162.08,0.000152588},{3146.07,7024.41,0.00133514},{1408.43,8675.08,-1.00183},{8894.99,2049.1,0.00387573},{2382.53,11479.5,3.05176e-005},{6293.86,9910.17,-7.62939e-006},{3585.76,11540.7,-0.000236511},{7906.11,9917.2,0.0120544},{7776.88,10082.3,0.0262146},{7866.34,10102.5,3.05176e-005},{6908.45,11119.5,-2.40052},{9257.02,10282.7,0.0631027},{10610.4,10890.6,0.166985},{11172.6,11424.1,-2.82624},{2078.25,7295.17,0.795135},{7620.01,5982.55,0}
	};
	antennasBlacklistIndex[] = {2,3,4,6,8,10,11,12,13,14};
	banks[] = {}; //no suitable building available
	garrison[] = {{},{"airport_3","control_14"},{},{"control_14"}};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	climate = "temperate";
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
