// Chernarus

// big red buildings
class Land_HouseV2_04;
class Land_HouseV2_04_interier : Land_HouseV2_04
{
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{2.69043,-7.03931,-4.53918},0},
        {"Banner_01_F",{3.49219,7.89832,-4.63599},180},
        {"OfficeTable_01_old_F",{3.27002,7.12366,-5.74087},0},
        {"Land_ChairWood_F",{2.97607,6.58521,-5.74105},180},
        {"Box_NATO_Wps_F",{-1.4126,2.86682,-5.74223},0}
    };
};

class Land_HouseV2_02;
class Land_HouseV2_02_Interier : Land_HouseV2_02
{
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-3.01953,7.65247,-4.25836},180},
        {"Banner_01_F",{3.0249,-7.70349,-4.38084},0},
        {"OfficeTable_01_old_F",{5.48145,-2.11572,-5.53312},180},
        {"Land_ChairWood_F",{5.6665,-1.5675,-5.53312},0},
        {"Box_NATO_Wps_F",{-8.19971,-1.81995,-5.53312},0}
    };
};

// pub/restaurant
class House;
class Land_A_Pub_01 : House
{
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-1.2168,2.88391,-4.28544},90},
        {"Banner_01_F",{6.271,-5.90845,-2.04558},315},
        {"Box_NATO_Wps_F",{-7.38086,-3.73157,-1.76366},90},
        {"OfficeTable_01_old_F",{3.75635,2.07666,-1.76366},180},
        {"Land_ChairWood_F",{4.12012,2.4585,-1.76366},0}
    };
};

// Fire station
class Land_a_stationhouse : House
{
    A3A_policeStationObjects[] = {
    	{"Banner_01_F",{-8.91162,-8.37109,-7.93235},0},
        {"Banner_01_F",{-5.55029,9.67236,-8.36535},180},
        {"Box_NATO_Wps_F",{-17.1279,3.42493,-6.7813},270},
        {"OfficeTable_01_old_F",{-0.950684,2.69263,-6.7813},90},
        {"Land_OfficeCabinet_02_F",{-0.876953,0.891968,-6.78129},90},
        {"Land_ChairWood_F",{-1.4458,2.86865,-6.7813},270}
    };
};

// shitty shack
class Land_HouseV_1I4 : House
{
    A3A_policeStationObjects[] = {
    	{"Banner_01_F",{1.36621,3.96838,-1.7723},270},
        {"Banner_01_F",{-5.13086,-3.17371,-1.7163},90},
        {"OfficeTable_01_old_F",{-4.47852,-2.97937,-2.74871},270},
        {"Box_NATO_Wps_F",{0.674805,-2.75806,-2.74883},90}
    };
};

// guardhouse
class Land_Mil_Guardhouse : House
{
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-1.91846,2.80212,-0.61635},90},
        {"Banner_01_F",{5.44775,-0.69751,-0.50935},270},
        {"Box_NATO_Wps_F",{4.39404,3.49805,-1.67183},0},
        {"OfficeTable_01_old_F",{0.473633,3.71204,-1.67183},0},
        {"Land_ChairWood_F",{0.242676,3.26221,-1.67179},180}
    };
};


// Takistan

// Large building with archway
class House_EP1;
class Land_House_C_3_EP1 : House_EP1
{
    A3A_policeStationObjects[] = {
		{"Banner_01_F",{4.64648,4.80566,-1.15671},180},
		{"Banner_01_F",{-6.01025,-4.28613,0.108753},0},
		//{"Land_Document_01_F",{-7.53955,3.40527,0.573701},0},
		{"OfficeTable_01_old_F",{-8.08887,0.990723,0.5737},270},
		{"Land_ChairWood_F",{-7.74561,0.682617,0.573698},87},
		{"Box_NATO_Wps_F",{-4.34985,-1.33154,0.5737},270}
	};
};

// Rooms above garage
class Land_House_C_10_EP1 : House_EP1
{
    A3A_policeStationObjects[] = {
		{"Banner_01_F",{4.10693,-6.40137,0.47357},270},
		{"Banner_01_F",{-5.88281,-0.116211,-0.567965},90},
		//{"Land_Document_01_F",{-1.48706,-3.00977,-0.872},357},
		{"OfficeTable_01_old_F",{0.990723,-3.20313,-0.871767},90},
		{"Box_NATO_Wps_F",{-1.74634,7.67578,-0.870679},0}
	};
};

// Pillar house
class Land_House_C_4_EP1 : House_EP1
{
    A3A_policeStationObjects[] = {
		{"Banner_01_F",{-1.32031,-4.16504,-2.45607},0},
		{"Banner_01_F",{-2.53662,5.34375,-2.49399},180},
		//{"Land_Document_01_F",{-2.78687,0.992188,-0.352016},0},
		{"OfficeTable_01_old_F",{5.87207,0.950684,-0.352937},90},
		{"Land_ChairWood_F",{5.45898,1.1582,-0.352777},267},
		{"Box_NATO_Wps_F",{-4.104,2.80469,-0.351299},270}
	};
};

// Corner house
class Land_House_C_9_EP1 : House_EP1
{
    A3A_policeStationObjects[] = {
		{"Banner_01_F",{-4.76563,-5.10449,-1.56915},45},
		{"Banner_01_F",{3.8877,5.53906,-0.511545},270},
		//{"Land_Document_01_F",{-1.31104,-1.68066,-0.154605},0}
		{"OfficeTable_01_old_F",{1.01074,3.77832,-0.154604},180},
		{"Land_ChairWood_F",{1.24463,4.20068,-0.154609},0},
		{"Box_NATO_Wps_F",{3.86426,-5.16309,-0.154606},270},
	};
};

// 3 storey wooden junk
class Land_House_K_8_EP1 : House_EP1
{
    A3A_policeStationObjects[] = {
		{"Banner_01_F",{3.03125,4.63916,-1.61143},180},
		{"Banner_01_F",{-2.72266,-4.36377,-1.69419},0},
		//{"Land_Document_01_F",{-2.479,3.53174,-2.59157},0},
		{"OfficeTable_01_old_F",{2.29102,1.01465,-2.58644},90},
		{"Land_ChairWood_F",{2.04541,1.17773,-2.58689},272},
		{"Box_NATO_Wps_F",{-2.64648,-1.1333,3.35913},0}
	};
};

// 2 storey junk with balcony
class Land_House_K_7_EP1 : House_EP1
{
    A3A_policeStationObjects[] = {
		{"Banner_01_F",{0.846191,2.45313,1.01782},270},
		{"Banner_01_F",{-5.45801,-0.754883,1.23499},0},
		{"Box_NATO_Wps_F",{-3.47754,4.35742,3.28789},360},
		{"OfficeTable_01_old_F",{-3.81616,4.53857,-0.220809},0}
	};
};

// Mud shack
class Land_House_L_6_EP1 : House_EP1
{
    A3A_policeStationObjects[] = {
		{"Banner_01_F",{-5.03833,-1.67188,-0.698441},90},
		{"Banner_01_F",{8.10596,-0.0205078,1.90656},270},
		{"Box_NATO_Wps_F",{4.25854,1.62256,1.27856},360},
		{"OfficeTable_01_old_F",{1.70654,1.0542,-1.54344},90}
	};
};
