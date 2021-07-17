params ["_intel"];

/*  Handles the retrieving of medium intel
*   Params:
*       _intel : OBJECT : The object which is holding the intel
*
*   Returns:
*       Nothing
*/

//Take intel from desk
private _side = _intel getVariable "side";
[localize "STR_antistasi_intel_search", localize "STR_antistasi_intel_taken"] call A3A_fnc_customHint;
private _intelText = ["Medium", _side] call A3A_fnc_selectIntel;
[_intelText] remoteExec ["A3A_fnc_showIntel", [teamPlayer, civilian]];
{
    [5,_x] call A3A_fnc_playerScoreAdd;
} forEach ([50,0,_intel,teamPlayer] call A3A_fnc_distanceUnits);
deleteVehicle _intel;