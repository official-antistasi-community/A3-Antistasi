// Copyright 2025 John Jordan. All Rights Reserved.
// Used and distributed by the Antistasi Community project with permission.

/*
Interiors for CUP works by overwriting the data of CUP buildings with the data for Livonia buildings.
Original inheritance is untouched. All mappings:

Land_HouseV_2I -> Land_House_1B01_F
Land_HouseV_2L -> Land_House_2B01_F
Land_HouseV2_02 -> Land_House_2B02_F
Land_HouseV2_03B -> Land_House_2B03_F
Land_HouseV2_04_interier -> Land_House_2B04_F
Land_HouseV_1I1 -> Land_House_1W01_F
Land_HouseV_3I3 -> Land_House_1W10_F
Land_HouseV_3I4 -> Land_House_1W11_F
Land_HouseV_1I2 -> Land_House_1W02_F
Land_HouseV_1I3 -> Land_House_1W03_F
Land_HouseV_1I4 -> Land_House_1W04_F
Land_HouseV_1L1 -> Land_House_1W05_F
Land_HouseV_1L2 -> Land_House_1W06_F
Land_HouseV_1T -> Land_House_1W07_F
Land_HouseV_3I1 -> Land_House_1W08_F
Land_HouseV_3I2 -> Land_House_1W09_F
Land_houseV_2T1 -> Land_House_2W01_F
Land_houseV_2T2 -> Land_House_2W02_F
Land_HouseV2_01A -> Land_House_2W03_F
Land_HouseV2_01B -> Land_House_2W04_F

Land_HouseV2_03_dam -> Land_Factory_02_F
Land_Church_02a -> Land_OrthodoxChurch_02_F
Land_Church_02 -> Land_OrthodoxChurch_02_F
Land_Church_01 -> Land_Church_05_F

Land_Mil_Guardhouse_no_interior_CUP -> Land_GuardHouse_02_F
Land_Mil_Guardhouse_no_interior_EP1_CUP -> Land_GuardHouse_02_F
Land_Misc_WaterStation -> Land_WaterStation_01_F

All policeStationObjects data here is copied from Livonia.
*/

class House;
class Land_HouseV2_04;

// Declared early for inheritance reasons
// Land_House_1W02_F
class Land_HouseV_1I2 : House {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{5.53906,-0.542725,-0.990138},270},
        {"Banner_01_F",{-1.46509,4.94165,-1.44889},90},
        {"Land_OfficeCabinet_02_F",{3.91309,3.48999,-2.12627},0},
        {"OfficeTable_01_old_F",{3.33789,2.14673,-2.1263},270},
        {"Land_ChairWood_F",{3.7417,1.83081,-2.12629},93},
        {"Box_NATO_Wps_F",{-0.391602,2.9707,-2.12729},360}
    };
};

// Livonia large wooden house (Land_House_2W01_F)
class Land_houseV_2T1 : Land_HouseV_1I2 {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-2.85132,4.60327,-1.6238},180},
        {"Banner_01_F",{-3.47729,-3.94238,-1.55844},0},
        {"Box_NATO_Wps_F",{-0.165527,0.918457,0.0163097},270},
        {"Land_OfficeCabinet_02_F",{-4.22559,2.01685,0.0163202},270},
        {"OfficeTable_01_old_F",{-2.74414,2.78418,0.0163078},0},
        {"Land_OfficeChair_01_F",{-2.40601,1.3457,0.016304},120}
    };
};

// Livonia large wooden house (Land_House_2W02_F)
class Land_houseV_2T2 : Land_HouseV_1I2 {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-2.99927,3.45239,-2.46973},90},
        {"Banner_01_F",{9.54346,1.06885,-1.63434},270},
        {"Land_OfficeCabinet_02_F",{5.17822,2.00806,-4.04821},0},
        {"OfficeTable_01_old_F",{6.43945,0.264648,-4.04844},90},
        {"Land_OfficeChair_01_F",{5.15479,0.213623,-4.04844},227},
        {"Box_NATO_Wps_F",{2.16309,1.37451,-1.29616},90}
    };
};

// Livonia large green wooden house (Land_House_2W03_F)
class Land_HouseV2_01A : House {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-2.11865,-1.55005,-1.31741},0},
        {"Banner_01_F",{-3.74854,7.36157,-1.37264},180},
        {"Land_OfficeCabinet_02_F",{-8.45459,-0.798828,-0.779709},180},
        {"OfficeTable_01_old_F",{-8.99731,0.715576,-0.779716},270},
        {"Land_OfficeChair_01_F",{-7.51685,1.18286,-0.77971},38},
        {"Box_NATO_Wps_F",{-6.67554,3.97925,-0.779717},0}
    };
};

// Livonia large wooden house (Land_House_2W04_F)
class Land_HouseV2_01B : Land_HouseV2_01A {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-1.47827,7.64233,-1.41016},180},
        {"Banner_01_F",{-6.64917,-1.20435,-3.30691},0},
        {"Land_OfficeCabinet_02_F",{2.5896,4.59717,-0.825926},0},
        {"OfficeTable_01_old_F",{3.54272,2.93555,-0.825932},90},
        {"Land_OfficeChair_01_F",{2.39697,2.60938,-0.825904},229},
        {"Box_NATO_Wps_F",{4.96875,1.87964,-0.826188},0}
    };
};

// Livonia large stucco house 2 (Land_House_2B01_F)
class Land_HouseV_2L : Land_HouseV_1I2 {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-5.7251,1.07031,-2.66194},90},
        {"Banner_01_F",{3.25098,4.19434,-3.03287},270},
        {"Land_OfficeCabinet_02_F",{-1.698,4.77588,-1.02419},0},
        {"OfficeTable_01_old_F",{-0.4021,4.64697,-1.02419},0},
        {"Land_OfficeChair_01_F",{-1.07886,3.28564,-1.02417},217},
        {"Box_NATO_Wps_F",{-4.13794,1.33301,-1.0242},270}
    };
};

// Livonia large red brick house (Land_House_2B02_F)
class Land_HouseV2_02 : Land_HouseV2_01A {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-2.83911,-7.58936,-4.06564},0},
        {"Banner_01_F",{2.96484,7.7666,-4.0162},180},
        {"Box_NATO_Wps_F",{-8.46729,-1.41797,-5.53312},90},
        {"OfficeTable_01_old_F",{8.71387,-1.00781,-5.53312},90},
        {"Land_OfficeCabinet_02_F",{6.78516,-2.12256,-5.53311},180},
        {"Land_OfficeChair_01_F",{6.96582,-0.628906,-5.53309},308}
    };
};

// Livonia large stucco house (Land_House_2B03_F)
class Land_HouseV2_03B : Land_HouseV2_01A {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-2.95459,-6.80762,-3.8756},0},
        {"Banner_01_F",{-8.10107,7.34717,-4.04283},90},
        {"Banner_01_F",{7.76709,-0.602051,-4.02883},270},
        {"Box_NATO_Wps_F",{-2.20605,-5.57861,-2.21546},90},
        {"Land_OfficeCabinet_02_F",{1.32227,-1.38721,-2.21545},0},
        {"OfficeTable_01_old_F",{2.25928,-3.04102,-2.21545},90},
        {"Land_OfficeChair_01_F",{0.906738,-3.17676,-2.21543},229}
    };
};

// Livonia dungeony brick house (Land_House_2B04_F)
class Land_HouseV2_04_interier : Land_HouseV2_04 {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{3.29517,7.95215,-4.62899},180},
        {"Banner_01_F",{-0.420654,-7.02832,-4.68299},0},
        {"Land_OfficeCabinet_02_F",{-5.80103,3.36084,-5.712},270},
        {"OfficeTable_01_old_F",{-4.13354,2.69824,-5.71618},180},
        {"Land_OfficeChair_01_F",{-4.25366,3.96094,-5.71368},31},
        {"Box_NATO_Wps_F",{-5.16089,6.92725,-5.70676},0}
    };
};

// Livonia single-floor brick house (Land_House_1B01_F)
class Land_HouseV_2I : Land_HouseV_1I2 {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-3.3728,8.8772,-1.52012},90},
        {"Banner_01_F",{8.59521,2.74219,-1.66812},270},
        {"Box_NATO_Wps_F",{7.44604,9.28784,-2.80907},90},
        {"Land_OfficeCabinet_01_F",{-2.57056,7.1355,-2.80914},270},
        {"OfficeTable_01_old_F",{-2.66675,8.69165,-2.80907},270},
        {"Land_OfficeChair_01_F",{-1.34912,8.84375,-2.80895},36}
    };
};

// Livonia shitty houses 
// Land_House_1W11_F
class Land_HouseV_3I4 : Land_HouseV_1I2 {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-0.627441,2.53418,-1.2285},180},
        {"Banner_01_F",{-6.35327,-6.05713,-1.6119},0},
        {"Box_NATO_Wps_F",{-3.6731,-0.95874,-2.63268},0},
        {"OfficeTable_01_old_F",{1.11523,-0.624023,-2.6385},0},
        {"Land_OfficeCabinet_02_F",{3.03638,-0.762451,-2.63847},90},
        {"Land_OfficeChair_01_F",{0.661133,-2.26953,-2.63849},225}
    };
};

// Land_House_1W07_F
class Land_HouseV_1T : Land_HouseV_1I2 {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-2.66724,3.90967,-1.77614},180},
        {"Banner_01_F",{5.74805,-3.64673,-1.69725},0},
        {"Box_NATO_Wps_F",{-4.25684,-4.40601,-3.09124},0},
        {"Land_OfficeCabinet_02_F",{0.308838,-3.96582,-3.09123},0},
        {"OfficeTable_01_old_F",{0.738037,-5.47534,-3.09124},90},
        {"Land_ChairWood_F",{-0.255371,-5.60059,-3.09124},236}
    };
};

// Land_House_1W09_F
class Land_HouseV_3I2 : Land_HouseV_1I2 {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{3.07471,0.158203,-0.91034},270},
        {"Banner_01_F",{-7.41675,2.12256,-0.81134},90},
        {"Land_OfficeCabinet_02_F",{-6.85889,-3.41211,-1.9555},270},
        {"OfficeTable_01_old_F",{-5.49976,-3.99268,-1.95551},180},
        {"Land_ChairWood_F",{-5.25317,-3.31104,-1.95551},0},
        {"Box_NATO_Wps_F",{-6.41626,1.24731,-1.95551},90},
    };
};

// Livonia basement houses
// Land_House_1W05_F
class Land_HouseV_1L1 : Land_HouseV_1I2 {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{-0.0825195,4.23291,-0.108235},180},
        {"Banner_01_F",{3.49097,-3.92505,-0.0346122},0},
        {"Box_NATO_Wps_F",{-0.104492,0.797119,-0.830085},270},
        {"OfficeTable_01_old_F",{3.17358,-2.0647,-0.830085},180},
        {"Land_OfficeCabinet_02_F",{5.12061,-0.0109863,-0.830053},90},
        {"Land_ChairWood_F",{3.41064,-1.604,-0.830083},0}
    };
};

// Land_House_1W06_F
class Land_HouseV_1L2 : Land_HouseV_1I2 {
    A3A_policeStationObjects[] = {
        {"Banner_01_F",{3.5498,3.7002,0.148552},180},
        {"Banner_01_F",{-0.595215,-4.46802,0.312104},0},
        {"Box_NATO_Wps_F",{-0.362793,-1.00391,0.620298},270},
        {"Land_OfficeCabinet_02_F",{4.88647,-0.151367,-0.62034},90},
        {"OfficeTable_01_old_F",{3.18433,1.86963,-0.620297},0},
        {"Land_ChairWood_F",{2.91089,1.35181,-0.620296},180}
    };
};

