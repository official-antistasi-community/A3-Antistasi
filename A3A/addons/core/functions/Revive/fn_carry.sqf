private ["_carrierX","_carryX","_timeOut","_action"];
private _titleStr = localize "STR_A3A_fn_revive_carry_title";

_carryX = _this select 0;
_carrierX = _this select 1;

//if (_carryX getVariable ["carryX",false]) exitWith {hint "This soldier is being carried and you cannot help him"};
if (!alive _carryX) exitWith {[_titleStr, format [localize "STR_A3A_fn_revive_carry_dead",name _carryX]] call A3A_fnc_customHint;};
if !(_carryX getVariable ["incapacitated",false]) exitWith {[_titleStr, format [localize "STR_A3A_fn_revive_carry_nohelp",name _carryX]] call A3A_fnc_customHint;};
if !(isNull attachedTo _carryX) exitWith {[_titleStr, format [localize "STR_A3A_fn_revive_carry_no_carry",name _carryX]] call A3A_fnc_customHint;};
if (call A3A_fnc_isCarrying) exitWith {[_titleStr, format [localize "STR_A3A_fn_revive_carry_already",name _carryX]] call A3A_fnc_customHint;};

if (captive _carrierX) then {_carrierX setCaptive false};
_carrierX setVariable ["A3A_carryingObject", true];
_carrierX playMoveNow "AcinPknlMstpSrasWrflDnon";
[_carryX,"AinjPpneMrunSnonWnonDb"] remoteExec ["switchMove",_carryX];
//_carryX setVariable ["carryX",true,true];
_carryX setVariable ["helped",_carrierX,true];
[_carryX,"remove"] remoteExec ["A3A_fnc_flagaction",0,_carryX];
_carryX attachTo [_carrierX, [0,1.1,0.092]];
_carryX setDir 180;
_timeOut = time + 60;
_action = _carrierX addAction [format [localize "STR_A3A_fn_revive_carry_addact_release",name _carryX], {_this#0 setVariable ["A3A_cancelCarry", true]},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];

waitUntil {sleep 0.5; (!alive _carryX) or !([_carrierX] call A3A_fnc_canFight) or !(_carryX getVariable ["incapacitated",false]) or (_carrierX getVariable ["A3A_cancelCarry", false]) or (time > _timeOut) or (vehicle _carrierX != _carrierX)};

_carrierX removeAction _action;
if (_carryX in attachedObjects _carrierX) then {detach _carryX};
_carrierX setVariable ["A3A_cancelCarry", nil];
_carrierX setVariable ["A3A_carryingObject", nil];
_carrierX playMove "amovpknlmstpsraswrfldnon";
[_carryX,"UnconsciousReviveDefault"] remoteExec ["switchMove",_carryX];
//_carryX setVariable ["carryX",false,true];
[_carryX,"heal1"] remoteExec ["A3A_fnc_flagaction",0,_carryX];
sleep 5;
_carryX setVariable ["helped",objNull,true];
