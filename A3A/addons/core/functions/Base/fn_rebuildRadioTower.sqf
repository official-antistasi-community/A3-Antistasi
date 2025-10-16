// Repairs a radio tower.
// Parameter should be the original antenna object

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_antenna"];

if !(_antenna in A3A_antennas) exitWith { Error("Attempted to rebuild invalid radio tower") };

// Attempt to find matching ruin
/*private _ruin = nearestObjects [_antenna, ["Ruins"], 10, true];
if (isNull _ruin) then {
	Error_1("No ruin found for antenna at %1", getPosATL _antenna);
};
if (_ruin getVariable ["building", objNull] != _antenna) then {
	Error_1("Mismatched ruin found for antenna at %1", getPosATL _antenna);
	_ruin = objNull;
};
*/
Info_1("Repairing Antenna %1", _antenna);

//deleteVehicle _ruin;			// Arma does this itself for engine ruins - TODO: Check that this is true for mission objects
_antenna setDamage 0;

private _mrk = [A3A_mrkAntennas, _antenna] call BIS_fnc_nearestPosition;
_mrk setMarkerAlpha 1;
