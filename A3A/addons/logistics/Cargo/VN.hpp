class vn_objects_f_vietnam_supply_a2_ammo_pavn_vn_pavn_weapons_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.05,0,0};
    rotation[] = {0,-1,0};
    size = 1;
    recoil = 0;
};

class vn_static_f_vietnam_zpu4_vn_static_zpu4_01_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.15,-0.1,1.6};
    rotation[] = {0,-1,0};
    size = 7;
    recoil = 200;
    isWeapon = 1;
    weaponType = TYPE_AA;
};

class vn_static_f_vietnam_m45_vn_static_m45_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.07,0,1.93};
    rotation[] = {0,-1,0};
    size = 3;
    recoil = 150;
    isWeapon = 1;
    weaponType = TYPE_AA;
    blackList[] = {"vn\wheeled_f_vietnam\z157\vn_wheeled_z157_01.p3d","vn\wheeled_f_vietnam\m54\vn_wheeled_m54_01.p3d"};
};

class vn_static_f_vietnam_m60_vn_static_m60_high_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.2,0,1.63};
    rotation[] = {0,1,0};
    size = 4;
    recoil = 100;
    isWeapon = 1;
    weaponType = TYPE_MG;
};

class vn_static_f_vietnam_m2_vn_static_m2_high_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.2,0,1.63};
    rotation[] = {0,1,0};
    size = 4;
    recoil = 100;
    isWeapon = 1;
    weaponType = TYPE_MG;
};

class vn_static_f_vietnam_m1919_vn_static_m1919a4_low_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.2,0,1.2};
    rotation[] = {0,-1,0};
    size = 4;
    recoil = 100;
    isWeapon = 1;
    weaponType = TYPE_MG;
    isLow = 1;
};

class vn_static_f_vietnam_m1919_vn_static_m1919a4_high_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.2,0,1.66};
    rotation[] = {0,1,0};
    size = 4;
    recoil = 100;
    isWeapon = 1;
    weaponType = TYPE_MG;
};

class vn_static_f_vietnam_tow_vn_static_tow_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.2,0,1.19};
    rotation[] = {-1,0,0};
    size = 4;
    recoil = 250;
    isWeapon = 1;
    weaponType = TYPE_AT;
};

class vn_static_f_vietnam_m1919_vn_static_m1919a6_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,1.15};
    rotation[] = {0,-1,0};
    size = 5;
    recoil = 100;
    isWeapon = 1;
    isLow = 1;
    weaponType = TYPE_MG;
};

class vn_static_f_vietnam_mortar_m29_vn_static_mortar_m29 : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.2,0,0.69};
    rotation[] = {0,-1,0};
    size = 3;
    recoil = 2000;
    isWeapon = 1;
    blackList[] = {"\vn\boat_f_vietnam\motorboat\vn_boat_01.p3d","\vn\boat_f_vietnam\motorboat\vn_boat_01_mg.p3d","\vn\boat_f_vietnam\motorboat\vn_boat_02.p3d","\vn\boat_f_vietnam\motorboat\vn_boat_02_mg.p3d","\vn\boat_f_vietnam\sampan\vn_boat_08.p3d","\vn\boat_f_vietnam\sampan\vn_boat_07.p3d"};
    weaponType = TYPE_MORTAR;
    disallowOnBoat = 1;
};

class vn_static_f_vietnam_mortar_m2_vn_static_mortar_m2 : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.3,0,0.7};
    rotation[] = {0,-1,0};
    size = 2;
    recoil = 1500;
    isWeapon = 1;
    weaponType = TYPE_MORTAR;
    disallowOnBoat = 1
    blackList[] = {"\vn\boat_f_vietnam\motorboat\vn_boat_01.p3d","\vn\boat_f_vietnam\motorboat\vn_boat_01_mg.p3d","\vn\boat_f_vietnam\motorboat\vn_boat_02.p3d","\vn\boat_f_vietnam\motorboat\vn_boat_02_mg.p3d","\vn\boat_f_vietnam\sampan\vn_boat_08.p3d","\vn\boat_f_vietnam\sampan\vn_boat_07.p3d"};
};


class vn_static_f_vietnam_m2_vn_static_m2_low_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.1,0,1.17};
    rotation[] = {0,-1,0};
    size = 3;
    recoil = 100;
    isWeapon = 1;
    isLow = 1;
    weaponType = TYPE_MG;
};

class vn_static_f_vietnam_m60_vn_static_m60_low_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.1,0,1.17};
    rotation[] = {0,-1,0};
    size = 2;
    recoil = 100;
    isWeapon = 1;
    isLow = 1;
    weaponType = TYPE_MG;
};

class vn_static_f_vietnam_dshkm_vn_static_dshkm_high_02_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.2,0,1.7};
    rotation[] = {0,1,0};
    size = 4;
    recoil = 150;
    isWeapon = 1;
    weaponType = TYPE_MG;
};

class vn_static_f_vietnam_mortar_type53_vn_o_static_mortar_type53 : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0.95};
    rotation[] = {-1,-1,0};
    size = 3;
    recoil = 2000;
    isWeapon = 1;
    weaponType = TYPE_MORTAR;
    disallowOnBoat = 1;
};

class vn_static_f_vietnam_dshkm_vn_static_dshkm_low_02_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.3,0.8,1.21};
    rotation[] = {0,-1,0};
    size = 4;
    recoil = 150;
    isWeapon = 1;
    isLow = 1;
    weaponType = TYPE_MG;
};

class vn_static_f_vietnam_dshkm_vn_static_dshkm_high_01_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.2,0,1.69};
    rotation[] = {0,1,0};
    size = 4;
    recoil = 150;
    isWeapon = 1;
    weaponType = TYPE_MG;
};

class vn_static_f_vietnam_pk_vn_static_pk_high_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.15,1,1.97};
    rotation[] = {0,-1,0};
    size = 4;
    recoil = 100;
    isWeapon = 1;
    weaponType = TYPE_MG;
};

class vn_static_f_vietnam_dp28_vn_static_dp28_high_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.2,1,1.67};
    rotation[] = {0,-1,0};
    size = 4;
    recoil = 100;
    isWeapon = 1;
    weaponType = TYPE_MG;
};

class vn_static_f_vietnam_rpd_vn_static_rpd_high_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.15,1,1.67};
    rotation[] = {0,-1,0};
    size = 4;
    recoil = 100;
    isWeapon = 1;
    weaponType = TYPE_MG;
};

class vn_static_f_vietnam_dshkm_vn_static_dshkm_low_01_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.3,0.8,1.21};
    rotation[] = {0,-1,0};
    size = 4;
    recoil = 150;
    isWeapon = 1;
    weaponType = TYPE_MG;
    isLow = 1;
};

class vn_static_f_vietnam_PK_vn_static_PK_low_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.3,0,1.21};
    rotation[] = {0,-1,0};
    size = 2;
    recoil = 100;
    isWeapon = 1;
    weaponType = TYPE_MG;
    isLow = 1;
};

class vn_static_f_vietnam_02_l70mk2_vn_static_l70mk2_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.2,0,1.58};
    rotation[] = {0,0,0};
    size = 4;
    recoil = 1500;
    isWeapon = 1;
    weaponType = TYPE_AA;
};

class vn_static_f_vietnam_02_l60mk3_vn_static_l60mk3_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,1.77};
    rotation[] = {0,0,0};
    size = 7;
    recoil = 3000;
    isWeapon = 1;
    weaponType = TYPE_AA;
};

class vn_static_f_vietnam_02_type56rr_vn_o_static_type56rr_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.55,0,1.48};
    rotation[] = {0,-1,0};
    size = 4;
    recoil = 250;
    weaponType = TYPE_AT;
    isLow = 1;
};
