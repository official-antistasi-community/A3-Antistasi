//Each element is: [model name, [nodes]]
//Nodes are build like this: [Available(internal use,  always 1), Hardpoint location, Seats locked when node is in use]
A3A_logistics_vehicleHardpoints append [
    //Urals
    //Ural Open
    ["RHS_Ural_Open_Civ_01" call A3A_fnc_classNameToModel, [
        [1,             [0,0.14,-0.197],         [12,13]],
        [1,             [0,-0.66,-0.197],        [2,3,4,5]],
        [1,             [0,-1.4,-0.197],         [6,7]],
        [1,             [0,-2.2,-0.197],         [8,9]],
        [1,             [0,-3,-0.197],           [10,11]]
    ]],

    //Ural Closed
    ["rhsgref_nat_ural_work" call A3A_fnc_classNameToModel, [
        [1,             [0,0.14,-0.197],         [12,13]],
        [1,             [0,-0.66,-0.197],        [2,3,4,5]],
        [1,             [0,-1.4,-0.197],         [6,7]],
        [1,             [0,-2.2,-0.197],         [8,9]],
        [1,             [0,-3,-0.197],           [10,11]]
    ]],

    //Ural Open 2
    ["RHS_Ural_Open_MSV_01" call A3A_fnc_classNameToModel, [
        [1,             [0,0.55,-0.19],         [3,12,13]],
        [1,             [0,-0.25,-0.19],        [2,4,5]],
        [1,             [0,-1,-0.19],           [6,7]],
        [1,             [0,-1.8,-0.19],         [8,9]],
        [1,             [0,-2.6,-0.19],         [10,11]]
    ]],

    //Kamazs covered
    ["rhs_kamaz5350" call A3A_fnc_classNameToModel, [
        [1,             [0.1,1,-0.971],          [2,3,4]],
        [1,             [0.1,0.2,-0.971],        [5,6,7]],
        [1,             [0.1,-0.6,-0.971],       [8,9]],
        [1,             [0.1,-1.4,-0.971],       [10,11]],
        [1,             [0.1,-2.2,-0.971],       [12,13]],
        [1,             [0.1,-3,-0.971],         [14,15]]
    ]],

    //Zils covered
    ["rhs_zil131_base" call A3A_fnc_classNameToModel, [
        [1,             [0,0.4,-0.596],          [3,10,11]],
        [1,             [0,-0.4,-0.596],         [2,4,5]],
        [1,             [0,-1.2,-0.596],         [6,7]],
        [1,             [0,-2,-0.596],           [8,9]]
    ]],

    //Gaz covered
    ["rhs_gaz66_vmf" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-0.596],      [1,3,10,12]],
        [1,             [-0.05,-0.2,-0.596],     [2,4,5]],
        [1,             [-0.05,-1,-0.596],       [6,7,9]],
        [1,             [-0.05,-1.8,-0.596],     [8,11]]
    ]],

    //USAF 4x4 Trucks
    //Standard (covered)
    ["rhsusf_M1078A1P2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-0.476],      [3,12,13]],
        [1,             [-0.05,-0.2,-0.476],     [2,4,5]],
        [1,             [-0.05,-1,-0.476],       [6,7,9]],
        [1,             [-0.05,-1.8,-0.476],     [8]],
        [1,             [-0.05,-2.6,-0.476],     [10,11]]
    ]],

    //uparmoured
    ["rhsusf_M1078A1P2_B_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-0.476],      [3,12,13]],
        [1,             [-0.05,-0.2,-0.476],     [2,4,5]],
        [1,             [-0.05,-1,-0.476],       [6,7,9]],
        [1,             [-0.05,-1.8,-0.476],     [8]],
        [1,             [-0.05,-2.6,-0.476],     [10,11]]
    ]],

    //uparmoured - armed
    ["rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-1.095],       [2,12,13]],
        [1,             [-0.05,-0.2,-1.095],      [1,3,4]],
        [1,             [-0.05,-1,-1.095],        [5,6]],
        [1,             [-0.05,-1.8,-1.095],      [7,8]],
        [1,             [-0.05,-2.6,-1.095],      [10,11]]
    ]],

    //USAF 6x6 Trucks
    //Standard
    ["rhsusf_M1083A1P2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-0.474],      [3,12,13]],
        [1,             [-0.05,-0.2,-0.474],     [2,4,5]],
        [1,             [-0.05,-1,-0.474],       [6,7]],
        [1,             [-0.05,-1.8,-0.474],     [8,9,15]],
        [1,             [-0.05,-2.6,-0.474],     [10,11,14]]
    ]],

    //uparmoured
    ["rhsusf_M1083A1P2_B_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-0.474],      [3,12,13]],
        [1,             [-0.05,-0.2,-0.474],     [2,4,5]],
        [1,             [-0.05,-1,-0.474],       [6,7]],
        [1,             [-0.05,-1.8,-0.474],     [8,9,15]],
        [1,             [-0.05,-2.6,-0.474],     [10,11,14]]
    ]],

    //Armed
    ["rhsusf_M1083A1P2_B_M2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-1.097],       [2,11,12]],
        [1,             [-0.05,-0.2,-1.097],      [1,3,4]],
        [1,             [-0.05,-1,-1.097],        [5,6]],
        [1,             [-0.05,-1.8,-1.097],      [7,8,14]],
        [1,             [-0.05,-2.6,-1.097],      [9,10,13]]
    ]],

    //standard crane
    ["rhsusf_M1084A1P2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [0,1.05,-0.364],          []],
        [1,             [0,0.3,-0.364],           []],
        [1,             [0,-0.45,-0.364],         []],
        [1,             [0,-1.1,-0.364],          []],
        [1,             [0,-1.95,-0.364],         []],
        [1,             [0,-2.7,-0.364],          []]
    ]],

    //uparmoured crane
    ["rhsusf_M1084A1P2_B_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [0,1.05,-0.364],          []],
        [1,             [0,0.3,-0.364],           []],
        [1,             [0,-0.45,-0.364],         []],
        [1,             [0,-1.1,-0.364],          []],
        [1,             [0,-1.95,-0.364],         []],
        [1,             [0,-2.7,-0.364],          []]
    ]],

    //Armed crane
    ["rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [0,1.05,-1.061],          []],
        [1,             [0,0.3,-1.061],           []],
        [1,             [0,-0.45,-1.061],         []],
        [1,             [0,-1.1,-1.061],          []],
        [1,             [0,-1.95,-1.061],         []],
        [1,             [0,-2.7,-1.061],          []]
    ]],

    //SOCOM Stripped
    ["rhsusf_M1084A1R_SOV_M2_D_fmtv_socom" call A3A_fnc_classNameToModel, [
        [1,             [0,1,-1.078],             []],
        [1,             [0,0.25,-1.078],          []],
        [1,             [0,-0.5,-1.078],          []],
        [1,             [0,-1.15,-1.078],         []],
        [1,             [0,-2,-1.078],            []],
        [1,             [0,-2.75,-1.078],         []]
    ]],

    //SOCOM MRAP
    ["rhsusf_M1239_socom_d" call A3A_fnc_classNameToModel, [
        [1,             [0,-1.3,-1.176],          []],
        [1,             [0,-2.1,-1.176],          []],
        [1,             [0,-2.9,-1.176],          []],
        [1,             [0,-3.7,-1.176],          []]
    ]],
    //Soccom Mrap M2
    ["rhsusf_M1239_M2_socom_d" call A3A_fnc_classNameToModel, [
        [1,             [0,-1.3,-1.176],          []],
        [1,             [0,-2.1,-1.176],          []],
        [1,             [0,-2.9,-1.176],          []],
        [1,             [0,-3.7,-1.176],          []]
    ]],
    //Soccom Mrap MK19
    ["rhsusf_M1239_MK19_socom_d" call A3A_fnc_classNameToModel, [
        [1,             [0,-1.3,-1.176],          []],
        [1,             [0,-2.1,-1.176],          []],
        [1,             [0,-2.9,-1.176],          []],
        [1,             [0,-3.7,-1.176],          []]
    ]],
    //USAF 8x8 Trucks
    //Standard
    ["rhsusf_M977A4_usarmy_wd" call A3A_fnc_classNameToModel, [
        [1,             [0,1,-0.02],             []],
        [1,             [0,0.2,-0.02],           []],
        [1,             [0,-0.7,-0.02],          []],
        [1,             [0,-1.5,-0.02],          []],
        [1,             [0,-2.2,-0.02],          []],
        [1,             [0,-3,-0.02],            []],
        [1,             [0,-3.8,-0.02],          []]
    ]],

    //uparmoured
    ["rhsusf_M977A4_BKIT_usarmy_wd" call A3A_fnc_classNameToModel, [
        [1,             [0,0.8,-0.074],           []],
        [1,             [0,0,-0.074],             []],
        [1,             [0,-0.7,-0.074],          []],
        [1,             [0,-1.5,-0.074],          []],
        [1,             [0,-2.3,-0.074],          []],
        [1,             [0,-3.1,-0.074],          []],
        [1,             [0,-3.9,-0.074],          []]
    ]],

    //Armed
    ["rhsusf_M977A4_BKIT_M2_usarmy_wd" call A3A_fnc_classNameToModel, [
        [1,             [0,0.8,-0.783],          []],
        [1,             [0,0,-0.783],            []],
        [1,             [0,-0.7,-0.783],         []],
        [1,             [0,-1.5,-0.783],         []],
        [1,             [0,-2.3,-0.783],         []],
        [1,             [0,-3.1,-0.783],         []],
        [1,             [0,-3.9,-0.783],         []]
    ]],

    //Humvee 2D
    //Covered
    ["rhsusf_m998_w_2dr" call A3A_fnc_classNameToModel, [
        [1,             [0,-0.6,-0.932],         [1,2,4,5]],
        [1,             [0,-1.4,-0.932],         [3,6]]
    ]]
];

//Offsets for adding new statics/boxes to the JNL script.
A3A_logistics_attachmentOffset append [
    //weapons                                                                 //location                  //rotation                  //size    //recoil            //description
    ["RHS_TOW_TriPod_D" call A3A_fnc_classNameToModel,                          [0.0, 0, 1.045],             [0, 1, 0],                  4,      250],               //RHS TOW launcher
    ["RHS_M2StaticMG_D" call A3A_fnc_classNameToModel,                          [0.35, -0.3, 1.68],         [0, 1, 0],                  4,      100],               //RHS M2HB machinegun
    ["RHS_M2StaticMG_MiniTripod_D" call A3A_fnc_classNameToModel,               [0.3, -0.1, -0.01],          [1, 0, 0],                  4,      100],               //RHS M2HB sitting machinegun
    ["RHS_MK19_TriPod_D" call A3A_fnc_classNameToModel,                         [0, 0, 0.97],                  [0, -1, 0],                 4,      100],               //RHS mk.19 GMG, facing to the right
    ["rhs_DSHKM_ins" call A3A_fnc_classNameToModel,                             [0.3, -0.5, 1.603],          [0, 1, 0],                  4,      100],               //RHS DShKM
    ["rhs_DSHKM_Mini_TriPod_ins" call A3A_fnc_classNameToModel,                 [-0.5, -0.2, 1.285],         [1, 0, 0],                  4,      100],               //RHS DShKM sitting, facing to the right
    ["rhs_KORD_high_MSV" call A3A_fnc_classNameToModel,                         [0.22, -0.3, 1.617],         [0, 1, 0],                  4,      150],               //RHS Kord
    ["rhs_KORD_MSV" call A3A_fnc_classNameToModel,                              [0.1, -0.3, 1.312],          [1, 0, 0],                  4,      150],               //RHS Kord sitting, facing to the right
    ["RHS_NSV_TriPod_MSV" call A3A_fnc_classNameToModel,                        [-0.1, 0, 1.3],            [1, 0, 0],                  4,      150],               //RHS NSV sitting, facing to the right
    ["rhs_Kornet_9M133_2_msv" call A3A_fnc_classNameToModel,                    [0.0, 0, 0.97],             [1, 0, 0],                  4,      250],               //RHS kornet, facing to the right
    ["rhs_SPG9_INS" call A3A_fnc_classNameToModel,                              [-0.1, 0, 0.99],            [-0.96,0.25,0],             4,      250],               //RHS SPG-9, facing 75 degrees to the left
    ["RHS_AGS30_TriPod_MSV" call A3A_fnc_classNameToModel,                      [-0.4, 0, 1.21],            [0, -1, 0],                 4,      100],               //RHS AGS-30 the russian GMG, facing right
    ["rhs_Igla_AA_pod_msv" call A3A_fnc_classNameToModel,                       [0.3, 0, 1.555],             [0, 1, 0],                  4,      250],               //RHS double Igla launcher
    ["RHS_ZU23_MSV" call A3A_fnc_classNameToModel,                              [0,0,1.88],                    [0,1,0],                    7,      250],               //RHS ZU-23 //no rhs vehicle can fit it :D
    ["rhsgref_ins_2b14" call A3A_fnc_classNameToModel,                          [0, -0.55, 0.74],            [0, 1, 0],                  2,      2000],              //RHS Podnos Mortar
    ["RHS_M252_USMC_WD" call A3A_fnc_classNameToModel,                          [0, -0.45, 1.16],           [0, 1, 0],                  2,      2000]               //RHS M252
//Crates

//Other

];

//all vehicles with jnl loading nodes where the nodes are not located in the open, this can be because its inside the vehicle or it has a cover over the loading plane.
A3A_logistics_coveredVehicles append [
    "rhsgref_nat_ural_work" call A3A_fnc_classNameToModel
    , "rhs_kamaz5350" call A3A_fnc_classNameToModel
    , "rhs_zil131_base" call A3A_fnc_classNameToModel
    , "rhs_gaz66_vmf" call A3A_fnc_classNameToModel
    , "rhsusf_M1078A1P2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel
    , "rhsusf_M1078A1P2_B_WD_fmtv_usarmy" call A3A_fnc_classNameToModel
    , "rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel
    , "rhsusf_M1083A1P2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel
    , "rhsusf_M1083A1P2_B_WD_fmtv_usarmy" call A3A_fnc_classNameToModel
    , "rhsusf_M1083A1P2_B_M2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel
];

//if you want a weapon to be loadable you need to add it to this as a array of [model, [blacklist specific vehicles]],
//if the vehicle is in the coveredVehicles array dont add it to the blacklist in this array.
A3A_logistics_weapons append [
    ["RHS_TOW_TriPod_D" call A3A_fnc_classNameToModel,[]],
    ["RHS_M2StaticMG_D" call A3A_fnc_classNameToModel,[]],
    ["RHS_M2StaticMG_MiniTripod_D" call A3A_fnc_classNameToModel,[]],
    ["RHS_MK19_TriPod_D" call A3A_fnc_classNameToModel,[]],
    ["rhs_DSHKM_ins" call A3A_fnc_classNameToModel,[]],
    ["rhs_DSHKM_Mini_TriPod_ins" call A3A_fnc_classNameToModel,[]],
    ["rhs_KORD_high_MSV" call A3A_fnc_classNameToModel,[]],
    ["rhs_KORD_MSV" call A3A_fnc_classNameToModel,[]],
    ["RHS_NSV_TriPod_MSV" call A3A_fnc_classNameToModel,[]],
    ["rhs_Kornet_9M133_2_msv" call A3A_fnc_classNameToModel,[]],
    ["rhs_SPG9_INS" call A3A_fnc_classNameToModel,[]],
    ["RHS_AGS30_TriPod_MSV" call A3A_fnc_classNameToModel,[]],
    ["rhs_Igla_AA_pod_msv" call A3A_fnc_classNameToModel,[]],
    ["RHS_ZU23_MSV" call A3A_fnc_classNameToModel, ["rhsusf_M977A4_usarmy_wd" call A3A_fnc_classNameToModel, "rhsusf_M977A4_BKIT_usarmy_wd" call A3A_fnc_classNameToModel, "rhsusf_M977A4_BKIT_M2_usarmy_wd" call A3A_fnc_classNameToModel]],
    ["rhsgref_ins_2b14" call A3A_fnc_classNameToModel, ["C_Boat_Civil_01_F" call A3A_fnc_classNameToModel, "B_Boat_Transport_01_F" call A3A_fnc_classNameToModel, "C_Boat_Transport_02_F" call A3A_fnc_classNameToModel]],
    ["RHS_M252_USMC_WD" call A3A_fnc_classNameToModel, ["C_Boat_Civil_01_F" call A3A_fnc_classNameToModel, "B_Boat_Transport_01_F" call A3A_fnc_classNameToModel, "C_Boat_Transport_02_F" call A3A_fnc_classNameToModel]]
];
