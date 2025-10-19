class AMF_GBC180_amf_gbc180_PERS_F_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,0.6,1.6};
            seats[] = {1,4,5,6};
        };
        class Node2
        {
            offset[] = {0,-0.2,1.6};
            seats[] = {7,8,9,10};
        };
        class Node3
        {
            offset[] = {0,-1,1.6};
            seats[] = {11,12,13,14};
        };
        class Node4
        {
            offset[] = {0,-1.8,1.6};
            seats[] = {15,16};
        };
        class Node5
        {
            offset[] = {0,-2.6,1.6};
            seats[] = {17,18};
        };
    };
};

class AMF_GBC180_amf_gbc180_ViV_F_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,0.6,1.6};
        };
        class Node2
        {
            offset[] = {0,-0.2,1.6};
        };
        class Node3
        {
            offset[] = {0,-1,1.6};
        };
        class Node4
        {
            offset[] = {0,-1.8,1.6};
        };
        class Node5
        {
            offset[] = {0,-2.6,1.6};
        };
    };
};

class AMF_GBC180_amf_gbc180_PLATEAU_F_p3d : AMF_GBC180_amf_gbc180_ViV_F_p3d{};

class AMF_GBC180_amf_gbc180_MECA_F_p3d : AMF_GBC180_amf_gbc180_ViV_F_p3d {};