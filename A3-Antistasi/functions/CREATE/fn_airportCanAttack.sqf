private _markerX = _this select 0;
if ((spawner getVariable _markerX) != 2) exitWith {false};
if (!(_markerX in airportsX) and !(_markerX in outposts)) exitWith {false};
if !(dateToNumber date > server getVariable [_markerX,0]) exitWith {false};
private _isQRF = _this select 1;
if (_isQRF and (count (garrison getVariable [_markerX,[]]) <= 8)) exitWith {false};
if (!_isQRF and (count (garrison getVariable [_markerX,[]]) < 16)) exitWith {false};
if (_markerX in forcedSpawn) exitWith {false};
true
