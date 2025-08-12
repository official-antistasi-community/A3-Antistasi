#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_marker"];

/*  Returns the current state of a garrison as a string
*   Params:
*     _marker: STRING: The name of the marker
*
*   Returns:
*     _result: STRING: One of Good, Weakened and Decimated, depending on the state of the garrison
*/

if(isNil "_marker") exitWith {Error("No marker given!")};

private ["_ratio", "_result"];

_ratio = ["_marker"] call A3A_fnc_getGarrisonRatio;

_result = localize "STR_A3A_fn_garrison_getGarrisonStatus_decimated";
if(_ratio > 0.9) then
{
  _result = localize "STR_A3A_fn_garrison_getGarrisonStatus_good"
}
else
{
  if(_ratio > 0.4) then
  {
    _result = localize "STR_A3A_fn_garrison_getGarrisonStatus_weakened"
  };
};

_result;
