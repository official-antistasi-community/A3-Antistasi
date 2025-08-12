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
[localize "STR_A3A_fn_intel_title1", localize "STR_A3A_fn_intel_doc_success"] call A3A_fnc_customHint;
["Medium", _side] remoteExec ["A3A_fnc_selectIntel", 2];
{
    [5,_x] call A3A_fnc_playerScoreAdd;
} forEach ([50,0,_intel,teamPlayer] call A3A_fnc_distanceUnits);
deleteVehicle _intel;
