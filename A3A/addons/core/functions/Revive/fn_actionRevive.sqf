params ["_cured", "_medic"];

private _player = isPlayer _medic;
private _inPlayerGroup = !_player and ({isPlayer _x} count (units group _medic) > 0);
private _isMedic = [_medic] call A3A_fnc_isMedic;
private _titleStr = localize "STR_A3A_fn_revive_actRev_title";

if (captive _medic) then { _medic setCaptive false };         // medic is will be local
if !(alive _cured) exitWith
{
    if (_player) then {[_titleStr, format [localize "STR_A3A_fn_revive_actRev_no_dead",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat format [localize "STR_A3A_fn_revive_actRev_no_dead",name _cured]};
    false
};
if !([_medic] call A3A_fnc_canFight) exitWith
{
    if (_player) then { [_titleStr, localize "STR_A3A_fn_revive_actRev_no_able"] call A3A_fnc_customHint };
    false
};
if !(isNull attachedTo _cured) exitWith
{
    if (_player) then {[_titleStr, format [localize "STR_A3A_fn_revive_actRev_no_carry1",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat format [localize "STR_A3A_fn_revive_actRev_no_carry2",name _cured]};
    false
};
if !(_cured getVariable ["incapacitated",false]) exitWith
{
    if (_player) then {[_titleStr, format [localize "STR_A3A_fn_revive_actRev_no_up",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat format [localize "STR_A3A_fn_revive_actRev_no_up_AI",name _cured]};
    false
};

private _medkits = ["Medikit"] + (A3A_faction_reb get "mediKits");    // Medikit is kept in case a unit still got hold of it.
private _firstAidKits = ["FirstAidKit"] + (A3A_faction_reb get "firstAidKits");    // FirstAidKit is kept in case a unit still got hold of it.
private _hasMedkit = (count (_medkits arrayIntersect (items _medic + items _cured)) > 0);
private _medicFAKs = if (!_hasMedkit) then { _firstAidKits arrayIntersect items _medic };
private _curedFAKs = if (!_hasMedkit) then { _firstAidKits arrayIntersect items _cured };

if (!_hasMedkit && {count _medicFAKs == 0 && count _curedFAKs == 0}) exitWith
{
    if (_player) then {[_titleStr, format [localize "STR_A3A_fn_revive_actRev_no_meds",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat localize "STR_A3A_fn_revive_actRev_no_meds_AI"};
    false
};

private _timer = [10, A3A_reviveTime] select (_player or _inPlayerGroup);
if ([_cured] call A3A_fnc_fatalWound) then { _timer = _timer * 2 };
if (!_isMedic) then { _timer = _timer * 2 };
_timer = (_timer * (1 + random 0.5)) + time;

_medic setVariable ["helping",true];
_medic playMoveNow selectRandom medicAnims;
_medic setVariable ["cancelRevive",false];

private _actionX = 0;
if (!_player) then
{
    {_medic disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
}
else
{
    _actionX = _medic addAction [localize "STR_A3A_fn_revive_actRev_addact_cancel", {(_this select 1) setVariable ["cancelRevive",true]},nil,6,true,true,"",""];
    _cured setVariable ["helped",_medic,true];
};

private _animHandler = _medic addEventHandler ["AnimDone",
{
    private _medic = _this select 0;
    _medic playMoveNow selectRandom medicAnims;
}];

waitUntil {
    sleep 1;
    !([_medic] call A3A_fnc_canFight)
    or (time > _timer)
    or (_medic getVariable ["cancelRevive", false])		// medic might get deleted
    or !(alive _cured)
    or !(_cured getVariable ["incapacitated", false])   // other unit (or self) might revive the target
};

if (isNull _medic) exitWith { false };

_medic removeEventHandler ["AnimDone", _animHandler];
_medic setVariable ["helping",false];
_medic playMoveNow "AinvPknlMstpSnonWnonDnon_medicEnd";

if (!_player) then
{
    {_medic enableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
}
else
{
    _medic removeAction _actionX;
    _cured setVariable ["helped",objNull,true];
};

if (_medic getVariable ["cancelRevive",false]) exitWith
{
    // AI medics can be cancelled from A3A_fnc_help
    if (_player) then
    {
        [_titleStr, localize "STR_A3A_fn_revive_actRev_rev_cancel"] call A3A_fnc_customHint;
        _medic setVariable ["cancelRevive",nil];
    };
    false;
};
if !(alive _cured) exitWith
{
    if (_player) then {[_titleStr, format [localize "STR_A3A_fn_revive_actRev_lost",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat format [localize "STR_A3A_fn_revive_actRev_lost",name _cured]};
    false;
};
if (!([_medic] call A3A_fnc_canFight)) exitWith
{
    if (_player) then {[_titleStr, localize "STR_A3A_fn_revive_actRev_rev_cancel"] call A3A_fnc_customHint;};
    false;
};
if !(_cured getVariable ["incapacitated", false]) exitWith {
    if (_player) then {[_titleStr, format [localize "STR_A3A_fn_revive_actRev_other",name _cured]] call A3A_fnc_customHint;};
    true;
};

// Successful revive
if (_isMedic) then {_cured setDamage 0} else {_cured setDamage 0.25};
if (!_hasMedkit) then {
    if (count _medicFAKs == 0) then { _cured removeItem selectRandom _curedFAKs }
    else { _medic removeItem selectRandom _medicFAKs };
};
private _sideX = side (group _cured);
if ((_sideX != side (group _medic)) and ((_sideX == Occupants) or (_sideX == Invaders))) then
{
    _cured setVariable ["surrendering",true,true];
    sleep 2;
};
_cured setVariable ["incapacitated",false,true];        // why is this applied later? check
true;
