class LIB_SdKfz_7 : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.5,-0.8};
			seats[] = {2,3,4,5,9};
        };
        class Node2
        {
            offset[] = {0,-1.3,-0.8};
			seats[] = {6,10};
        };
        class Node3
        {
            offset[] = {0,-2.1,-0.8};

        };
        class Node4
        {
            offset[] = {0,-2.9,-0.8};
			seats[] = {7,8};
        };
    };
};
class LIB_DAK_SdKfz_7 : LIB_SdKfz_7 {};
class LIB_SdKfz_7_w : LIB_SdKfz_7 {};

class LIB_OpelBlitz_Open_Y_Camo : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.1,-0.04};
			seats[] = {1,2,7,10,11};
        };
        class Node2
        {
            offset[] = {0,-0.9,-0.04};
			seats[] = {5,6};
        };
        class Node3
        {
            offset[] = {0,-1.7,-0.04};
			seats[] = {3,4};
        };
        class Node4
        {
            offset[] = {0,-2.5,-0.04};
			seats[] = {8,9};
        };
    };
};
class LIB_DAK_OpelBlitz_Open : LIB_OpelBlitz_Open_Y_Camo {};
class LIB_OpelBlitz_Open_Y_Camo_w : LIB_OpelBlitz_Open_Y_Camo {};
class LIB_OpelBlitz_Open_G_Camo_w : LIB_OpelBlitz_Open_Y_Camo {};

class LIB_OpelBlitz_Tent_Y_Camo : TRIPLES(ADDON,Nodes,Base)
{
	    canLoadWeapon = 0;
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.1,-0.04};
			seats[] = {1,2,7,10,11};
        };
        class Node2
        {
            offset[] = {0,-0.9,-0.04};
			seats[] = {5,6};
        };
        class Node3
        {
            offset[] = {0,-1.7,-0.04};
			seats[] = {3,4};
        };
        class Node4
        {
            offset[] = {0,-2.5,-0.04};
			seats[] = {8,9};
        };
    };
};
class LIB_DAK_OpelBlitz_Tent : LIB_OpelBlitz_Tent_Y_Camo {};
class LIB_OpelBlitz_Tent_Y_Camo_w : LIB_OpelBlitz_Tent_Y_Camo {};

class LIB_US6_Open : TRIPLES(ADDON,Nodes,Base)
{
	    canLoadWeapon = 0;
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.28,0.2};
			seats[] = {1,10};
        };
        class Node2
        {
            offset[] = {0,-1.08,0.2};
			seats[] = {2,5,6,7};
        };
        class Node3
        {
            offset[] = {0,-1.88,0.2};
			seats[] = {3,4};
        };
        class Node4
        {
            offset[] = {0,-2.68,0.2};
			seats[] = {8,9};
        };
    };
};
class LIB_US6_Open_Cargo : LIB_US6_Open {};
class LIB_US6_Tent : LIB_US6_Open {};
class LIB_US6_Tent_Cargo : LIB_US6_Open {};

class LIB_Zis5v : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.2,-0.4};
			seats[] = {1,2,3,5,10,11};
        };
        class Node2
        {
            offset[] = {0,-1,-0.4};
			seats[] = {4,6,7};
        };
        class Node3
        {
            offset[] = {0,-1.8,-0.4};
			seats[] = {8,9,12};
        };
    };
};
class LIB_Zis5v_w : LIB_Zis5v {};

class LIB_US_GMC_Open : TRIPLES(ADDON,Nodes,Base)
{
	    canLoadWeapon = 0;
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.4,-0.6};
			seats[] = {1,2,7,10};
        };
        class Node2
        {
            offset[] = {0,-1.2,-0.6};
			seats[] = {5,6};
        };
        class Node3
        {
            offset[] = {0,-2,-0.6};
			seats[] = {3,4};
        };
        class Node4
        {
            offset[] = {0,-2.8,-0.6};
			seats[] = {8,9};
        };
    };
};
class LIB_US_GMC_Open_w : LIB_US_GMC_Open {};
class LIB_US_NAC_GMC_Open : LIB_US_GMC_Open {};
class LIB_US_GMC_Tent : LIB_US_GMC_Open {};
class LIB_US_NAC_GMC_Tent : LIB_US_GMC_Open {};
class LIB_US_GMC_Tent_w : LIB_US_GMC_Open {};
