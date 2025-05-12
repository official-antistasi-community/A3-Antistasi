class SPE_Normandy {
	population[] = {
		{"Vil_Saint_Gilles",40},{"Vil_Canisy",60},{"Vil_Quibou",60},{"Vil_Dangy",70},{"Vil_Pont_Brocard",80},{"Vil_Villebaudon",60},{"Vil_Saint_Denis",100},{"Vil_Lengronne",80},{"Vil_Bonfosse",90},{"Vil_Cerisy_La_Salle",80},{"Vil_Cenilly",90},{"Vil_Montabot",30},{"Vil_Gouvets",30},{"Vil_Hebecrevon",30},{"Vil_Vierge",50},{"Vil_Chevry",40},{"Vil_Beaucoudray",30},{"Vil_Marcambye",50},{"Vil_La_Calenge",50},{"Vil_Saint_Lo",110},{"Vil_La_Fenetre",90},{"Vil_Plains",40},{"Vil_Genest",70},{"Vil_Saint_Michel_De_La_Pierre_Y",30},{"Vil_La_Picotiere_Y",30},{"Vil_La_Riviere_Y",40},{"Vil_Village_Aux_Coeurs_Y",40},{"Vil_Lhotel_Jouvet_Y",30},{"Vil_La_Mariere_Y",50},{"Vil_La_Trefouilliere_Y",30},{"Vil_La_Crespiniere_Y",25},{"Vil_Le_Beltemiere_Y",25},{"Vil_La_Baconniere_Y",30},{"Vil_Le_Hamel_Y",40},{"Vil_La_Roulandiere_Y",25},{"Vil_Le_Hamel_Godard_Y",40},{"Vil_Le_Housset_Y",25},{"Vil_Troisgots_Y",25},{"Vil_Les_Corvees_Y",30},{"Vil_Saint_Romphaire_Y",40},{"Vil_Saint_Samson_De_Bonfosse_Y",50},{"Vil_Le_Ronceur_Y",40},{"Vil_La_Mancelliere_Sur_Vire_Y",30},{"Vil_La_Ranconniere_Y",30},{"Vil_La_Vicomterie_Y",30},{"Vil_La_Lande_Y",30},{"Vil_Le_Hameau_Cauchois_Y",30},{"Vil_Le_Chene_A_Loup_Y",30},{"Vil_Le_Couvert_Y",25},{"Vil_Le_Mesnil_De_Haut_Y",30},{"Vil_La_Belhamiere_Y",40},{"Vil_Laneuverie_V",25},{"Vil_Lebourg_V",30},{"Vil_Lesrenardieres_V",30},{"Vil_Lalarderie_V",30},{"Vil_Moyon_V",40},{"Vil_Lesvaux_V",25},{"Vil_Fervaches_V",30},{"Vil_Lecrespin_V",40},{"Vil_Courcy_M",40},{"Vil_Savigny_M",30},{"Vil_La_Croix_Perrier_M",40},{"Vil_Ouville_M",70},{"Vil_La_Prevostiere_M",50},{"Vil_Liveliniere_M",60},{"Vil_Cambernon_A",25},{"Vil_Village_De_La_Fremodiere_A",40},{"Vil_Village_De_La_Guesnonniere_A",30},{"Vil_Camprond_I",25},{"Vil_Le_Lorey_I",50},{"Vil_Le_Pont_Au_Crapaud_I",25},{"Vil_Montcuit_I",25},{"Vil_La_Billardiere_I",25},{"Vil_La_Bourdonniere_I",60},{"Vil_Le_Montier_I",80},{"Vil_Le_Hamel_Aubert_I",70},{"Vil_Le_Hamel_Grente_I",60},{"Vil_Le_Hamel_Boulanger_I",50},{"Vil_Le_Val_I",25},{"Vil_Marigny_D",60},{"Vil_La_Chapelle_En_Junger_D",50},{"Vil_Cour",40},{"Vil_Hamel_Breton",25},{"Vil_Poemelliere",30},{"Vil_Hamel_Vallois",60},{"Vil_Roncey",25},{"Vil_Hambye",50},{"Vil_Cametours",60},{"Vil_Carantilly",40},{"Vil_La_Forestel_A",25},{"Vil_Grimesnil_A",30},{"Vil_Saint_Martin_De_Cenilly_A",30}
	}; 
	disabledTowns[] = {
		"Loc_Les_Pallieres_I","Vil_Montpinchon","Vil_Bauderie","Vil_Le_Mesnildre","Vil_La_Traveliere","Vil_La_Manoir","Vil_Hameau_Campain_Y","Vil_La_Billardiere_Y","Vil_Lhotel_Benoit_Y","Vil_La_Maison_Neuve_Y","Vil_Lebourggroux_V","Vil_La_Venniere_M","Vil_La_Guerderie_A","Vil_La_Rimondiere_I","Vil_Le_Hamel_Dolley_I","Vil_La_Pagerie_I","Vil_La_Petite_Moriniere_I","Vil_Foulneliere","Vil_Hotel_Perron","Vil_Lavocaterie_A","Vil_Laurbrie","Vil_Guichard","Vil_Lhotel_Rauline_Y","Vil_Reaute"
	};
	antennas[] = {
		{6920.87,5046.02,0.528854},{7847.47,7550.9,0.0468597},{3342.4,5770.16,0},{5160.69,3227.63,-0.000228882},{8634.52,3235.58,0.0249481},{7843.24,9963.49,0.0034256},{11356.7,6093.06,-0.000450134},{2768.74,10223.7,0.0155334},{8165.78,1115.21,0.0586243},{10939.4,9994.03,0.367592},{1834.61,309.547,7.62939e-005}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {}; //no suitable/defined buildings
	garrison[] = {
		{},{"airport_3","outpost_1","outpost_10","factory_6","resource_1","resource_2","control_17","control_18","control_19","control_32","control_33","control_51","control_56","control_57"},
		{},{"control_17","control_18","control_19","control_32","control_33","control_51","control_56","control_57"}
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
