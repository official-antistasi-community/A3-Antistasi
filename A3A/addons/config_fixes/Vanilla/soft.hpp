//Vanilla - soft.hpp

class B_G_Offroad_01_AT_F;
class B_G_Offroad_01_F;
class B_G_Offroad_01_armed_F;
class B_LSV_01_AT_F;
class C_Van_02_service_F;
class C_Van_02_transport_F;
class C_Van_02_vehicle_F;
class I_C_Offroad_02_AT_F;
class I_C_Offroad_02_LMG_F;
class I_C_Offroad_02_unarmed_F;
class I_E_Offroad_01_comms_F;
class I_E_Offroad_01_covered_F;
class O_LSV_02_AT_F;

class Van_02_medevac_base_F; //external Root Class
class C_Van_02_medevac_F : Van_02_medevac_base_F
{ 
    class TextureSources; //external Child Class
};

//Black
class a3a_Offroad_01_black_F : B_G_Offroad_01_F
{
    scope = 2;
    hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa"};
    textureList[] = {};
    animationList[] = {"HideDoor1",0,"HideDoor2",0,"HideDoor3",0.333333,"HideBumper1",0.5,"HideBumper2",0.5};
};
class a3a_Offroad_01_black_armed_F : B_G_Offroad_01_armed_F
{
    scope = 2;
    hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa"};
    textureList[] = {};
    animationList[] = {"HideDoor1",1,"HideDoor2",1,"HideDoor3",1,"HideBumper1",0.5,"HideBumper2",0.5};
};
class a3a_Offroad_01_black_AT_F : B_G_Offroad_01_AT_F
{
    scope = 2;
    hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa"};
    textureList[] = {};
    animationList[] = {"HideDoor1",1,"HideDoor2",1,"HideDoor3",1,"HideBumper1",0.5,"HideBumper2",0.5};
};
class a3a_Offroad_02_black_unarmed_F : I_C_Offroad_02_unarmed_F
{
    scope = 2;
    textureList[] = {"Black",1,"Blue",0,"Green",0,"Orange",0,"Red",0,"White",0,"Brown",0,"Olive",0,"IDAP",0};
};
class a3a_Offroad_02_black_AT_F : I_C_Offroad_02_AT_F
{
    scope = 2;
    textureList[] = {"Black",1,"Blue",0,"Green",0,"Orange",0,"Red",0,"White",0,"Brown",0,"Olive",0,"IDAP",0};
};
class a3a_Offroad_02_LMG_black_F : I_C_Offroad_02_LMG_F
{
    scope = 2;
    textureList[] = {"Black",1,"Blue",0,"Green",0,"Orange",0,"Red",0,"White",0,"Brown",0,"Olive",0,"IDAP",0};
};
class a3a_LSV_02_AT_black_F : O_LSV_02_AT_F
{
    scope = 2;
    textureList[] = {"Black",1,"GreenHex",0,"Arid",0};
};
class a3a_LSV_01_AT_black_F : B_LSV_01_AT_F
{
    scope = 2;
    textureList[] = {"Black",1,"Olive",0,"Sand",0};
};
class a3a_Van_02_black_transport_F : C_Van_02_transport_F
{
    scope = 2;
    textureList[] = {"Swifd",0,"IdapCargo",0,"IdapTransport",0,"IdapAmbulance",0,"CivAmbulance",0,"CivService",0,"Syndikat",0,"FIA3",0,"FIA2",0,"FIA1",0,"Daltgreen",0,"Vrana",0,"BluePearl",0,"Fuel",0,"BattleBus",0,"Green",0,"Black",1,"Red",0,"Blue",0,"Orange",0,"White",0};
};
class a3a_Van_02_black_vehicle_F : C_Van_02_vehicle_F
{
    scope = 2;
    textureList[] = {"Swifd",0,"IdapCargo",0,"IdapTransport",0,"IdapAmbulance",0,"CivAmbulance",0,"CivService",0,"Syndikat",0,"FIA3",0,"FIA2",0,"FIA1",0,"Daltgreen",0,"Vrana",0,"BluePearl",0,"Fuel",0,"BattleBus",0,"Green",0,"Black",1,"Red",0,"Blue",0,"Orange",0,"White",0};
};
class a3a_Van_02_black_service_F : C_Van_02_service_F
{
    scope = 2;
    textureList[] = {"Swifd",0,"IdapCargo",0,"IdapTransport",0,"IdapAmbulance",0,"CivAmbulance",0,"CivService",0,"Syndikat",0,"FIA3",0,"FIA2",0,"FIA1",0,"Daltgreen",0,"Vrana",0,"BluePearl",0,"Fuel",0,"BattleBus",0,"Green",0,"Black",1,"Red",0,"Blue",0,"Orange",0,"White",0};
};
class a3a_Van_02_black_medevac_F : C_Van_02_medevac_F
{
    scope = 2;
    class TextureSources : TextureSources
    {
        class Black
        {
            author = "Bohemia Interactive";
            displayName = "Black";
            materials[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body.rvmat","\A3\Soft_F_Orange\Van_02\Data\van_wheel.rvmat","","\a3\Data_f\Lights\Car_Beacon_Orange_emit.rvmat"};
            textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Black_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Black_CO.paa"};
        };
        class White
        {
            author = "Bohemia Interactive";
            displayName = "White";
            materials[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body.rvmat","\A3\Soft_F_Orange\Van_02\Data\van_wheel.rvmat","","\a3\Data_f\Lights\Car_Beacon_Orange_emit.rvmat"};
            textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_White_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_White_CO.paa"};
        };
    };
    textureList[] = {"Black",1,"White",0,"CivAmbulance",0,"IdapAmbulance",0,"LDFAmbulance",0};
};

//Green/Tropical
class a3a_Offroad_01_green_F : B_G_Offroad_01_F
{
    scope = 2;
    hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa"};
    textureList[] = {"Green",1};
};
class a3a_Offroad_01_green_armed_F : B_G_Offroad_01_armed_F
{
    scope = 2;
    hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa"};
    textureList[] = {"Green",1};
};
class a3a_Offroad_01_green_AT_F : B_G_Offroad_01_AT_F
{
    scope = 2;
    hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa"};
    textureList[] = {"Green",1};
};
class a3a_Offroad_01_comms_green_F : I_E_Offroad_01_comms_F
{
    scope = 2;
    hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_cover_grn_co.paa"};
    textureList[] = {"Green",1};
};
class a3a_Offroad_01_covered_green_F : I_E_Offroad_01_covered_F
{
    scope = 2;
    hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_cover_grn_co.paa"};
    textureList[] = {"Green",1};
};

//Tan/Beige
class a3a_Offroad_01_tan_F : B_G_Offroad_01_F
{
    scope = 2;
    textureList[] = {"Beige",1};
    hiddenSelectionsTextures[] = {"a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa"};
};
class a3a_Offroad_01_tan_armed_F : B_G_Offroad_01_armed_F
{
    scope = 2;
    textureList[] = {"Beige",1};
    hiddenSelectionsTextures[] = {"a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa"};
};
class a3a_Offroad_01_tan_AT_F : B_G_Offroad_01_AT_F
{
    scope = 2;
    textureList[] = {"Beige",1};
    hiddenSelectionsTextures[] = {"a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa"};
};
class a3a_Offroad_01_comms_tan_F : I_E_Offroad_01_comms_F
{
    scope = 2;
    textureList[] = {"Beige",1};
    hiddenSelectionsTextures[] = {"a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_cover_blk_co.paa"};
};
class a3a_Offroad_01_covered_tan_F : I_E_Offroad_01_covered_F
{
    scope = 2;
    textureList[] = {"Beige",1};
    hiddenSelectionsTextures[] = {"a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_cover_blk_co.paa"};
};

//LDF-Camo
class a3a_Offroad_01_ldf_armed_F : B_G_Offroad_01_armed_F
{
    crew = "I_E_Soldier_F";
    faction = "IND_E_F";
    side = 2;
    hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa"};
    textureList[] = {"EAF",1};
};
class a3a_Offroad_01_ldf_AT_F : B_G_Offroad_01_AT_F
{
    crew = "I_E_Soldier_F";
    faction = "IND_E_F";
    side = 2;
    hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa"};
    textureList[] = {"EAF",1};
};

//Gendarmerie
class a3a_Offroad_01_GEN_armed_F : B_G_Offroad_01_armed_F
{
    crew = "B_GEN_Commander_F";
    faction = "BLU_GEN_F";
    side = 1;
    hiddenSelectionsTextures[] = {"\A3\Soft_F_Exp\Offroad_01\Data\Offroad_01_ext_gen_CO.paa","\A3\Soft_F_Exp\Offroad_01\Data\Offroad_01_ext_gen_CO.paa"};
    textureList[] = {"Gendarmerie",1};
    animationList[] = {"HideDoor1",0,"HideDoor2",0,"HideDoor3",0.5,"HideBumper1",0.5,"HideBumper2",0.5};
};
class a3a_Offroad_01_GEN_AT_F : B_G_Offroad_01_AT_F
{
    crew = "B_GEN_Commander_F";
    faction = "BLU_GEN_F";
    side = 1;
    hiddenSelectionsTextures[] = {"\A3\Soft_F_Exp\Offroad_01\Data\Offroad_01_ext_gen_CO.paa","\A3\Soft_F_Exp\Offroad_01\Data\Offroad_01_ext_gen_CO.paa"};
    textureList[] = {"Gendarmerie",1};
    animationList[] = {"HideDoor1",0,"HideDoor2",0,"HideDoor3",0.5,"HideBumper1",0.5,"HideBumper2",0.5};
};