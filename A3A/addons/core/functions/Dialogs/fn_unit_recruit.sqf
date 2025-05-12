#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_display","_childControl"];
#ifdef UseDoomGUI
    ERROR("Disabled due to UseDoomGUI Switch.")
#else
	_nul = createDialog "unit_recruit";
#endif

sleep 1;
disableSerialization;

_display = findDisplay 100;
_unitCost = localize "STR_A3A_fn_dialogs_unit_recruit";

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format [_unitCost,server getVariable FactionGet(reb,"unitRifle")];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip format [_unitCost,server getVariable FactionGet(reb,"unitMG")];
	_ChildControl = _display displayCtrl 126;
	_ChildControl  ctrlSetTooltip format [_unitCost,server getVariable FactionGet(reb,"unitMedic")];
	_ChildControl = _display displayCtrl 107;
	_ChildControl  ctrlSetTooltip format [_unitCost,server getVariable FactionGet(reb,"unitEng")];
	_ChildControl = _display displayCtrl 108;
	_ChildControl  ctrlSetTooltip format [_unitCost,server getVariable FactionGet(reb,"unitExp")];
	_ChildControl = _display displayCtrl 109;
	_ChildControl  ctrlSetTooltip format [_unitCost,server getVariable FactionGet(reb,"unitGL")];
	if (A3A_hasIFA) then {_childControl ctrlSetText localize "STR_A3A_fn_dialogs_unit_recruit_radioOP"};
	_ChildControl = _display displayCtrl 110;
	_ChildControl  ctrlSetTooltip format [_unitCost,server getVariable FactionGet(reb,"unitSniper")];
	_ChildControl = _display displayCtrl 111;
	_ChildControl  ctrlSetTooltip format [_unitCost,server getVariable FactionGet(reb,"unitLAT")];
	_ChildControl = _display displayCtrl 112;
	_ChildControl  ctrlSetTooltip format [_unitCost,server getVariable FactionGet(reb,"unitAT")];
	_ChildControl = _display displayCtrl 113;
	_ChildControl  ctrlSetTooltip format [_unitCost,server getVariable FactionGet(reb,"unitAA")];
};
