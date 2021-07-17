_handled = false;
if (player getVariable ["incapacitated",false]) exitWith {_handled};
if (player getVariable ["owner",player] != player) exitWith {_handled};
_key = _this select 1;
if (_key == 21) then
	{
	if (isNil"garageVeh") then
		{
		if (_this select 2) then
			{
			if (player == theBoss) then
				{
				[] spawn A3A_fnc_artySupport;
				};
			}
		else
			{
			closedialog 0;
			_nul = createDialog "radio_comm";
			};
		};
	}
else
	{
	if (_key == 207) then
		{
		if (!A3A_hasACEHearing) then
			{
			if (soundVolume <= 0.5) then
				{
				0.5 fadeSound 1;
				[localize "STR_antistasi_earplugs", localize "STR_antistasi_earplugs_off", true] call A3A_fnc_customHint;
				}
			else
				{
				0.5 fadeSound 0.1;
				[localize "STR_antistasi_earplugs", localize "STR_antistasi_earplugs_on", true] call A3A_fnc_customHint;
				};
			};
		};
	};
_handled