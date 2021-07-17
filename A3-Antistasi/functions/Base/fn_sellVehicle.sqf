/*
Author: Barbolani, Wurzel, Jaj22, Michael Phillips, Caleb Serafin
Attempts to sell the vehicle the player is looking at.
Vehicle cannot be sold if owned by another player.

Arguments:
    <OBJECT> Player who is trying to sell a vehicle.
    <OBJECT> cursorObject of the player.

Return Value:
<NIL> nil

Scope: Server/HC, All calls need to be executed on one machine, using an HC is also possible.
Environment: Unscheduled, is used to sell vehicles, execution cannot be stacked and exploited.
Public: No
Dependencies:
<STRING> ownerX found on vehicles, contains UID of player who bought it.
<ARRAY> Template vehicle arrays, see costs = call {}.

Example:
// From a button control:
action = "if (player == theBoss) then {closeDialog 0; nul = [player,cursorObject] remoteExecCall [""A3A_fnc_sellVehicle"",2]} else {[""Sell Vehicle"", ""Only the Commander can sell vehicles""] call A3A_fnc_customHint;};";

// Testing spam:
for "_i" from 1 to 1000 do {
    [player,cursorObject] remoteExecCall ["A3A_fnc_sellVehicle",2];
};

*/
params [
    ["_player",objNull,[objNull]],
    ["_veh",objNull,[objNull]]
];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

if (isNull _player) exitWith { Error("_player is null.") };
if (isNull _veh) exitWith {[localize "STR_antistasi_journal_entry_header_commander_11", localize "STR_antistasi_customHint_sell_veh_no_look"] remoteExecCall ["A3A_fnc_customHint",_player];};

if (_veh distance getMarkerPos respawnTeamPlayer > 50) exitWith {[localize "STR_antistasi_journal_entry_header_commander_11", format [localize "STR_antistasi_customHint_sell_veh_no_flag",50]] remoteExecCall ["A3A_fnc_customHint",_player];};

if ({isPlayer _x} count crew _veh > 0) exitWith {[localize "STR_antistasi_journal_entry_header_commander_11", localize "STR_antistasi_customHint_sell_veh_no_empty"] remoteExecCall ["A3A_fnc_customHint",_player];};

_owner = _veh getVariable ["ownerX",""];
if !(_owner isEqualTo "" || {getPlayerUID _player isEqualTo _owner}) exitWith {  // Vehicle cannot be sold if owned by another player.
    [localize "STR_antistasi_journal_entry_header_commander_11", localize "STR_antistasi_customHint_sell_veh_owner"] remoteExecCall ["A3A_fnc_customHint",_player];
};

if (_veh getVariable ["A3A_sellVehicle_inProgress",false]) exitWith {[localize "STR_antistasi_journal_entry_header_commander_11", localize "STR_antistasi_customHint_sell_veh_already"] remoteExecCall ["A3A_fnc_customHint",_player];};
_veh setVariable ["A3A_sellVehicle_inProgress",true,false];  // Only processed on the server. It is absolutely pointless trying to network this due to race conditions.

private _typeX = typeOf _veh;
private _costs = call {
    if (_veh isKindOf "StaticWeapon") exitWith {100};			// in case rebel static is same as enemy statics
    if (_typeX in vehFIA) exitWith { ([_typeX] call A3A_fnc_vehiclePrice) / 2 };
    if ((_typeX in arrayCivVeh) or (_typeX in civBoats) or (_typeX in [civBoat,civCar,civTruck])) exitWith {25};
    if ((_typeX in vehNormal) or (_typeX in vehBoats) or (_typeX in vehAmmoTrucks)) exitWith {100};
    if (_typeX in [vehCSATPatrolHeli, vehNATOPatrolHeli, civHeli]) exitWith {500};
    if ((_typeX in vehAPCs) || (_typeX in vehTransportAir) || (_typeX in vehUAVs)) exitWith {1000};
    if ((_typeX in vehAttackHelis) or (_typeX in vehTanks) or (_typeX in vehAA) or (_typeX in vehMRLS)) exitWith {3000};
    if (_typeX in [vehNATOPlane,vehNATOPlaneAA,vehCSATPlane,vehCSATPlaneAA]) exitWith {4000};
    0;
};

if (_costs == 0) exitWith {
    _veh setVariable ["A3A_sellVehicle_inProgress",false,false];
    [localize "STR_antistasi_journal_entry_header_commander_11", localize "STR_antistasi_customHint_sell_veh_suitable"] remoteExecCall ["A3A_fnc_customHint",_player];
};

_costs = round (_costs * (1-damage _veh));

[0,_costs] remoteExec ["A3A_fnc_resourcesFIA",2];

if (_veh in staticsToSave) then {staticsToSave = staticsToSave - [_veh]; publicVariable "staticsToSave"};
if (_veh in reportedVehs) then {reportedVehs = reportedVehs - [_veh]; publicVariable "reportedVehs"};

[_veh,true] call A3A_fnc_empty;

if (_veh isKindOf "StaticWeapon") then {deleteVehicle _veh};

[localize "STR_antistasi_journal_entry_header_commander_11", localize "STR_antistasi_customHint_sell_veh_sold"] remoteExecCall ["A3A_fnc_customHint",_player];
nil;
