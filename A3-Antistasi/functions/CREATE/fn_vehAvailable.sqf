#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private ["_typeX","_cant"];
_typeX = _this select 0;
if (_typeX == "") exitWith {false};
if (
    (_typeX in ( FactionGet(inv,"vehiclesHelisLight") + FactionGet(occ,"vehiclesHelisLight") + FactionGet(inv,"vehiclesTransportBoats") + FactionGet(occ,"vehiclesTransportBoats") ))
    or (_typeX in FactionGet(inv,"vehiclesTrucks"))
    or (_typeX in FactionGet(occ,"vehiclesTrucks"))
    or (_typeX in FactionGet(occ,"vehiclesCargoTrucks"))
) exitWith {true};
_cant = timer getVariable _typeX;
if (isNil "_cant") exitWith {true};
if (_cant <= 1) exitWith {false};
if ({typeOf _x == _typeX} count vehicles >= (floor _cant)) exitWith {false};
true
