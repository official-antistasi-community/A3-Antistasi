private["_player"];
if (player != player getVariable["owner", player]) exitWith {
	["Undercover", "You cannot go Undercover while you are controlling AI"] call A3A_fnc_customHint;
};
_player = player getVariable["owner", player];
if (captive _player) exitWith {
	["Undercover", "You are Undercover already"] call A3A_fnc_customHint;
};

private["_compromised", "_changeX", "_secureBases", "_roadblocks", "_player", "_size", "_base", "_onDetectionMarker", "_onBaseMarker", "_baseSide"];

_changeX = "";
_roadblocks = (controlsX select {
	isOnRoad(getMarkerPos _x)
});
_secureBases = airportsX + outposts + seaports + _roadblocks;
_compromised = _player getVariable "compromised";



if (vehicle _player != _player) then {
	if (not(typeOf(vehicle _player) in undercoverVehicles)) then {
		["Undercover", "You are not in a civilian vehicle"] call A3A_fnc_customHint;
		_changeX = "Init"
	};
	if (vehicle _player in reportedVehs) then {
		["Undercover", "This vehicle has been reported to the enemy. Change or renew your vehicle in the Garage to go Undercover"] call A3A_fnc_customHint;
		_changeX = "Init";
	};
}
else {
	if ((primaryWeapon _player != "") or (secondaryWeapon _player != "") or (handgunWeapon _player != "") or (vest _player != "") or (headgear _player in allArmoredHeadgear) or (hmd _player != "") or (not(uniform _player in allCivilianUniforms))) then {
		["Undercover", "You cannot go Undercover while:<br/><br/>A weapon is visible<br/>Wearing a vest<br/>Wearing a helmet<br/>Wearing NVGs<br/>Wearing a mil uniform"] call A3A_fnc_customHint;
		_changeX = "Init";
	};
	if (dateToNumber date < _compromised) then {
		["Undercover", "You have been reported in the last 30 minutes therefore you cannot go Undercover"] call A3A_fnc_customHint;
		_changeX = "Init";
	};
};

if (_changeX != "") exitWith {};

if ({
		((side _x == Invaders) or(side _x == Occupants)) and(((_x knowsAbout _player > 1.4) and(_x distance _player < 500)) or(_x distance _player < 350))
	}
	count allUnits > 0) exitWith {
	["Undercover", "You cannot go Undercover while enemies are spotting you"] call A3A_fnc_customHint;
	if (vehicle _player != _player) then {
		{
			if ((isPlayer _x) and(captive _x)) then {
				[_x, false] remoteExec["setCaptive"];
				_x setCaptive false;
				reportedVehs pushBackUnique(vehicle _player);
				publicVariable "reportedVehs"
			}
		}
		forEach((crew(vehicle _player)) + (assignedCargo(vehicle _player)) - [_player]);
	};
};

_base = [_secureBases, _player] call BIS_fnc_nearestPosition;
_size = [_base] call A3A_fnc_sizeMarker;
if ((_player distance getMarkerPos _base < _size * 2) and(not(sidesX getVariable[_base, sideUnknown] == teamPlayer))) exitWith {
	["Undercover", "You cannot go Undercover near Airports, Outposts, Seaports or Roadblocks"] call A3A_fnc_customHint;
};

["Undercover ON", 0, 0, 4, 0, 0, 4] spawn bis_fnc_dynamicText;

[_player, true] remoteExec["setCaptive", 0, _player];
_player setCaptive true;
[] spawn A3A_fnc_statistics;
if (_player == leader group _player) then {
	{
		if ((!isplayer _x) and(local _x) and(_x getVariable["owner", _x] == _player)) then {
			[_x] spawn A3A_fnc_undercoverAI
		}
	}
	forEach units group _player;
};
_isInControl = false;
while {
	_changeX == ""
}
do {
	private _healingTarget = objNull;
	if !(isNil {player getVariable "ace_medical_treatment_endInAnim"}) then {
		_healingTarget = currentAceTarget;
	};

	sleep 1;
	if (!captive _player) then {
		_changeX = "Reported";
	}
	else {
		_veh = vehicle _player;
		_typeX = typeOf _veh;
		if (_veh != _player) then {
			if (not(_typeX in undercoverVehicles)) then {
				_changeX = "VNoCivil"
			}
			else {
				if (_veh in reportedVehs) then {
					_changeX = "VCompromised"
				}
				else {
					if ((_typeX != civHeli) and(!(_typeX in civBoats))) then {
						if !(isOnRoad position _veh) then {
							if (count(_veh nearRoads 50) == 0) then {
								if ({
										((side _x == Invaders) or(side _x == Occupants)) and((_x knowsAbout _player > 1.4) or(_x distance _player < 350))
									}
									count allUnits > 0) then {
									_changeX = "Highway"
								};
							};
						};
						if (hasACE) then {
							if (((position _player nearObjects["DemoCharge_Remote_Ammo", 5]) select 0) mineDetectedBy Occupants) then {
								_changeX = "SpotBombTruck";
							};
							if (((position _player nearObjects["SatchelCharge_Remote_Ammo", 5]) select 0) mineDetectedBy Occupants) then {
								_changeX = "SpotBombTruck";
							};
						};
					};
				};
			}
		}
		else {
			if (_healingTarget != objNull) then {
				if (side _healingTarget != civilian && {_healingTarget isKindOf "Man"}) then {
					if ({((side _x == Invaders) or(side _x == Occupants)) and((_x knowsAbout _player > 1.4) or(_x distance _player < 350))} count allUnits > 0) then {
						_changeX = "BadMedic2";
					} else {
						_changeX = "BadMedic";
					};
				};
			};
			if ((primaryWeapon _player != "") or (secondaryWeapon _player != "") or (handgunWeapon _player != "") or(vest _player != "") or(getNumber(configfile >> "CfgWeapons" >> headgear _player >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 2) or(hmd _player != "") or(not(uniform _player in allCivilianUniforms))) then {
				if ({((side _x == Invaders) or (side _x == Occupants)) and ((_x knowsAbout _player > 1.4) or (_x distance _player < 350))} count allUnits > 0) then {
					_changeX = "clothes2"
				} else {
					_changeX = "clothes"
				};
			};
			if (dateToNumber date < _compromised) then {
				_changeX = "Compromised";
			};
		};
		if (_changeX == "") then {
			if ((_typeX != civHeli) and(!(_typeX in civBoats))) then {
				_base = [_secureBases, _player] call BIS_fnc_nearestPosition;
				//_size = [_base] call A3A_fnc_sizeMarker;
				//Following lines are for the detection of players in the detectionAreas
				_onDetectionMarker = (detectionAreas findIf {
					_player inArea _x
				} != -1);
				_onBaseMarker = (_player inArea _base);
				_baseSide = (sidesX getVariable[_base, sideUnknown]);
				_airport = [airportsX, _player] call BIS_fnc_nearestPosition;
				if (_onBaseMarker && {
						_baseSide != teamPlayer
					} || {
						_onDetectionMarker && {
							sidesX getVariable _airport != teamPlayer
						}
					}) then {
					if !(_isInControl) then {
						_aggro =
							if (_baseSide == Occupants) then {
								aggressionOccupants + (tierWar * 10)
							} else {
								aggressionInvaders + (tierWar * 10)
							};
							//Probability	of being spotted. Unless we're in an airfield - then we're always spotted.
						if (_base in airportsX || _onDetectionMarker || random 100 < _aggro) then {
							if (_base in _roadblocks) then {
								_changeX = "distanceX";
							}
							else {
								_changeX = "Control";
							};
						}
						else {
							_isInControl = true;
						};
					};
				}
				else {
					_isInControl = false;
				};
			}
			else {
				if (_typeX == civHeli) then
                {
                    if(_veh getVariable ["NoFlyZoneDetected", ""] != "") then
                    {
                        _changeX = "NoFly";
                    };

				};
			};
		};
	};
};

if (captive _player) then {
	[_player, false] remoteExec["setCaptive"];
	_player setCaptive false
};

if (vehicle _player != _player) then {
	{
		if (isPlayer _x) then {
			[_x, false] remoteExec["setCaptive", 0, _x];
			_x setCaptive false
		}
	}
	forEach((assignedCargo(vehicle _player)) + (crew(vehicle _player)) - [_player]);
};

["Undercover OFF", 0, 0, 4, 0, 0, 4] spawn bis_fnc_dynamicText;
[] spawn A3A_fnc_statistics;
switch _changeX do {
	case "Reported":{
			["Undercover", "You have been reported or spotted by the enemy"] call A3A_fnc_customHint;
			//_compromised = _player getVariable "compromised";
			if (vehicle _player != _player) then {
				//_player setVariable ["compromised",[_compromised select 0,vehicle _player]];
				reportedVehs pushBackUnique(vehicle _player);
				publicVariable "reportedVehs";
			}
			else {
				_player setVariable["compromised", (dateToNumber[date select 0, date select 1, date select 2, date select 3, (date select 4) + 30])];
			};
		};
	case "VNoCivil":{
			["Undercover", "You entered a non civilian vehicle"] call A3A_fnc_customHint;
		};
	case "VCompromised":{
			["Undercover", "You entered in a reported vehicle"] call A3A_fnc_customHint;
		};
	case "SpotBombTruck":{
			["Undercover", "Explosives have been spotted on your vehicle"] call A3A_fnc_customHint;
			reportedVehs pushBackUnique(vehicle _player);
			publicVariable "reportedVehs";
		};
	case "Highway":{
			["Undercover", "You went too far away from any roads and have been spotted"] call A3A_fnc_customHint;
			reportedVehs pushBackUnique(vehicle _player);
			publicVariable "reportedVehs";
		};
	case "clothes":{
			["Undercover", "You cannot stay Undercover while:<br/><br/>A weapon is visible<br/>Wearing a vest<br/>Wearing a helmet<br/>Wearing NVGs<br/>Wearing a mil uniform"] call A3A_fnc_customHint;
		};
	case "clothes2":{
			["Undercover", "You cannot stay Undercover while showing:<br/><br/>A weapon is visible<br/>Wearing a vest<br/>Wearing a helmet<br/>Wearing NVGs<br/>Wearing a mil uniform<br/><br/>The enemy added you to their Wanted List"] call A3A_fnc_customHint;
			_player setVariable["compromised", dateToNumber[date select 0, date select 1, date select 2, date select 3, (date select 4) + 30]];
		};
	case "BadMedic":{
			["Undercover", "You cannot stay Undercover while healing a compromised resistance member"] call A3A_fnc_customHint;
		};
	case "BadMedic2":{
			["Undercover", "You cannot stay Undercover while healing a compromised resistance member<br/><br/>The enemy added you to their Wanted List"] call A3A_fnc_customHint;
			_player setVariable["compromised", dateToNumber[date select 0, date select 1, date select 2, date select 3, (date select 4) + 30]];
		};
	case "Compromised":{
			["Undercover", "You left your vehicle and you are still on the Wanted List"] call A3A_fnc_customHint;
		};
	case "distanceX":{
			["Undercover", "You have gotten too close to an enemy Base, Outpost or Roadblock"] call A3A_fnc_customHint;
			//_compromised = _player getVariable "compromised";
			if (vehicle _player != _player) then {
				//_player setVariable ["compromised",[_compromised select 0,vehicle _player]];
				reportedVehs pushBackUnique(vehicle _player);
				publicVariable "reportedVehs";
			}
			else {
				_player setVariable["compromised", (dateToNumber[date select 0, date select 1, date select 2, date select 3, (date select 4) + 30])];
			};
		};
	case "NoFly":{
            private _veh = vehicle _player;
            private _detectedBy = _veh getVariable "NoFlyZoneDetected";
			["Undercover", format ["You have violated the airspace of %1", [_detectedBy] call A3A_fnc_localizar]] call A3A_fnc_customHint;
			//_compromised = _player getVariable "compromised";
			reportedVehs pushBackUnique _veh;
			publicVariable "reportedVehs";
            _veh setVariable ["NoFlyZoneDetected", nil, true];
		};
	case "Control":{
			["Undercover", "The Installation Garrison has recognised you"] call A3A_fnc_customHint;
			//_compromised = _player getVariable "compromised";
			reportedVehs pushBackUnique(vehicle _player);
			publicVariable "reportedVehs";
		};
};
