// Logic for determining whether to reveal enemy vehicles?

private _chance = tierWar*3;
{
	if (!alive _x) then { continue };
	private _marker = A3A_antennaMap get netId _x;
	if (sidesX getVariable _marker == teamPlayer) then {_chance = _chance + 4};
} forEach A3A_antennas;

private _return = false;

if (random 100 < _chance) then
	{
	if (count _this == 0) then
		{
		if (not revealX) then
			{
			["TaskSucceeded", ["", localize "STR_A3A_fn_FIARadio_yes"]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
			revealX = true; publicVariable "revealX";
			[] remoteExec ["A3A_fnc_revealToPlayer",teamPlayer];
			};
		}
	else
		{
		_return = true;
		};
	}
else
	{
	if (count _this == 0) then
		{
		if (revealX) then
			{
			["TaskFailed", ["", localize "STR_A3A_fn_FIARadio_no"]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
			revealX = false; publicVariable "revealX";
			};
		};
	};
_return