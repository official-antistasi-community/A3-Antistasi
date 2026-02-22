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
private _marker = _intel getVariable "marker";
[localize "STR_A3A_fn_intel_title1", localize "STR_A3A_fn_intel_doc_success"] call A3A_fnc_customHint;
["Medium", _side] remoteExec ["A3A_fnc_selectIntel", 2];
[100, false, _intel, 100] call A3A_tasks_fnc_rewardPlayers;     // players within 100m of intel
deleteVehicle _intel;
if (!isNil "_marker") then {
    [_marker, "intel"] remoteExecCall ["A3A_fnc_garrisonServer_looted", 2];
};
