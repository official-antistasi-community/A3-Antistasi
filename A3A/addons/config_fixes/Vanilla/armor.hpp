//Vanilla - armor.hpp

class I_MRAP_03_F;
class I_MRAP_03_gmg_F;
class I_MRAP_03_hmg_F;
class O_MBT_04_cannon_F;
class O_MBT_04_command_F;
    class O_MBT_02_base_F
    ; //external Root Class
    class O_MBT_02_cannon_F : O_MBT_02_base_F
    { 
        class TextureSources; //external Child Class
    };

//Grey
class a3a_MRAP_03_grey_F : I_MRAP_03_F
{ 
    hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
};
class a3a_MRAP_03_gmg_grey_F : I_MRAP_03_gmg_F
{ 
    hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
};
class a3a_MRAP_03_hmg_grey_F : I_MRAP_03_hmg_F
{ 
    hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
};

//Black
class a3a_MBT_04_cannon_black_F : O_MBT_04_cannon_F
{
    textureList[] = {};
    hiddenSelectionsTextures[] = {"a3\armor_f_tank\mbt_04\data\mbt_04_exterior_1_co.paa","a3\armor_f_tank\mbt_04\data\mbt_04_exterior_2_co.paa","a3\armor_f\data\camonet_csat_stripe_desert_co.paa"};
};
class a3a_MBT_04_command_black_F : O_MBT_04_command_F
{
    textureList[] = {};
    hiddenSelectionsTextures[] = {"a3\armor_f_tank\mbt_04\data\mbt_04_exterior_1_co.paa","a3\armor_f_tank\mbt_04\data\mbt_04_exterior_2_co.paa","a3\armor_f\data\camonet_csat_stripe_desert_co.paa"};
};

class a3a_MBT_02_cannon_black_F : O_MBT_02_cannon_F
{
    class TextureSources : TextureSources
    {
        class Grey
        {
            author = "Bohemia Interactive";
            displayName = "Grey";
            textures[] = {"a3\Armor_F_Decade\MBT_02\Data\MBT_02_body_expo_CO.paa","a3\Armor_F_Decade\MBT_02\Data\MBT_02_turret_expo_CO.paa","a3\Armor_F_Decade\MBT_02\Data\MBT_02_expo_CO.paa","A3\Armor_F\Data\camonet_CSAT_HEX_Green_CO.paa"};
        };
    };
    textureList[] = {"Grey", 1};
    hiddenSelectionsTextures[] = {"a3\Armor_F_Decade\MBT_02\Data\MBT_02_body_expo_CO.paa","a3\Armor_F_Decade\MBT_02\Data\MBT_02_turret_expo_CO.paa","a3\Armor_F_Decade\MBT_02\Data\MBT_02_expo_CO.paa","A3\Armor_F\Data\camonet_CSAT_HEX_Green_CO.paa"};
};