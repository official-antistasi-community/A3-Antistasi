
// Just for debugging probably
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _titleStr = localize "STR_A3A_fn_ai_help_title";

// Both units must be local. Non-local unit might be resolved at some point.

params ["_unit", "_medicX"];

// Probably none of these should happen, but whatever
if !(isNull (_unit getVariable ["helped",objNull])) exitWith {};
if (isPlayer _medicX) exitWith {};
if (_medicX getVariable ["helping",false]) exitWith {};

_unit setVariable ["helped",_medicX];
_medicX setVariable ["helping",true];
_medicX setVariable ["maneuvering",true];

private _cured = false;
private _isPlayerGroup = if ({isPlayer _x} count units _unit > 0) then {true} else {false};

private _fnc_canHelp = {
    params ["_medic", "_target"];
    (alive _target)
    and (_medic call A3A_fnc_canFight)
    and (isNull objectParent _medic)
    and (_medic == _target getVariable ["helped",objNull])			// is assigned helper
    and (isNull attachedTo _target)									// target not dragged or loaded into vehicle
    and !(_medicX getVariable ["cancelRevive",false])				// revive not cancelled (due to medic damage?)
};

private _fnc_doHeal = {
    params ["_medic", "_target"];
    _medic stop true;
    _target stop true;
    private _cured = if (_target getVariable ["incapacitated",false]) then { 
        [_target,_medic] call A3A_fnc_actionRevive;
    } else {
        _medic action ["HealSoldier",_unit];
        sleep 10; true;
    };
    if (_cured && _medic != _target && _isPlayerGroup) then {
        _medic groupChat format [localize "STR_A3A_fn_ai_heal_ready",name _target];
    };
    _medic stop false;
    _target stop false;
    _target doFollow leader _target;
    _medic doFollow leader _medic;
    _cured;
};

if (_medicX != _unit) then
{
    // Is this one even used? Never seen it
    if !(_unit getVariable ["incapacitated",false]) then
    {
        if (_isPlayerGroup) then {_unit groupChat format [localize "STR_A3A_fn_ai_heal_hurt", name _unit]};
        playSound3D [(selectRandom injuredSounds),_unit,false, getPosASL _unit, 1, 1, 50];
    };

    // Fire helping message if in player group
    if (_isPlayerGroup) then {
        _medicX groupChat format [localize "STR_A3A_fn_ai_heal_support", name _unit]
    };

    // Actual helping hint for player
    if (player == _unit) then {
        [_titleStr, format [localize "STR_A3A_fn_ai_help_onway", name _medicX]] call A3A_fnc_customHint;
    };

    Debug_2("Medic %1 helping %2", _medicX, _unit);

    // Smoke target vs nearest enemy
    private _enemy = _medicX findNearestEnemy _unit;
    if ((_unit getVariable ["incapacitated", false]) and (!isNull _enemy)) then
    {
        [_medicX,_unit,_enemy] call A3A_fnc_chargeWithSmoke;

        // Get some smoke/suppression help from nearby AI squadmates.
        private _nearFriends = units _medicX select { (_x != _medicX) and (_x call A3A_fnc_canFight) and (_x distance _unit < 50) and !(_x getVariable ["helping",false]) and (!isPlayer _x) };
        {
            if (random 100 > 40) then { continue };
            if (random 100 > 60) then {
                [selectRandom _nearFriends, _unit, _enemy] spawn A3A_fnc_chargeWithSmoke;
            } else {
                [selectRandom _nearFriends, _enemy] spawn A3A_fnc_suppressingFire;
            };
        } forEach _nearFriends;
    };

    Debug_1("Medic %1 moving to target", _medicX);

    // Attempt to move to target
    _medicX stop false;
    _medicX forceSpeed -1;				// Not sure what this is cleaning up exactly, but whatever
    _medicX doMove getPosATL _unit;
    _timeOut = time + 60;
    waitUntil { sleep 1; !([_medicX, _unit] call _fnc_canHelp) or (unitReady _medicX) or (_medicX distance _unit <= 2) or (time > _timeOut) };

    // Couldn't get close enough or abandoned for some reason
    if (!([_medicX, _unit] call _fnc_canHelp) or (_unit distance _medicX > 3)) exitWith {
        private _canHelp = [_medicX, _unit] call _fnc_canHelp;
        Debug_4("Medic %1 abandoned at distance %2, ready %3, canHelp %4", _medicX, _unit distance _medicX, unitReady _medicX, _canHelp);

        if (_unit getVariable ["incapacitated", false]) then {
            private _failCount = _unit getVariable ["helpFailed", 0];
            _unit setVariable ["helpFailed", _failCount + 1];
        };
    };

    // Unit incapped and enemy exists, order suppressing fire and drag to cover if appropriate
    if ((_unit getVariable ["incapacitated",false]) and (!isNull _enemy)) then
    {
        // Drag if there's better cover nearby
        _coverX = [_unit,_enemy] call A3A_fnc_coverage;
        if (count _coverX == 3) then {
            Debug_1("Medic %1 dragging target", _medicX);
            [_medicX, _unit, _coverX] call A3A_fnc_AIdrag;
        };
    };

    Debug_1("Medic %1 healing target", _medicX);

    if ([_medicX, _unit] call _fnc_canHelp) then {
        _cured = [_medicX, _unit] call _fnc_doHeal;
    };
}
else
{
    // Self-heal + smoke stuff
    [_medicX,_medicX] call A3A_fnc_chargeWithSmoke;
    if ([_medicX] call A3A_fnc_canFight) then
    {
        _medicX action ["HealSoldierSelf",_medicX];
        sleep 10;
    };
    _medicX setVariable ["helped",objNull];
    _cured = true;
};

// Some sort of hacky attempt to clear stuck animations or what?
//if ((animationState _medicX == "amovpknlmstpsraswrfldnon") or (animationState _medicX == "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2") or (animationState _medicX == "AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_2")) then {_medicX switchMove ""};

_medicX setUnitPos "AUTO";
_medicX doFollow leader _unit;

if (_medicX == _unit getVariable ["helped",objNull]) then { _unit setVariable ["helped",objNull,true] };

_medicX setVariable ["helping",false];
_medicX setVariable ["maneuvering",false];

if (_medicX getVariable ["cancelRevive",false]) then {
    _medicX setVariable ["cancelRevive",false];
    sleep 15;			// don't give other orders for a bit? Why not?
};

_cured			// probably doesn't matter, function is always spawned?
