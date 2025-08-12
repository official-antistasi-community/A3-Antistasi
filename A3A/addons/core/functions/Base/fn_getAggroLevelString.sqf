params ["_level"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (_level in [1, 2, 3, 4, 5]) exitWith {localize ("STR_A3A_fn_getAggroLevelString_" + str(_level))};
Error_1("Bad level recieved, cannot generate string, was %1", _level);
"None"
