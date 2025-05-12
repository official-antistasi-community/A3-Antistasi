private ["_chance","_pos","_markerX","_return"];

_chance = tierWar*3;
{_pos = getPos _x;
_markerX = [outposts,_pos] call BIS_fnc_nearestPosition;
if ((sidesX getVariable [_markerX,sideUnknown] == teamPlayer) and (alive _x)) then {_chance = _chance + 4};
} forEach antennas;
_return = false;
if (debug) then {_chance = 100};

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