//if (!isMultiplayer) exitWith {};
if ((side player == Occupants) or (side player == Invaders)) exitWith {};
private ["_pointsX","_playerX","_pointsXJ","_moneyJ"];
_pointsX = _this select 0;
_playerX = _this select 1;

if (!isPlayer _playerX) exitWith {};

//if (rank _playerX == "COLONEL") exitWith {};
_playerX = _playerX getVariable ["owner",_playerX];
if (isMultiplayer) exitWith
	{
	_pointsXJ = _playerX getVariable ["score",0];
	_moneyJ = _playerX getVariable ["moneyX",0];
	if (_pointsX > 0) then
		{
		_moneyJ = _moneyJ + (_pointsX * 10);
		_playerX setVariable ["moneyX",_moneyJ,true];
		if (_pointsX > 1) then
			{
			_textX = format ["<br/><br/><br/><br/><br/><br/>" + localize "STR_A3A_fn_orgp_playerScoreAdd_money" + " €",_pointsX*10];
			[petros,"income",_textX] remoteExec ["A3A_fnc_commsMP",_playerX];
			//[] remoteExec ["A3A_fnc_statistics",_playerX];
			if (_pointsX >= 10) then { // Dumb way to track mission completion without changing every mission file
				private _missions = _playerX getVariable "missionsCompleted";
				_playerX setVariable ["missionsCompleted",_missions];
			}
			};
		};
	_pointsX = _pointsX + _pointsXJ;
	_playerX setVariable ["score",_pointsX,true];
	};

if (_pointsX > 0) then
	{
	if (_pointsX != 1) then {[0,(_pointsX * 5)] remoteExec ["A3A_fnc_resourcesFIA",2]} else {[0,20-(tierWar * 2)] remoteExec ["A3A_fnc_resourcesFIA",2]};
	};
