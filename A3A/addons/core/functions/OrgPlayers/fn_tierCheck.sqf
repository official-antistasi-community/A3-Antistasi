params [["_silent", false]];

private _totalPoints = (8 * count airportsX) + (4 * count seaports) + (2 * count outposts)
	+ (count citiesX) + (2 * count resourcesX) + (2 * count factories);

private _rebelSites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
private _rebelPoints = 0;
{
	_rebelPoints = _rebelPoints + call {
		if (_x in citiesX) exitWith {1};
		if (_x in outposts or {_x in resourcesX or _x in factories}) exitWith {2};
		if (_x in seaports) exitWith {4};
		if (_x in airportsX) then {8} else {0};
	}
} forEach _rebelSites;

// war tier 10 = 70% of total points, WT8 = 42%, WT6 = 22%, WT4 = 8%, WT2 = 1%
private _tierWar = 1 + floor (9 * sqrt (_rebelPoints / (0.7 * _totalPoints)));
if (_tierWar > 10) then {_tierWar = 10};

//_tierWar = 1 + (floor (((5*({(_x in outposts) or (_x in resourcesX) or (_x in citiesX)} count _sites)) + (10*({_x in seaports} count _sites)) + (20*({_x in airportsX} count _sites)))/10));
if (_tierWar != tierWar) then
{
	tierWar = _tierWar;
	publicVariable "tierWar";
	if (!_silent) then { [petros,"tier",""] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]] };
};
