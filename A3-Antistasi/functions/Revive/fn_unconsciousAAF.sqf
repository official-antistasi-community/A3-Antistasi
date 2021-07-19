#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_unit", "_injurer"];

private _bleedOutTime = if (surfaceIsWater (position _unit)) then {time + 60} else {time + 300};
private _playerNear = false;
private _group = group _unit;
private _side = side _group;

if ({if ((isPlayer _x) and (_x distance _unit < distanceSPWN2)) exitWith {1}} count allUnits != 0) then
{
	_playerNear = true;
	[_unit,"heal"] remoteExec ["A3A_fnc_flagaction",0,_unit];
	[_unit,true] remoteExec ["setCaptive"];
	_unit setCaptive true;
};

_unit setFatigue 1;
[_group,_injurer] spawn A3A_fnc_AIreactOnKill;

while
{
    (alive _unit) &&
    {(time < _bleedOutTime) &&
    {_unit getVariable ["incapacitated",false]}}
} do
{
    //Plays the injured sound
	if (random 10 < 1) then
    {
        playSound3D [(selectRandom injuredSounds),_unit,false, getPosASL _unit, 1, 1, 50];
    };
    //Ask for help if not already helped
	private _helped = _unit getVariable ["helped",objNull];
	if (isNull _helped) then
    {
        [_unit] call A3A_fnc_askHelp;
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
	if (side _injurer == teamPlayer) then
	{
		if (isPlayer _injurer) then
		{
			[1,_injurer] call A3A_fnc_playerScoreAdd;
		};
		[-1,1,getPos _unit] remoteExec ["A3A_fnc_citySupportChange",2];
	};
    _unit setDamage 1;
};

if (alive _unit) then
{
	_unit setUnconscious false;
	_unit playMoveNow "AmovPpneMstpSnonWnonDnon_healed";
	_unit setVariable ["overallDamage",damage _unit];

	if (_unit getVariable ["surrendering", false]) exitWith {
		_unit setVariable ["surrendering", nil, true];
		[_unit] spawn A3A_fnc_surrenderAction;
	};

	if (!(_unit getVariable ["surrendered", false]) and captive _unit) then {
		[_unit,false] remoteExec ["setCaptive",0,_unit];
		_unit setCaptive false;
	};
};
