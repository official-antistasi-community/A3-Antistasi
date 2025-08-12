#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _owner = param [4];

if (_owner in hcArray) then
{
	Info_2("Headless client ID %1 disconnected from HC array %2", _owner, hcArray);
	if ({owner _x == _owner} count allUnits > 0) then
	{
		A3A_HCErrorHandle = [] spawn {
			while {true} do
			{
				[petros,"hint", localize "STR_A3A_fn_base_hcdics_warning", localize "STR_A3A_fn_base_hcdics_hc"] remoteExec ["A3A_fnc_commsMP"];
				sleep 30;
			};
		};
	}
	else
	{
		hcArray = hcArray - [_owner];
	};
};

// TODO: STR_A3A_fn_base_hcdics_hc - needs implementation in line 14
// TODO: STR_A3A_fn_base_hcdics_warning - needs implementation in line 14
