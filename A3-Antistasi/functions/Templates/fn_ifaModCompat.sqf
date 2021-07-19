////////////////////////////////////
//   IFA ITEMS MODIFICATIONS     ///
////////////////////////////////////
/*
allSmokeGrenades = ["LIB_RDG","LIB_NB39"];
allChemlights = [];
lootNVG = [];
lootAttachment = [];
lootBackpack = [];
lootHelmet = [];
lootVest = [];
allArmoredHeadgear = [];
{allArmoredHeadgear pushBackUnique (getUnitLoadout _x select 6)} forEach NATOSquad;//old template var, new template data in "faction" -> "groups" -> "squad"
*/
if (A3A_hasACE) then {
	lootItem append ["ACE_LIB_LadungPM","ACE_SpareBarrel"];
};

private _libStaticParts = [];
{
	if ((getText (configFile >> "CfgWeapons" >> _x >> "LIB_WeaponType")) isEqualTo "ROCKET") then {
		_libStaticParts pushBack _x;
	};
} forEach allRocketLaunchers;

{
lootWeapon deleteAt (lootWeapon find _x);
} forEach _libStaticParts;
