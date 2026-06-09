// Final server-side chunk of addToGarrison
// Required because garrison troop count is only known to server

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _titleStr = localize "STR_A3A_garrison_header";

params ["_nearX", "_groupX", "_unitsX", "_player"];

private _limit = [_nearX] call A3A_fnc_getGarrisonLimit;
private _oldGarrison = A3A_garrison get _nearX get "troops";        // assume rebel garrison at this point...

if (_limit != -1 and count _oldGarrison >= _limit) exitWith {
    [_titleStr, localize "STR_A3A_garrison_full_limit"] remoteExecCall ["A3A_fnc_customHint", _player];
};

private _newGarrisonCount = count _unitsX + count _oldGarrison;
if (_limit != -1 and _newGarrisonCount >= _limit) then {
    private _unitsToRefundCount = _newGarrisonCount - _limit;
    private _unitsToRefund = _unitsX select [0, _unitsToRefundCount];
    _unitsX deleteRange [0, _unitsToRefundCount];

    private _refundMoney = 0;
    {
        private _unitType = _x getVariable "unitType";
        _refundMoney = _refundMoney + (server getVariable _unitType);
        deleteVehicle _x;
    } forEach _unitsToRefund;

    [count _unitsToRefund,_refundMoney] remoteExec ["A3A_fnc_resourcesFIA",2];
    [_titleStr, localize "STR_A3A_garrison_exceed_limit"] remoteExecCall ["A3A_fnc_customHint", _player];
};

// Units may not delete immediately so we create a temporary group
private _garrisonGroup = createGroup [teamPlayer, true];
_unitsX joinSilent _garrisonGroup;
if (isNull _groupX) then {
    [_titleStr, localize "STR_A3A_garrison_adding_to_garrison"] remoteExecCall ["A3A_fnc_customHint", _player];
} else {
    [_titleStr, format [localize "STR_A3A_garrison_adding_to_garrison_hc", groupID _groupX]] remoteExecCall ["A3A_fnc_customHint", _player];
    theBoss hcRemoveGroup _groupX;
    _groupX deleteGroupWhenEmpty true;
};

[_nearX, _garrisonGroup] remoteExecCall ["A3A_fnc_garrisonServer_addGroup", 2];
