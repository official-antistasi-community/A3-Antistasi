class chernarus {
	population[] = {
		{"vill_NovySobor",129},{"city_StarySobor",149},{"vill_Guglovo",26},{"vill_Vyshnoye",41},{"vill_Kabanino",86},{"vill_Rogovo",66},{"vill_Mogilevka",104},{"city_Gorka",115},{"vill_Grishino",168},{"vill_Shakhovka",55},{"vill_Pogorevka",57},{"vill_Pulkovo",26},{"vill_Nadezhdino",109},{"city_Vybor",180},{"vill_Polana",118},{"vill_Staroye",115},{"vill_Dubrovka",86},{"vill_Pustoshka",163},{"vill_Kozlovka",100},{"vill_Pusta",52},{"vill_Dolina",83},{"vill_Gvozdno",78},{"vill_Prigorodki",145},{"vill_Drozhino",58},{"vill_Sosnovka",54},{"vill_Msta",96},{"vill_Lopatino",159},{"city_Zelenogorsk",280},{"vill_Orlovets",65},{"city_Berezino",340},{"vill_Myshkino",49},{"vill_Petrovka",45},{"city_Chernogorsk",761},{"vill_Bor",46},{"vill_Nizhnoye",146},{"vill_Balota",147},{"vill_Khelm",110},{"city_Krasnostav",194},{"vill_Komarovo",127},{"city_Elektrozavodsk",745},{"city_Solnychniy",224},{"vill_Kamyshovo",196},{"vill_Tulga",35},{"vill_Pavlovo",99},{"vill_Kamenka",127},{"vill_Olsha",20}
	};
	disabledTowns[] = {"ACityC_Prigorodki"};
	antennas[] = {
		{3029.11,2350.27,0.229149},{4547.68,3132.05,0.693176},{3715.81,5984.25,0},{6563.68,3405.56,0.0547333},{5264.35,5314.45,-0.00253296},{6443.78,6545.48,0.0928955},{4967.81,9966.56,0},{8127.52,9151.57,0},{13477.6,3345.84,0.0730896},{13010.1,5964.96,-0.0163116},{12937,12763.6,0.164017},{11241.9,4261.85,-0.0175781}
	};
	antennasBlacklistIndex[] = {0,4,8,9};
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"outpost_21","control_30","resource_5"},{},{"control_30"}
	};
	fuelStationTypes[] = {"Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"};
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
