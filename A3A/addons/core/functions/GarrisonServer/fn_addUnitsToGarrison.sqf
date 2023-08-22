
// Server-side function for adding live units to (rebel?) garrison

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_unitsOrGroup", "_client"];

/*
private _limit = [_marker] call A3A_fnc_getGarrisonLimit;
private _troops = A3A_garrison get _marker get "troops";

if (_limit != -1) then {
    private _newGarrisonCount = count _unitsX + count _oldGarrison;

    switch (true) do {
        case (count _oldGarrison == _limit): {
            [localize "STR_A3A_garrison_header", localize "STR_A3A_garrison_full_limit"] call A3A_fnc_customHint;
            _earlyEscape = true;
        };
        case (_newGarrisonCount >= _limit): {
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
            [localize "STR_A3A_garrison_header", localize "STR_A3A_garrison_exceed_limit"] call A3A_fnc_customHint;
        };
        default {
            //proceed as usual
        };
    };
};
if (_earlyEscape) exitWith {};
*/

private _group = _unitsOrGroup;
if (_unitsOrGroup isEqualType []) then {
    _group = createGroup teamPlayer;
    _unitsOrGroup joinSilent _group;
    [localize "STR_A3A_garrison_header", localize "STR_A3A_garrison_adding_to_garrison"] remoteExecCall ["A3A_fnc_customHint", _client];
} else {
    [localize "STR_A3A_garrison_header", format [localize "STR_A3A_garrison_adding_to_garrison_hc", groupID _group]] remoteExecCall ["A3A_fnc_customHint", _client];
    theBoss hcRemoveGroup _group;
};

// Add to the server garrison data store
(A3A_garrison get _marker get "troops") append units _group;

// Add to the live garrison
private _machineID = A3A_garrisonMachine get _marker;
if (!isNil {_machineID}) then {
    _group setGroupOwner _machineID;
    {
        _x setVariable ["markerX", _marker, true];
        _x setVariable ["spawner", nil, true];
    } forEach units _group;
    ["addGroup", [_marker, _unitType]] remoteExecCall ["A3A_fnc_garrisonOp", _machineID];
} else {
    { deleteVehicle _x } forEach units _group;
};
