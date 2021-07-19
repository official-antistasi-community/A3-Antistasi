params ["_data", "_side"];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _groupData = FactionGetGroups(_side);
/*  Creates a single line of a garrison from given preference data
*   Params:
*     _data : ARRAY : Single element from the preference array
*     _side : SIDE : The side, the garrison belongs too
*
*   Returns:
*     _line : ARRAY : A line in garrison format
*/

private ["_vehicleType", "_vehicle", "_crew", "_crewMember", "_cargoGroup", "_line"];

_vehicleType = _data select 0;
_vehicle = [_vehicleType, _side] call A3A_fnc_selectVehicleType;
_crew = [];
if((_data select 1) != 0) then
{
  _crewMember = _groupData get "crew";
  _crew = [_vehicle, _crewMember] call A3A_fnc_getVehicleCrew;
};
_cargoGroup = [_vehicle, _data select 2, _side] call A3A_fnc_selectGroupType;

[_vehicle, _crew, _cargoGroup];
