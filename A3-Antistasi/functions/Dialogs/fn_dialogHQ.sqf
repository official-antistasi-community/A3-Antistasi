private ["_display","_childControl","_veh","_textX","_costs","_typeVehX"];
_nul = createDialog "HQ_menu";

sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 109;
	_ChildControl  ctrlSetTooltip format ["Current level: %2. Next Level Training Cost: %1 €",1000 + (1.5*((skillFIA) *750)),skillFIA];
};
