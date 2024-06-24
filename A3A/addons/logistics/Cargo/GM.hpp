class gm_gm_weapons_gm_machineguns_gm_mg3_gm_mg3_aatripod : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,-1,1.45};
    rotation[] = {0,0,0};
    size = 3;
    recoil = 100;
    isWeapon = 1;
    weaponType = TYPE_MG ;
};

class gm_gm_weapons_gm_machineguns_gm_dshkm_gm_dshkm_aatripod : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,-1,1.7};
    rotation[] = {0,0,0};
    size = 3;
    recoil = 100;
    isWeapon = 1;
    weaponType = TYPE_MG ;
};

class gm_gm_weapons_gm_launchers_gm_milan_gm_milan_launcher_tripod : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,1.15};
    rotation[] = {0,-1,0};
    size = 4;
    recoil = 200;
    isWeapon = 1;
    isLow = 1;
    weaponType = TYPE_AT ;
    blackList[] = {"\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_452_container","\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_451_container","\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_454_cargo"};
};

class gm_gm_weapons_gm_launchers_gm_spg9_gm_spg9_tripod : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,1};
    rotation[] = {0,-1,0};
    size = 4;
    recoil = 200;
    isWeapon = 1;
    isLow = 1;
    weaponType = TYPE_AT ;
    blackList[] = {"\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_452_container","\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_451_container","\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_454_cargo"};
};

class gm_gm_weapons_gm_launchers_gm_fagot_gm_fagot_launcher_tripod : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0.5,1.175};
    rotation[] = {0,-1,0};
    size = 4;
    recoil = 200;
    isWeapon = 1;
    weaponType = TYPE_AT ;
    isLow = 1;
    blackList[] = {"\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_452_container","\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_451_container","\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_454_cargo"};
};
