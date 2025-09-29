class lingor3 {
	population[] = { 
		{"tucos",150},{"maruko",897},{"calamar",460},
		{"montehofo",29},{"manteria",71},{"sanvigado",55},
		{"guayucca",71},{"calapedro",87},{"tia",82},
		{"mercielo",93},{"calixo",123},{"fernando",116},
		{"aculto",72},{"garibosa",50},{"haciendos",96},
		{"mairango",76},{"rosalia",27},{"elcanto",85},
		{"morada",43},{"victorin",66},{"prospero",57},
		{"corazon",173},{"fauna",35},{"negrosa",28},
		{"peligron",35},{"sanisabel",94},{"marcella",44},
		{"pancho",32},{"lagosa",17},{"aguado",28},
		{"barro",20},{"gomez",21},{"conoteta",37},
		{"cemarin",14},{"madron",19},{"picolin",12},
		{"villon",95},{"palida",64},
		{"tamba",51},{"pachi",37},
		{"cabara",45},{"monga",47},{"ayan",15},
		{"pikawas",32},{"bilbado",147},{"ralon",82},
		{"sanarulco",571},{"benio",288},{"pocobay",36},
		{"reginatributa",67},{"drassen",264},
		{"rago",81},{"medlina",99},{"zuela",95},
		{"alma",23},{"cordo",23},{"mercadio",18},
		{"verto",54},{"zanjeer",74},{"gatoro",69},
		{"medicolin",51},{"arapesca",48},{"fantasmo",70},
		{"matacan",105},{"vidora",79},{"paredes",28},
		{"mirasol",93},
		{"jodido",13},{"pescito",34},{"ramona",36},{"gritto",44},{"vissa",35}
		};
	disabledTowns[] = {
		"chupinka","mvv","mvt","pmalargo","vissa","pancho","pintosa"

	};
	antennas[] = {
        {5456.76,5563.79,-7.62939e-06},{6045.82,5673.9,-0.0406189},
		{5707.51,4116.72,1.90735e-05},{4233.71,4228.46,-4.57764e-05},
		{6196.84,6274.59,-0.0289917},{6303.86,3954.35,-5.72205e-06},
		{6749.59,4443.55,-0.173943},{4377.66,6760.45,-7.62939e-06},
		{6004.59,6722.59,1.33514e-05},{6105.75,3448.68,-2.28882e-05},
		{6316.9,6847.01,-1.90735e-06},{3497.27,3738.23,-0.000427246},
		{6888.58,6391.33,-1.90735e-06},{4465.38,2602.27,0.00159454},
		{4153.71,7614.02,-1.47539},{2857.93,3550.29,0.00883484},
		{2669.33,6757.55,0},{6116.91,1660.57,0},
		{3872.14,1732.76,0.0149536},{4135.02,1642.41,0},
		{1740.48,3464.25,0.00170898},{8991.09,5873.28,8.01086e-05},
		{9230.81,5043.77,0.0376701},{3112.18,1492.78,9.91821e-05},
		{5692.52,9552.13,0.186287},{999.054,3136.39,0.29697},
		{1253.04,2667.81,0.00248718},{8816.03,8024.08,3.8147e-05},
		{539.404,3192.38,0.0529938},{8323.89,1223.07,9.91821e-05},
		{1910.4,1193.97,0.000106812},{9262.42,8205.94,1.84101},
		{2628.78,9817.92,-0.349384},{1818.24,497.806,9.91821e-05},
		{1230.3,787.588,0.20536},{507.015,9934.24,0}
	};
	antennasBlacklistIndex[] = {0,1,2,3,4,5,6,9,11,12,13,14,15,18,20,21,23,26,27,28,29,30,32,33,34,

	};
	banks[] = {{4326.05,4930.17,0},{3757.44,1390.48,0},{3019.46,5950.92,0},{6717.83,6060.44,0},{6941.92,6399.69,0}}; //no suitable building available
	garrison[] = {
		{},{"airport_6","factory_1","outpost_19","outpost_17","outpost_8","resource","control","control_1","control_2"},
		{},{"control","control_1","control_2"}
	};
	fuelStationTypes[] = {"Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"};
	climate = "tropical";
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
	policeStationTypes[] = {
		"Land_HouseV2_04_interier", "Land_HouseV2_02_Interier", "Land_A_Pub_01",
		"Land_a_stationhouse", "Land_HouseV_1I4", "Land_Mil_Guardhouse"
	};
};
