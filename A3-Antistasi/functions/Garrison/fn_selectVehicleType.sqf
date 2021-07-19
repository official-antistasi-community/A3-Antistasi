params ["_preference", "_side"];

/*  Selects a fitting vehicle type based on given preference and side
*   Params:
*     _preference : STRING : The preferred vehicle type
*     _side : SIDE : The side of the vehicle
*
*   Returns:
*     _result : STRING : The className of the selected vehicle (also empty string or "Empty")
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _faction = Faction(_side);

Verbose_2("SelectVehicleType: Selecting vehicle now, preferred is %1, side is %2", _preference, _side);

if(_preference == "LAND_AIR") exitWith { selectRandom (_faction get "vehiclesAA") };
if(_preference == "LAND_TANK") exitWith { selectRandom (_faction get "vehiclesTanks") };

private _possibleVehicles = [];
if(_preference in ["EMPTY", "LAND_START", "HELI_PATROL", "AIR_DRONE"]) then {
    _possibleVehicles pushBack "";
};

if(_preference in ["LAND_START", "LAND_LIGHT", "LAND_DEFAULT"]) then {
    _possibleVehicles append (_faction get "vehiclesLightArmed");
    _possibleVehicles append (_faction get "vehiclesLightUnarmed");
};

if(_preference in ["LAND_DEFAULT", "LAND_APC", "LAND_ATTACK"]) then {
    _possibleVehicles append (_faction get "vehiclesAPCs");
};

if(_preference in ["LAND_ATTACK"]) then {
    _possibleVehicles append (_faction get "vehiclesTanks");
};

if(_preference in ["HELI_PATROL", "HELI_LIGHT"]) then {
    _possibleVehicles append (_faction get "vehiclesHelisLight");
};

if(_preference in ["HELI_TRANSPORT", "HELI_DEFAULT"]) then {
    _possibleVehicles append (_faction get "vehiclesHelisLight");
    _possibleVehicles append (_faction get "vehiclesHelisTransport");
};

if(_preference in ["HELI_DEFAULT", "HELI_ATTACK"]) then {
    _possibleVehicles append (_faction get "vehiclesHelisAttack");
};

if(_preference in ["AIR_DRONE", "AIR_GENERIC"]) then {
    _possibleVehicles append (_faction get "uavsAttack");
    _possibleVehicles append (_faction get "uavsPortable");
};
if(_preference in ["AIR_GENERIC", "AIR_DEFAULT"]) then {
    _possibleVehicles append (_faction get "vehiclesPlanesCAS");
    _possibleVehicles append (_faction get "vehiclesPlanesAA");
};

if(count _possibleVehicles == 0) exitWith
{
    Error_1("No result for %1, assuming bad parameter!", _preference);
    "Empty";
};

Verbose_1("SelectVehicleType: Preselection done, possible vehicles are %1", str _possibleVehicles);

selectRandom _possibleVehicles;
