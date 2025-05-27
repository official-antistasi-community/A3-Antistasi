
// Server-side function for adding live units to (rebel?) garrison

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_group", "_client"];

Trace_1("Called with params %1", _this);

// Add to the server garrison data store

if (sidesX getVariable _marker == teamPlayer) then
{
    // If it's rebel, just append the unit types and update the marker
    private _unitTypes = units _group apply { _x getVariable "unitType" };
    (A3A_garrison get _marker get "troops") append _unitTypes;

    [_marker] call A3A_fnc_mrkUpdate
}
else
{
    // If enemy, need to adjust the quality based on the incoming units. Overkill to do it per unit, but whatever
    private _typeQuality = ["other", "police", "militia", "regular", "SF"] createHashMapFromArray [0,0,1,2,3];
    private _qualityTot = 0;
    {
        private _unitType = _x getVariable "unitType" splitString "_" select 1;
        _qualityTot = _qualityTot + (_typeQuality getOrDefault [_unitType, 0]);
    } forEach units _group;

    private _troops = A3A_garrison get _marker get "troops";
    private _newCount = _troops#0 + count units _group;
    private _newQuality = (_troops#1 * _troops#0 + _qualityTot) / _newCount;
    _troops set [1, _newQuality];
    _troops set [0, _newCount];
};

// Add to the live garrison
private _machineID = A3A_garrisonMachine get _marker;
if (!isNil "_machineID") then {
    _group setGroupOwner _machineID;            // should outpace the garrison op?
    {
        _x setVariable ["markerX", _marker, true];
        _x setVariable ["spawner", nil, true];
    } forEach units _group;
    ["addGroup", [_marker, _group]] call A3A_fnc_garrisonOp;
} else {
    { deleteVehicle _x } forEach units _group;
};

Trace("Completed");
