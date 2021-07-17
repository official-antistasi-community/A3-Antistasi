if !(isServer) exitWith {};
params ["_playerX", ["_newBoss", objNull]];

// Find real player unit, in case of remote control
_playerX = _playerX getVariable ["owner", _playerX];

private _text = "";
if (_playerX getVariable ["eligible",false]) then
{
	_playerX setVariable ["eligible",false,true];
	if (_playerX == theBoss) then
	{
		if(!isNull _newBoss && isPlayer _newBoss) then
		{
			if ([_newBoss] call A3A_fnc_makePlayerBossIfEligible) then {
				_text = format [localize "STR_antistasi_customHint_eligible_suc", name _newBoss];
			}
			else {
				_text = format [localize "STR_antistasi_customHint_eligible_suc_noChosen", name _newBoss];
			};
		}
		else {
			_text = localize "STR_antistasi_customHint_eligible_noSuc";
		};
	}
	else
	{
		_text = localize "STR_antistasi_customHint_eligible_no";
	};
}
else
{
	_playerX setVariable ["eligible",true,true];
	_text = localize "STR_antistasi_customHint_eligible";
};

[localize "STR_position_commander", _text] remoteExec ["A3A_fnc_customHint", _playerX];

// Will remove current boss if now ineligible
[] call A3A_fnc_assignBossIfNone;
