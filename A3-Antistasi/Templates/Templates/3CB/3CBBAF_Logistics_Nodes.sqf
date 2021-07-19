//JNL mounting nodes for cargo and statics.
//Each element is: [model name, [nodes]]
//Nodes are build like this: [Available(internal use,  always 1), Hardpoint location, Seats locked when node is in use]
A3A_logistics_vehicleHardpoints append [
    // Coyote P GMG
    ["UK3CB_BAF_Coyote_Passenger_L134A1_D" call A3A_fnc_classNameToModel,[
        [1,             [0.05,-1.6,-1.695],      [2,3,4,5,6,7]], // Both nodes block all seats here because 2 nodes blocking
        [1,             [0.05,-2.4,-1.695],      [2,3,4,5,6,7]]  // 2 common seats but not all didn't work for some reason
    ]],

    // Coyote P HMG
    ["UK3CB_BAF_Coyote_Passenger_L111A1_D2" call A3A_fnc_classNameToModel,[
        [1,             [0.05,-1.6,-1.695],      [2,3,4,5,6,7]], // Same deal as above here
        [1,             [0.05,-2.4,-1.695],      [2,3,4,5,6,7]]
    ]],

    // MAN Truck, 4x4 Flatbed
    ["UK3CB_BAF_MAN_HX60_Cargo_Green_A" call A3A_fnc_classNameToModel,[
        [1,             [0,3.3,-1.205],          []],
        [1,             [0,2.5,-1.205],          []],
        [1,             [0,1.7,-1.205],          []],
        [1,             [0,0.9,-1.205],          []],
        [1,             [0,0.1,-1.205],          []],
        [1,             [0,-0.7,-1.205],         []]
    ]],

    // MAN Truck, 6x6 Flatbed
    ["UK3CB_BAF_MAN_HX58_Cargo_Green_A" call A3A_fnc_classNameToModel,[
        [1,             [0,4.8,-1.205],          []],
        [1,             [0,4.0,-1.205],          []],
        [1,             [0,3.2,-1.205],          []],
        [1,             [0,2.4,-1.205],          []],
        [1,             [0,1.6,-1.205],          []],
        [1,             [0,0.8,-1.205],          []],
        [1,             [0,0.0,-1.205],          []],
        [1,             [0,-0.8,-1.205],         []]
    ]]
];

//Offsets for adding new statics/boxes to the JNL script.
A3A_logistics_attachmentOffset append [];

//all vehicles with jnl loading nodes where the nodes are not located in the open, this can be because its inside the vehicle or it has a cover over the loading plane.
A3A_logistics_coveredVehicles append [];

//if you want a weapon to be loadable you need to add it to this as a array of [model, [blacklist specific vehicles]],
//if the vehicle is in the coveredVehicles array don't add it to the blacklist in this array.
A3A_logistics_weapons append [];
