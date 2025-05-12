//Vanilla - air.hpp

class B_Heli_Light_01_F;
class B_Heli_Light_01_dynamicLoadout_F;
class B_Heli_Light_01_stripped_F;
class I_Heli_Transport_02_F;
class I_Plane_Fighter_03_dynamicLoadout_F;
class I_Plane_Fighter_04_F;
class O_Heli_Light_02_dynamicLoadout_F;
class O_Heli_Light_02_unarmed_F;

//Black
class a3a_Heli_Light_02_black_F : O_Heli_Light_02_dynamicLoadout_F
{
    class TextureSources
    {
        class Black
        {
            author = "Bohemia Interactive";
            displayName = "Black";
            textures[] = {"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_CO.paa"};
        };
        class Blackcustom
        {
           author = "Bohemia Interactive";
            displayName = "Black Custom";
            textures[] = {"\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa"};
        };
    };
    textureList[] = {"Black",1,"Blackcustom",1};
    hiddenSelectionsTextures[] = {"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_CO.paa"};
};

//ION
class a3a_Heli_Light_01_Stripped_ION_F : B_Heli_Light_01_stripped_F
{
    hiddenSelectionsTextures[] = {"a3\air_f\heli_light_01\data\heli_light_01_ext_ion_co.paa",""};
};
class a3a_Heli_Light_01_ION_F : B_Heli_Light_01_F
{
    hiddenSelectionsTextures[] = {"a3\air_f\heli_light_01\data\heli_light_01_ext_ion_co.paa",""};
};
class a3a_Heli_Light_01_dynamicLoadout_ION_F : B_Heli_Light_01_dynamicLoadout_F
{
    hiddenSelectionsTextures[] = {"a3\air_f\heli_light_01\data\heli_light_01_ext_ion_co.paa","a3\air_f\heli_light_01\data\heli_light_01_dot_ca.paa"};
};
class a3a_ION_Heli_Transport_02_F : I_Heli_Transport_02_F
{
    textureList[] = {"ION",1,"AAF",0,"IDAP",0,"Dahoman",0};
    hiddenSelectionsTextures[] = {"a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_1_ion_co.paa","a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_2_ion_co.paa","a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_3_ion_co.paa","a3\air_f_beta\heli_transport_02\data\heli_transport_02_int_02_co.paa"};
};

//Grey
class a3a_Plane_Fighter_04_grey_F : I_Plane_Fighter_04_F
{
    textureList[] = {"CamoGrey",1,"DigitalCamoGreen",0,"DigitalCamoGrey",0};
    hiddenSelectionsTextures[] = {"a3\air_f_jets\plane_fighter_04\data\fighter_04_fuselage_01_co.paa","a3\air_f_jets\plane_fighter_04\data\fighter_04_fuselage_02_co.paa","a3\air_f_jets\plane_fighter_04\data\fighter_04_misc_01_co.paa","a3\air_f_jets\plane_fighter_04\data\numbers\fighter_04_number_04_ca.paa","a3\air_f_jets\plane_fighter_04\data\numbers\fighter_04_number_04_ca.paa","a3\air_f_jets\plane_fighter_04\data\numbers\fighter_04_number_08_ca.paa"};
};
class a3a_Plane_Fighter_03_grey_F : I_Plane_Fighter_03_dynamicLoadout_F
{
    textureList[] = {"Grey",1,"Green",0,"Hex",0};
    hiddenSelectionsTextures[] = {"a3\air_f_gamma\plane_fighter_03\data\plane_fighter_03_body_1_greyhex_co.paa","a3\air_f_gamma\plane_fighter_03\data\plane_fighter_03_body_2_greyhex_co.paa"};
};

//Civilian
class a3a_C_Heli_Transport_02_F : I_Heli_Transport_02_F
{
    crew = "C_man_1_1_F";
    faction = "CIV_F";
    side = 3;
    textureList[] = {"ION",0,"AAF",0,"IDAP",0,"Dahoman",1};
    hiddenSelectionsTextures[] = {"a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_1_dahoman_co.paa","a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_2_dahoman_co.paa","a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_3_dahoman_co.paa","a3\air_f_beta\heli_transport_02\data\heli_transport_02_int_02_co.paa"};
};
