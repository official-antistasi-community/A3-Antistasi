class gm_weferlingen_summer {
	population[] = {
		{"gm_name_grasleben",250},{"gm_name_weferlingen",420},{"gm_name_doehren",150},{"gm_name_seggerde",50},{"gm_name_belsdorf",110},{"gm_name_behnsdorf",2010},{"gm_name_eschenrode",125},{"gm_name_walbeck",215},{"gm_name_beendorf",175},{"gm_name_mariental",100},{"gm_name_querenhorst",110},{"gm_name_bahrdorf",275},{"DefaultKeyPoint53",90},{"DefaultKeyPoint1",160},{"DefaultKeyPoint2",65},{"DefaultKeyPoint3",120},{"DefaultKeyPoint4",218},{"DefaultKeyPoint5",147},{"DefaultKeyPoint6",325},{"DefaultKeyPoint7",100},{"DefaultKeyPoint8",201},{"DefaultKeyPoint9",164},{"DefaultKeyPoint10",194},{"DefaultKeyPoint11",104},{"DefaultKeyPoint12",121},{"DefaultKeyPoint13",94},{"DefaultKeyPoint14",43},{"DefaultKeyPoint15",70},{"DefaultKeyPoint17",69},{"DefaultKeyPoint18",179},{"DefaultKeyPoint19",152},{"DefaultKeyPoint20",88},{"DefaultKeyPoint21",97},{"DefaultKeyPoint22",135},{"DefaultKeyPoint23",50},{"DefaultKeyPoint24",52},{"DefaultKeyPoint25",57},{"DefaultKeyPoint26",89},{"DefaultKeyPoint27",147},{"DefaultKeyPoint28",240},{"DefaultKeyPoint29",124},{"DefaultKeyPoint30",75},{"DefaultKeyPoint44",133},{"DefaultKeyPoint157",180},{"DefaultKeyPoint158",42},{"DefaultKeyPoint159",142},{"DefaultKeyPoint160",69},{"DefaultKeyPoint161",72},{"DefaultKeyPoint162",59}
	};
	disabledTowns[] = {}; //no towns that need to be disabled
	antennas[] = {
		{13492.2,9346.15,0},{7694.42,13715.5,0},{14654.1,12117.2,-7.62939e-006},{13451.1,4033.84,0},{11575.2,17731.8,0},{5298.28,4077.87,0},{2530.6,8367.89,0},{6849.02,17665.4,0},{19569.3,9448.69,1.52588e-005},{19562.8,17421.6,7.62939e-006}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {
	};
	garrison[] = {
		{},{"airport_4","outpost_8","outpost_16","outpost_19","resource_6","resource_7","control_3","control_4","control_8","control_9","control_10","control_29"},{},{"control_3","control_4","control_8","control_9","control_10","control_29"}
	};
	fuelStationTypes[] = {
		"Land_Fuelstation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_03_pump_F","Land_FuelStation_02_pump_F","land_gm_euro_fuelpump_01_e","land_gm_euro_fuelpump_02_e","land_gm_euro_fuelpump_02_w","land_gm_euro_fuelpump_01_w"
	};
	climate = "arid";
	buildObjects[] = {
		//barbed wire
		{"land_gm_barbedwire_01", 5},{"land_gm_barbedwire_02", 5},
		//small structures and camo nets
		{"land_gm_sandbags_01_door_02", 10},{"land_gm_sandbags_01_round_01", 20},{"land_gm_sandbags_01_wall_01", 20},
		{"gm_berm_02", 20},{"gm_berm_01", 20},{"gm_berm_03", 20},
		{"land_gm_camonet_04_east", 20},{"land_gm_camonet_03_east", 20},
		//medium sandbag structures
		{"land_gm_sandbags_01_wall_02", 50},{"land_gm_tanktrap_02", 50},
		{"land_gm_sandbags_02_wall", 50},{"land_gm_woodbunker_01", 50},
		//large sandbag structures
		{"land_gm_sandbags_02_bunker_high", 100},{"land_gm_woodbunker_01_bags", 100},
		//other large
		{"land_gm_euro_misc_viewplatform_01", 150},
		//small bunker
		{"Land_Bunker_02_double_F", 500},
		//big bunker
		{"land_gm_bunker_command_01", 5000}
	};
};
