private ["_carrierX","_carryX","_timeOut","_action"];
_carryX = _this select 0;
_carrierX = _this select 1;

//if (_carryX getVariable ["carryX",false]) exitWith {hint "This soldier is being carried and you cannot help him"};
if (!alive _carryX) exitWith {[localize "STR_antistasi_customHint_carry", format [localize "STR_antistasi_customHint_carry_dead",name _carryX]] call A3A_fnc_customHint;};
if !(_carryX getVariable ["incapacitated",false]) exitWith {[localize "STR_antistasi_customHint_carry", format [localize "STR_antistasi_customHint_revive_long_your",name _carryX]] call A3A_fnc_customHint;};
if !(isNull attachedTo _carryX) exitWith {[localize "STR_antistasi_customHint_carry", format [localize "STR_antistasi_customHint_carry_nocarry",name _carryX]] call A3A_fnc_customHint;};
if (captive _carrierX) then {[_carrierX,false] remoteExec ["setCaptive",0,_carrierX]; _carrierX setCaptive false};
_carrierX playMoveNow "AcinPknlMstpSrasWrflDnon";
[_carryX,"AinjPpneMrunSnonWnonDb"] remoteExec ["switchMove"];
//_carryX setVariable ["carryX",true,true];
_carryX setVariable ["helped",_carrierX,true];
[_carryX,"remove"] remoteExec ["A3A_fnc_flagaction",0,_carryX];
_carryX attachTo [_carrierX, [0,1.1,0.092]];
_carryX setDir 180;
_timeOut = time + 60;
_action = _carrierX addAction [format [localize "STR_antistasi_logistics_release",name _carryX], {{detach _x} forEach (attachedObjects player)},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];

waitUntil {sleep 0.5; (!alive _carryX) or !([_carrierX] call A3A_fnc_canFight) or !(_carryX getVariable ["incapacitated",false]) or ({!isNull _x} count attachedObjects _carrierX == 0) or (time > _timeOut) or (vehicle _carrierX != _carrierX)};

_carrierX removeAction _action;
if (count attachedObjects _carrierX != 0) then {detach _carryX};
_carrierX playMove "amovpknlmstpsraswrfldnon";
sleep 2;
_carryX playMoveNow "";
if (_carryX getVariable ["incapacitated",false]) then
	{
	[_carryX,false] remoteExec ["setUnconscious",_carryX];
	waitUntil {sleep 0.1; lifeState _carryX != "incapacitated"};
	[_carryX,true] remoteExec ["setUnconscious",_carryX];
	};
//_carryX setVariable ["carryX",false,true];
[_carryX,"heal1"] remoteExec ["A3A_fnc_flagaction",0,_carryX];
sleep 5;
_carryX setVariable ["helped",objNull,true];
