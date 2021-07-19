#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
if (_this in FactionGet(all,"vehiclesUnlimited")) exitWith {};

private _number = timer getVariable _this;

if (isNil "_number") then {
	timer setVariable [_this, 0, true];
} else {
	if (!(_number isEqualType 0)) then { _number = 1; };
	timer setVariable [_this, _number - 1, true];
};
