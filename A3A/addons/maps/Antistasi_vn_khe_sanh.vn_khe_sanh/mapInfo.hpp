class vn_khe_sanh {
	population[] = {
		{"Khesanhvil",586}, {"Axau",25}, {"Xiso",200}, {"PalienKhun",25}, {"Koso",153}, {"BanNeme",72}, {"Avau",25}, {"ToRout",108},
		{"RoRo",32}, {"Tavouac",200}, {"Thanh",28}, {"AHo",25}, {"ACoi",200}, {"Dan",200}, {"Bahy",25}, {"HaiPhuc",25},
		{"HaiTan",115}, {"Donque",25}, {"Hamy",25}, {"BichNam",25}, {"Bolieu",31}, {"Raoha",25}, {"NhiHa",25}, {"GioHai",145},
		{"Kok",25}, {"HopTac",200}, {"CoSo",200}, {"Cola",200}, {"Seina",96}, {"Viski",25}, {"NamHung",200}, {"VinhTu",66},
		{"ThaiLai",200}, {"Lako",28}, {"pagnouy",48}, {"Sadoun",25}, {"Salen",25}, {"Lousalia",25}, {"Paxiou",25}, {"Gnavet",25},
		{"Xok",25}, {"Soy",200}, {"SonXuan",25}, {"Nabo",200}, {"Tuan",193}, {"Naxok",114}, {"Koanphan",117}, {"Phonsang",25},
		{"Louang",25}, {"Phonsi",73}, {"Pomkhoun",38}, {"Doy",57}, {"Nase",53}, {"Nadou",33}, {"Cukty",25}, {"HoaThanh",25},
		{"CuYang",63}, {"Ploy",25}, {"Thongxa",25}, {"Kang",25}, {"Pasom",25}, {"Donxat",200}, {"Vangkoy",37}, {"Nalao",44},
		{"Kouthi",143}, {"Nasano",40}, {"Naxuak",200}, {"Dantete",25}, {"Nonghano",25}, {"Saoven",25}, {"Prao",62}, {"Talu",25},
		{"Langvei",50}, {"Langcon",50}, {"Langhuoha",50}, {"Langvoi",51}, {"Thuongvan",25}, {"Arieng",25}, {"Chanulangchanh",25},
		{"Tumlang",25}, {"LangBu",100}, {"Xomtacan",100}, {"Langtatuc",100}, {"Langhoantap",100}, {"Langruhon",100}, {"Xiomlaho",100},
		{"Langtamve",75}, {"Aplavien",100}, {"Langgiao",50}, {"Langouhi",25}, {"Langtemp",50}, {"Xaheng",50}, {"ABung",25}
	};
	disabledTowns[] = {
		"Paca", "Kate", "Hinlap", "XomBau", "XingEa", "AnMy", "That", "Tanloan", "Avian", "Kengkep", "MuTa",
		"KoNo", "Paxia", "KoWe", "LiemCong", "SonGiang", "Nongno", "Tansoum", "Hindam", "AnDinh", "Lapoung", "Xingwe",
		"Bengdan", "Napang", "Khoyamep", "Donvay", "Palo", "Lukdong", "Xino", "Xombatu", "Xombolu", "Gnavay",
		"Xombolou", "Xomcon", "Pakpong", "XiMi", "Xeku", "Xombong", "Phailom", "Pasom"
	};
	antennas[] = {
		{9048.66,6549.03,-0.258987}, {9387.63,10437.2,0.00366211}, {5117.91,11335.2,0}, {2792.38,8592.84,0.140808},
		{10692.6,3183.53,-0.000190735}, {11182.8,1808.63,0.138306}, {4562.41,866.129,0.49115}, {748.892,11575.5,0.138336},
		{11235.1,14857.8,0.000335693}, {412.002,509.969,0.00694847}, {6019.46,4247.75,0.429047}, {2565.96,3428.66,0.506516}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {};
	garrison[] = {
		{},
		{
			"airport_2", "airport_3", "outpost_1", "outpost_11", "outpost_12", "outpost_13", "outpost_14", "outpost_15", "outpost_16", "outpost_17", "outpost_18", "outpost_19", "outpost_20", "resource_1", "resource_2", "resource_3", "resource_5", "resource_6", "resource_7", "seaport_4", "factory_1", "factory_4"
		},
		{},
		{
			"control_1", "control_2", "control_3", "control_4", "control_5", "control_6", "control_7", "control_8", "control_9", "control_10", "control_11", "control_12", "control_13", "control_14", "control_15", "control_16", "control_17", "control_18", "control_19", "control_20"
		}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_vn_b_prop_fueldrum_01","Land_vn_usaf_fueltank_75_01","Land_vn_fuelstation_feed_f","Land_vn_fuelstation_01_pump_f","Land_vn_fuelstation_02_pump_f"
	};
	climate = "tropical";
	buildObjects[] = {
		// Standalone bunkers
		{"Land_vn_bunker_small_01", 60}, {"Land_vn_pillboxbunker_01_hex_f", 200}, {"Land_vn_pillboxbunker_01_rectangle_f", 300},
		// Trenches & matching firing posts
		{"Land_vn_b_trench_45_02", 40}, {"Land_vn_b_trench_05_02", 20}, {"Land_vn_b_trench_firing_04", 60}, {"Land_vn_b_trench_firing_05", 80}, {"Land_vn_b_mortarpit_01", 40},			// circular low trench
		// VN sandbag walls
		{"Land_vn_bagfence_01_long_green_f", 10}, {"Land_vn_bagfence_01_short_green_f", 10}, {"Land_vn_bagfence_01_round_green_f", 10},
		// Higher sandbag/metal walls + junk
		{"Land_vn_b_trench_revetment_tall_03", 20}, {"Land_vn_b_trench_revetment_05_01", 30}, {"Land_vn_barricade_01_4m_f", 30},
		// PAVN stuff
		{"Land_vn_o_bunker_03", 40}, {"Land_vn_o_platform_06", 40}, {"Land_vn_fence_punji_01_03", 10}
	};
};
