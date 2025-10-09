#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// Faster GC that only cleans up essential stuff near HQ. Bodies and burning wrecks primarily as well as junk items.
#define CLEANDIST 100

private _playersNearHQ = (allPlayers - entities "HeadlessClient_F") select {_x distance2D markerPos "Synd_HQ" < 100};
_playersNearHQ pushBackUnique theBoss;
[localize "STR_A3A_fn_base_gc_title", "Cleaning the HQ area of garbage..."] remoteExec ["A3A_fnc_customHint", _playersNearHQ];
Info("Cleaning garbage near HQ...");

private _cleanPos = getMarkerPos "Synd_HQ";

private _fnc_objNearHQ = {
    params ["_objectArray", ["_clean",false]];
    private _nearArray = _objectArray inAreaArray [_cleanPos, CLEANDIST, CLEANDIST]; 
    if ((_nearArray isNotEqualTo []) && (_clean)) exitWith {[_nearArray] call _fnc_cleanArray};
    _nearArray;
};
private _fnc_cleanArray = {
    params ["_objectArray"];
    {
        deleteVehicle _x;
    } forEach _objectArray;
};

private _allDeadMenNearHQ = [allDeadMen,false] call _fnc_objNearHQ;

Debug("Moving dead solders out of vehicles at HQ...")
{
	if !(isNull objectParent _x) then { moveOut _x };
} forEach _allDeadMenNearHQ;
Debug("Finished moving soldiers out of vehicles at HQ; executing garbage clean.")
sleep 0.5;

[allDead, true] call _fnc_objNearHQ;
[allMissionObjects "WeaponHolder", true] call _fnc_objNearHQ;
[allMissionObjects "WeaponHolderSimulated", true] call _fnc_objNearHQ;

private _smallTrashCleanList = [ // Array of classnames like ejection seats or stuff thats junk and should be cleaned up regardless
    "Ejection_Seat_Base_F",
    "UserTexture1m_F",
    "ace_cookoff_Turret_MBT_01",
    "ace_cookoff_Turret_MBT_02",
    "rhs_a10_acesII_seat",
    "rhs_a10_canopy",
    "rhs_k36d5_seat",
    "rhs_vs1_seat",
    "rhs_mi28_door_pilot",
    "rhs_mi28_door_gunner",
    "rhs_mi28_wing_left",
    "rhs_mi28_wing_right",
    "rhs_ka52_rps_rocket",
    "rhs_ka52_blade"
];

{
    [allMissionObjects _x,true] call _fnc_objNearHQ;
} forEach _smallTrashCleanList;

[localize "STR_A3A_fn_base_gc_title", localize "STR_A3A_fn_base_gc_hqCleaned"] remoteExec ["A3A_fnc_customHint", 0];
Info("HQ Garbage clean completed");
