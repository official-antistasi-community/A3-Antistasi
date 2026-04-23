//Fallujah - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(Fallujah) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","fallujah_v1_0"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};
class CfgWorlds {
    class CAWorld;
    class Utes : CAWorld {};

    class Fallujah : Utes {
        class Names {
            class Jolan_text {
                angle = 0;
                name = "Jolan North";
                position[] = {3409,6016};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class a3a_Jolan_South {
                angle = 0;
                name = "Jolan South";
                position[] = {3125,5071};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class Mualimeen_text {
                angle = 0;
                name = "Mualimeen West";
                position[] = {3942,6257};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class a3a_Mualimeen_East {
                angle = 0;
                name = "Mualimeen East";
                position[] = {4849,6364};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class Muhandisin_text {
                angle = 0;
                name = "Muhandisin West";
                position[] = {4007,5435};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class a3a_Muhandisin_East {
                angle = 0;
                name = "Muhandisin East";
                position[] = {4802,5588};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class Shurta_text {
                angle = 0;
                name = "Shurta North";
                position[] = {5781,6625};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class a3a_Shurtah_South {
                angle = 0;
                name = "Shurta South";
                position[] = {5415,5553};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class Jeghaifi_text {
                angle = 0;
                name = "Jeghaifi";
                position[] = {6263,6338};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class a3a_Jeghaifi_South {
                angle = 0;
                name = "Jeghaifi South";
                position[] = {6247,5551};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class Askari_text {
                angle = 0;
                name = "Askari";
                position[] = {7232,5448};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class a3a_Askari_North {
                angle = 0;
                name = "Askari North";
                position[] = {7000,6281};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class Resafa_text {
                angle = 0;
                name = "Resafa North";
                position[] = {3831,4292};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class a3a_Resafa_South {
                angle = 0;
                name = "Resafa South";
                position[] = {4279,3450};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class Nazal_text {
                angle = 0;
                name = "Nazal Old City";
                position[] = {4810,4770};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class a3a_Nazal_South {
                angle = 0;
                name = "Nazal South";
                position[] = {5193,3903};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class Shuhada_text {
                angle = 0;
                name = "Shuhada";
                position[] = {5508,2605};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class a3a_Shuhada_West {
                angle = 0;
                name = "Shuhada West";
                position[] = {4864,2535};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class a3a_Shuhada_East {
                angle = 0;
                name = "Shuhada East";
                position[] = {6059,2692};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
         };
        };
        };
