#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_unit", "_player", "_actionID"];

/*  The action of interrogating a surrendered unit.
*   Params:
*       _unit : OBJECT : The unit which will be interrogated
*       _player : OBJECT : The unit which is interrogating
*       _unused : NOT USED
*       _actionID : NUMBER : The ID of the interrogate action
*
*   Returns:
*       Nothing
*/

//Removing action
[_unit, _actionID] remoteExec ["removeAction", [teamPlayer, civilian], _unit];

if (!alive _unit) exitWith {};
if (_unit getVariable ["interrogated", false]) exitWith {};
_unit setVariable ["interrogated", true, true];

_player globalChat "You imperialist! Tell me what you know!";
private _chance = 0;
private _side = side (group _unit);
if (_side == Occupants) then
{
	_chance = 100 - aggressionOccupants;
}
else
{
	_chance = 100 - aggressionInvaders;
};

_chance = _chance + 20;

sleep 5;

if ((round (random 100)) < _chance) then
{
    if((_unit getVariable "unitType") in FactionGet(all,"SquadLeaders")) then
    {
        if(_unit getVariable ["hasIntel", false]) then
        {
            _unit globalChat "Okay, I tell you what I know";
            _unit setVariable ["hasIntel", false, true];
            ["Small", _side] spawn A3A_fnc_selectIntel;
        }
        else
        {
            _unit globalChat "I would, but I don't know anything";
        };
    }
    else
    {
        _unit globalChat "I would, but only our squadleader may knows something";
    };
}
else
{
	_unit globalChat "Screw you, I am not telling anything!";
};
