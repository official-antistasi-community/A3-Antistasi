// This function is now unscheduled only
// If <0 is provided, it reduces the accumHR value instead

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith {Error("Server-only function miscalled")};

Trace_1("Params: %1", _this);

params [["_change",""], ["_pos",""], ["_scaled", true]]; // nil protection
if !(_change isEqualType 0) exitWith {Error("The first parameter, the support change, must be a number");};
if !(_city isEqualType "") exitWith {Error("The second parameter, the position, must be a string (city name) or array (coordinates)");};

private _city = if (_pos isEqualType "") then {_pos} else {[citiesX, _pos] call BIS_fnc_nearestPosition};
if (A3A_cityData isNil _city) exitWith {Error_1("City %1 not found in city data", _city);};

private _cityData = A3A_cityData getVariable _city;
_cityData params ["_numCiv", "_supportReb", "_accumHR", "_taskDelay"];		// add task delay? Could save it then...

if (_scaled) then {
	_change = 10 * _change / sqrt _numCiv;			// normalized to 1 = 1% at size 100
};

if (_change > 0) then {
	private _antenna = A3A_antennaMap get _city;
	if (!alive _antenna) then { _change = _change * 1.5 } else {
		private _antSide = sidesX getVariable (A3A_antennaMap get netId _antenna);
		_change = _change * ([1, 2] select (_antSide == teamPlayer));
	};
	private _stationPos = A3A_garrison get _site getOrDefault ["policeStation", false];
	if (_stationPos isEqualTo []) then { _change = _change * 1.5 };
};

Trace_2("City %1 change %2", _city, _change);

// Cap rebel support to 0-100. Changes below 0 reduce accumHR
_supportReb = (_supportReb + _change) min 100;
if (_supportReb < 0) then {
	_accumHR = _accumHR + (_supportReb / 5);			// 1 HR per 5 pop at size 100
	_supportReb = 0;
};

A3A_cityData setVariable [_city, [_numCiv, _supportReb, _accumHR, _taskDelay]];

// Flip logic...
private _citySide = sidesX getVariable _city;
if (_supportReb > 80 and _citySide != teamPlayer) then
{
	// Run cityBattle task if it's a significant town
	if (_city in A3A_activeCityBattles) exitWith {};			// might be possible?
	if (_numCiv >= 70) exitWith {
		A3A_activeCityBattles set [_city, true];
		[A3A_tasks_fnc_cityBattle, [_city]] spawn A3A_tasks_fnc_runTask;
	};
	[_city, true] call A3A_fnc_citySideChange;			// just autoflip for small stuff
};
if (_supportReb < 40 and _citySide == teamPlayer) then {
	[_city, false] call A3A_fnc_citySideChange;
};

true;
