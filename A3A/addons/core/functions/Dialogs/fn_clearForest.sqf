//TODO: add header

private _titleStr = localize "STR_A3A_fn_dialogs_clrforest_title";

if (player != theBoss) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_clrforest_commander"] call A3A_fnc_customHint;};
{ [_x, true] remoteExec ["hideObjectGlobal",2] } forEach (nearestTerrainObjects [getMarkerPos respawnTeamPlayer,["tree","bush","small tree"],70]);
[_titleStr, localize "STR_A3A_fn_dialogs_clrforest_cleared"] call A3A_fnc_customHint;
chopForest = true; publicVariable "chopForest";
