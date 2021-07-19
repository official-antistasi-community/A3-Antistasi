#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_vehicle", "_preference"];

/*  Checks if the given vehicle type is within the preferred category
*   Params:
*     _vehicle : STRING : The vehicle type
*     _preference : STRING : The preferred category
*
*   Return:
*     _result : BOOLEAN : True if vehicle fits category, false otherwise
*/

//define list of vehicles as lazy conditions
#define lightVeh \
    {_vehicle in FactionGet(occ,"vehiclesLightArmed")} \
    || {_vehicle in FactionGet(inv,"vehiclesLightUnarmed")} \
    || {_vehicle in FactionGet(occ,"vehiclesLightArmed")} \
    || {_vehicle in FactionGet(inv,"vehiclesLightUnarmed")}

#define apc \
    {_vehicle in FactionGet(occ,"vehiclesAPCs")} \
    || {_vehicle in FactionGet(inv,"vehiclesAPCs")}

#define tank \
    {_vehicle in FactionGet(occ,"vehiclesTanks")} \
    || {_vehicle in FactionGet(inv,"vehiclesTanks")}

#define patrolHeli \
    {_vehicle in FactionGet(occ,"vehiclesHelisLight")} \
    || {_vehicle in FactionGet(inv,"vehiclesHelisLight")}

#define transportHeli \
    patrolHeli \
    || {_vehicle in FactionGet(occ,"vehiclesHelisTransport")} \
    || {_vehicle in FactionGet(inv,"vehiclesHelisTransport")}

#define attackHeli \
    {_vehicle in FactionGet(occ,"vehiclesHelisAttack")} \
    || {_vehicle in FactionGet(inv,"vehiclesHelisAttack")}

#define drone \
    {_vehicle in FactionGet(occ,"uavsAttack")} \
    || {_vehicle in FactionGet(inv,"uavsAttack")} \
    || {_vehicle in FactionGet(occ,"uavsPortable")} \
    || {_vehicle in FactionGet(inv,"uavsPortable")}

#define plane \
    {_vehicle in FactionGet(occ,"vehiclesPlanesCAS")} \
    || {_vehicle in FactionGet(inv,"vehiclesPlanesCAS")} \
    || {_vehicle in FactionGet(occ,"vehiclesPlanesAA")} \
    || {_vehicle in FactionGet(inv,"vehiclesPlanesAA")}

//TODO this does not work properly (maybe even throws errors) as the template files arent
//unified on how they work, await Pots Templates, then fix this
switch (_preference) do
{
    case ("EMPTY"):
    {
      _vehicle == "";
    };
    case ("LAND_START"):
    {
        _vehicle == "" || lightVeh;
    };
    case ("LAND_LIGHT"):
    {
      false || lightVeh;
    };
    case ("LAND_DEFAULT"):
    {
      false || lightVeh || apc;
    };
    case ("LAND_APC"):
    {
      false || apc;
    };
    case ("LAND_ATTACK"):
    {

      false || apc || tank;
    };
    case ("LAND_TANK"):
    {
      false || tank;
    };
    case ("LAND_AIR"):
    {
      _vehicle in FactionGet(occ,"vehiclesAA") || {_vehicle in FactionGet(inv,"vehiclesAA")};
    };
    case ("HELI_PATROL"):
    {
      _vehicle == "" || patrolHeli;
    };
    case ("HELI_LIGHT"):
    {
      false || patrolHeli;
    };
    case ("HELI_TRANSPORT"):
    {
        false || transportHeli;
    };
    case ("HELI_DEFAULT"):
    {
        false || transportHeli || attackHeli;
    };
    case ("HELI_ATTACK"):
    {
      false || attackHeli;
    };
    case ("AIR_DRONE"):
    {
      _vehicle == "" || drone
    };
    case ("AIR_GENERIC"):
    {
      false || drone || plane;
    };
    case ("AIR_DEFAULT"):
    {
      false || plane;
    };
};
