params ["_cured", "_medic"];

private _player = isPlayer _medic;
private _inPlayerGroup = if !(_player) then {if ({isPlayer _x} count (units group _medic) > 0) then {true} else {false}} else {false};
private _isMedic = [_medic] call A3A_fnc_isMedic;

if (captive _medic) then { _medic setCaptive false };         // medic is will be local
if !(alive _cured) exitWith
{
    if (_player) then {["Revive", format ["%1 is already dead",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat format ["%1 is already dead",name _cured]};
    false
};
if !([_medic] call A3A_fnc_canFight) exitWith
{
    if (_player) then { ["Revive", "You are not able to revive anyone"] call A3A_fnc_customHint };
    false
};
if (([_cured] call A3A_fnc_fatalWound) and !_isMedic) exitWith
{
    if (_player) then {["Revive", format ["%1 is injured by a fatal wound, only a medic can revive him",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat format ["%1 is injured by a fatal wound, only a medic can revive him",name _cured]};
    false
};
if !(isNull attachedTo _cured) exitWith
{
    if (_player) then {["Revive", format ["%1 is being carried or transported and you cannot heal him",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat format ["%1 is being carried or transported and I cannot heal him",name _cured]};
    false
};
if !(_cured getVariable ["incapacitated",false]) exitWith
{
    if (_player) then {["Revive", format ["%1 no longer needs your help",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat format ["%1 no longer needs my help",name _cured]};
    false
};

private _medkits = ["Medikit"] + (A3A_faction_reb get "mediKits");    // Medikit is kept in case a unit still got hold of it.
private _firstAidKits = ["FirstAidKit"] + (A3A_faction_reb get "firstAidKits");    // FirstAidKit is kept in case a unit still got hold of it.
private _hasMedkit = (count (_medkits arrayIntersect items _medic) > 0);
private _medicFAKs = if (!_hasMedkit) then { _firstAidKits arrayIntersect items _medic };
private _curedFAKs = if (!_hasMedkit) then { _firstAidKits arrayIntersect items _cured };

if (!_hasMedkit && {count _medicFAKs == 0 && count _curedFAKs == 0}) exitWith
{
    if (_player) then {["Revive", format ["You or %1 need a First Aid Kit or Medikit to be able to revive",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat "I'm out of FA kits and I have no Medikit!"};
    false
};

private _timer = if ([_cured] call A3A_fnc_fatalWound) then
{
    time + 35 + (random 20)
}
else
{
    if (_isMedic) then
    {
        time + 10 + (random 5)
    }
    else
    {
        time + 15 + (random 10)
    };
};

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
    _actionX = _medic addAction ["Cancel Revive", {(_this select 1) setVariable ["cancelRevive",true]},nil,6,true,true,"",""];
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
};

if (isNull _medic) exitWith {};

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
        ["Revive", "Revive cancelled"] call A3A_fnc_customHint;
        _medic setVariable ["cancelRevive",nil];
    };
    false;
};
if !(alive _cured) exitWith
{
    if (_player) then {["Revive", format ["We lost %1",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat format ["We lost %1",name _cured]};
    false;
};
if (!([_medic] call A3A_fnc_canFight)) exitWith
{
    if (_player) then {["Revive", "Revive cancelled"] call A3A_fnc_customHint;};
    false;
};

// Successful revive
if (_isMedic) then {_cured setDamage 0.25} else {_cured setDamage 0.5};
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
