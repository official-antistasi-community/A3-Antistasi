class tanoa {
	population[] = {
		{"Lami01",277},{"Lifou01",350},{"Lobaka01",64},{"LaFoa01",38},{"Savaka01",33},{"Regina01",303},{"Katkoula01",413},{"Moddergat01",195},{"Losi01",83},{"Tanouka01",380},{"Tobakoro01",45},{"Georgetown01",347},{"Kotomo01",160},{"Rautake01",113},{"Harcourt01",325},{"Buawa01",44},{"SaintJulien01",353},{"Balavu01",189},{"Namuvaka01",45},{"Vagalala01",174},{"Imone01",31},{"Leqa01",45},{"Blerick01",71},{"Yanukka01",189},{"OuaOue01",200},{"Cerebu01",22},{"Laikoro01",29},{"Saioko01",46},{"Belfort01",240},{"Oumere01",333},{"Muaceba01",18},{"Nicolet01",224},{"Lailai01",23},{"Doodstil01",101},{"Tavu01",178},{"Lijnhaven01",610},{"Nani01",19},{"PetitNicolet01",135},{"PortBoise01",28},{"SaintPaul01",136},{"Nasua01",60},{"Savu01",184},{"Murarua01",258},{"Momea01",159},{"LaRochelle01",532},{"Koumac01",51},{"Taga01",31},{"Buabua01",27},{"Penelo01",189},{"Vatukoula01",15},{"Nandai01",130},{"Tuvanaka01",303},{"Rereki01",43},{"Ovau01",226},{"IndPort01",420},{"Ba01",106}
	};
	disabledTowns[] = {"Lakatoro01","Galili01","Sosovu01","Ipota01"};
	antennas[] = {
		{2682.94,2592.64,-0.000686646},{4701.6,3165.23,0.0633469},{2437.25,7224.06,0.0264893},{2563.15,9017.1,0.291538},{6617.95,7853.57,0.200073},{11008.8,4211.16,-0.00154114},{6005.47,10420.9,0.20298},{7486.67,9651.9,1.52588e-005},{2690.54,12323,0.0372467},{2965.33,13087.1,0.191544},{7278.8,12846.6,0.0838776},{12889.2,8578.86,0.228729},{10114.3,11743.1,9.15527e-005},{10949.8,11517.3,0.14209},{11153.3,11435.2,0.210876},{13775.8,10976.8,0.170441}
	};
	antennasBlacklistIndex[] = {9,14};
	banks[] = {
		{5893.41,10253.1,-0.687263},{9507.5,13572.9,0.133848}
	};
	garrison[] = {
		{},{"airport_1","seaport_5","outpost_10"},{},{"control_20"}
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
