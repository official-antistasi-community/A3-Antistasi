params ["_unit", "_playerX"];

if (captive _playerX) then { _playerX setCaptive false };

_playerX globalChat localize "STR_antistasi_chat_liberate_free";
sleep 3;

[_unit] join group _playerX;
private _timeout = 10;
waituntil {sleep 1; _timeout = _timeout-1; _timeout < 0 or (local _unit and group _unit == group _playerX)};
if (_timeout < 0) exitWith {};

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

_unit globalChat localize "STR_antistasi_chat_liberate_thank";
_unit enableAI "MOVE";
_unit enableAI "AUTOTARGET";
_unit enableAI "TARGET";
_unit enableAI "ANIM";
[_unit] spawn A3A_fnc_FIAInit;
if (captive _unit) then { _unit setCaptive false };
