class UK3CB_BAF_Vehicles_addons_UK3CB_BAF_Vehicles_Coyote_Jackal_uk3cb_coyote_L134A1_passenger_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0.05,-1.6,-1.695};
            seats[] = {2,3,4,5,6,7};
        };
        class Node2
        {
            offset[] = {0.05,-2.4,-1.695};
            seats[] = {2,3,4,5,6,7};
        };
    };
    canLoadLowWeapons = 0;
};

class UK3CB_BAF_Vehicles_addons_UK3CB_BAF_Vehicles_Coyote_Jackal_uk3cb_coyote_L111A1_passenger_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0.05,-1.6,-1.695};
            seats[] = {2,3,4,5,6,7};
        };
        class Node2
        {
            offset[] = {0.05,-2.4,-1.695};
            seats[] = {2,3,4,5,6,7};
        };
    };
    canLoadLowWeapons = 0;
};

class uk3cb_baf_vehicles_addons_uk3cb_baf_vehicles_man_uk3cb_man_4x4_cargo_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,3.3,-1.205};
            seats[] = {};
        };
        class Node2
        {
            offset[] = {0,2.5,-1.205};
            seats[] = {};
        };
        class Node3
        {
            offset[] = {0,1.7,-1.205};
            seats[] = {};
        };
        class Node4
        {
            offset[] = {0,0.9,-1.205};
            seats[] = {};
        };
        class Node5
        {
            offset[] = {0,0.1,-1.205};
            seats[] = {};
        };
        class Node6
        {
            offset[] = {0,-0.7,-1.205};
            seats[] = {};
        };
    };
};

class uk3cb_baf_vehicles_addons_uk3cb_baf_vehicles_man_uk3cb_man_6x6_cargo_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,4.8,-1.205};
            seats[] = {};
        };
        class Node2
        {
            offset[] = {0,4,-1.205};
            seats[] = {};
        };
        class Node3
        {
            offset[] = {0,3.2,-1.205};
            seats[] = {};
        };
        class Node4
        {
            offset[] = {0,2.4,-1.205};
            seats[] = {};
        };
        class Node5
        {
            offset[] = {0,1.6,-1.205};
            seats[] = {};
        };
        class Node6
        {
            offset[] = {0,0.8,-1.205};
            seats[] = {};
        };
        class Node7
        {
            offset[] = {0,0,-1.205};
            seats[] = {};
        };
        class Node8
        {
            offset[] = {0,-0.8,-1.205};
            seats[] = {};
        };
    };
};

//Prevent mount Weapons in Trucks spawned with container on the back

class uk3cb_baf_HX_container_6x6 : uk3cb_baf_vehicles_addons_uk3cb_baf_vehicles_man_uk3cb_man_6x6_cargo_p3d
{
    canLoadLowWeapons = 0;
};

class uk3cb_baf_HX_container_4x4 : uk3cb_baf_vehicles_addons_uk3cb_baf_vehicles_man_uk3cb_man_4x4_cargo_p3d
{
    canLoadLowWeapons = 0;
};

class UK3CB_BAF_MAN_HX58_Cargo_Green_B_Arctic : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Sand_B_DDPM : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Green_B_MTP : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Sand_B_MTP : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Green_B_DPMT : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Green_B_Tropical : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Green_B_DPMW : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Green_B_Arctic_RM : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Sand_B_DDPM_RM : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Green_B_MTP_RM : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Sand_B_MTP_RM : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Green_B_DPMT_RM : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Green_B_Tropical_RM : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Green_B_DPMW_RM : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Green_B : uk3cb_baf_HX_container_6x6
{

};

class UK3CB_BAF_MAN_HX58_Cargo_Sand_B : uk3cb_baf_HX_container_6x6
{

};


class UK3CB_BAF_MAN_HX60_Cargo_Sand_B_DDPM : uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Green_B_Arctic: uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Green_B_MTP: uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Sand_B_MTP: uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Green_B_DPMT: uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Green_B_Tropical: uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Green_B_DPMW: uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Green_B_Arctic_RM: uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Sand_B_DDPM_RM: uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Green_B_MTP_RM: uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Sand_B_MTP_RM: uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Green_B_DPMT_RM: uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Green_B_DPMW_RM: uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Green_B: uk3cb_baf_HX_container_4x4
{

};

class UK3CB_BAF_MAN_HX60_Cargo_Sand_B: uk3cb_baf_HX_container_4x4
{

};


