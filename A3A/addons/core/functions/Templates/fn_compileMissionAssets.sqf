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
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

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
setVar("vehiclesPolice", OccAndInv("vehiclesPolice"));
setVar("vehiclesUAVs", OccAndInv("uavsAttack")+ OccAndInv("uavsPortable") );
setVar("vehiclesAmmoTrucks", OccAndInv("vehiclesAmmoTrucks") );
setVar("vehiclesLightAPCs", OccAndInv("vehiclesLightAPCs"));
setVar("vehiclesAPCs", OccAndInv("vehiclesAPCs") );
setVar("vehiclesIFVs", OccAndInv("vehiclesIFVs") );
setVar("vehiclesLightTanks", OccAndInv("vehiclesLightTanks"));
setVar("vehiclesTanks", OccAndInv("vehiclesTanks"));
setVar("vehiclesHeavyTanks", OccAndInv("vehiclesHeavyTanks"));
setVar("vehiclesAA", OccAndInv("vehiclesAA"));
setVar("vehiclesArtillery", OccAndInv("vehiclesArtillery"));
setVar("vehiclesTransportAir", OccAndInv("vehiclesHelisLight") + OccAndInv("vehiclesHelisTransport") + OccAndInv("vehiclesPlanesTransport") );
setVar("vehiclesHelisLight", OccAndInv("vehiclesHelisLight"));
setVar("vehiclesHelisLightAttack", OccAndInv("vehiclesHelisLightAttack"));
setVar("vehiclesHelisAttack", OccAndInv("vehiclesHelisAttack"));
setVar("vehiclesHelisTransport", OccAndInv("vehiclesHelisTransport"));
setVar("vehiclesPlanesAA", OccAndInv("vehiclesPlanesAA"));
setVar("vehiclesPlanesCAS", OccAndInv("vehiclesPlanesCAS"));
setVar("vehiclesPlanesTransport", OccAndInv("vehiclesPlanesTransport"));
setVar("vehiclesAirPatrol", OccAndInv("vehiclesAirPatrol"));
setVar("vehiclesTransportBoats",OccAndInv("vehiclesTransportBoats"));
setVar("vehiclesGunBoats",OccAndInv("vehiclesGunBoats"));
setVar("staticMortars", OccAndInv("staticMortars") + Reb("staticMortars"));
setVar("staticAA", OccAndInv("staticAA") + Reb("staticAA"));
setVar("staticAT", OccAndInv("staticAT") + Reb("staticAT"));
setVar("staticMGs", OccAndInv("staticMGs") + Reb("staticMGs"));

private _vehMilitia = OccAndInv("vehiclesMilitiaCars")
+ OccAndInv("vehiclesMilitiaTrucks")
+ OccAndInv("vehiclesMilitiaLightArmed");
setVar("vehiclesMilitia", _vehMilitia);

//boats
private _vehBoats = OccAndInv("vehiclesTransportBoats") + OccAndInv("vehiclesGunBoats") + Reb("vehiclesBoat");
setVar("vehiclesBoats", _vehBoats);

//Occ&Inv helicopters
private _vehHelis =
OccAndInv("vehiclesHelisTransport")
+ OccAndInv("vehiclesHelisLightAttack")
+ OccAndInv("vehiclesHelisAttack")
+ OccAndInv("vehiclesHelisLight");
setVar("vehiclesHelis", _vehHelis);

//fixed winged aircrafts
private _vehFixedWing =
OccAndInv("vehiclesPlanesCAS")
+ OccAndInv("vehiclesPlanesAA")
+ OccAndInv("vehiclesPlanesTransport")
+ Reb("vehiclesPlane")
+ Reb("vehiclesCivPlane");
setVar("vehiclesFixedWing", _vehFixedWing);

//trucks to carry infantry
private _vehTrucks =
OccAndInv("vehiclesTrucks")
+ OccAndInv("vehiclesMilitiaTrucks")
+ Reb("vehiclesTruck");
setVar("vehiclesTrucks", _vehTrucks);

//Armed cars
private _carsArmed =
OccAndInv("vehiclesLightArmed")
+ OccAndInv("vehiclesMilitiaLightArmed")
+ Reb("vehiclesLightArmed");
setVar("vehiclesLightArmed", _carsArmed);

//Unarmed cars
private _carsUnarmed =
OccAndInv("vehiclesLightUnarmed")      // anything else?
+ OccAndInv("vehiclesMilitiaCars")
+ OccAndInv("vehiclesPolice")
+ Reb("vehiclesLightUnarmed");
setVar("vehiclesLightUnarmed", _carsUnarmed);
setVar("vehiclesLight", _carsArmed + _carsUnarmed);

//all Occ&Inv armor
private _vehArmor =
getVar("vehiclesTanks")
+ getVar("vehiclesLightTanks")
+ getVar("vehiclesHeavyTanks")
+ getVar("vehiclesAA")
+ getVar("vehiclesArtillery")
+ getVar("vehiclesLightAPCs")
+ getVar("vehiclesAPCs")
+ getVar("vehiclesIFVs");
setVar("vehiclesArmor", _vehArmor);

//rebel vehicles
private _vehReb = 
    Reb("vehiclesBasic") + Reb("vehiclesTruck") + Reb("vehiclesBoat")
    + Reb("vehiclesAT") + Reb("vehiclesLightArmed") + Reb("vehiclesLightUnarmed")
    + Reb("staticMGs") + Reb("staticAT") + Reb("staticAA") + Reb("staticMortars")
    + Reb("vehiclesHelis") + Reb("vehiclesPlane") + Reb("vehiclesMedical") + Reb("vehiclesAA");
setVar("vehiclesReb", _vehReb);

//trucks that can cary logistics cargo
private _vehCargoTrucks = (_vehTrucks + OccAndInv("vehiclesCargoTrucks")) select { [_x] call A3A_Logistics_fnc_getVehCapacity > 1 };
setVar("vehiclesCargoTrucks", _vehCargoTrucks);

missionNamespace setVariable ["A3A_faction_all", A3A_faction_all, true];
A3A_faction_all
