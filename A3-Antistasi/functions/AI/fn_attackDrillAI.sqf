private _groupX = _this;
_objectivesX = _groupX call A3A_fnc_enemyList;
_groupX setVariable ["objectivesX",_objectivesX];
_groupX setVariable ["taskX","Patrol"];
private _sideX = side _groupX;
private _friendlies = if ((_sideX == Occupants) or (_sideX == teamPlayer)) then {[_sideX,civilian]} else {[_sideX]};
_mortarsX = [];
_mgs = [];
_movable = [leader _groupX];
_baseOfFire = [leader _groupX];
_flankers = [];

{
if (alive _x) then
	{
	_result = _x call A3A_fnc_typeOfSoldier;
	_x setVariable ["maneuvering",false];
	if (_result == "Normal") then
		{
		_movable pushBack _x;
		_flankers pushBack _x;
		}
	else
		{
		if (_result == "StaticMortar") then
			{
			_mortarsX pushBack _x;
			}
		else
			{
			if (_result == "StaticGunner") then
				{
				_mgs pushBack _x;
				};
			_movable pushBack _x;
			_baseOfFire pushBack _x;
			};
		};
	};
} forEach (units _groupX);

if (count _mortarsX == 1) then
	{
	_mortarsX append ((units _groupX) select {_x getVariable ["typeOfSoldier",""] == "StaticBase"});
	if (count _mortarsX > 1) then
		{
        //Never happens, the two previous conditions exclude each other
		//_mortarsX spawn A3A_fnc_mortarDrill;
		_mortarsX spawn A3A_fnc_staticMGDrill;//no olvides borrar la otra función si esto funciona
		}
	else
		{
		_movable pushBack (_mortarsX select 0);
		_flankers pushBack (_mortarsX select 0);
		};
	};
if (count _mgs == 1) then
	{
	_mgs append ((units _groupX) select {_x getVariable ["typeOfSoldier",""] == "StaticBase"});
	if (count _mgs == 2) then
		{
		_mgs spawn A3A_fnc_staticMGDrill;
		}
	else
		{
		_movable pushBack (_mgs select 0);
		_flankers pushBack (_mgs select 0);
		};
	};

_groupX setVariable ["movable",_movable];
_groupX setVariable ["baseOfFire",_baseOfFire];
_groupX setVariable ["flankers",_flankers];
if (side _groupX == teamPlayer) then {_groupX setVariable ["autoRearmed",time + 300]};
{
if (vehicle _x != _x) then
	{
	if !(vehicle _x isKindOf "Air") then
		{
		if ((assignedVehicleRole _x) select 0 == "Cargo") then
			{
			if (isNull(_groupX getVariable ["transporte",objNull])) then {_groupX setVariable ["transporte",vehicle _x]};
			};
		};
	};
} forEach units _groupX;

while {true} do
	{
	if !(isPlayer (leader _groupX)) then
		{
		_movable = _movable select {[_x] call A3A_fnc_canFight};
		_baseOfFire = _baseOfFire select {[_x] call A3A_fnc_canFight};
		_flankers = _flankers select {[_x] call A3A_fnc_canFight};
		_objectivesX = _groupX call A3A_fnc_enemyList;
		_groupX setVariable ["objectivesX",_objectivesX];
		if !(_objectivesX isEqualTo []) then
			{
			_air = objNull;
			_tanksX = objNull;
			{
			_eny = assignedVehicle (_x select 4);
			if (_eny isKindOf "Tank") then
				{
				_tanksX = _eny;
				}
			else
				{
				if (_eny isKindOf "Air") then
					{
					if (count (weapons _eny) > 1) then
						{
						_air = _eny;
						};
					};
				};
			if (!(isNull _air) and !(isNull _tanksX)) exitWith {};
			} forEach _objectivesX;
			_LeaderX = leader _groupX;
			_allNearFriends = allUnits select {(_x distance _LeaderX < (distanceSPWN/2)) and (side group _x in _friendlies)};
			{
			_unit = _x;
			{
			_objectiveX = _x select 4;
			if (_LeaderX knowsAbout _objectiveX >= 1.4) then
				{
				_know = _unit knowsAbout _objectiveX;
				if (_know < 1.2) then {_unit reveal [_objectiveX,(_know + 0.2)]};
				};
			} forEach _objectivesX;
			} forEach (_allNearFriends select {_x == leader _x}) - [_LeaderX];
			_numNearFriends = count _allNearFriends;
			//_air = objNull;
			//_tanksX = objNull;
			_numObjectives = count _objectivesX;
			_taskX = _groupX getVariable ["taskX","Patrol"];
			_nearX = _groupX call A3A_fnc_nearEnemy;
			_soldiers = ((units _groupX) select {[_x] call A3A_fnc_canFight}) - [_groupX getVariable ["mortarX",objNull]];
			_numSoldiers = count _soldiers;
			if !(isNull _air) then
			{
                private _supportTypes = [_groupX, _air] call A3A_fnc_chooseSupport;
                if ((count _supportTypes) > 0) then
                {
                    [_groupX, _supportTypes, _air] spawn A3A_fnc_callForSupport;
                };
				_groupX setVariable ["taskX","Hide"];
				_taskX = "Hide";
			};
			if !(isNull _tanksX) then
			{
                private _supportTypes = [_groupX, _tanksX] call A3A_fnc_chooseSupport;
                if ((count _supportTypes) > 0) then
                {
                    [_groupX, _supportTypes, _tanksX] spawn A3A_fnc_callForSupport;
                };
				_groupX setVariable ["taskX","Hide"];
				_taskX = "Hide";
			};
			if (_numObjectives > 2 * _numNearFriends) then
			{
				if !(isNull _nearX) then
				{
                    private _supportTypes = [_groupX, _nearX] call A3A_fnc_chooseSupport;
                    if ((count _supportTypes) > 0) then
                    {
                        [_groupX, _supportTypes, _nearX] spawn A3A_fnc_callForSupport;
                    };
				};
				_groupX setVariable ["taskX","Hide"];
				_taskX = "Hide";
			};
			_transporte = _groupX getVariable ["transporte",objNull];
			if (isNull(_groupX getVariable ["transporte",objNull])) then
				{
				_exit = false;
				{
				_veh = vehicle _x;
				if (_veh != _x) then
					{
					if !(_veh isKindOf "Air") then
						{
						if ((assignedVehicleRole _x) select 0 == "Cargo") then
							{
							_groupX setVariable ["transporte",_veh];
							_transporte = _veh;
							_exit = true;
							};
						};
					};
				if (_exit) exitWith {};
				} forEach units _groupX;
				};
			if !(isNull(_transporte)) then
				{
				if !(_transporte isKindOf "Tank") then
					{
					_driver = driver (_transporte);
					if !(isNull _driver) then
						{
						[_driver]  allowGetIn false;
						};
					};
				(units _groupX select {(assignedVehicleRole _x) select 0 == "Cargo"}) allowGetIn false;
				};

			if (_taskX == "Patrol") then
				{
				if ((_nearX distance _LeaderX < 150) and !(isNull _nearX)) then
					{
					_groupX setVariable ["taskX","Assault"];
					_taskX = "Assault";
					}
				};

			if (_taskX == "Assault") then
				{
				if (_nearX distance _LeaderX < 50) then
					{
					_groupX setVariable ["taskX","AssaultClose"];
					_taskX = "AssaultClose";
					}
				else
					{
					if (_nearX distance _LeaderX > 150) then
						{
						_groupX setVariable ["taskX","Patrol"];
						}
					else
						{
						if !(isNull _nearX) then
							{
							{
							[_x,_nearX] call A3A_fnc_suppressingFire;
							} forEach _baseOfFire select {(_x getVariable ["typeOfSoldier",""] == "MGMan") or (_x getVariable ["typeOfSoldier",""] == "StaticGunner")};
							if (sunOrMoon < 1) then
								{
								if !(haveNV) then
									{
									if (A3A_hasIFA) then
										{
										if (([_LeaderX] call A3A_fnc_canFight) and ((typeOf _LeaderX) in squadLeaders)) then {[_LeaderX,_nearX] call A3A_fnc_useFlares}
										}
									else
										{
										{
										[_x,_nearX] call A3A_fnc_suppressingFire;
										} forEach _baseOfFire select {(_x getVariable ["typeOfSoldier",""] == "Normal") and (count (getArray (configfile >> "CfgWeapons" >> primaryWeapon _x >> "muzzles")) == 2)};
										};
									};
								};
							};
						};
					};
				};

			if (_taskX == "AssaultClose") then
				{
				if (_nearX distance _LeaderX > 150) then
					{
					_groupX setVariable ["taskX","Patrol"];
					}
				else
					{
					if (_nearX distance _LeaderX > 50) then
						{
						_groupX setVariable ["taskX","Assault"];
						}
					else
						{
						if !(isNull _nearX) then
							{
							_flankers = _flankers select {!(_x getVariable ["maneuvering",false])};
							if (count _flankers != 0) then
								{
								{
								[_x,_x,_nearX] spawn A3A_fnc_chargeWithSmoke;
								} forEach (_baseOfFire select {(_x getVariable ["typeOfSoldier",""] == "Normal")});
								if ([getPosASL _nearX] call A3A_fnc_isBuildingPosition) then
									{
									_engineerX = objNull;
									_building = nearestBuilding _nearX;
									if !(_building getVariable ["assaulted",false]) then
										{
										{
										if ((_x call A3A_fnc_typeOfSoldier == "Engineer") and {_x != leader _x} and {!(_x getVariable ["maneuvering",true])} and {_x distance _nearX < 50}) exitWith {_engineerX = _x};
										} forEach _baseOfFire;
										if !(isNull _engineerX) then
											{
											[_engineerX,_nearX,_building] spawn A3A_fnc_destroyBuilding;
											}
										else
											{
											[[_flankers,_nearX] call BIS_fnc_nearestPosition,_nearX,_building] spawn A3A_fnc_assaultBuilding;
											};
										};
									}
								else
									{
									[_flankers,_nearX] spawn A3A_fnc_doFlank;
									};
								};
							};
						};
					};
				};

			if (_taskX == "Hide") then
				{
				if ((isNull _tanksX) and {isNull _air} and {_numObjectives <= 2*_numNearFriends}) then
					{
					_groupX setVariable ["taskX","Patrol"];
					}
				else
					{
					_movable = _movable select {!(_x getVariable ["maneuvering",false])};
					_movable spawn A3A_fnc_hideInBuilding;
					};
				};
			}
		else
			{
			if (_groupX getVariable ["taskX","Patrol"] != "Patrol") then
				{
				if (_groupX getVariable ["taskX","Patrol"] == "Hide") then {_groupX call A3A_fnc_recallGroup};
				_groupX setVariable ["taskX","Patrol"];
				};
			if (side _groupX == teamPlayer) then
				{
				if (time >= _groupX getVariable ["autoRearm",time]) then
					{
					_groupX setVariable ["autoRearm",time + 120];
					{[_x] spawn A3A_fnc_autoRearm; sleep 1} forEach (_movable select {!(_x getVariable ["maneuvering",false])});
					};
				};
			if !(isNull(_groupX getVariable ["transporte",objNull])) then
				{
				(units _groupX select {vehicle _x == _x}) allowGetIn true;
				};
			};
		//diag_log format ["taskX:%1.Movable:%2.Base:%3.Flankers:%4",_groupX getVariable "taskX",_groupX getVariable "movable",_groupX getVariable "baseOfFire",_groupX getVariable "flankers"];
		sleep 30;
		_movable =  (_groupX getVariable ["movable",[]]) select {alive _x};
		if ((_movable isEqualTo []) or (isNull _groupX)) exitWith {};
		_groupX setVariable ["movable",_movable];
		_baseOfFire = (_groupX getVariable ["baseOfFire",[]]) select {alive _x};
		_groupX setVariable ["baseOfFire",_baseOfFire];
		_flankers = (_groupX getVariable ["flankers",[]]) select {alive _x};
		_groupX setVariable ["flankers",_flankers];
		};
	};
