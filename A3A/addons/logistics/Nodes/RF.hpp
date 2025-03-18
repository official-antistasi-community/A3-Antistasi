// RF.hpp - Vehicle Logistic Nodes

//Default open pickup
class lxRF_vehicles_rf_pickup_01_pickup_01_unarmed_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.5,-1};
            seats[] = {5,6};
        };
        class Node2
        {
            offset[] = {0,-2.3,-1};
            seats[] = {3,4};
        };
    };
};
class lxRF_vehicles_rf_pickup_01_pickup_01_mmg_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.5,-1.1};
            seats[] = {5,6};
        };
        class Node2
        {
            offset[] = {0,-2.3,-1.1};
            seats[] = {3,4};
        };
    };
};
class lxRF_vehicles_rf_pickup_01_pickup_01_service_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.5,-1};
            seats[] = {5,6};
        };
        class Node2
        {
            offset[] = {0,-2.3,-1};
            seats[] = {3,4};
        };
    };
};

class a3a_civ_Pickup_fuel_rf : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes {};
};