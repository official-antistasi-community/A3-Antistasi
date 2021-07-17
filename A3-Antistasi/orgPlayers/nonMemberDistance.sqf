#define INITIAL_COUNT_TIME 61

_countX = INITIAL_COUNT_TIME;
while {!([player] call A3A_fnc_isMember)} do
	{
	_playerMembers = (call A3A_fnc_playableUnits) select {([_x] call A3A_fnc_isMember) and (side group _x == teamPlayer)};
	if !(_playerMembers isEqualTo []) then
		{
		if (player distance2D (getMarkerPos respawnTeamPlayer) > memberDistance) then
			{
			_closestMember = [_playerMembers,player] call BIS_fnc_nearestPosition;
			if (player distance2d _closestMember > memberDistance) then
				{
				_countX = _countX - 1;
				}
			else
				{
				_countX = INITIAL_COUNT_TIME;
				};
			}
		else
			{
			_countX = INITIAL_COUNT_TIME;
			};
		}
	else
		{
		_countX = INITIAL_COUNT_TIME;
		};
	if (_countX != INITIAL_COUNT_TIME) then
		{
		[localize "STR_antistasi_customHint_memberDistance", format [localize "STR_antistasi_customHint_memberDistance_tp", _countX]] call A3A_fnc_customHint;
		sleep 1;
		if (_countX == 0) then
			{
			private _possibleVehicle = vehicle player;
			if (_possibleVehicle != player && (driver _possibleVehicle) == player) then
				{
				[_possibleVehicle] call A3A_fnc_teleportVehicleToBase;
				};
			player setPos (getMarkerPos respawnTeamPlayer);
			};
		}
	else
		{
		sleep 60;
		};
	};
