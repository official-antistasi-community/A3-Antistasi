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
action = "if (player == theBoss) then {closeDialog 0; nul = [player,cursorObject] remoteExecCall [""A3A_fnc_sellVehicle"",2]} else {[""Sell Vehicle"", ""Only the Commander can sell vehicles.""] call A3A_fnc_customHint;};";

// Testing spam:
for "_i" from 1 to 1000 do {
    [player,cursorObject] remoteExecCall ["A3A_fnc_sellVehicle",2];
};

*/
params [
    ["_player",objNull,[objNull]],
    ["_veh",objNull,[objNull]]
];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _titleStr = localize "STR_A3A_fn_base_sellveh_sell";

/*
Blacklisted Assets

The array below contains classnames of assets which are not allowed to be sold within Antistasi.
Reason for this is that those items are one or more of the following:
- can be aquired by means that don't cost anything and the ability to sell those would be an infinite money exploit.
- are no proper "statics" in terms of weaponized statics but for example the ACE spotting scoped
- something else
*/
_blacklistedAssets = [
"ACE_I_SpottingScope","ACE_O_SpottingScope","ACE_O_T_SpottingScope","ACE_B_SpottingScope","ACE_B_T_SpottingScope","ACE_SpottingScopeObject",
"O_Static_Designator_02_F","B_Static_Designator_01_F","B_W_Static_Designator_01_F",
"vn_o_nva_spiderhole_01","vn_o_nva_spiderhole_02","vn_o_nva_spiderhole_03",
"vn_o_pl_spiderhole_01","vn_o_pl_spiderhole_02","vn_o_pl_spiderhole_03",
"vn_o_vc_spiderhole_01","vn_o_vc_spiderhole_02","vn_o_vc_spiderhole_03"];

if (isNull _player) exitWith { Error("_player is null.") };
if (isNull _veh) exitWith {[_titleStr, localize "STR_A3A_fn_base_sellveh_no_looking"] remoteExecCall ["A3A_fnc_customHint",_player];};

if (_veh distance getMarkerPos respawnTeamPlayer > 50) exitWith {[_titleStr, localize "STR_A3A_fn_base_sellveh_no_closer"] remoteExecCall ["A3A_fnc_customHint",_player];};

if ({isPlayer _x} count crew _veh > 0) exitWith {[_titleStr, localize "STR_A3A_fn_base_sellveh_no_empty"] remoteExecCall ["A3A_fnc_customHint",_player];};

_owner = _veh getVariable ["ownerX",""];
if !(_owner isEqualTo "" || {getPlayerUID _player isEqualTo _owner}) exitWith {  // Vehicle cannot be sold if owned by another player.
    [_titleStr, localize "STR_A3A_fn_base_sellveh_no_owner"] remoteExecCall ["A3A_fnc_customHint",_player];
};

if (_veh getVariable ["A3A_sellVehicle_inProgress",false]) exitWith {[_titleStr, localize "STR_A3A_fn_base_sellveh_progress"] remoteExecCall ["A3A_fnc_customHint",_player];};
_veh setVariable ["A3A_sellVehicle_inProgress",true,false];  // Only processed on the server. It is absolutely pointless trying to network this due to race conditions.

private _costs = [_veh] call A3A_fnc_getVehicleSellPrice;

if (_costs == 0) exitWith {
    _veh setVariable ["A3A_sellVehicle_inProgress",false,false];
    [_titleStr, localize "STR_A3A_fn_base_sellveh_no_suitable"] remoteExecCall ["A3A_fnc_customHint",_player];
};

_costs = round (_costs * (1-damage _veh));

[0,_costs] remoteExec ["A3A_fnc_resourcesFIA",2];

if (_veh in staticsToSave) then {staticsToSave = staticsToSave - [_veh]; publicVariable "staticsToSave"};

[_veh,true] call A3A_fnc_empty;

if (_veh isKindOf "StaticWeapon") then {deleteVehicle _veh};

[_titleStr, localize "STR_A3A_fn_base_sellveh_sold"] remoteExecCall ["A3A_fnc_customHint",_player];
nil;
