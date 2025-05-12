class tem_kujari {
	population[] = {
		{"Gonidi",71},{"AfofoBangoua",25},{"AfofoGangna",25},{"AfofoKiska",25},{"AriBoudoumiri",84},
		{"BiriNoula",110},{"Chouwari",48},{"Damaram",629},{"Gouara",36},{"Kabaridi",25},
		{"KawiyaBoukarSouri",31},{"KawiyaGambori",82},{"KawiyaLawanBachir",39},{"KawiyaLawanBoukar",105},{"KawiyaMainari",27},
		{"KawiyaMaloumdi",44},{"KawiyaMoustapha",76},{"KoubleMaimatara",46},{"Madairi",100},{"Maiwa",46},
		{"Mandalari",46},{"Marwey",501},{"Mianmi",25},{"Mourimadi",121},{"Rara",25},
		{"Salmari",99},{"Wondori",142},{"Afofo",25},{"Mawa",29},{"LawanAridi",46},
		{"Ariboudoumari",30},{"Samari",182},{"Douro",39},{"GeydamTchoukou",292},{"Barawas",32},
		{"Bramataro",34},{"Walada",54},{"Gororop",25},{"Mimi",78},{"BiriBoula",128},
		{"Kaoya",115},{"Malari",25},{"GajajiMastafa",25},{"Masakali",55},{"Isufuri",25},
		{"KyariKinnai",206},{"MallumtiBurin",50},{"Yusufari",92},{"BalamaKurdi",69},{"Chunguliski",25},
		{"GadjadjiLawan",33},{"Tsakuwa",25},{"Gano",25},{"Kumbotso",25},{"Kura",116},
		{"Izala",47},{"Danashiwa",169},{"Turawa",25},{"Karaye",31},{"Bora",83}
	}; 
	disabledTowns[] = {"Ndilgori"};
	antennas[] = {
		{9907.64,8816.97,0.0937614},{6227.55,9143.77,0.0173683},{11706.2,6888.35,0.0166779},{6463.11,11835.9,0.00778198},
		{8057.83,3152.71,0.0414696},{4289.6,3838.09,0.00062561},{14559.3,9804.99,0.121281},{12689.9,3212.28,-0.00634003},
		{2218.75,4310.41,-0.00779724},{15247.8,5813.69,0.0383797},{12153.8,15080.1,-0.00162506},{1004.36,12550.4,0.0623932},
		{3028.17,15750.5,0.0923653}
	};
	antennasBlacklistIndex[] = {}; 
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"airport_5","outpost_8","outpost_16","outpost_19","resource_1","resource_2","resource_13"},{},{"control_1","control_2","control_3","control_4","control_5","control_6","control_7","control_8"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"
	};
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
