/*
Description:
    Setup function for building placer. Needs to run scheduled to handle box locking.

Environment: Client, spawned
Arguments: 
    1. <object> Object to center placement around
    2. <number> Radius in which to place buildings
    3. <object> Builder box to use (if any? maybe later)
*/

params [
	["_centerObject", player, [objNull]],
	["_radius", 20, [0]],
	["_builderBox", objNull, [objNull]]
];
private _hintTitle = localize "STR_A3A_builder_title";

// Already in the placer
if(!isNil "A3A_building_EHDB") exitwith {};

// Check enemy proximity
if ([getPosATL _centerObject] call A3A_fnc_enemyNearCheck) exitWith {
	// TODO: stringtable
	[_hintTitle, localize "STR_A3A_builder_enemies_near"] call A3A_fnc_customHint;
};

// Check player eligibility
// options: teamLeader (1), engineer (2), either (3). Boss always eligible
private _eligibleTL = (A3A_builderPermissions % 2 >= 0) and (typeOf player == "I_G_Soldier_TL_F");
private _eligibleEng = (A3A_builderPermissions % 4 >= 2) and (player call A3A_fnc_isEngineer);
if (!_eligibleTL and !_eligibleEng and player != theBoss) exitWith {
	// TODO: stringtable
	[_hintTitle, localize "STR_A3A_builder_not_eligible"] call A3A_fnc_customHint;
};

// Now attempt to take ownership of the builder box and wait for that
[_builderBox, player, true] remoteExecCall ["A3A_fnc_lockBuilderBox", 2];

private _timeout = time + 5;
private _owner = objNull;
waitUntil {
    sleep 0.1;
    _owner = _builderBox getVariable ["A3A_build_owner", objNull];
    time > _timeout or alive _owner
};

// Need unscheduled for both customHint and buildingPlacer, may as well wrap
isNil {
    if (time > _timeout) exitWith {
        [_hintTitle, localize "STR_A3A_builder_server_respond_failed"] call A3A_fnc_customHint;
    };
    if (alive _owner and _owner != player) exitWith {
        [_hintTitle, format [localize "STR_A3A_builder_box_being_used", name _curOwner]] call A3A_fnc_customHint;
    };

    // Have box ownership so start the placer
    _this call A3A_fnc_buildingPlacer;
};
