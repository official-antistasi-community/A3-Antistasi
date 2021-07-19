if (A3A_faction_reb get "addDiveGear") then {
	diveGear append ["U_I_Wetsuit","V_RebreatherIA","G_Diving"];
};

if (A3A_faction_reb get "addFlightGear") then {
	flyGear pushBack "U_I_pilotCoveralls"
};
//Lights Vs Laser ID
{
if (isClass(configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "FlashLight" >> "Attenuation")) then
     {
     allLightAttachments pushBack _x;
     }
     else
     {
     allLaserAttachments pushBack _x;
     };
} forEach allPointerAttachments;

//Signal Mags ID
{
if (getText(configfile >> "CfgMagazines" >> _x >> "nameSound") isEqualTo "Chemlight") then
     {
     allChemlights pushback _x;
     };
if (getText(configfile >> "CfgMagazines" >> _x >> "nameSound") isEqualTo "smokeshell") then
     {
     allSmokeGrenades pushback _x;
     };
if (getText(configfile >> "CfgMagazines" >> _x >> "nameSound") isEqualTo "") then
     {
     allLaunchedSmokeGrenades pushback _x;
     };
} forEach allMagSmokeShell;

//Flares ID
//PBP - NOT WORKING
private _uglMag = getArray (configfile >> "CfgMagazineWells" >> "UGL_40x36" >> "BI_Magazines");
_uglMag append (getArray(configfile >> "CfgMagazineWells" >> "3UGL_40x36" >> "BI_Magazines"));
{
if (_x in _uglMag) then
     {
     allLaunchedFlares pushBack _x;
     }
     else
     {
     allHandFlares pushBack _x;
     };
} forEach allMagFlare;

//IR Grenades
{
if (getText (configfile >> "CfgMagazines" >> _x >> "displayNameShort") isEqualTo "IR Grenade") then
     {
     allIRGrenades pushBack _x;
     };
} forEach allUnknown;
//Clean allUnknown of IR Grenades
{
allUnknown deleteAt (allUnknown find _x);
} forEach allIRGrenades;

//LaserDesignator Batteries
{
if (getText (configfile >> "CfgMagazines" >> _x >> "displayName") isEqualTo "Designator Batteries") then
     {
     allLaserBatteries pushBack _x;
     };
} forEach allUnknown;
//Clean allUnknown of batteries
{
allUnknown deleteAt (allUnknown find _x);
} forEach allLaserBatteries;
