class lingor3 {
	population[] = {

		};
	disabledTowns[] = {

	};
	antennas[] = {

	};
	antennasBlacklistIndex[] = {

	};
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"airport_3","resource_1", "outpost_6", "outpost_10", "outpost_11", "outpost_12", "outpost_16", "outpost_18", "control_25", "control_29", "control_24", "control_30", "control_19", "control_21", "control_22", "control_20", "control_23", "control_25", "control_29", "control_63", "control_62", "control_24", "control_64", "control_30", "control_19", "control_21", "control_22", "control_20", "control_23"},{},{"control_25", "control_29", "control_24", "control_30", "control_19", "control_21", "control_22", "control_20", "control_23", "control_25", "control_29", "control_63", "control_62", "control_24", "control_64", "control_30", "control_19", "control_21", "control_22", "control_20", "control_23"}
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
