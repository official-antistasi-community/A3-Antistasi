#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {Error("Server-only function miscalled")};

waitUntil {!cityIsSupportChanging};
cityIsSupportChanging = true;

params [["_changeGov",""], ["_changeReb",""], ["_pos","",["",[]]], ["_scaled", true], ["_isRadio", false]]; // nil protection
if !(_changeGov isEqualType 0) exitWith {Error("The first parameter, the government support, must be a number");};
if !(_changeReb isEqualType 0) exitWith {Error("The second parameter, the rebel support, must be a number");};
if (_pos isEqualTo "") exitWith {Error("The third parameter, the position, must be a string (city name) or array (coordinates)");};

private _city = if (_pos isEqualType "") then {_pos} else {[citiesX, _pos] call BIS_fnc_nearestPosition};
private _cityData = server getVariable _city;
if (isNil "_cityData" || {!(_cityData isEqualType [])}) exitWith
{
	cityIsSupportChanging = false;
    Error_1("No data found for city %1", _city);
};
_cityData params ["_numCiv", "_numVeh", "_supportGov", "_supportReb"];

// Radio propaganda can't increase support above 30% or decrease below 50%
if (_isRadio) then {
	if (_changeGov > 0) then { _changeGov = (30 - _supportGov) max 0 min _changeGov };
	if (_changeGov < 0) then { _changeGov = (50 - _supportGov) min 0 max _changeGov };

	if (_changeReb > 0) then { _changeReb = (30 - _supportReb) max 0 min _changeReb };
	if (_changeReb < 0) then { _changeReb = (50 - _supportReb) min 0 max _changeReb };
}
else {
	// Most non-radio changes are scaled inversely by city population, so less effect on large towns
	if (_scaled) then {
		private _popScale = 200 / (_numCiv max 50);
		_changeGov = _changeGov * _popScale;
		_changeReb = _changeReb * _popScale;
	};
};

// Cap total to 100 and minimums to 0
_supportGov = 0 max (_supportGov + _changeGov);
_supportReb = 0 max (_supportReb + _changeReb);

private _supportTotal = _supportGov + _supportReb;
if (_supportTotal > 100) then {
	_supportGov = _supportGov * (100 / _supportTotal);
	_supportReb = _supportReb * (100 / _supportTotal);
};

_cityData = [_numCiv, _numVeh, _supportGov, _supportReb];

server setVariable [_city,_cityData,true];
cityIsSupportChanging = false;
true
