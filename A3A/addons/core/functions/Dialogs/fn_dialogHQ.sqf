//TODO: add header

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_display","_childControl","_veh","_textX","_costs","_typeVehX"];

#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	_nul = createDialog "HQ_menu";
#endif

sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 109;
	_ChildControl  ctrlSetTooltip format [localize "STR_A3A_fn_dialogs_dialogHQ_upgrade",1000 + (1.5*((skillFIA) *750)),skillFIA];
};
