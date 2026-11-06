#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _titleStr = localize "STR_A3A_fn_reinf_FIASkAdd_title";

if (player != theBoss) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_FIASkAdd_no_commander"] call A3A_fnc_customHint;};

if (skillFIA >= 20) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_FIASkAdd_training_max"] call A3A_fnc_customHint;};
if (skillFIA >= (tierWar*2)) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_FIASkAdd_no_wl"] call A3A_fnc_customHint;};
_resourcesFIA = server getVariable "resourcesFIA";
_costs = 1000 + (1.5*(skillFIA *750));
if (_resourcesFIA < _costs) exitWith {[_titleStr, format [localize "STR_A3A_fn_reinf_FIASkAdd_no_money",_costs]] call A3A_fnc_customHint;};

skillFIA = skillFIA + 1;
[_titleStr, format [localize "STR_A3A_fn_reinf_FIASkAdd_upgraded",skillFIA,FactionGet(reb,"name")]] call A3A_fnc_customHint;
publicVariable "skillFIA";
// The server takes the cost from the current money. Writing the value read above would undo any change made since
[0, -_costs, true] remoteExecCall ["A3A_fnc_resourcesFIA", 2];

//update tooltip
_display = findDisplay 100;
if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 109;
	_ChildControl  ctrlSetTooltip format [localize "STR_A3A_fn_dialogs_dialogHQ_upgrade",1000 + (1.5*((skillFIA) *750)),skillFIA];
};

[] spawn A3A_fnc_statistics;
{
    _costs = server getVariable _x;
    _costs = round (_costs + (_costs * (skillFIA/280)));
    server setVariable [_x,_costs,true];
} forEach FactionGet(reb,"unitsSoldiers");
