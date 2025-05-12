/*
* Author: Håkon
* Last Modified: [Håkon - 26.aug - 2020]
* [Description]
*	Kills player if they leaves the playable area.
* Arguments:
*
* Return Value: nil
*
* Enviroment: Scheduled
*
* Example:
* [] spawn A3A_fnc_outOfBounds;
*
* Public: [Yes]
*/

if !(hasInterface) exitWith {};
if (player getVariable ["outOfBoundsInit", false]) exitWith {};
player setVariable ["outOfBoundsInit", true];

private _timeLeft = 30;
private _timerResetTimeOut = 0;
while {alive player} do {
	private _pos = getPos player select [0,2];
	private _limit = if (vehicle player isKindOf "Plane") then {3000} else {0};

	private _outOfBounds = _pos findIf { (_x < -_limit) || (_x > worldSize + _limit)} != -1;
	private _atHQ = (player distance2D getMarkerPos respawnTeamPlayer) < 200;
	if (_outOfBounds and !_atHQ) then {
		if (_timeLeft isEqualTo 0) then {player call BIS_fnc_neutralizeUnit} else {
			_timerResetTimeOut = 60;
			_timeLeft = _timeLeft -1;
			[localize "STR_A3A_fn_punish_oob_titel", format [localize "STR_A3A_fn_punish_oob_text", _timeLeft]] call A3A_fnc_customHint;
		};
	} else {
		if (_timerResetTimeOut == 0) then {
			_timeLeft = 30;
		} else {
			_timerResetTimeOut = _timerResetTimeOut -1;
		};
	};
	uiSleep 1;
};
player setVariable ["outOfBoundsInit", false]; //dosnt reset across respawn
