// min & max in seconds. Scaled to 100 pop, decreased for larger cities

params ["_marker", ["_min", 900], ["_max", 1800], ["_popScale", true]];

private _pop = (A3A_cityData getVariable _marker) # 0;
private _delay = _min + random (_max - _min);			// given delay for pop 100 city
if (_popScale) then { _delay = _delay * 10 / sqrt _pop };

A3A_cityTaskTimer set [_marker, time + _delay];
