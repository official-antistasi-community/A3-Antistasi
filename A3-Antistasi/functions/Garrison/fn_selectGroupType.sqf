#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_vehicle", "_preference", "_side"];

/*  Selects a suitable group for the given vehicle and preference
*   Params:
*     _vehicle : STRING : The vehicle typename
*     _preference : STRING : The preferred group
*     _side : SIDE : The side of the selected group
*
*   Returns:
*     _group : ARRAY of STRINGS : The selected group
*/
private _groupData = FactionGetGroups(_side);
#define OccAndInv(VAR) (FactionGet(occ, VAR) + FactionGet(inv, VAR))

//If preference is empty, return empty
if(_preference == "Empty") exitWith {[]};

//If tank, select AT team
if(_vehicle in OccAndInv("vehiclesTanks")) exitWith {_groupData getOrDefault ["AT", []]};

//If AA-tank, select AA team
if(_vehicle in OccAndInv("vehiclesAA")) exitWith {_groupData getOrDefault ["AA", []]};

_result = "";
//If no vehicle return preference
if(_vehicle == "") then
{
  _result = _preference
}
else
{
  //Check vehicle seats
  _vehicleSeats = ([_vehicle, true] call BIS_fnc_crewCount) - ([_vehicle, false] call BIS_fnc_crewCount);
  if(_vehicleSeats >= 8) then
  {
    _result = _preference;
  }
  else
  {
    if(_vehicleSeats >= 4) then
    {
      _result = "GROUP";
    }
    else
    {
      _result = _preference;
      if(debug) then
      {
          Debug_1("Vehicle %1 cannot transport four or more people, reconsider using another vehicle or make smaller groups possible!", _vehicle);
          Debug("Assuming preference as a solution, may be changed in the future!");
      };
    };
  };
};

if(_result != "EMPTY") exitWith
{
    if(_result == "SQUAD") then {selectRandom (_groupData getOrDefault ["squads", []])} else {selectRandom (_groupData getOrDefault ["medium", []])};
};

[];
