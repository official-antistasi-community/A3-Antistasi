private ["_cured","_medicX","_healed","_player","_timer","_sideX","_actionX"];

_cured = _this select 0;
_medicX = _this select 1;
_actionX = 0;
_healed = false;
_player = isPlayer _medicX;
_inPlayerGroup = if !(_player) then {if ({isPlayer _x} count (units group _medicX) > 0) then {true} else {false}} else {false};
if (captive _medicX) then
    {
    [_medicX,false] remoteExec ["setCaptive",0,_medicX];
    _medicX setCaptive false;
    };
if !(alive _cured) exitWith
    {
    if (_player) then {["Revive", format ["%1 is already dead",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medicX groupChat format ["%1 is already dead",name _cured]};
    _healed
    };
if !([_medicX] call A3A_fnc_canFight) exitWith {if (_player) then {["Revive", "You are not able to revive anyone"] call A3A_fnc_customHint;};_healed};
if  (
        (!([_medicX] call A3A_fnc_isMedic && "Medikit" in (items _medicX))) &&
        {(!("FirstAidKit" in (items _medicX))) &&
        {(!("FirstAidKit" in (items _cured)))}}
    ) exitWith
{
    if (_player) then {["Revive", format ["You or %1 need a First Aid Kit or Medikit to be able to revive",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medicX groupChat "I'm out of FA kits and I have no Medikit!"};
    _healed
};
if ((not("FirstAidKit" in (items _medicX))) and !(_medicX canAdd "FirstAidKit")) exitWith
    {
    if (_player) then {["Revive", format ["%1 has a First Aid Kit but you do not have enough space in your inventory to use it",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medicX groupChat "I'm out of FA kits!"};
    _healed
    };
if ((([_cured] call A3A_fnc_fatalWound)) and !([_medicX] call A3A_fnc_isMedic)) exitWith
    {
    if (_player) then {["Revive", format ["%1 is injured by a fatal wound, only a medic can revive him",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medicX groupChat format ["%1 is injured by a fatal wound, only a medic can revive him",name _cured]};
    _healed
    };
if !(isNull attachedTo _cured) exitWith
    {
    if (_player) then {["Revive", format ["%1 is being carried or transported and you cannot heal him",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medicX groupChat format ["%1 is being carried or transported and I cannot heal him",name _cured]};
    _healed
    };
if !(_cured getVariable ["incapacitated",false]) exitWith
    {
    if (_player) then {["Revive", format ["%1 no longer needs your help",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medicX groupChat format ["%1 no longer needs my help",name _cured]};
    _healed
    };
if (_player) then
    {
    _cured setVariable ["helped",_medicX,true];
    };
_medicX setVariable ["helping",true];
if  (
        (!("FirstAidKit" in (items _medicX))) &&
        {!("Medikit" in (items _medicX))}
    ) then
{
    _medicX addItem "FirstAidKit";
    _cured removeItem "FirstAidKit";
};
_timer = if ([_cured] call A3A_fnc_fatalWound) then
            {
            time + 35 + (random 20)
            }
        else
            {
            if ((!isMultiplayer and (isPlayer _cured)) or ([_medicX] call A3A_fnc_isMedic)) then
                {
                time + 10 + (random 5)
                }
            else
                {
                time + 15 + (random 10)
                };
            };


_medicX setVariable ["timeToHeal",_timer];
_medicX playMoveNow selectRandom medicAnims;
_medicX setVariable ["animsDone",false];
_medicX setVariable ["cured",_cured];
_medicX setVariable ["success",false];
_medicX setVariable ["cancelRevive",false];
if (!_player) then
    {
    {_medicX disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
    }
else
    {
    _actionX = _medicX addAction ["Cancel Revive", {(_this select 1) setVariable ["cancelRevive",true]},nil,6,true,true,"","(_this getVariable [""helping"",false]) and (isPlayer _this)"];
    };
_medicX addEventHandler ["AnimDone",
{
    private _medicX = _this select 0;
    private _cured = _medicX getVariable ["cured",objNull];
    if (([_medicX] call A3A_fnc_canFight) and (time <= (_medicX getVariable ["timeToHeal",time])) and !(_medicX getVariable ["cancelRevive",false]) and (alive _cured) and (_cured getVariable ["incapacitated",false]) and (_medicX == vehicle _medicX)) then
    {
        _medicX playMoveNow selectRandom medicAnims;
    }
    else
    {
        _medicX removeEventHandler ["AnimDone",_thisEventHandler];
        _medicX setVariable ["animsDone",true];
        if (([_medicX] call A3A_fnc_canFight) and !(_medicX getVariable ["cancelRevive",false]) and (_medicX == vehicle _medicX) and (alive _cured)) then
        {
            if (_cured getVariable ["incapacitated",false]) then
            {
                _medicX setVariable ["success",true];
                //_cured setVariable ["incapacitated",false,true];
                //_medicX action ["HealSoldier",_cured];
                if ([_medicX] call A3A_fnc_isMedic) then {_cured setDamage 0.25} else {_cured setDamage 0.5};
                if(!("Medikit" in (items _medicX))) then
                {
                    _medicX removeItem "FirstAidKit";
                };
            };
        };
    };
}];
waitUntil {sleep 0.5; (_medicX getVariable ["animsDone",true])};
_medicX setVariable ["animsDone",nil];
_medicX setVariable ["timeToHeal",nil];
_medicX setVariable ["cured",nil];
_medicX setVariable ["helping",false];
if (!_player) then
    {
    {_medicX enableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
    }
else
    {
    _medicX removeAction _actionX;
    _cured setVariable ["helped",objNull,true];
    _medicX setVariable ["helping",false];
    };
if (_medicX getVariable ["cancelRevive",false]) exitWith
    {
    if (_player) then
        {
        ["Revive", "Revive cancelled"] call A3A_fnc_customHint;
        _medicX setVariable ["cancelRevive",nil];
        };
    _healed
    };
if !(alive _cured) exitWith
    {
    if (_player) then {["Revive", format ["We lost %1",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medicX groupChat format ["We lost %1",name _cured]};
    _healed
    };
if (!([_medicX] call A3A_fnc_canFight) or (_medicX != vehicle _medicX) or (_medicX distance _cured > 3)) exitWith {if (_player) then {["Revive", "Revive cancelled"] call A3A_fnc_customHint;};_healed};

if (_medicX getVariable ["success",true]) then
    {
    _sideX = side (group _cured);
    if ((_sideX != side (group _medicX)) and ((_sideX == Occupants) or (_sideX == Invaders))) then
        {
        _cured setVariable ["surrendering",true,true];
        sleep 2;
        };
    _cured setVariable ["incapacitated",false,true];
    _healed = true;
    }
else
    {
    if (_player) then {["Revive", "Revive unsuccesful"] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medicX groupChat "Revive failed"};
    };

_healed