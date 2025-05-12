params ["_unit", "_playerX"];

if (captive _playerX) then { _playerX setCaptive false };

_playerX globalChat localize "STR_A3A_fn_ai_libPOW";
_unit setDir (getDir _playerX);
_playerX playMove "MountSide";
sleep 5;
_playerX playMove "";

[_unit] join group _playerX;
private _timeout = 10;
waituntil {sleep 1; _timeout = _timeout-1; _timeout < 0 or (local _unit and group _unit == group _playerX)};
if (_timeout < 0) exitWith {};

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

private _responseNum = str selectRandom [1,2,3];
_response = localize ("STR_A3A_fn_ai_captureX_libresponse" + _responseNum);
_unit globalChat _response;
_unit enableAI "MOVE";
_unit enableAI "AUTOTARGET";
_unit enableAI "TARGET";
_unit enableAI "ANIM";
[_unit] spawn A3A_fnc_FIAInit;
if (captive _unit) then { _unit setCaptive false };
