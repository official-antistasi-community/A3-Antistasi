// Static place definition (A3A >> StaticPlaces) for vanilla buildings

class StaticPlaces {
    // Short vanilla MG towers
    class Land_Cargo_Patrol_V1_F {
        places[] = {
            {"MG", {-2.345,-0.653,-0.560}, 180}
        };
    };
    class Land_Cargo_Patrol_V2_F : Land_Cargo_Patrol_V1_F {};
    class Land_Cargo_Patrol_V3_F : Land_Cargo_Patrol_V1_F {};
    class Land_Cargo_Patrol_V4_F : Land_Cargo_Patrol_V1_F {};

    // Short vanilla HQ buildings
    class Land_Cargo_HQ_V1_F {
        places[] = {
            {"AA", {0.004,0.004,-0.735}, 0}
        };
    };
    class Land_Cargo_HQ_V2_F : Land_Cargo_HQ_V1_F {};
    class Land_Cargo_HQ_V3_F : Land_Cargo_HQ_V1_F {};

    // Giant vanilla towers
    class Land_Cargo_Tower_V1_F {
        places[] = {
            {"MG", {5.883,-0.759,4.973}, -270},
            {"MG", {-1.886,5.042,4.973}, 0},
            {"MG", {-4.435,-4.998,4.973}, -180}
        };
    };
    class Land_Cargo_Tower_V2_F : Land_Cargo_Tower_V1_F {};
    class Land_Cargo_Tower_V3_F : Land_Cargo_Tower_V1_F {};
    class Land_Cargo_Tower_V4_F : Land_Cargo_Tower_V1_F {};
    class Land_Cargo_Tower_V1_No1_F : Land_Cargo_Tower_V1_F {};
    class Land_Cargo_Tower_V1_No2_F : Land_Cargo_Tower_V1_F {};
    class Land_Cargo_Tower_V1_No3_F : Land_Cargo_Tower_V1_F {};
    class Land_Cargo_Tower_V1_No4_F : Land_Cargo_Tower_V1_F {};
    class Land_Cargo_Tower_V1_No5_F : Land_Cargo_Tower_V1_F {};
    class Land_Cargo_Tower_V1_No6_F : Land_Cargo_Tower_V1_F {};
    class Land_Cargo_Tower_V1_No7_F : Land_Cargo_Tower_V1_F {};

    // Livonia control/guard tower
    class Land_ControlTower_01_F {
        places[] = {
            {"MG", {2.269,-1.918,1.769}, 90},
            {"MG", {-0.589,-2.299,1.769}, 270},
            {"MG", {0.627,-2.290,-1.331}, 180}
        };
    };

    // Livonia control tower
    class Land_ControlTower_02_F {
        places[] = {
            {"MG", {7.363,1.998,2.801}, 45},
            {"MG", {1.940,-2.295,2.799}, -135}
        };
    };

    // Tall Livonia MG platform
    class Land_Sawmill_01_illuminati_tower_F {
        places[] = {
            {"MG", {-0.213,-0.213,10.321}, 180}
        };
    };

    // Livonia castle bastion
    class Land_CastleRuins_01_bastion_F {
        places[] = {
            {"MG", {2.271,1.360,2.949}, 90}
        };
    };

    // Ground-level vanilla sandbag bunkers. Offset for some reason?
    class Land_BagBunker_Small_F {
        places[] = {
            {"MG", {-0.998,-0.249,-0.946}, 180}
        };
    };
    class Land_BagBunker_01_small_green_F : Land_BagBunker_Small_F {};
    // VN versions
    class Land_vn_bagbunker_01_small_green_f : Land_BagBunker_Small_F {};
    class Land_vn_bagbunker_small_f : Land_BagBunker_Small_F {};
    class Land_vn_bunker_small_01 : Land_BagBunker_Small_F {};

    // Some sort of military building with open roof. Common on Stubbhult. VN version not tested.
    class Land_Radar_01_HQ_F {
        places[] = {
            {"AA", {-0.016,-0.031,3.841}, 0},
            {"MG", {-9.538,3.258,3.841}, -45},
            {"MG", {4.977,-10.323,3.841}, 135}
        };
    };
    class Land_vn_radar_01_hq_f : Land_Radar_01_HQ_F {};

    // Ground-level CUP sandbag bunkers
    class Fort_Nest {
        places[] = {
            {"MG", {-0.243,-0.100,-0.951}, 180}
        };
    };
    class Land_fortified_nest_small_EP1 : Fort_Nest {};
    class Land_fortified_nest_small : Fort_Nest {};

    // Elevated MG tower (CUP & VN versions identical)
    class Land_Hlaska {
        places[] = {
            {"MG", {0.285,0.616,3.783}, 0}
        };
    };
    class Land_vn_hlaska : Land_Hlaska {};

    // Large wooden VN bunker
    class Land_vn_o_shelter_05 {
        places[] = {
            {"MG", {-1.727,0.0708,-1.206}, 270}
        };
    };

    // Camouflaged wooden tower
    class Land_vn_o_tower_02 {
        places[] = {
            {"MG", {-1.499,0.987,0.816}, 270}
        };
    };

    class Land_vn_hut_tower_01 {
        places[] = {
            {"MG", {-0.219,-0.165,3.172}, 180}
        };
    };

    // Two-level bunker
    class Land_vn_b_trench_bunker_04_01 {
        places[] = {
            {"AA", {3.965,0.490,0.721}, 90}
        };
    };

    // Large factory buildings 
    class Land_vn_cementworks_01_brick_f {
        places[] = {
            {"AA", {0,0,5.70116}, 0}
        };
    };
    class Land_vn_cementworks_01_grey_f : Land_vn_cementworks_01_brick_f {};

    // Building with tall center roof
    class Land_vn_a_office01 {
        places[] = {
            {"AA", {-1.243,3.108,6.203}, 0}
        };
    };
};
