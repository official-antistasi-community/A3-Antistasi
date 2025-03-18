class SPE_Mortain {
	population[] = {
		{"Vil_Romagny",477},{"Vil_Neufbourg",562},{"Vil_Mortain",878},{"Vil_Barthelemy",305},{"Vil_Bellefontaine",453},{"Vil_Tournerie",253},{"Vil_Les_Liards",219},{"Vil_La_Vieille_Vente",78},{"Vil_La_Deliniere",209},{"Vil_La_Bagotiere",299},{"Vil_La_Baffardiere",188},{"Vil_La_Menardiere",241},{"Vil_lagranderoche",91},{"Vil_belleeau",103},{"Vil_Les_Aulnays",255},{"Vil_LaGalpichere",191},{"Vil_LeClosMonnier",223},{"Vil_Le_Tertre",321},{"Loc_La_Morinais",385},{"Vil_Calvaire",469},{"Vil_LePillon",179},{"Vil_LaRiffaudiere",110},{"Vil_Saint_Hilaire",544},{"Vil_LaGesberdiere",464},{"Vil_La_Fieffe_de_Brousse_Pave",172},{"Vil_Le_Chene_des_Maires",260},{"Vil_Brousse_Pave",224}
	}; 
	disabledTowns[] = {
		"Vil_La_Bougonniere","Vil_longueveille","Vil_Abbeye_Blanche","Vil_La_Giffardiere","Vil_Ruandelle"
	};
	antennas[] = {
		{3952.95,5297.37,0.00991821},{5179.92,3040.97,0.0291138},{4223.79,7540.87,0.0480347},{542.119,4122.41,0.0940552},{7802.82,6414.54,0.131439}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {}; //no suitable/defined buildings
	garrison[] = {
		{},{"airport_6","outpost_8","outpost_9","outpost_15","factory_3","resource_5","resource_6","resource_10","control_5","control_10","control_19","control_20","control_21","control_25","control_28","control_30"},
		{},{"control_5","control_10","control_19","control_20","control_21","control_25","control_28","control_30"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","SPE_Fuel_Barrel_German_01","SPE_Fuel_Barrel_US_01"
	};
	climate = "arid";
	buildObjects[] = {
		// Pillbox bunkers
		{"Land_PillboxBunker_01_hex_F", 200}, {"Land_PillboxBunker_01_rectangle_F", 300},
		// SPE sandbag walls
		{"Land_SPE_Sandbag_Long", 15}, {"Land_SPE_Sandbag_Short", 10}, {"Land_SPE_Sandbag_Nest", 15}, {"Land_SPE_Sandbag_Curve", 20},
		// Some extra stuff from vanilla
		{"Land_Barricade_01_4m_F", 30}, {"Land_GuardBox_01_brown_F", 80}, {"Land_Tyres_F", 10}
	};
};
