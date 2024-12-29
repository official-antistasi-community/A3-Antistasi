//Crates/Boxes
class WW2_SPE_Assets_m_Weapons_AmmoBoxes_m_SPE_GER_Crate_2_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.04,0.04,0};
    rotation[] = {0,1,0};
    size = 1;
};
class WW2_SPE_Assets_m_Weapons_AmmoBoxes_m_SPE_US_Crate_Ammo_Ball_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.04,0.04,0};
    rotation[] = {0,1,0};
    size = 1;
};
class WW2_SPE_Structures_Military_Supplies_SPE_Ammobox_German_04_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0.7,-0.01};
    rotation[] = {0,0,0};
    size = 2;
    recoil = 0;
};
class WW2_SPE_Structures_Military_Supplies_SPE_US_Crate_Explosives_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0.7,0.21};
    rotation[] = {0,0,0};
    size = 2;
    recoil = 0;
};
//Weapons
//MGs
class WW2_SPE_Assets_m_Vehicles_StaticWeapons_m_SPE_MG42_Lafette_High_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.12,-0.5,1.45};
    rotation[] = {0,1,0}; //You can turn those ingame
    size = 2;
    recoil = 150;
	isWeapon = 1;
    weaponType = TYPE_MG;
};
class WW2_SPE_Assets_m_Vehicles_StaticWeapons_m_SPE_MG34_Lafette_High_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.12,-0.5,1.45};
    rotation[] = {0,1,0}; //You can turn those ingame
    size = 2;
    recoil = 150;
	isWeapon = 1;
    weaponType = TYPE_MG;
};
//AA
//Flak 30/38 same Model
class WW2_SPE_Assets_m_Vehicles_StaticWeapons_m_SPE_Flak_38_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.09,0.3,1.38};
    rotation[] = {0,1,0};
    size = 4;
    recoil = 1500;
	isWeapon = 1;
    weaponType = TYPE_AA;
};
class WW2_SPE_Assets_m_Vehicles_StaticWeapons_m_SPE_M45_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.45,0.2,1.73};
    rotation[] = {0,1,0};
    size = 4;
    recoil = 250;
	isWeapon = 1;
    weaponType = TYPE_AA;
};
//Mortars
class WW2_SPE_Assets_m_Weapons_Mortars_m_SPE_M1_Mortar_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.2,-0,0.72};
    rotation[] = {0,1,0};
    size = 2;
    recoil = 2000;
	isWeapon = 1;
    weaponType = TYPE_MORTAR;
    disallowOnBoat = 1;
};
class WW2_SPE_Assets_m_Weapons_Mortars_m_SPE_Brandt_81mm_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.2,-0,0.72};
    rotation[] = {0,1,0};
    size = 2;
    recoil = 2000;
	isWeapon = 1;
    weaponType = TYPE_MORTAR;
    disallowOnBoat = 1;
};
// Fuel Barrels
class WW2_SPE_Structures_Military_Supplies_SPE_Fuel_Barrel_US_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0.7,0.52};
    rotation[] = {0,0,0};
    size = 2;
    recoil = 0;
};
class WW2_SPE_Structures_Military_Supplies_SPE_Fuel_Barrel_German_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0.7,0.52};
    rotation[] = {0,0,0};
    size = 2;
    recoil = 0;
};