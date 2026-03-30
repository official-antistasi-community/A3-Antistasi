#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (count hcArray == 0) exitWith {2};
//if (count hcArray == 1) exitWith {_params remoteExec [_function,hcArray select 0]};

private _targetID = 2;
private _min = ({local _x} count allUnits) * 2;			// use server too when it's quiet
{
    private _hcID = _x;
    private _num = {owner _x == _hcID} count allUnits;
    if (_num < _min) then {
        _targetID = _hcID;
        _min = _num;
    };
} forEach hcArray;

_targetID;
