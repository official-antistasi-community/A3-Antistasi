// Extracted from fn_addFIAsquadHC

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_squadType",["_vehType",""]];

_costs = 0;
_costHR = 0;
if (_squadType isEqualType []) then {
	{ _costs = _costs + (server getVariable _x); _costHR = _costHR +1 } forEach _squadType;

	if (_squadType in (FactionGet(reb,"staticMGs"))) then {_costs = _costs + ([(FactionGet(reb,"staticMGs")) # 0] call A3A_fnc_vehiclePrice)};
	if (_squadType in (FactionGet(reb,"staticMortars"))) then {_costs = _costs + ([(FactionGet(reb,"staticMortars")) # 0] call A3A_fnc_vehiclePrice)};
	if !(_vehType isEqualTo "") then {_costs = _costs + ([_vehType] call A3A_fnc_vehiclePrice)};

} else {
	// Two-man vehicle crew, AT cars and AA trucks
    private _typeCrew = FactionGet(reb,"unitCrew");
	_costs = 2*(server getVariable _typeCrew) + ([_squadType] call A3A_fnc_vehiclePrice);
	if (_squadType in FactionGet(reb,"staticAA")) then { _costs = _costs + ([(FactionGet(reb,"vehiclesTruck")) # 0] call A3A_fnc_vehiclePrice) };
	_costHR = 2;

	//if ((_typeGroup in FactionGet(reb,"staticMortars")) or (_typeGroup in FactionGet(reb,"staticMGs"))) exitWith { _isInfantry = true };
};

[_costs,_costHR];
