class vt7 {
	population[] = {
		{"aarre",80},{"Alapihlaja",90},{"Eerikkala",88},{"haavisto",60},{"Hailila",90},{"Hanski",100},{"Harju",100},{"harjula",70},{"Hurppu",80},{"Hyypianvuori",60},{"Jarvenkyla",100},{"Kirkonkyla",400},{"Klamila",150},{"Koivuniemi",100},{"Korpela",80},{"Kouki",90},{"Lansikyla",100},{"Myllynmaki",60},{"Nakarinmaki",90},{"Niemela",60},{"Ojala",80},{"Onnela",100},{"Pajunlahti",90},{"piispa",100},{"Pyterlahti",190},{"Rannanen",80},{"Ravijoki",90},{"Riko",100},{"Santaniemi",100},{"Skippari",80},{"suopelto",80},{"Sydankyla",150},{"uski",80},{"Uutela",100},{"Vilkkila",110},{"Virojoki",500},{"Ylapaa",80},{"Ylapihlaja",80},{"Souvio",70}
	};
	disabledTowns[] = {"Tikanen","toipela","hirvela","kallio","Kuusela","nopala"};
	antennas[] = {
		{907.35,2955.65,0},{6644.62,7275.58,0.00256348},{6242.47,13009.4,0.39426},{13061.2,6487.81,0.760155},{1768.36,15526.1,0.00277328},{15449.2,16603.3,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {{14501.2,14607.6,0.0752449},{14669.9,14700.3,-0.102319}};
	garrison[] = {
		{},{"airport_2","control_25","control_29","control_30","control_31","control_32","Seaport_1","Outpost_3"},{},{"control_25","control_29","control_30","control_31","control_32"}
	};
	fuelStationTypes[] = {"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"};
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
