/*
Author: Håkon
Description:
    Can spawn in any hostile cities in mission distance from the current rebel HQ location

Return Value:
<Bool> false if valid location couldn't be found
<Array<String>> an array containing a single marker from the citiesX array

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example:

License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _possibleMarkers = [airportsX] call FUNC(nearHostileMarkers);
private _marker = selectRandom _possibleMarkers;
if (isNil "_marker") exitWith {false};
[_marker];
