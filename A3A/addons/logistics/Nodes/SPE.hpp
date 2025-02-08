class SPE_ST_OpelBlitz : TRIPLES(ADDON,Nodes,Base) //Removable Canopy on both Covered and Open variant.
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.8,-0.77};
            seats[] = {1,2,7,10};
        };
        class Node2
        {
            offset[] = {0,-1.6,-0.77};
            seats[] = {5,6,7};
        };
        class Node3
        {
            offset[] = {0,-2.4,-0.77};
            seats[] = {3,4,5,6};
        };
        class Node4
        {
            offset[] = {0,-3.2,-0.77};
            seats[] = {8,9};
        };
    };
};

class SPE_OpelBlitz : SPE_ST_OpelBlitz {};
class SPE_OpelBlitz_Open : SPE_ST_OpelBlitz {};
class SPE_ST_OpelBlitz_Open : SPE_ST_OpelBlitz {};
class SPE_FFI_OpelBlitz : SPE_ST_OpelBlitz {};
class SPE_FFI_OpelBlitz_Open : SPE_ST_OpelBlitz {};

class SPE_US_M3_Halftrack_Unarmed : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.4,-1.02};
            seats[] = {0,1,2,3,4,11};
        };
        class Node2
        {
            offset[] = {0,-1.2,-1.02};
            seats[] = {3,4,5,6}; //3,4 cause overlap
        };
        class Node3
        {
            offset[] = {0,-2,-1.02};
            seats[] = {7,8,9,10};
        };
    };
};
class SPE_FR_M3_Halftrack_Unarmed : SPE_US_M3_Halftrack_Unarmed {};

class SPE_US_M3_Halftrack : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.1,-1.01};
            seats[] = {3,4,5,6};
        };
        class Node2
        {
            offset[] = {0,-1.9,-1.01};
            seats[] = {1,7,8,9};
        };
    };
};
class SPE_FR_M3_Halftrack : SPE_US_M3_Halftrack {};

class SPE_CCKW_353 : TRIPLES(ADDON,Nodes,Base)
{
    canLoadWeapon = 0;
        class Nodes
    {
        class Node1
        {
            offset[] = {0,0.3,-0.7};
            seats[] = {3,4};
        };
        class Node2
        {
            offset[] = {0,-0.5,-0.7};
            seats[] = {5,6,7,8};
        };
        class Node3
        {
            offset[] = {0,-1.3,-0.7};
            seats[] = {9,10};
        };
        class Node4
        {
            offset[] = {0,-2.1,-0.7};
            seats[] = {0,1};
        };
    };
};
class SPE_CCKW_353_M2 : SPE_CCKW_353 {};
class SPE_CCKW_353_Open : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,0.3,-0.7};
            seats[] = {3,4};
        };
        class Node2
        {
            offset[] = {0,-0.5,-0.7};
            seats[] = {5,6,7,8};
        };
        class Node3
        {
            offset[] = {0,-1.3,-0.7};
            seats[] = {9,10};
        };
        class Node4
        {
            offset[] = {0,-2.1,-0.7};
            seats[] = {0,1};
        };
    };
};

class SPE_US_G503_MB : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.07,-0.6};
        };
    };
};
class SPE_US_G503_MB_Armoured : SPE_US_G503_MB {};
class SPE_US_G503_MB_Open : SPE_US_G503_MB {};