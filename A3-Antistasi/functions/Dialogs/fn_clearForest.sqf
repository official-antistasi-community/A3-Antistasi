if (player != theBoss) exitWith {[localize "STR_antistasi_customHint_clean_forest", localize "STR_antistasi_customHint_clean_forest_only_comander"] call A3A_fnc_customHint;};
{ [_x, true] remoteExec ["hideObjectGlobal",2] } forEach (nearestTerrainObjects [getMarkerPos respawnTeamPlayer,["tree","bush","small tree"],70]);
[localize "STR_antistasi_customHint_clean_forest", localize "STR_antistasi_customHint_cleared_forest"] call A3A_fnc_customHint;
chopForest = true; publicVariable "chopForest";
