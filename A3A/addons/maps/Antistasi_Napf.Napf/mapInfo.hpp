class Napf {
	population[] = {
		{"vil_Lenzburg",584},{"vil_Trueb",148},{"vil_Seltisberg",129},{"vil_NeueWelt",144},{"vil_Bubendorf",124},{"vil_Seewen",46},
		{"vil_Huttwil",134},{"vil_Oberdorf",69},{"vil_Muttenz",386},{"farm_HofHorn",11},
		{"farm_Elbishof",21},{"farm_Rossbode",31},{"vil_Muenchenstein",368},{"vil_Chatzbach",163},{"vil_Bruderholz",36},{"farm_Aegerifeld",16},
		{"vil_Freidorf",83},{"vil_Olten",205},{"vil_Ruemlingen",184},{"Hof_KleineEgg",16},{"farm_Eichmatt",10},
		{"vil_Hirsegg",59},{"Insel_Hasenmatt",5},{"vil_Lausen",121},{"farm_Ey",16},{"farm_Rorighof",6},{"farm_Arxhof",11},{"farm_Ramsebode",12},
		{"vil_Unterdorf",94},{"vil_Luzern",750},{"vil_Emmen",422},{"vil_Wolhusen",151},{"vil_Horw",152},{"vil_Romoos",48},{"vil_Meggen",68},
		{"vil_Liestal",274},{"vil_Sachseln",91},{"vil_Sissach",104},{"vil_Buckten",35},{"vil_Eggwil",48},{"Insel_Pfeffikon",36},
		{"vil_Signau",88},{"vil_Schangen",186},{"vil_Hasle",58},{"vil_Worb",458},{"vil_Munsingen",144},{"vil_Ittingen",152},{"vil_Hindelbank",91},
		{"Hof_Goms",39},{"Hof_Hungerschwand",12},{"vil_Farnen",38},{"vil_Sorenberg",107},
		{"pass_Rorenpass",7},{"Hof_Waldegg",10},{"vil_Brienz",98},{"vil_Nordstern",55},{"vil_Goldwil",20},{"vil_Magden",52},
		{"vil_Bunig", 100},{"vil_Malters",55},{"vil_Wasen",41},{"vil_Seltishafen",53},{"vil_Abach",46}
	};
	disabledTowns[] = {
		"mil_SouthAirstrip","Island_Feldmoos","Island_Bernerplatte","castle_Homburg","Castle_Froburg","ind_Saegewerk",
		"for_Teufelsgraben","lw_Ruchfeld","lw_Lochacker","LandMark_Hubel","Insel_Suhrenfeld","Insel_Hasenmatt","vil_Giswil","farm_Alpnach","lw_Hagacher"
	};
	antennas[] = {
		{10987.7,9465.01,0.0774231},{9135.95,11027.4,-0.783722},{7672.83,9772.95,0.00149536},{8994.92,7573.55,0.0384521},{8994.92,7573.55,-0.444763},{6202.3,10639,-0.000984192},{6186.1,12025.9,-0.0628891},{7919.53,14442.1,0.219131},{15117.9,12586.8,0.00614929},{10898,4404.76,-0.135315},{9393.43,16246.8,-0.00434494},{9393.61,16247,0.0274506},{7021.62,4662.36,0.158585},{5852.23,15093.9,-0.0428619},{9676.3,2933.88,-0.334412},{5258.93,4510.2,-1.52588e-005},{698.401,6726.06,-0.179443},{16327.5,18434.2,-0.105293},{18743.5,2148.42,-0.226135}
	};
	antennasBlacklistIndex[] = {0,3,6,8,9,10,12,13,16};
	distanceForAirAttack = 16000;
	distanceForLandAttack = 5000;
	banks[] = {
		{8770.24,16103.2,0},{14572.2,13863.2,0},{6422.43,9854.96,0},{12736.4,9494.58,0},{6243.64,10474.4,0}
	};
	garrison[] = {
		{},{"airport_3","seaport_9","seaport_10","airport_1","outpost_4"},{},
		{"control_7","control_31","control_30"}
	};
	fuelStationTypes[] = {
		"Land_Fuelstation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_03_pump_F","Land_FuelStation_02_pump_F","Land_Benzina_schnell","Land_A_FuelStation_Feed",
	};
	climate = "temperate";
	buildObjects[] = {
		{"Land_fortified_nest_big_EP1", 300}, {"Land_Fort_Watchtower_EP1", 300}, {"Fortress2", 200}, {"Fortress1", 100}, {"Fort_Nest", 60},
		{"Land_Shed_09_F", 120}, {"Land_Shed_10_F", 140}, {"ShedBig", 100}, {"Shed", 100}, {"ShedSmall", 60}, {"Land_GuardShed", 30},
		// CUP sandbag walls
		{"Land_BagFenceLong", 10}, {"Land_BagFenceShort", 10}, {"Land_BagFenceRound", 10}, {"Land_BagFenceEnd", 5},
		// Other CUP fences
		{"Land_fort_artillery_nest_EP1", 200}, {"Land_fort_rampart_EP1", 50}, {"Fort_Barricade", 50}, {"Fence", 20}, {"FenceWood", 10}, {"FenceWoodPalet", 10},
		// Non-camo vanilla stuff
		{"Land_SandbagBarricade_01_half_F", 20}, {"Land_SlumWall_01_s_2m_F", 5}, {"Land_PillboxBunker_01_hex_F", 200},
		{"Land_Barricade_01_4m_F", 30}, {"Land_GuardBox_01_brown_F", 80}, {"Land_Tyres_F", 10}
	};
	policeStationTypes[] = {
		// Chernarus
		"Land_HouseV2_04_interier", "Land_HouseV2_02_Interier", "Land_A_Pub_01",
		//"Land_a_stationhouse", "Land_HouseV_1I4", "Land_Mil_Guardhouse",
		// North Sahrani
		"Land_Dum_mesto2", "Land_Dum_olezlina"
	};
	requiredMods = "Napf Island A3 and CUP Terrains - Core";
	size = 20.5;
	cityCount = 62;
	airbaseCount = 4;
};
