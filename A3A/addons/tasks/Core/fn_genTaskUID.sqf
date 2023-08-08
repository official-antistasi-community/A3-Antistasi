#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {};

GVAR(taskUID) = GVAR(taskUID) + 1;
str GVAR(taskUID);
