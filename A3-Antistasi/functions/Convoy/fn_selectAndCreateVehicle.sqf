#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_vehPool", "_side", ["_isAir", false]];

/*  Selects a vehicle from the given pool, if available, selects basic vehicle else
*   Params:
*     _vehPool: ARRAY of STRINGS; the current vehicle pool
*     _side: SIDE; the side for which the vehicle should be choosen
*     _isAir: BOOLEAN; Optional, selects if vehicle pool consists of air vehicles, default false
*   Returns:
*     ARRAY of mixed types:
*       - ARRAY of STRINGS:
*         - choosen vehicle: STRING
*         - choosen cargo group: STRING
*       - ARRAY of STRINGS: the new vehicle pool
*/

private _faction = Faction(_side);
private _groupData = FactionGetGroups(_side);

if(isNil "_side") exitWith
{
    Error("No side given!");
  [objNull, objNull];
};
if(isNil "_vehPool" || {!(_vehPool isEqualType []) || {count _vehPool == 0}}) exitWith
{
    Error("_vehpool is not a correct variable or empty!");
  [objNull, objNull];
};
private ["_selectedVehicle"];
_selectedVehicle = selectRandom _vehPool;

_crewUnits = _groupData get "crew";

while{!([_selectedVehicle] call A3A_fnc_vehAvailable)} do
{
  _vehPool = _vehPool - [_selectedVehicle];
  if (count _vehPool == 0) then
  {
    switch (true) do
    {
      case (!_isAir):
      {
        _vehPool = _faction get "vehiclesTrucks";
      };
      default
      {
        _vehPool = (_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport");
      };

    };
  };
  _selectedVehicle = selectRandom _vehPool;
};
_crew = [_selectedVehicle, _crewUnits] call A3A_fnc_getVehicleCrew;

_typeGroup = [];
if (!_isEasy) then
{
  if (!(_selectedVehicle in FactionGet(all,"vehiclesTanks"))) then
  {
    _typeGroup = [_selectedVehicle,_side] call A3A_fnc_cargoSeats;
  };
}
else
{
  if (not(_selectedVehicle == (_faction get "vehiclesMilitiaLightArmed"))) then
  {
    _typeGroup = selectRandom (_groupData get "militia_Squads");
    if (_selectedVehicle == (_faction get "vehiclesMilitiaCars")) then
    {
      _typeGroup = selectRandom (_groupData get "medium");
    };
  };
};

[[_selectedVehicle, _crew, _typeGroup], _vehPool];
