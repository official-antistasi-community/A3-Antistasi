private _titleStr = localize "STR_A3A_fn_orgp_tBTogEli_titel";

if !(isServer) exitWith {};
params ["_playerX", ["_newBoss", objNull]];

// Find real player unit, in case of remote control
_playerX = _playerX getVariable ["owner", _playerX];

private _forceElection = false;
private _text = "";
if (_playerX getVariable ["eligible",false]) then
{
	_playerX setVariable ["eligible",false,true];
	if (_playerX == theBoss) then
	{
		if(!isNull _newBoss && isPlayer _newBoss) then
		{
			if ([_newBoss] call A3A_fnc_makePlayerBossIfEligible) then {
				_text = format [localize "STR_A3A_fn_orgp_tBTogEli_resign_choosing", name _newBoss];
			}
			else {
				_text = format [localize "STR_A3A_fn_orgp_tBTogEli_resign_chosen", name _newBoss];
			};
		}
		else {
			_text = localize "STR_A3A_fn_orgp_tBTogEli_resign_others";
		};
	}
	else
	{
		_text = localize "STR_A3A_fn_orgp_tBTogEli_eligible_no";
	};
}
else
{
	if ([_playerX] call A3A_fnc_isMember) then { _forceElection = true };
	_playerX setVariable ["eligible",true,true];
	_text = localize "STR_A3A_fn_orgp_tBTogEli_eligible_yes";
};


[_titleStr, _text] remoteExec ["A3A_fnc_customHint", _playerX];
 ["update"] remoteExecCall ["A3A_GUI_fnc_playerTab", _playerX];

// Will remove current boss if now ineligible
[_forceElection] call A3A_fnc_assignBossIfNone;
