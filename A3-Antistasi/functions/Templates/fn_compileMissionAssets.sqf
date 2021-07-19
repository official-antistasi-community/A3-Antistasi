/*
Author: Håkon
Description:
    Generates a list off all assets used by the factions, replaces old global variables like vehAttack

Arguments: <Nil>

Return Value: <Hashmap> the hashmap A3A_faction_all

Scope: Server
Environment: unscheduled
Public: No
Dependencies:

Example:

License: MIT License
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

//group macros
private _groupsOcc = FactionGet(occ, "groups");
private _groupsInv = FactionGet(inv, "groups");
private _groupsReb = FactionGet(reb, "groups");
private _groupsCiv = FactionGet(civ, "groups");
#define GroupOcc(VAR) (_groupsOcc get VAR)
#define GroupInv(VAR) (_groupsInv get VAR)
#define GroupReb(VAR) (_groupsReb get VAR)
#define GroupCiv(VAR) (_groupsCiv get VAR)

#define OccAndInv(VAR) (FactionGetOrDefault(occ, VAR, []) + FactionGetOrDefault(inv, VAR, []))
#define Reb(VAR) FactionGetOrDefault(reb, VAR, [])

A3A_faction_all = createHashMap;
//setVar expects an array
#define setVar(VAR, VALUE) A3A_faction_all set [VAR, (VALUE) arrayIntersect (VALUE)];
#define getVar(VAR) (A3A_faction_all get VAR)

  //=====\\
 // Units \\
// ======= \\
Info("Identifying unit types");

//create empty lists
private _squadLeaders = [];
private _medics = [];

//add occ and inv units to the lists
{
    private _prefix = _x;
    {
        _squadLeaders pushBack ('loadouts_'+_prefix+_x+'SquadLeader');//type
        _medics pushBack ('loadouts_'+_prefix+_x+'Medic');
    } forEach ["militia_","military_","SF_"];//section
} forEach ["occ_", "inv_"];//prefix

//then rebel units
_squadLeaders pushBack 'loadouts_reb_militia_SquadLeader';
_medics pushBack 'loadouts_reb_militia_Medic';

//set the lists in the hm
setVar("SquadLeaders", _squadLeaders);
setVar("Medics", _medics);

  //========\\
 // Vehicles \\
// ========== \\
Info("Identifying vehicle types");

//Occ&Inv X vehicles
setVar("Police", OccAndInv("vehiclesPolice"));
setVar("vehiclesAttack", OccAndInv("vehiclesAttack") );
setVar("vehiclesPlanes", OccAndInv("vehiclesAir") + [Reb("vehiclePlane")] );
setVar("vehiclesAttackHelis", OccAndInv("vehiclesHelisAttack") );
setVar("vehiclesUAVs", OccAndInv("uavsAttack")+ OccAndInv("uavsPortable") );
setVar("vehiclesAmmoTrucks", OccAndInv("vehiclesAmmoTrucks") );
setVar("vehiclesAPCs", OccAndInv("vehiclesAPCs") );
setVar("vehiclesTanks", OccAndInv("vehiclesTanks"));
setVar("vehiclesAA", OccAndInv("vehiclesAA") );
setVar("vehiclesTransportAir", OccAndInv("vehiclesTransportHelis") + OccAndInv("vehiclesPlanesTransport") );
setVar("vehiclesArtillery", OccAndInv("vehiclesArtillery"));

//normal vehicles
private _vehNormal = //would be nice to have a reasoning for the "normal" veh list elements
OccAndInv("vehiclesNormal")
+ OccAndInv("vehiclesCargoTrucks")
+ OccAndInv("vehiclesMilitiaCars")
+ OccAndInv("vehiclesMilitiaTrucks")
+ OccAndInv("vehiclesMilitiaLightArmed")
+ OccAndInv("vehiclesPolice")
+ OccAndInv("vehiclesBasic")
+ [ //reb vehicles are not arrays (yet 😉)
    Reb("vehicleBasic")
    , Reb("vehicleTruck")
    , Reb("vehicleRepair")
    , Reb("vehicleLightArmed")
    , Reb("vehicleAT")
];
setVar("vehiclesNormal", _vehNormal);

//boats
private _vehBoats = OccAndInv("vehiclesTransportBoats") + OccAndInv("vehiclesGunBoats") + [Reb("vehicleBoat")];
setVar("vehiclesBoats", _vehBoats);

//Occ&Inv helicopters
private _vehHelis =
OccAndInv("vehiclesTransportHelis")
+ OccAndInv("vehiclesAttackHelis")
+ OccAndInv("vehiclesHelisLight");
setVar("vehiclesHelis", _vehHelis);

//fixed winged aircrafts
private _vehFixedWing =
OccAndInv("vehiclesPlanesCAS")
+ OccAndInv("vehiclesPlanesAA")
+ OccAndInv("vehiclesPlanesTransport")
+ [Reb("vehiclePlane")];
setVar("vehiclesFixedWing", _vehFixedWing);

//trucks to carry infantry
private _vehTrucks =
OccAndInv("vehiclesTrucks")
+ OccAndInv("vehiclesMilitiaTrucks")
+ [Reb("vehicleTruck")];
setVar("vehiclesTrucks", _vehTrucks);

//all Occ&Inv armor
private _vehArmor =
getVar("vehiclesTanks")
+ getVar("vehiclesAA")
+ getVar("vehiclesArtillery")
+ getVar("vehiclesAPCs");
setVar("vehiclesArmor", _vehArmor);

//vehicles that the AI have "unlimited" of
private _vehUnlimited =
OccAndInv("vehiclesNormal")
+ OccAndInv("vehiclesTransportBoats")
+ OccAndInv("vehiclesHelisLight")
+ OccAndInv("uavsAttack")
+ OccAndInv("uavsPortable")
+ OccAndInv("staticMGs")
+ OccAndInv("staticMortars");
setVar("vehiclesUnlimited", _vehUnlimited);

//rebel vehicles
private _vehReb = [
    Reb("vehicleBasic"), Reb("vehicleTruck"), Reb("vehicleRepair"), Reb("vehicleBoat")
    , Reb("vehicleAT"), Reb("vehicleLightArmed"), Reb("vehicleLightUnarmed")
    , Reb("staticMG"), Reb("staticAT"), Reb("staticAA"), Reb("staticMortar")
];
setVar("vehiclesReb", _vehReb);

//trucks that can cary logistics cargo
private _vehCargoTrucks = (_vehTrucks + OccAndInv("vehiclesCargoTrucks")) select { [_x] call A3A_fnc_logistics_getVehCapacity > 1 };
setVar("vehiclesCargoTrucks", _vehCargoTrucks);

missionNamespace setVariable ["A3A_faction_all", A3A_faction_all, true];
A3A_faction_all
