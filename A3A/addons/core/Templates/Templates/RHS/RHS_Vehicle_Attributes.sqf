["attributesVehicles", [
    // Light helis
    ["RHS_MELB_AH6M_H", ["cost", 150]],     // has 2x Hellfire

    // Bradleys
//    ["RHS_M2A2", ["cost", 130], ["threat", 200]],
//    ["RHS_M2A3", ["cost", 130], ["threat", 200]],
    ["RHS_M2A2_BUSKI", ["cost", 180], ["threat", 250]],
    ["RHS_M2A3_BUSKI", ["cost", 180], ["threat", 250]],
    ["RHS_M2A3_BUSKIII", ["cost", 200], ["threat", 300]],

    // woodland camo
//    ["RHS_M2A2_wd", ["cost", 130], ["threat", 200]],
//    ["RHS_M2A3_wd", ["cost", 130], ["threat", 200]],
    ["RHS_M2A2_BUSKI_WD", ["cost", 180], ["threat", 250]],
    ["RHS_M2A3_BUSKI_wd", ["cost", 180], ["threat", 250]],
    ["RHS_M2A3_BUSKIII_wd", ["cost", 200], ["threat", 300]],

    // CDF trash planes
    ["rhs_l159_cdf_b_CDF", ["cost", 150]],
    ["rhs_l159_cdf_b_CDF_CAP", ["cost", 150]],
    ["RHSGREF_A29B_HIDF", ["cost", 120]],

    // Apaches
//  ["RHS_AH64D_GS", ["cost", 300]],           // no hellfires
    ["RHS_AH64D", ["cost", 350]],
    ["RHS_AH64D_CS", ["cost", 350]],
    ["RHS_AH64D_AA", ["cost", 350]],
	
	//Cost adjustments for ChDKZ
    ["RHS_Mi24P_vvsc", ["cost", 170]], 		//Cheaper attack heli
    ["rhsgref_BRDM2_HQ_ins", ["cost", 50]], //Single limited arc PK
    ["rhsgref_BRDM2UM_ins", ["cost", 40]], 	
    ["rhsgref_ins_uaz", ["cost", 10]],      
    ["rhsgref_ins_uaz_open", ["cost", 10]]	

]] call _fnc_saveToTemplate;
