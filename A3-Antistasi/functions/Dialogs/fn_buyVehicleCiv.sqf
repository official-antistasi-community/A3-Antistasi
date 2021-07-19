#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private ["_display","_childControl"];
_nul = createDialog "civ_vehicle";

//sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[FactionGet(reb,"vehicleCivCar")] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> FactionGet(reb,"vehicleCivCar") >> "displayName")];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[FactionGet(reb,"vehicleCivTruck")] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> FactionGet(reb,"vehicleCivTruck") >> "displayName")];
	_ChildControl = _display displayCtrl 106;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[FactionGet(reb,"vehicleCivHeli")] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> FactionGet(reb,"vehicleCivHeli") >> "displayName")];
	_ChildControl = _display displayCtrl 107;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[FactionGet(reb,"vehicleCivBoat")] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> FactionGet(reb,"vehicleCivBoat") >> "displayName")];
};
