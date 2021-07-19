#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private ["_display","_childControl","_costs","_costHR","_unitsX","_formatX"];
if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {["Squad Recruit", "You need a radio in your inventory to be able to give orders to other squads"] call A3A_fnc_customHint;} else {["Squad Recruit", "You need a Radio Man in your group to be able to give orders to other squads"] call A3A_fnc_customHint;}};
_nul = createDialog "squad_recruit";

sleep 1;
disableSerialization;

_display = findDisplay 100;
private _groupData = FactionGet(reb,"groups");

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 104;
	_costs = 0;
	_costHR = 0;

	_ChildControl = _display displayCtrl 105;
	_costs = 0;
	_costHR = 0;
	{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach (_groupData get "medium");
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 106;
	_costs = 0;
	_costHR = 0;
	{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach (_groupData get "AT");
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 107;
	_costs = 0;
	_costHR = 0;
	{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach (_groupData get "groupsSnipers");
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 108;
	_costs = (2*(server getVariable (_groupData get "staticCrew")));
	_costHR = 2;
	_costs = _costs + ([FactionGet(reb, "staticMG")] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];


	_ChildControl = _display displayCtrl 109;
	_costs = (2*(server getVariable (_groupData get "staticCrew")));
	_costHR = 2;
	_costs = _costs + ([FactionGet(reb,"vehicleAT")] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 110;
	_costs = (2*(server getVariable (_groupData get "staticCrew")));
	_costHR = 2;
	_costs = _costs + ([FactionGet(reb,"vehicleTruck")] call A3A_fnc_vehiclePrice) + ([FactionGet(reb,"staticAA")] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 111;
	_costs = (2*(server getVariable (_groupData get "staticCrew")));
	_costHR = 2;
	_costs = _costs + ([FactionGet(reb,"staticMortar")] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];
};
