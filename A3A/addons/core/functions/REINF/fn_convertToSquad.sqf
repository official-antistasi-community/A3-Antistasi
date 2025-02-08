#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()


private _titleStr = localize "STR_A3A_fn_reinf_convSqd_title";

// reuse some addFIAsquadHC messages, should be fine
if (player != theBoss) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdHC_no_commander"] call A3A_fnc_customHint};
if (markerAlpha respawnTeamPlayer == 0) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdHC_no_movehq"] call A3A_fnc_customHint};
if !([player] call A3A_fnc_hasRadio) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdHC_no_radio"] call A3A_fnc_customHint};

private _maxGroups = [6,10] select (player call A3A_fnc_isMember);
if (count hcAllGroups player >= _maxGroups) exitWith {
    [_titleStr, localize "STR_A3A_fn_reinf_addSqdHC_no_many"] call A3A_fnc_customHint;
};

private _bannedTypes = [FactionGet(reb,"unitCrew"), FactionGet(reb,"unitUnarmed"), FactionGet(reb,"unitPetros"), "unknown"];
private _units = groupSelectedUnits player select { !isPlayer _x and !(_x getVariable ["unitType", "unknown"] in _bannedTypes) };
if (_units isEqualTo []) exitWith {
    [_titleStr, localize "STR_A3A_fn_reinf_convSqd_no_selected"] call A3A_fnc_customHint;
};
// apparently the units are unselected when you change command bar mode, so don't need to worry about that

private _group = createGroup teamPlayer;
_group setGroupIdGlobal ["Tm-" + str ({side (leader _x) == teamPlayer} count allGroups)];       // uh. whatever
_units join _group;

// Select a suitable leader for the squad
private _types = _units apply {_x getVariable "unitType"};
private _leaderIndex = _types find FactionGet(reb,"unitSL");            // not actually possible atm
if (_leaderIndex == -1) then {
    private _badLeaders = [FactionGet(reb,"unitMedic"), FactionGet(reb,"unitAA"), FactionGet(reb,"unitAT")];
    _leaderIndex = _types findIf {!(_x in _badLeaders)};
};
if (_leaderIndex != -1) then { _group selectLeader _units#_leaderIndex };

player hcSetGroup [_group];
_group spawn A3A_fnc_attackDrillAI;

private _successStr = format [localize "STR_A3A_fn_reinf_convSqd_created", count _units, groupId _group];
[_titleStr, _successStr] call A3A_fnc_customHint;

// todo: comment, allow commander to purchase AI with faction money
