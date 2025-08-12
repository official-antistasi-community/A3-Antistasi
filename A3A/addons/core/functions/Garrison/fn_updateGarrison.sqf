#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_type", "_marker"];

/*  Checks for updates and updates the garrison if needed. SHOULD BE CALLED AFTER EVERY DESPAWN
*   Params
*     _type : STRING : The type of the marker
*     _marker : STRING : The marker name
*
*   Returns:
*     Nothing
*/

private ["_preferred", "_side", "_garCount", "_preCount", "_line"];

_preferred = garrison getVariable (format ["%1_preference", _type]);
_garrison = garrison getVariable (format ["%1_garrison", _marker]);
_side = sidesX getVariable [_marker, sideUnknown];
private _faction = Faction(_side);

if(_side == sideUnknown) exitWith
{
    Error("Could not retrieve side!");
};

for "_i" from 0 to (_garCount - 1) do
{
  _garData = _garrison select _i;
  _preData = _preferred select _i;
  if !([_garData select 0, _preData select 0] call A3A_fnc_checkVehicleType) then
  {
    _garData set [0, [_preData select 0, _side] call A3A_fnc_selectVehicleType];
    if(_preData select 1 != 0) then
    {
      _crew = _faction get "unitCrew";
      _garData set [1, [_garData select 0, _crew] call A3A_fnc_getVehicleCrew];
    }
    else
    {
      _garData set [1, ["","",""]];
    };
    if !([_garData select 2, _garData select 0, _preData select 2] call A3A_checkGroupType) then
    {
      _garData set [2, [_garData select 0, _preData select 2, _side] call A3A_fnc_selectGroupType];
    };
  };
};

_garCount = count _garrison;
_preCount = count _preferred;

//Current garrison is bigger (not really possible) or equal preference, exit
if(_garCount >= _preCount) exitWith {};



//Adding new units to garrison
for "_i" from _garCount to (_preCount - 1) do
{
  _line = [_preferred select _i, _side] call A3A_fnc_createGarrisonLine;
  [_marker, _line, -1, true] call A3A_fnc_addRequested;
};
