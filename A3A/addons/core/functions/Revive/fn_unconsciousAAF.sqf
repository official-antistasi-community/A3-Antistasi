#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_unit", "_injurer", "_fatalWound"];

_unit setDamage 0.9;
if (!_fatalWound) then { _unit setHitPointDamage ["hitface", 0.5]; };			// fatal wound marker

private _bleedOutTime = if (surfaceIsWater (position _unit)) then {time + 60} else {time + 300};
private _playerNear = false;
private _group = group _unit;
private _side = side _group;

if (playableUnits inAreaArray [getPosATL _unit, distanceSPWN2, distanceSPWN2] isNotEqualTo []) then
{
	_playerNear = true;
	[_unit,"heal"] remoteExec ["A3A_fnc_flagaction",0,_unit];
	_unit setCaptive true;
};

private _nextRequest = 0;
while { (alive _unit) && (time < _bleedOutTime) && (_unit getVariable ["incapacitated",false]) } do
{
    //Plays the injured sound
	if (random 20 < 1) then {
        playSound3D [(selectRandom injuredSounds),_unit,false, getPosASL _unit, 1, 1, 50];
    };

    //Ask for help if not already helped
	private _helped = _unit getVariable ["helped",objNull];
	if (isNull _helped and _nextRequest < time) then {
		[_unit] call A3A_fnc_askHelp;
		_nextRequest = time + (2 + (_unit getVariable ["helpFailed", 0]))^2;
	};
	sleep 3;
};

_unit stop false;
if (_playerNear) then
{
	[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",0,_unit];
    if((_unit getVariable "unitType") in FactionGet(all,"SquadLeaders")) then
    {
        _unit spawn
        {
            sleep 1;
            [_this, "Intel_Small"] remoteExec ["A3A_fnc_flagaction", [teamPlayer,civilian], _this];
        };
    };
};


if (time >= _bleedOutTime) exitWith
{
    _unit setDamage 1;
};

if (alive _unit) then
{
	_unit setUnconscious false;
	_unit playMoveNow "unconsciousoutprone";
	_unit setVariable ["A3A_downedBy", nil];

	if (_unit getVariable ["surrendering", false]) exitWith {
		_unit setVariable ["surrendering", nil, true];
		[_unit] spawn A3A_fnc_surrenderAction;
	};

	if (!(_unit getVariable ["surrendered", false]) and captive _unit) then {
		_unit setCaptive false;
	};
};
