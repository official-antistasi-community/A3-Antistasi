class WW2_Assets_m_Vehicles_Cars_m_IF_Willys_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.325,-0.9,-0.35};
            seats[] = {1, 2};
        };
    };
};

//If the cargo nodes were moved towards the front a little bit seat 8 & 9 on the Opel Blitz could be unblocked
class WW2_Assets_m_Vehicles_Trucks_m_IF_Opelblitz_Tent_p3d : TRIPLES(ADDON,Nodes,Base)
{
    canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.4,-0.05};
            seats[] = {1, 2, 7, 10, 11};
        };
        class Node2
        {
            offset[] = {0,-1.2,-0.05};
            seats[] = {5,6};
        };
        class Node3
        {
            offset[] = {0,-2,-0.05};
            seats[] = {3,4,8,9};
        };
    };
};

class WW2_Assets_m_Vehicles_Trucks_m_IF_Opelblitz_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.4,-0.05};
            seats[] = {1,2,7,10,11};
        };
        class Node2
        {
            offset[] = {0,-1.2,-0.05};
            seats[] = {5,6};
        };
        class Node3
        {
            offset[] = {0,-2,-0.05};
            seats[] = {3,4,8,9};
        };
    };
};

//Nodes seem offcentre, check if AAF basic weapons is offcentre before fixing
class WW2_Assets_m_Vehicles_WheeledAPC_m_IF_SdKfz_7_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.5,-0.75};
            seats[] = {2,3,4,5,9};
        };
        class Node2
        {
            offset[] = {0,-1.3,-0.75};
            seats[] = {10};
        };
        class Node3
        {
            offset[] = {0,-2.1,-0.75};
            seats[] = {6};
        };
        class Node4
        {
            offset[] = {0,-2.9,-0.75};
            seats[] = {7,8};
        };
    };
};

class WW2_Assets_m_Vehicles_Trucks_m_IF_Us6_p3d : TRIPLES(ADDON,Nodes,Base)
{
    canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.4,0.2};
            seats[] = {1,10};
        };
        class Node2
        {
            offset[] = {0,-1.2,0.2};
            seats[] = {2,5,6,7};
        };
        class Node3
        {
            offset[] = {0,-2,0.2};
            seats[] = {3,4};
        };
        class Node4
        {
            offset[] = {0,-2.8,0.2};
            seats[] = {8,9};
        };
    };
};

class WW2_Assets_m_Vehicles_Trucks_m_IF_Gmc353Truck_p3d : TRIPLES(ADDON,Nodes,Base)
{
    canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.4,-0.6};
            seats[] = {1,10};
        };
        class Node2
        {
            offset[] = {0,-1.2,-0.6};
            seats[] = {2,7};
        };
        class Node3
        {
            offset[] = {0,-2,-0.6};
            seats[] = {3,4,5,6};
        };
        class Node4
        {
            offset[] = {0,-2.8,-0.6};
            seats[] = {8,9};
        };
    };
};

class WW2_Assets_m_Vehicles_Trucks_m_IF_Zis5v_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.15,-0.4};
            seats[] = {1,2,3,5,10,11};
        };
        class Node2
        {
            offset[] = {0,-0.95,-0.4};
            seats[] = {4,6,7};
        };
        class Node3
        {
            offset[] = {0,-1.75,-0.4};
            seats[] = {8,9,12};
        };
    };
};
