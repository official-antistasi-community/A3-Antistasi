class cup_chernarus_A3 {
	population[] = {
		{"City_NovayaPetrovka",552},
		{"City_Severograd",362},
		{"Settlement_Arsenovo",25},
		{"Settlement_Kalinovka",133},
		{"Settlement_Kamensk",147},
		{"Settlement_Krasnoe",29},
		{"Settlement_Nagornoe",177},
		{"Settlement_Polesovo",117},
		{"Settlement_Ratnoe",82},
		{"Settlement_Skalka",51},
		{"Settlement_StaryYar",348},
		{"Settlement_Svergino",164},
		{"Settlement_Zaprudnoe",168},
		{"Vil_Sinystok",107},
		{"Vil_Tisy",83},
		{"Vil_Topolniki",234},
		{"city_Berezino",349},
		{"city_Chernogorsk",628},
		{"city_Elektrozavodsk",704},
		{"city_Gorka",159},
		{"city_Krasnostav",221},
		{"city_Novodmitrovsk",596},
		{"city_Solnychniy",225},
		{"city_StarySobor",181},
		{"city_Svetloyarsk",487},
		{"city_Vybor",240},
		{"city_Zelenogorsk",477},
		{"city_cernayapolana",225},
		{"vil_BelayaPolyana",92},
		{"vil_Berezhki",26},
		{"vil_Bogtyrka",146},
		{"vil_Dobroye",49},
		{"vil_Karmanovka",142},
		{"vil_Turovo",97},
		{"vil_Zabolotye",55},
		{"vil_vavilovo",121},
		{"vill_Balota",160},
		{"vill_Bor",63},
		{"vill_Dolina",86},
		{"vill_Drozhino",107},
		{"vill_Dubrovka",102},
		{"vill_Grishino",143},
		{"vill_Guglovo",31},
		{"vill_Gvozdno",95},
		{"vill_Kabanino",80},
		{"vill_Kamenka",130},
		{"vill_Kamyshovo",207},
		{"vill_Khelm",119},
		{"vill_Komarovo",132},
		{"vill_Lopatino",148},
		{"vill_Mogilevka",117},
		{"vill_Msta",94},
		{"vill_Myshkino",97},
		{"vill_Nadezhdino",105},
		{"vill_Nizhnoye",143},
		{"vill_NovySobor",127},
		{"vill_Olsha",117},
		{"vill_Orlovets",62},
		{"vill_Pavlovo",122},
		{"vill_Pogorevka",74},
		{"vill_Polana",136},
		{"vill_Prigorodki",147},
		{"vill_Pulkovo",39},
		{"vill_Pusta",48},
		{"vill_Pustoshka",197},
		{"vill_Rogovo",73},
		{"vill_Shakhovka",62},
		{"vill_Sosnovka",61},
		{"vill_Staroye",106},
		{"vill_Tulga",42},
		{"vill_Vyshnoye",44},
		{"vill_Zvir",102}
	};
	disabledTowns[] = {"vill_Kozlovka"};
	antennas[] = {
		{8128.66,9151.15,-0.195831},
		{6444.28,6545.92,-0.096283},
		{5264.36,5314.46,0.0282288},
		{4968.54,9964.37,0.0121155},
		{3715.81,5984.25,0},
		{6564.42,3405.32,-0.0242767},
		{4548.06,3131.85,0.476025},
		{13008,5963.23,0.223602},
		{1169.04,4979.73,0},
		{3029.08,2350.29,0.219475},
		{13326.5,3257.09,0.15934},
		{12936.7,12762.7,0.0453033},
		{12004,14779.1,0.0237579},
		{304.767,2707.54,0.156723},
		{14126.7,13851.9,0.138626},
		{1779.32,14132.8,-0.00180054},
		{7756.32,14820.1,0.00469971}
	};
	antennasBlacklistIndex[] = {2,8,9,13,14};
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"outpost_22","outpost_23","factory_5","factory_6","resource_5","resource_10","control_41","control_42","control_43","control_52","control_53","control_55","control_56"},{},{"control_41","control_42","control_43","control_52","control_53","control_55","control_56"}
	};
	fuelStationTypes[] = {"Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell","Land_Fuelstation_Feed_F", "Land_fs_feed_F", "Land_FuelStation_01_pump_F", "Land_FuelStation_01_pump_malevil_F", "Land_FuelStation_03_pump_F", "Land_FuelStation_02_pump_F"};
	climate = "temperate";
	buildObjects[] = {
		{"Land_fortified_nest_big_EP1", 300}, {"Land_Fort_Watchtower_EP1", 300}, {"Fortress2", 200}, {"Fortress1", 100}, {"Fort_Nest", 60},
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
