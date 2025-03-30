class australia {
	//Map names are mostly fucked on this map
	population[] = {
		{"Moreton Island",0},{"Tiwi Island",4},{"Rottnest Island", 0},{"Garden Island",0},{"Cape Peron", 14},{"Groote Eylandt", 54},{"Toowoomba", 442},{"Cairns", 833},{"Cape Melville",0},{"Kangaroo Island",0},{"Broken Hill",387},{"Tailem bend",141},{"Flinders Island",0},{"Mount Isa",84},{"Stuart Hwy",0},{"Weipa",208},{"Port Lincoln",86},{"Bathurst",86},{"Willcania",663},{"Smithton",42},{"Coober Pedy",246},{"Rockhampton",1285},{"NT",0},{"qld",0},{"nsw",1},{"vic",94},{"sa",0},{"Melbourne",1298},{"alice",507},{"Adelaide",1483},{"Perth",899},{"darwin",93},{"Brisbane",764},{"sydney",1857},{"pinegap",83},{"Tasmania",223},{"hobart",80},{"Brisbane",764},{"Army Base",170},{"Phillip Island",0},{"Eden",245},{"Launceston",230},{"Mildura",378}
	};
	//A few map names here do not disappear eg Moreton Island, Tiwi Island, King Island. Alot of islands
	disabledTowns[] = {"Stuart Hwy", "Groote Eylandt", "Moreton Island", "West_australia", "NT", "sa", "qld", "King Island", "Garden Island","Rottnest Island", "Tiwi Island", "Cape Melville", "Phillip Island", "Kangaroo Island"}; //no towns that need to be disabled
	antennas[] = {
		{19677.8,24005.7,0.000545502},{19707.4,24041.9,2.28882e-05},{19683.5,24085,-3.8147e-06},{19683.5,24085,0.000183105},{19692.7,24102.9,-0.000263214},{19202.8,24193,0.00166321},{19272.8,24280.5,-0.000347137},{19890.7,24439,0},{19890.7,24439,0.00148582},{19896.1,24446.7,-3.8147e-06},{19896.1,24446.7,0},{19878.4,24456.5,0},{25928.1,12988.2,0.0575104},{25947.2,12911.6,0.00283813},{30951.3,18834.3,-7.62939e-06},{30951.3,18834.3,2.28882e-05},{31456.9,25303,0.750427},{31614.1,24954,0},{31614.1,24954,3.05176e-05},{31912.6,24881.8,0.298706},{31938.8,24885.1,6.10352e-05},{31950.5,24889.7,7.62939e-05},{17552.9,33095.6,-1.71661e-05},{17552.9,33095.6,3.8147e-06},{17639.1,34249.7,-0.00555801},{17769.8,34339.7,0},{17769.8,34339.7,2.28882e-05},{17567.6,34327.2,0},{17567.6,34327.2,2.28882e-05},{33819.5,15751.4,-0.000617981},{33832.7,15759.3,-0.000400543},{33832.7,15759.3,0},{33846,15742.4,-0.00069809},{33846,15742.4,-0.000114441},{36431.4,14288.4,0},{36433.1,14288.1,0},{36425.9,14241.6,0},{36439.4,14241.4,0},{36461.6,14248,0},{36461.6,14248,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {
		{19808.3,24380.9,3.8147e-06},{19775.1,24407.7,0},{21956.5,25576.3,-0.000619888},{21973.3,25605.1,-0.000516891},{20744.7,12916.6,-0.782235},{27626.8,17081.1,-0.000335693},{31232.2,19983.1,-0.000125885},{31583.3,25168.4,-0.391495},{15879.6,33441.4,9.53674e-07},{30827.3,11333.1,-0.479738},{17509.3,34127.6,0},{6727.58,18023.6,-0.202614},{30853,10621.1,-0.765281},{31121.5,10601,-0.42619},{5754.34,18540.6,-0.00122261},{5774.74,18308.4,-0.490837},{32123.1,29848.2,-8.58307e-05},{34925.5,25883.1,-0.335293},{28405.5,35255.1,0.00220966},{34951,11697.2,-0.431705},{37962.6,20522.4,-0.416302},{36479.5,12987.8,-0.343521},{38312.9,20037,9.53674e-07},{36743,13009.2,0},{36744.3,12871.3,9.53674e-06},{36897.8,12961.4,-0.411804},{36825.3,12786.5,-0.445873},{33714.6,3353.86,-0.466493}
	};
	garrison[] = {
		{},{"airport_4", "airport_7", "outpost_2", "resource_5"},{},{}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	climate = "arid";
	buildObjects[] = {
		// Large vanilla arid structures
		{"Land_BagBunker_01_large_F", 300}, {"Land_HBarrier_01_tower_F", 300}, {"Land_BagBunker_01_small_F", 60},
		{"Land_Shed_09_F", 120}, {"Land_Shed_10_F", 140}, {"Land_House_1W12_F", 500},
		// vanilla arid sandbag walls
		{"Land_BagFence_01_short_F", 10}, {"Land_BagFence_01_round_F", 10}, {"Land_BagFence_01_long_F", 10},
		// Non-camo vanilla stuff
		{"Land_SandbagBarricade_01_half_F", 20}, {"Land_SlumWall_01_s_2m_F", 5},
		{"Land_Barricade_01_4m_F", 30}, {"Land_GuardBox_01_brown_F", 80}, {"Land_Tyres_F", 10}
	};
};
