class VME_BJ2022_CSVP4_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.4,0.6};
        };
    };
};

class VME_BJ2022_BJ2102_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.6,-0.5};
        };
    };
};

class VME_BJ2022_BJ2102patrol_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.7,0.9};
        };
    };
};

class vme_pla_EQ2050_VME_PLA_EQ2050_p3d : TRIPLES(ADDON,Nodes,Base)
{
    canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.5,-1};
        };
        class Node2
        {
            offset[] = {0,-1.3,-1};
        };
    };
};

class vme_pla_EQ2050_VME_PLA_EQ2050_HQ_p3d : TRIPLES(ADDON,Nodes,Base)
{
    canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.5,-1.2};
        };
    };
};

class vme_pla_EQ2050_VME_PLA_EQ2050_GL_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.4,1};
        };
    };
};

class vme_pla_EQ2050_VME_PLA_EQ2050_reconMG_p3d : vme_pla_EQ2050_VME_PLA_EQ2050_GL_p3d{};

class  vme_pla_sx2190_vme_pla_sx2190_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,1.4,-0.35};
        };
        class Node2
        {
            offset[] = {0,0.6,-0.35};
        };
        class Node3
        {
            offset[] = {0,-0.2,-0.35};
        };
        class Node4
        {
            offset[] = {0,-1,-0.35};
        };
        class Node5
        {
            offset[] = {0,-1.8,-0.35};
        };
        class Node6
        {
            offset[] = {0,-2.6,-0.35};
        };
        class Node7
        {
            offset[] = {0,-3.4,-0.35};
        };
    };
};
