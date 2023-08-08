/*
Author: Håkon
Description:
    returns the ingame time X minutes from now

Arguments:
0. <Int> minutes

Return Value:
<string> formated time string "H:M"

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example:
    private _time = [20] call FUNC(minutesFromNow); //returns formated time 20 minutes from the call
License: MIT License
*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_minutesDiff", 0, [0]]];
if (_minutesDiff < 0) then {
    Error_1("Function does not support negative time: %1", _minutesDiff);
    _minutesDiff = 0;
};

// get current time
private _dayTime = daytime;
private _hours = floor _dayTime;
private _minutes = floor ((_dayTime - _hours) * 60);

// calculate time from now
_minutes = _minutes + _minutesDiff;
_hours = _hours + floor (_minutes/60);
_minutes = floor (_minutes % 60);

str _hours + ":" + str _minutes;
