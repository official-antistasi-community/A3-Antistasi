class cam_lao_nam {
	population[] = {
		{"haiphong",500},{"hanoi",1000},{"hue",2000},{"saigon",700},{"sihanoukville",200},{"nodallho",100},{"bru",100},{"attapeu",100},{"dakrong",100},{"lumphat",100},{"cuchi",100},{"baria",100},{"danang",600},{"kenglat",100},{"laichau",100},{"paknoi",100},{"phuan",100},{"xomram",120},{"xomgia",100},{"tongmoo",100},{"donlac",100},{"cangon",100},{"nalai",100},{"baichai",100},{"bachdang",100},{"ketthuc",100},{"vongxo",100},{"banbon",100},{"nongkhiaw",100},{"horhog",100},{"langmau",100},{"baria2",100},{"anhoa",100},{"binhminh",100},{"buoisang",100},{"hoalien",100},{"lacmy",100},{"cacan",100},{"tanhop",100},{"hanoi2",300},{"gansong",100},{"zokcarbora",100},{"banhtrung",100},{"yentinh",100},{"thunglungcao",100},{"baibiendep",100},{"phoduc",100},{"baove",100},{"ngatu",100},{"binhyen",100},{"bosong",100},{"marble",180},{"niemtin",100},{"krosang",100},{"banlen",100},{"comngon",100},{"saigonport",100},{"cauhai",100}
	};
	disabledTowns[] = {
		"fob4","daumau","fob1","quanloi","stagingarea","fob2","pleimei","fob6","berchtesgaden","fob3","khegio","fob5","thudridge","halongnavybase","plainofjars","pleikuboatbase","banhoang","vinhau","kechau","quanbo","huecitadel","bimat","danthemthem","daophai","phuquoc","dharmadocks","dharma","patmep","phokham","rungcung","tiengtai","vacang","hanoi3","saigonport","ansungsong","vanchu","sangha","hoxanx","congtroi","boave","longhai","honba","kiemtra","baibiendiep","nuocbun","cantho","nhenden","soctrang","mekongdelta","tampep","segbegat","che","tandi","lahot","alieng","thiengling","phaonoi","timho","quyen","caloi","thuphac","diemdang","bandao","mantau","dongxa","tauphabang","horgoat","samsong","muylai","caymo","docon","paradiseisland","mien","giuaho","daotrai"
	};
	antennas[] = {
		{2247.39,3986.44,0.00225067},{6918.17,5419.54,0},{2947.57,8719.32,0.00744534},{3971.88,10207.1,0},{11382.5,5747.82,8.39233e-005},{8700.25,10425.1,-0.00531006},{4898.78,13640.6,-0.120941},{3272.04,15538.2,0},{15266.2,4664.97,0.000167847},{13743.9,8425.6,-0.171967},{14864.6,6866.28,-0.00304413},{16101.4,3639.34,-0.115108},{16074.1,7125.38,0.000450134},{5279.59,16872.8,0.446297},{16120.6,7510.5,0.00740814},{16798.7,6349.54,-0.134335},{17358.3,5560.4,-0.15237},{16567.1,7649.92,-6.48499e-005},{16915.2,7431.9,-9.53674e-006},{11481,14497.6,0.093338},{9002.38,16557.6,0.00338745},{16704,9187.21,-6.29425e-005},{14135,12825.5,0.106886},{16193.1,10991.2,-0.0359497},{16956.7,10360.2,-6.67572e-005},{18696.2,8463.42,-0.26639},{20109.3,6538.61,9.53674e-007},{20062.7,7258.82,0.0105629},{14532.3,16441.8,-0.00198364},{14754.2,18335.2,0.000380516}
	};
	antennasBlacklistIndex[] = {11,15,17,21,24,27};
	banks[] = {};
	garrison[] = {
		{},{"airport_5","outpost_33","outpost_34","resource_4","seaport_3","outpost_15","outpost_22","outpost_8","outpost_4","resource_9","outpost_21","resource_14","outpost_3","outpost_2","factory_3","outpost_1","outpost_7","seaport_2","outpost_32","airport_1","outpost_23","outpost_10","outpost_5","outpost_16","outpost_6","outpost_11","resource_6","resource_20","outpost_9","outpost_38"},{},{"control_1","control_2","control_3","control_4","control_5","control_6","control_7","control_8","control_9","control_10","control_11","control_12","control_13","control_14","control_15","control_16","control_17","control_18","control_19","control_20","control_21","control_22","control_23","control_24","control_25","control_26","control_27","control_28","control_29"}
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
