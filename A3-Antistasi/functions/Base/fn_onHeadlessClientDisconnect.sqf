private _owner = param [4];

if (_owner in hcArray) then
{
	if ({owner _x == _owner} count allUnits > 0) then
	{
		[] spawn {
			while {true} do
			{
				[petros,"hint",localize "STR_antistasi_Headless_disconnected", localize "STR_antistasi_Headless_head"] remoteExec ["A3A_fnc_commsMP"];
				sleep 30;
			};
		};
	}
	else
	{
		hcArray = hcArray - [_owner];
	};
};