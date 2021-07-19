//Each element is: [model name, [nodes]]
//Nodes are build like this: [Available(internal use,  always 1), Hardpoint location, Seats locked when node is in use]
A3A_logistics_vehicleHardpoints = [
    //Bikes
    //Quadbike
    ["C_Quadbike_01_F" call A3A_fnc_classNameToModel, [
        // always 1,    location                locked seats
        [1,             [0,-0.9,-0.453],          [0]]
    ]],

    //4x4s
    //Offroad
    ["C_Offroad_01_F" call A3A_fnc_classNameToModel, [
        // always 1,    location                locked seats
        [1,             [-0.05,-1.3,-0.683],     [3,4]],
        [1,             [-0.05,-2.3,-0.683],     [1,2]]
    ]],

        //Small Truck
    ["C_Van_01_transport_F" call A3A_fnc_classNameToModel, [
        [1,             [0,-0.7475,-0.615],      [2,3,4,5]],
        [1,             [0,-1.4375,-0.615],      [6,7]],
        [1,             [0,-2.2,-0.615],         [8,9]],
        [1,             [0,-3,-0.615],           [10,11]]
        ]],

        //Van Transport
    ["C_Van_02_transport_F" call A3A_fnc_classNameToModel, [
        [1,             [0,-1.245,-0.921],       []],
        [1,             [0,-2.49,-0.921],        [9,10]]
    ]],

        //Van Cargo
    ["C_Van_02_vehicle_F" call A3A_fnc_classNameToModel, [
        [1,             [0,0.7025,-0.921],       []],
        [1,             [0,-0.1275,-0.921],      []],
        [1,             [0,-0.9575,-0.921],      []],
        [1,             [0,-1.7875,-0.921],      []],
        [1,             [0,-2.6175,-0.921],      []]
    ]],

    //6x6s
    //Zamak Open
    ["O_Truck_02_transport_F" call A3A_fnc_classNameToModel, [
        [1,             [0,0.7175,-0.797],       [2,3]],
        [1,             [0,-0.1125,-0.797],      [4,5,6,7]],
        [1,             [0,-0.9425,-0.797],      [8,9]],
        [1,             [0,-1.7725,-0.797],      [10,11]],
        [1,             [0,-2.6025,-0.797],      [12,13]],
        [1,             [0,-3.4325,-0.797],      [14,15]]
    ]],

    //Zamak Covered
    ["O_Truck_02_covered_F" call A3A_fnc_classNameToModel, [
        [1,             [0,0.7175,-0.798],       [2,3]],
        [1,             [0,-0.1125,-0.798],      [4,5,6,7]],
        [1,             [0,-0.9425,-0.798],      [8,9]],
        [1,             [0,-1.7725,-0.798],      [10,11]],
        [1,             [0,-2.6025,-0.798],      [12,13]],
        [1,             [0,-3.4325,-0.798],      [14,15]]
    ]],

    //CSAT Tempest open
    ["O_Truck_03_transport_F" call A3A_fnc_classNameToModel,[
        [1,             [0,-0.5175,-0.413],       [1,6]],
        [1,             [0,-1.3475,-0.413],       [9,7]],
        [1,             [0,-2.1775,-0.413],       [2,8]],
        [1,             [0,-3.0075,-0.413],       [3,10,12]],
        [1,             [0,-3.8375,-0.413],       [4]],
        [1,             [0,-4.65,-0.413],         [5,11]]
    ]],

    //CSAT Tempest closed
    ["O_Truck_03_covered_F" call A3A_fnc_classNameToModel, [
        [1,             [0,-0.5175,-0.405],       [1,6]],
        [1,             [0,-1.3475,-0.405],       [9,7]],
        [1,             [0,-2.1775,-0.405],       [2,8]],
        [1,             [0,-3.0075,-0.405],       [3,10,12]],
        [1,             [0,-3.8375,-0.405],       [4]],
        [1,             [0,-4.65,-0.405],         [5,11]]
    ]],

    //8x8s
    //HEMTT open
    ["B_Truck_01_transport_F" call A3A_fnc_classNameToModel,[
        // always 1    location                 locked seats
        [1,             [0,0,-0.533],            [1,8,9,16]],
        [1,             [0,-0.8,-0.533],         [2,10]],
        [1,             [0,-1.7,-0.533],         [3,11]],
        [1,             [0,-2.6,-0.533],         [4,5,12,13]],
        [1,             [0,-3.5,-0.533],         [6,14]],
        [1,             [0,-4.4,-0.533],         [7,15]]
    ]],

    //HEMTT covered
    ["B_Truck_01_covered_F" call A3A_fnc_classNameToModel,[
        // always 1    location                 locked seats
        [1,             [0,0,-0.534],            [1,8,9,16]],
        [1,             [0,-0.8,-0.534],         [2,10]],
        [1,             [0,-1.7,-0.534],         [3,11]],
        [1,             [0,-2.6,-0.534],         [4,5,12,13]],
        [1,             [0,-3.5,-0.534],         [6,14]],
        [1,             [0,-4.4,-0.534],         [7,15]]
    ]],

    //Vanilla HEMTT Flatbed
    ["a3\Soft_F_Gamma\Truck_01\Truck_01_flatbed_F.p3d", [
        [1,[0,0.7,-0.8],[]]
        ,[1,[0,-0.1,-0.8],[]]
        ,[1,[0,-0.9,-0.8],[]]
        ,[1,[0,-1.7,-0.8],[]]
        ,[1,[0,-2.5,-0.8],[]]
        ,[1,[0,-3.3,-0.8],[]]
        ,[1,[0,-4.1,-0.8],[]]
    ]],

    //Vanilla HEMTT Cargo
    ["B_Truck_01_cargo_F" call A3A_fnc_classNameToModel, [
        [1,             [0,1,-0.522],             []],
        [1,             [0,0.2,-0.522],           []],
        [1,             [0,-0.6,-0.522],          []],
        [1,             [0,-1.4,-0.522],          []],
        [1,             [0,-2.2,-0.522],          []],
        [1,             [0,-3,-0.522],            []],
        [1,             [0,-3.8,-0.522],          []]
    ]],

    //Boats
    //Motorboat civilian
    ["C_Boat_Civil_01_F" call A3A_fnc_classNameToModel, [
        [1,             [0,-0.9425,-1.026],       [0,1]],
        [1,             [0,-1.5725,-1.026],       []]
    ]],

    //Speedboat minigun
    ["B_Boat_Armed_01_minigun_F" call A3A_fnc_classNameToModel, [
        [1,             [0,3.2,-2.159],           [4,5]],
        [1,             [0,2.4,-2.159],           []]
    ]],

    //Transport rubber boat
    ["B_Boat_Transport_01_F" call A3A_fnc_classNameToModel, [
        [1,             [0,0.7575,-1.045],        [0,1,2,3]],
        [1,             [0,-0.0725,-1.045],       []]
    ]],

    //Civilian transport boat (RHIB)
    ["C_Boat_Transport_02_F" call A3A_fnc_classNameToModel, [
        [1,             [0,1.8575,-0.7],        [0,1]],
        [1,             [0,1.0275,-0.7],        [2,6]]
    ]]
];

//Offsets for adding new statics/boxes to the JNL script.
A3A_logistics_attachmentOffset = [
    //weapons                                                                 //location                  //rotation                  //size    //recoil            //description
    ["B_static_AT_F" call A3A_fnc_classNameToModel,                             [-0.5, 0.0, 0.99],          [1, 0, 0],                  2,      250],               //AT titan, facing to the right
    ["B_static_AA_F" call A3A_fnc_classNameToModel,                             [-0.5, 0.0, 0.99],          [1, 0, 0],                  2,      250],               //AA titan, facing to the right
    ["B_GMG_01_high_F" call A3A_fnc_classNameToModel,                           [0.2, -0.4, 1.66],          [0, 1, 0],                  2,      100],               //Static GMG High
    ["B_HMG_01_high_F" call A3A_fnc_classNameToModel,                           [0.2, -0.4, 1.66],          [0, 1, 0],                  2,      100],               //Static HMG High
    ["B_GMG_01_F" call A3A_fnc_classNameToModel,                                [0, 0, 1.2],                [0, -1, 0],                 4,      100],               //Static GMG
    ["B_HMG_01_F" call A3A_fnc_classNameToModel,                                [0, 0, 1.24],               [0, -1, 0],                 4,      100],               //Static HMG
    ["B_Mortar_01_F" call A3A_fnc_classNameToModel,                             [-0.1,-0.5,0.74],           [0, 1, 0],                  2,      2000],              //Mortar
    ["B_HMG_02_high_F" call A3A_fnc_classNameToModel,                           [0.2, -0.5, 1.69],          [0, 1, 0],                  4,      100],               //M2 High
    ["B_HMG_02_F" call A3A_fnc_classNameToModel,                                [-0.2, 0, 1.24],            [0, -1, 0],                 4,      100],               //M2

    //medium sized crates
    ["Box_NATO_AmmoVeh_F" call A3A_fnc_classNameToModel,                        [0,0,0.81],                 [1,0,0],                    2],                         //Vehicle ammo create
    ["Land_PaperBox_01_open_boxes_F" call A3A_fnc_classNameToModel,             [0,0,0.62],                 [1,0,0],                    2],                         //Stef test supplybox
    ["Land_FoodSacks_01_cargo_brown_F" call A3A_fnc_classNameToModel,           [0,0,0.51],                 [1,0,0],                    2],                         //New city supplies crate
    ["Land_PlasticCase_01_medium_F" call A3A_fnc_classNameToModel,              [0,0,0.19],                 [1,0,0],                    2],                         //Stef test Devin crate1
    ["Box_Syndicate_Ammo_F" call A3A_fnc_classNameToModel,                      [0,0,0.2],                  [1,0,0],                    2],                         //Stef test Devin crate2
    ["Box_IED_Exp_F" call A3A_fnc_classNameToModel,                             [0,0,0.2],                  [1,0,0],                    2],                         //Stef test Devin crate3
    ["B_supplyCrate_F" call A3A_fnc_classNameToModel,                           [0, 0, 0.89],               [1,0,0],                    2],                         //Ammodrop crate
    ["C_Quadbike_01_F" call A3A_fnc_classNameToModel,                           [0, 0, 1.41],               [0,1,0],                    2],                         //Quadbike

    //small sized crates                                                      //location                  //rotation                  //size                        //description
    ["Box_NATO_Equip_F" call A3A_fnc_classNameToModel,                          [0,0,0.37],                 [1,0,0],                    1],                         //Equipment box
    ["\A3\weapons_F\AmmoBoxes\WpnsBox_F",                                       [0,0,0.17],                 [0,1,0],                    1]                          //surrender crates
];

//all vehicles with jnl loading nodes where the nodes are not located in the open, this can be because its inside the vehicle or it has a cover over the loading plane.
A3A_logistics_coveredVehicles = [
    "C_Van_02_vehicle_F" call A3A_fnc_classNameToModel
    , "C_Van_02_transport_F" call A3A_fnc_classNameToModel
    , "B_Truck_01_covered_F" call A3A_fnc_classNameToModel
    , "O_Truck_03_covered_F" call A3A_fnc_classNameToModel
    , "I_Truck_02_covered_F" call A3A_fnc_classNameToModel
];

//if you want a weapon to be loadable you need to add it to this as a array of [model, [blacklist specific vehicles]],
//if the vehicle is in the coveredVehicles array dont add it to the blacklist in this array.
A3A_logistics_weapons = [
    //vanilla
    ["B_static_AT_F" call A3A_fnc_classNameToModel,[]],
    ["B_static_AA_F" call A3A_fnc_classNameToModel,[]],
    ["B_GMG_01_high_F" call A3A_fnc_classNameToModel,[]],
    ["B_HMG_01_high_F" call A3A_fnc_classNameToModel,[]],
    ["B_GMG_01_F" call A3A_fnc_classNameToModel,[]],
    ["B_HMG_01_F" call A3A_fnc_classNameToModel,[]],
    ["B_Mortar_01_F" call A3A_fnc_classNameToModel,["C_Boat_Civil_01_F" call A3A_fnc_classNameToModel, "B_Boat_Transport_01_F" call A3A_fnc_classNameToModel, "C_Boat_Transport_02_F" call A3A_fnc_classNameToModel]],
    ["B_HMG_02_high_F" call A3A_fnc_classNameToModel,[]],
    ["B_HMG_02_F" call A3A_fnc_classNameToModel,[]]
];
